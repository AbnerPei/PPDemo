//
//  ASDataController.mm
//  AsyncDisplayKit
//
//  Copyright (c) 2014-present, Facebook, Inc.  All rights reserved.
//  This source code is licensed under the BSD-style license found in the
//  LICENSE file in the root directory of this source tree. An additional grant
//  of patent rights can be found in the PATENTS file in the same directory.
//

#import <AsyncDisplayKit/ASDataController.h>

#import <AsyncDisplayKit/_ASHierarchyChangeSet.h>
#import <AsyncDisplayKit/ASAssert.h>
#import <AsyncDisplayKit/ASCellNode.h>
#import <AsyncDisplayKit/ASLayout.h>
#import <AsyncDisplayKit/ASMainSerialQueue.h>
#import <AsyncDisplayKit/ASMultidimensionalArrayUtils.h>
#import <AsyncDisplayKit/ASThread.h>
#import <AsyncDisplayKit/ASIndexedNodeContext.h>
#import <AsyncDisplayKit/ASDataController+Subclasses.h>
#import <AsyncDisplayKit/ASDispatch.h>
#import <AsyncDisplayKit/ASInternalHelpers.h>
#import <AsyncDisplayKit/ASCellNode+Internal.h>

//#define LOG(...) NSLog(__VA_ARGS__)
#define LOG(...)

#define AS_MEASURE_AVOIDED_DATACONTROLLER_WORK 0

#define RETURN_IF_NO_DATASOURCE(val) if (_dataSource == nil) { return val; }
#define ASSERT_ON_EDITING_QUEUE ASDisplayNodeAssertNotNil(dispatch_get_specific(&kASDataControllerEditingQueueKey), @"%@ must be called on the editing transaction queue.", NSStringFromSelector(_cmd))

const static NSUInteger kASDataControllerSizingCountPerProcessor = 5;
const static char * kASDataControllerEditingQueueKey = "kASDataControllerEditingQueueKey";
const static char * kASDataControllerEditingQueueContext = "kASDataControllerEditingQueueContext";

NSString * const ASDataControllerRowNodeKind = @"_ASDataControllerRowNodeKind";
NSString * const ASCollectionInvalidUpdateException = @"ASCollectionInvalidUpdateException";

#if AS_MEASURE_AVOIDED_DATACONTROLLER_WORK
@interface ASDataController (AvoidedWorkMeasuring)
+ (void)_didLayoutNode;
+ (void)_expectToInsertNodes:(NSUInteger)count;
@end
#endif

@interface ASDataController () {
  NSMutableDictionary *_nodeContexts;       // Main thread only. This is modified immediately during edits i.e. these are in the dataSource's index space.
  NSMutableArray *_externalCompletedNodes;    // Main thread only.  External data access can immediately query this if available.
  NSMutableDictionary *_completedNodes;       // Main thread only.  External data access can immediately query this if _externalCompletedNodes is unavailable.
  NSMutableDictionary *_editingNodes;         // Modified on _editingTransactionQueue only.  Updates propagated to _completedNodes.
  BOOL _itemCountsFromDataSourceAreValid;     // Main thread only.
  std::vector<NSInteger> _itemCountsFromDataSource;         // Main thread only.
  
  ASMainSerialQueue *_mainSerialQueue;

  dispatch_queue_t _editingTransactionQueue;  // Serial background queue.  Dispatches concurrent layout and manages _editingNodes.
  dispatch_group_t _editingTransactionGroup;     // Group of all edit transaction blocks. Useful for waiting.
  
  BOOL _initialReloadDataHasBeenCalled;

  BOOL _delegateDidInsertNodes;
  BOOL _delegateDidDeleteNodes;
  BOOL _delegateDidInsertSections;
  BOOL _delegateDidDeleteSections;
}

@end

@implementation ASDataController

#pragma mark - Lifecycle

- (instancetype)initWithDataSource:(id<ASDataControllerSource>)dataSource eventLog:(ASEventLog *)eventLog
{
  if (!(self = [super init])) {
    return nil;
  }
  
  _dataSource = dataSource;
  
#if ASEVENTLOG_ENABLE
  _eventLog = eventLog;
#endif
  
  _nodeContexts = [NSMutableDictionary dictionary];
  _completedNodes = [NSMutableDictionary dictionary];
  _editingNodes = [NSMutableDictionary dictionary];

  _nodeContexts[ASDataControllerRowNodeKind] = [NSMutableArray array];
  _completedNodes[ASDataControllerRowNodeKind] = [NSMutableArray array];
  _editingNodes[ASDataControllerRowNodeKind] = [NSMutableArray array];
  
  _mainSerialQueue = [[ASMainSerialQueue alloc] init];
  
  const char *queueName = [[NSString stringWithFormat:@"org.AsyncDisplayKit.ASDataController.editingTransactionQueue:%p", self] cStringUsingEncoding:NSASCIIStringEncoding];
  _editingTransactionQueue = dispatch_queue_create(queueName, DISPATCH_QUEUE_SERIAL);
  dispatch_queue_set_specific(_editingTransactionQueue, &kASDataControllerEditingQueueKey, &kASDataControllerEditingQueueContext, NULL);
  _editingTransactionGroup = dispatch_group_create();
  
  return self;
}

- (instancetype)init
{
  ASDisplayNodeFailAssert(@"Failed to call designated initializer.");
  id<ASDataControllerSource> fakeDataSource = nil;
  ASEventLog *eventLog = nil;
  return [self initWithDataSource:fakeDataSource eventLog:eventLog];
}

- (void)setDelegate:(id<ASDataControllerDelegate>)delegate
{
  if (_delegate == delegate) {
    return;
  }
  
  _delegate = delegate;
  
  // Interrogate our delegate to understand its capabilities, optimizing away expensive respondsToSelector: calls later.
  _delegateDidInsertNodes     = [_delegate respondsToSelector:@selector(dataController:didInsertNodes:atIndexPaths:withAnimationOptions:)];
  _delegateDidDeleteNodes     = [_delegate respondsToSelector:@selector(dataController:didDeleteNodes:atIndexPaths:withAnimationOptions:)];
  _delegateDidInsertSections  = [_delegate respondsToSelector:@selector(dataController:didInsertSections:atIndexSet:withAnimationOptions:)];
  _delegateDidDeleteSections  = [_delegate respondsToSelector:@selector(dataController:didDeleteSectionsAtIndexSet:withAnimationOptions:)];
}

+ (NSUInteger)parallelProcessorCount
{
  static NSUInteger parallelProcessorCount;

  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    parallelProcessorCount = [[NSProcessInfo processInfo] activeProcessorCount];
  });

  return parallelProcessorCount;
}

#pragma mark - Cell Layout

- (void)batchLayoutNodesFromContexts:(NSArray<ASIndexedNodeContext *> *)contexts batchCompletion:(ASDataControllerCompletionBlock)batchCompletionHandler
{
  ASSERT_ON_EDITING_QUEUE;
#if AS_MEASURE_AVOIDED_DATACONTROLLER_WORK
    [ASDataController _expectToInsertNodes:contexts.count];
#endif
  
  if (contexts.count == 0) {
    batchCompletionHandler(@[], @[]);
    return;
  }

  ASProfilingSignpostStart(2, _dataSource);
  
  NSUInteger blockSize = [[ASDataController class] parallelProcessorCount] * kASDataControllerSizingCountPerProcessor;
  NSUInteger count = contexts.count;
  
  // Processing in batches
  for (NSUInteger i = 0; i < count; i += blockSize) {
    NSRange batchedRange = NSMakeRange(i, MIN(count - i, blockSize));
    NSArray<ASIndexedNodeContext *> *batchedContexts = [contexts subarrayWithRange:batchedRange];
    NSArray *nodes = [self _layoutNodesFromContexts:batchedContexts];
    NSArray *indexPaths = [ASIndexedNodeContext indexPathsFromContexts:batchedContexts];
    batchCompletionHandler(nodes, indexPaths);
  }
  
  ASProfilingSignpostEnd(2, _dataSource);
}

/**
 * Measure and layout the given node with the constrained size range.
 */
- (void)_layoutNode:(ASCellNode *)node withConstrainedSize:(ASSizeRange)constrainedSize
{
  ASDisplayNodeAssert(ASSizeRangeHasSignificantArea(constrainedSize), @"Attempt to layout cell node with invalid size range %@", NSStringFromASSizeRange(constrainedSize));

  CGRect frame = CGRectZero;
  frame.size = [node layoutThatFits:constrainedSize].size;
  node.frame = frame;
}

/**
 * Measures and defines the layout for each node in optimized batches on an editing queue, inserting the results into the backing store.
 */
- (void)_batchLayoutAndInsertNodesFromContexts:(NSArray<ASIndexedNodeContext *> *)contexts withAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  ASSERT_ON_EDITING_QUEUE;
  
  [self batchLayoutNodesFromContexts:contexts batchCompletion:^(NSArray<ASCellNode *> *nodes, NSArray<NSIndexPath *> *indexPaths) {
    // Insert finished nodes into data storage
    [self _insertNodes:nodes atIndexPaths:indexPaths withAnimationOptions:animationOptions];
  }];
}

- (NSArray<ASCellNode *> *)_layoutNodesFromContexts:(NSArray<ASIndexedNodeContext *> *)contexts
{
  ASSERT_ON_EDITING_QUEUE;
  
  NSUInteger nodeCount = contexts.count;
  if (!nodeCount || _dataSource == nil) {
    return nil;
  }

  __strong ASCellNode **allocatedNodeBuffer = (__strong ASCellNode **)calloc(nodeCount, sizeof(ASCellNode *));

  dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  ASDispatchApply(nodeCount, queue, 0, ^(size_t i) {
    RETURN_IF_NO_DATASOURCE();

    // Allocate the node.
    ASIndexedNodeContext *context = contexts[i];
    ASCellNode *node = context.node;
    if (node == nil) {
      ASDisplayNodeAssertNotNil(node, @"Node block created nil node; %@, %@", self, self.dataSource);
      node = [[ASCellNode alloc] init]; // Fallback to avoid crash for production apps.
    }
    
    // Layout the node if the size range is valid.
    ASSizeRange sizeRange = context.constrainedSize;
    if (ASSizeRangeHasSignificantArea(sizeRange)) {
      [self _layoutNode:node withConstrainedSize:sizeRange];
    }

#if AS_MEASURE_AVOIDED_DATACONTROLLER_WORK
    [ASDataController _didLayoutNode];
#endif
    allocatedNodeBuffer[i] = node;
  });

  BOOL canceled = _dataSource == nil;

  // Create nodes array
  NSArray *nodes = canceled ? nil : [NSArray arrayWithObjects:allocatedNodeBuffer count:nodeCount];
  
  // Nil out buffer indexes to allow arc to free the stored cells.
  for (int i = 0; i < nodeCount; i++) {
    allocatedNodeBuffer[i] = nil;
  }
  free(allocatedNodeBuffer);

  return nodes;
}

- (ASSizeRange)constrainedSizeForNodeOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
  return [_dataSource dataController:self constrainedSizeForNodeAtIndexPath:indexPath];
}

#pragma mark - External Data Querying + Editing

- (void)insertNodes:(NSArray *)nodes ofKind:(NSString *)kind atIndexPaths:(NSArray *)indexPaths completion:(ASDataControllerCompletionBlock)completionBlock
{
  ASSERT_ON_EDITING_QUEUE;
  if (!indexPaths.count || _dataSource == nil) {
    return;
  }

  NSMutableArray *editingNodes = _editingNodes[kind];
  ASInsertElementsIntoMultidimensionalArrayAtIndexPaths(editingNodes, indexPaths, nodes);
  
  // Deep copy is critical here, or future edits to the sub-arrays will pollute state between _editing and _complete on different threads.
  NSMutableArray *completedNodes = ASTwoDimensionalArrayDeepMutableCopy(editingNodes);
  
  [_mainSerialQueue performBlockOnMainThread:^{
    _completedNodes[kind] = completedNodes;
    if (completionBlock) {
      completionBlock(nodes, indexPaths);
    }
  }];
}

- (void)deleteNodesOfKind:(NSString *)kind atIndexPaths:(NSArray *)indexPaths completion:(ASDataControllerCompletionBlock)completionBlock
{
  ASSERT_ON_EDITING_QUEUE;
  if (!indexPaths.count || _dataSource == nil) {
    return;
  }

  LOG(@"_deleteNodesAtIndexPaths:%@ ofKind:%@, full index paths in _editingNodes = %@", indexPaths, kind, ASIndexPathsForTwoDimensionalArray(_editingNodes[kind]));
  ASDeleteElementsInMultidimensionalArrayAtIndexPaths(_editingNodes[kind], indexPaths);

  [_mainSerialQueue performBlockOnMainThread:^{
    NSMutableArray *allNodes = _completedNodes[kind];
    NSArray *nodes = ASFindElementsInMultidimensionalArrayAtIndexPaths(allNodes, indexPaths);
    ASDeleteElementsInMultidimensionalArrayAtIndexPaths(allNodes, indexPaths);
    if (completionBlock) {
      completionBlock(nodes, indexPaths);
    }
  }];
}

- (void)insertSections:(NSMutableArray *)sections ofKind:(NSString *)kind atIndexSet:(NSIndexSet *)indexSet completion:(void (^)(NSArray *sections, NSIndexSet *indexSet))completionBlock
{
  ASSERT_ON_EDITING_QUEUE;
  if (!indexSet.count|| _dataSource == nil) {
    return;
  }

  if (_editingNodes[kind] == nil) {
    _editingNodes[kind] = [NSMutableArray array];
  }
  
  [_editingNodes[kind] insertObjects:sections atIndexes:indexSet];
  
  // Deep copy is critical here, or future edits to the sub-arrays will pollute state between _editing and _complete on different threads.
  NSArray *sectionsForCompleted = ASTwoDimensionalArrayDeepMutableCopy(sections);
  
  [_mainSerialQueue performBlockOnMainThread:^{
    [_completedNodes[kind] insertObjects:sectionsForCompleted atIndexes:indexSet];
    if (completionBlock) {
      completionBlock(sections, indexSet);
    }
  }];
}

- (void)deleteSections:(NSIndexSet *)indexSet completion:(void (^)())completionBlock
{
  ASSERT_ON_EDITING_QUEUE;
  if (!indexSet.count || _dataSource == nil) {
    return;
  }

  [_editingNodes enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull kind, NSMutableArray *sections, BOOL * _Nonnull stop) {
    [sections removeObjectsAtIndexes:indexSet];
  }];
  [_mainSerialQueue performBlockOnMainThread:^{
    [_completedNodes enumerateKeysAndObjectsUsingBlock:^(NSString *  _Nonnull kind, NSMutableArray *sections, BOOL * _Nonnull stop) {
      [sections removeObjectsAtIndexes:indexSet];
    }];
    if (completionBlock) {
      completionBlock();
    }
  }];
}

#pragma mark - Internal Data Querying + Editing

/**
 * Inserts the specified nodes into the given index paths and notifies the delegate of newly inserted nodes.
 *
 * @discussion Nodes are first inserted into the editing store, then the completed store is replaced by a deep copy
 * of the editing nodes. The delegate is invoked on the main thread.
 */
- (void)_insertNodes:(NSArray *)nodes atIndexPaths:(NSArray *)indexPaths withAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  ASSERT_ON_EDITING_QUEUE;
  
  [self insertNodes:nodes ofKind:ASDataControllerRowNodeKind atIndexPaths:indexPaths completion:^(NSArray *nodes, NSArray *indexPaths) {
    ASDisplayNodeAssertMainThread();
    
    if (_delegateDidInsertNodes)
      [_delegate dataController:self didInsertNodes:nodes atIndexPaths:indexPaths withAnimationOptions:animationOptions];
  }];
}

/**
 * Removes the specified nodes at the given index paths and notifies the delegate of the nodes removed.
 *
 * @discussion Nodes are first removed from the editing store then removed from the completed store on the main thread.
 * Once the backing stores are consistent, the delegate is invoked on the main thread.
 */
- (void)_deleteNodesAtIndexPaths:(NSArray *)indexPaths withAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  ASSERT_ON_EDITING_QUEUE;
  
  [self deleteNodesOfKind:ASDataControllerRowNodeKind atIndexPaths:indexPaths completion:^(NSArray *nodes, NSArray *indexPaths) {
    ASDisplayNodeAssertMainThread();
    
    if (_delegateDidDeleteNodes)
      [_delegate dataController:self didDeleteNodes:nodes atIndexPaths:indexPaths withAnimationOptions:animationOptions];
  }];
}

/**
 * Inserts sections, represented as arrays, into the backing store at the given indices and notifies the delegate.
 *
 * @discussion The section arrays are inserted into the editing store, then a deep copy of the sections are inserted
 * in the completed store on the main thread. The delegate is invoked on the main thread.
 */
- (void)_insertSections:(NSMutableArray *)sections atIndexSet:(NSIndexSet *)indexSet withAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  ASSERT_ON_EDITING_QUEUE;
  
  [self insertSections:sections ofKind:ASDataControllerRowNodeKind atIndexSet:indexSet completion:^(NSArray *sections, NSIndexSet *indexSet) {
    ASDisplayNodeAssertMainThread();
    
    if (_delegateDidInsertSections)
      [_delegate dataController:self didInsertSections:sections atIndexSet:indexSet withAnimationOptions:animationOptions];
  }];
}

/**
 * Removes sections at the given indices from the backing store and notifies the delegate.
 *
 * @discussion Section array are first removed from the editing store, then the associated section in the completed
 * store is removed on the main thread. The delegate is invoked on the main thread.
 */
- (void)_deleteSectionsAtIndexSet:(NSIndexSet *)indexSet withAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  ASSERT_ON_EDITING_QUEUE;
  
  [self deleteSections:indexSet completion:^() {
    ASDisplayNodeAssertMainThread();
    
    if (_delegateDidDeleteSections)
      [_delegate dataController:self didDeleteSectionsAtIndexSet:indexSet withAnimationOptions:animationOptions];
  }];
}

#pragma mark - Initial Load & Full Reload (External API)

- (void)reloadDataWithAnimationOptions:(ASDataControllerAnimationOptions)animationOptions completion:(void (^)())completion
{
  [self _reloadDataWithAnimationOptions:animationOptions synchronously:NO completion:completion];
}

- (void)reloadDataImmediatelyWithAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  [self _reloadDataWithAnimationOptions:animationOptions synchronously:YES completion:nil];
}

- (void)_reloadDataWithAnimationOptions:(ASDataControllerAnimationOptions)animationOptions synchronously:(BOOL)synchronously completion:(void (^)())completion
{
  ASDisplayNodeAssertMainThread();

  _initialReloadDataHasBeenCalled = YES;
  dispatch_group_wait(_editingTransactionGroup, DISPATCH_TIME_FOREVER);

  [self invalidateDataSourceItemCounts];
  NSUInteger sectionCount = [self itemCountsFromDataSource].size();
  NSIndexSet *sectionIndexes = [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, sectionCount)];
  NSArray<ASIndexedNodeContext *> *newContexts = [self _populateNodeContextsFromDataSourceForSections:sectionIndexes];

  // Update _nodeContexts
  NSMutableArray *allContexts = _nodeContexts[ASDataControllerRowNodeKind];
  [allContexts removeAllObjects];
  NSArray *nodeIndexPaths = [ASIndexedNodeContext indexPathsFromContexts:newContexts];
  for (int i = 0; i < sectionCount; i++) {
    [allContexts addObject:[[NSMutableArray alloc] init]];
  }
  ASInsertElementsIntoMultidimensionalArrayAtIndexPaths(allContexts, nodeIndexPaths, newContexts);

  // Allow subclasses to perform setup before going into the edit transaction
  [self prepareForReloadDataWithSectionCount:sectionCount];
  
  dispatch_group_async(_editingTransactionGroup, _editingTransactionQueue, ^{
    LOG(@"Edit Transaction - reloadData");
    
    /**
     * Leave the current data in the collection view until the first batch of nodes are laid out.
     * Once the first batch is laid out, in one operation, replace all the sections and insert
     * the first batch of items.
     *
     * We previously would replace all the sections immediately, and then start adding items as they
     * were laid out. This resulted in more traffic to the UICollectionView and it also caused all the
     * section headers to bunch up until the items come and fill out the sections.
     */
    __block BOOL isFirstBatch = YES;
    [self batchLayoutNodesFromContexts:newContexts batchCompletion:^(NSArray<ASCellNode *> *nodes, NSArray<NSIndexPath *> *indexPaths) {
      if (isFirstBatch) {
        // -beginUpdates
        [_mainSerialQueue performBlockOnMainThread:^{
          [_delegate dataControllerBeginUpdates:self];
          [_delegate dataControllerWillDeleteAllData:self];
        }];
        
        // deleteSections:
        // Remove everything that existed before the reload, now that we're ready to insert replacements
        NSUInteger oldSectionCount = [_editingNodes[ASDataControllerRowNodeKind] count];
        if (oldSectionCount) {
          NSIndexSet *indexSet = [[NSIndexSet alloc] initWithIndexesInRange:NSMakeRange(0, oldSectionCount)];
          [self _deleteSectionsAtIndexSet:indexSet withAnimationOptions:animationOptions];
        }
        
        [self willReloadDataWithSectionCount:sectionCount];
        
        // insertSections:
        NSMutableArray *sections = [NSMutableArray arrayWithCapacity:sectionCount];
        for (int i = 0; i < sectionCount; i++) {
          [sections addObject:[[NSMutableArray alloc] init]];
        }
        [self _insertSections:sections atIndexSet:sectionIndexes withAnimationOptions:animationOptions];
      }
      
      // insertItemsAtIndexPaths:
      [self _insertNodes:nodes atIndexPaths:indexPaths withAnimationOptions:animationOptions];
      
      if (isFirstBatch) {
        // -endUpdates
        [_mainSerialQueue performBlockOnMainThread:^{
          [_delegate dataController:self endUpdatesAnimated:NO completion:nil];
        }];
        isFirstBatch = NO;
      }
    }];
    
    if (completion) {
      [_mainSerialQueue performBlockOnMainThread:completion];
    }
  });
  if (synchronously) {
    [self waitUntilAllUpdatesAreCommitted];
  }
}

- (void)waitUntilAllUpdatesAreCommitted
{
  ASDisplayNodeAssertMainThread();
  
  dispatch_group_wait(_editingTransactionGroup, DISPATCH_TIME_FOREVER);
  
  // Schedule block in main serial queue to wait until all operations are finished that are
  // where scheduled while waiting for the _editingTransactionQueue to finish
  [_mainSerialQueue performBlockOnMainThread:^{ }];
}

#pragma mark - Data Source Access (Calling _dataSource)

/**
 * Fetches row contexts for the provided sections from the data source.
 */
- (NSArray<ASIndexedNodeContext *> *)_populateNodeContextsFromDataSourceForSections:(NSIndexSet *)sections
{
  ASDisplayNodeAssertMainThread();
  
  __weak id<ASTraitEnvironment> environment = [self.environmentDelegate dataControllerEnvironment];
  
  std::vector<NSInteger> counts = [self itemCountsFromDataSource];
  NSMutableArray<ASIndexedNodeContext *> *contexts = [NSMutableArray array];
  [sections enumerateRangesUsingBlock:^(NSRange range, BOOL * _Nonnull stop) {
    for (NSUInteger sectionIndex = range.location; sectionIndex < NSMaxRange(range); sectionIndex++) {
      NSUInteger itemCount = counts[sectionIndex];
      for (NSUInteger i = 0; i < itemCount; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:sectionIndex];
        ASCellNodeBlock nodeBlock = [_dataSource dataController:self nodeBlockAtIndexPath:indexPath];
        
        ASSizeRange constrainedSize = [self constrainedSizeForNodeOfKind:ASDataControllerRowNodeKind atIndexPath:indexPath];
        [contexts addObject:[[ASIndexedNodeContext alloc] initWithNodeBlock:nodeBlock
                                                                  indexPath:indexPath
                                                   supplementaryElementKind:nil
                                                            constrainedSize:constrainedSize
                                                                environment:environment]];
      }
    }
  }];
  return contexts;
}

- (void)invalidateDataSourceItemCounts
{
  ASDisplayNodeAssertMainThread();
  _itemCountsFromDataSourceAreValid = NO;
}

- (std::vector<NSInteger>)itemCountsFromDataSource
{
  ASDisplayNodeAssertMainThread();
  if (NO == _itemCountsFromDataSourceAreValid) {
    id<ASDataControllerSource> source = self.dataSource;
    NSInteger sectionCount = [source numberOfSectionsInDataController:self];
    std::vector<NSInteger> newCounts;
    newCounts.reserve(sectionCount);
    for (NSInteger i = 0; i < sectionCount; i++) {
      newCounts.push_back([source dataController:self rowsInSection:i]);
    }
    _itemCountsFromDataSource = newCounts;
    _itemCountsFromDataSourceAreValid = YES;
  }
  return _itemCountsFromDataSource;
}

#pragma mark - Batching (External API)

- (void)beginUpdates
{
  ASDisplayNodeAssertMainThread();
  // TODO: make this -waitUntilAllUpdatesAreCommitted?
  dispatch_group_wait(_editingTransactionGroup, DISPATCH_TIME_FOREVER);

  dispatch_group_async(_editingTransactionGroup, _editingTransactionQueue, ^{
    [_mainSerialQueue performBlockOnMainThread:^{
      // Deep copy _completedNodes to _externalCompletedNodes.
      // Any external queries from now on will be done on _externalCompletedNodes, to guarantee data consistency with the delegate.
      _externalCompletedNodes = ASTwoDimensionalArrayDeepMutableCopy(_completedNodes[ASDataControllerRowNodeKind]);

      LOG(@"beginUpdates - begin updates call to delegate");
      [_delegate dataControllerBeginUpdates:self];
    }];
  });
}

- (void)endUpdatesAnimated:(BOOL)animated completion:(void (^)(BOOL))completion
{
  LOG(@"endUpdatesWithCompletion - beginning");
  ASDisplayNodeAssertMainThread();

  // Running these commands may result in blocking on an _editingTransactionQueue operation that started even before -beginUpdates.
  // Each subsequent command in the queue will also wait on the full asynchronous completion of the prior command's edit transaction.
  dispatch_group_async(_editingTransactionGroup, _editingTransactionQueue, ^{
    [_mainSerialQueue performBlockOnMainThread:^{
      // Now that the transaction is done, _completedNodes can be accessed externally again.
      _externalCompletedNodes = nil;
      
      LOG(@"endUpdatesWithCompletion - calling delegate end");
      [_delegate dataController:self endUpdatesAnimated:animated completion:completion];
    }];
  });
}

- (void)updateWithChangeSet:(_ASHierarchyChangeSet *)changeSet animated:(BOOL)animated
{
  ASDisplayNodeAssertMainThread();
  
  void (^batchCompletion)(BOOL) = changeSet.completionHandler;
  
  /**
   * If the initial reloadData has not been called, just bail because we don't have
   * our old data source counts.
   * See ASUICollectionViewTests.testThatIssuingAnUpdateBeforeInitialReloadIsUnacceptable
   * For the issue that UICollectionView has that we're choosing to workaround.
   */
  if (!self.initialReloadDataHasBeenCalled) {
    if (batchCompletion != nil) {
      batchCompletion(YES);
    }
    return;
  }
  
  [self invalidateDataSourceItemCounts];
  
  // Attempt to mark the update completed. This is when update validation will occur inside the changeset.
  // If an invalid update exception is thrown, we catch it and inject our "validationErrorSource" object,
  // which is the table/collection node's data source, into the exception reason to help debugging.
  @try {
    [changeSet markCompletedWithNewItemCounts:[self itemCountsFromDataSource]];
  } @catch (NSException *e) {
    id responsibleDataSource = self.validationErrorSource;
    if (e.name == ASCollectionInvalidUpdateException && responsibleDataSource != nil) {
      [NSException raise:ASCollectionInvalidUpdateException format:@"%@: %@", [responsibleDataSource class], e.reason];
    } else {
      @throw e;
    }
  }
  
  ASDataControllerLogEvent(self, @"triggeredUpdate: %@", changeSet);
  
  [self beginUpdates];
  
  for (_ASHierarchyItemChange *change in [changeSet itemChangesOfType:_ASHierarchyChangeTypeDelete]) {
    [self deleteRowsAtIndexPaths:change.indexPaths withAnimationOptions:change.animationOptions];
  }
  
  for (_ASHierarchySectionChange *change in [changeSet sectionChangesOfType:_ASHierarchyChangeTypeDelete]) {
    [self deleteSections:change.indexSet withAnimationOptions:change.animationOptions];
  }
  
  for (_ASHierarchySectionChange *change in [changeSet sectionChangesOfType:_ASHierarchyChangeTypeInsert]) {
    [self insertSections:change.indexSet withAnimationOptions:change.animationOptions];
  }
  
  for (_ASHierarchyItemChange *change in [changeSet itemChangesOfType:_ASHierarchyChangeTypeInsert]) {
    [self insertRowsAtIndexPaths:change.indexPaths withAnimationOptions:change.animationOptions];
  }
  
#if ASEVENTLOG_ENABLE
  NSString *changeSetDescription = ASObjectDescriptionMakeTiny(changeSet);
  batchCompletion = ^(BOOL finished) {
    if (batchCompletion != nil) {
      batchCompletion(finished);
    }
    ASDataControllerLogEvent(self, @"finishedUpdate: %@", changeSetDescription);
  };
#endif
  
  [self endUpdatesAnimated:animated completion:batchCompletion];
}

#pragma mark - Section Editing (External API)

- (void)insertSections:(NSIndexSet *)sections withAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  ASDisplayNodeAssertMainThread();
  LOG(@"Edit Command - insertSections: %@", sections);
  if (!_initialReloadDataHasBeenCalled) {
    return;
  }

  dispatch_group_wait(_editingTransactionGroup, DISPATCH_TIME_FOREVER);
  
  NSArray<ASIndexedNodeContext *> *contexts = [self _populateNodeContextsFromDataSourceForSections:sections];

  // Update _nodeContexts
  {
    NSMutableArray *sectionArray = [NSMutableArray arrayWithCapacity:sections.count];
    for (NSUInteger i = 0; i < sections.count; i++) {
      [sectionArray addObject:[NSMutableArray array]];
    }
    NSMutableArray *allRowContexts = _nodeContexts[ASDataControllerRowNodeKind];
    [allRowContexts insertObjects:sectionArray atIndexes:sections];
    ASInsertElementsIntoMultidimensionalArrayAtIndexPaths(allRowContexts, [ASIndexedNodeContext indexPathsFromContexts:contexts], contexts);
  }

  [self prepareForInsertSections:sections];
  
  dispatch_group_async(_editingTransactionGroup, _editingTransactionQueue, ^{
    [self willInsertSections:sections];

    LOG(@"Edit Transaction - insertSections: %@", sections);
    NSMutableArray *sectionArray = [NSMutableArray arrayWithCapacity:sections.count];
    for (NSUInteger i = 0; i < sections.count; i++) {
      [sectionArray addObject:[NSMutableArray array]];
    }

    [self _insertSections:sectionArray atIndexSet:sections withAnimationOptions:animationOptions];
    
    [self _batchLayoutAndInsertNodesFromContexts:contexts withAnimationOptions:animationOptions];
  });
}

- (void)deleteSections:(NSIndexSet *)sections withAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  ASDisplayNodeAssertMainThread();
  LOG(@"Edit Command - deleteSections: %@", sections);
  if (!_initialReloadDataHasBeenCalled) {
    return;
  }

  [_nodeContexts[ASDataControllerRowNodeKind] removeObjectsAtIndexes:sections];

  dispatch_group_wait(_editingTransactionGroup, DISPATCH_TIME_FOREVER);

  [self prepareForDeleteSections:sections];
  dispatch_group_async(_editingTransactionGroup, _editingTransactionQueue, ^{
    [self willDeleteSections:sections];

    // remove elements
    LOG(@"Edit Transaction - deleteSections: %@", sections);
    [self _deleteSectionsAtIndexSet:sections withAnimationOptions:animationOptions];
  });
}

#pragma mark - Backing store manipulation optional hooks (Subclass API)

- (void)prepareForReloadDataWithSectionCount:(NSInteger)newSectionCount
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)willReloadDataWithSectionCount:(NSInteger)newSectionCount
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)prepareForInsertSections:(NSIndexSet *)sections
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)prepareForDeleteSections:(NSIndexSet *)sections
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)willInsertSections:(NSIndexSet *)sections
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)willDeleteSections:(NSIndexSet *)sections
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)willMoveSection:(NSInteger)section toSection:(NSInteger)newSection
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)prepareForInsertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)willInsertRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)prepareForDeleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

- (void)willDeleteRowsAtIndexPaths:(NSArray<NSIndexPath *> *)indexPaths
{
  // Optional template hook for subclasses (See ASDataController+Subclasses.h)
}

#pragma mark - Row Editing (External API)

- (void)insertRowsAtIndexPaths:(NSArray *)indexPaths withAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  ASDisplayNodeAssertMainThread();
  if (!_initialReloadDataHasBeenCalled) {
    return;
  }

  LOG(@"Edit Command - insertRows: %@", indexPaths);
  dispatch_group_wait(_editingTransactionGroup, DISPATCH_TIME_FOREVER);

  // Sort indexPath to avoid messing up the index when inserting in several batches
  NSArray *sortedIndexPaths = [indexPaths sortedArrayUsingSelector:@selector(compare:)];
  NSMutableArray<ASIndexedNodeContext *> *contexts = [[NSMutableArray alloc] initWithCapacity:indexPaths.count];

  __weak id<ASTraitEnvironment> environment = [self.environmentDelegate dataControllerEnvironment];
  
  for (NSIndexPath *indexPath in sortedIndexPaths) {
    ASCellNodeBlock nodeBlock = [_dataSource dataController:self nodeBlockAtIndexPath:indexPath];
    ASSizeRange constrainedSize = [self constrainedSizeForNodeOfKind:ASDataControllerRowNodeKind atIndexPath:indexPath];
    [contexts addObject:[[ASIndexedNodeContext alloc] initWithNodeBlock:nodeBlock
                                                              indexPath:indexPath
                                               supplementaryElementKind:nil
                                                        constrainedSize:constrainedSize
                                                            environment:environment]];
  }

  ASInsertElementsIntoMultidimensionalArrayAtIndexPaths(_nodeContexts[ASDataControllerRowNodeKind], sortedIndexPaths, contexts);
  [self prepareForInsertRowsAtIndexPaths:indexPaths];

  dispatch_group_async(_editingTransactionGroup, _editingTransactionQueue, ^{
    [self willInsertRowsAtIndexPaths:indexPaths];

    LOG(@"Edit Transaction - insertRows: %@", indexPaths);
    [self _batchLayoutAndInsertNodesFromContexts:contexts withAnimationOptions:animationOptions];
  });
}

- (void)deleteRowsAtIndexPaths:(NSArray *)indexPaths withAnimationOptions:(ASDataControllerAnimationOptions)animationOptions
{
  ASDisplayNodeAssertMainThread();

  if (!_initialReloadDataHasBeenCalled) {
    return;
  }

  LOG(@"Edit Command - deleteRows: %@", indexPaths);

  dispatch_group_wait(_editingTransactionGroup, DISPATCH_TIME_FOREVER);
  
  // Sort indexPath in order to avoid messing up the index when deleting in several batches.
  // FIXME: Shouldn't deletes be sorted in descending order?
  NSArray *sortedIndexPaths = [indexPaths sortedArrayUsingSelector:@selector(compare:)];

  ASDeleteElementsInMultidimensionalArrayAtIndexPaths(_nodeContexts[ASDataControllerRowNodeKind], sortedIndexPaths);
  [self prepareForDeleteRowsAtIndexPaths:sortedIndexPaths];

  dispatch_group_async(_editingTransactionGroup, _editingTransactionQueue, ^{
    [self willDeleteRowsAtIndexPaths:sortedIndexPaths];

    LOG(@"Edit Transaction - deleteRows: %@", indexPaths);
    [self _deleteNodesAtIndexPaths:sortedIndexPaths withAnimationOptions:animationOptions];
  });
}

- (void)relayoutAllNodes
{
  ASDisplayNodeAssertMainThread();
  if (!_initialReloadDataHasBeenCalled) {
    return;
  }

  LOG(@"Edit Command - relayoutRows");
  dispatch_group_wait(_editingTransactionGroup, DISPATCH_TIME_FOREVER);

  // Can't relayout right away because _completedNodes may not be up-to-date,
  // i.e there might be some nodes that were measured using the old constrained size but haven't been added to _completedNodes
  // (see _layoutNodes:atIndexPaths:withAnimationOptions:).
  dispatch_group_async(_editingTransactionGroup, _editingTransactionQueue, ^{
    [_mainSerialQueue performBlockOnMainThread:^{
      for (NSString *kind in _completedNodes) {
        [self _relayoutNodesOfKind:kind];
      }
    }];
  });
}

- (void)_relayoutNodesOfKind:(NSString *)kind
{
  ASDisplayNodeAssertMainThread();
  NSArray *nodes = [self completedNodesOfKind:kind];
  if (!nodes.count) {
    return;
  }
  
  NSUInteger sectionIndex = 0;
  for (NSMutableArray *section in nodes) {
    NSUInteger rowIndex = 0;
    for (ASCellNode *node in section) {
      RETURN_IF_NO_DATASOURCE();
      NSIndexPath *indexPath = [NSIndexPath indexPathForRow:rowIndex inSection:sectionIndex];
      ASSizeRange constrainedSize = [self constrainedSizeForNodeOfKind:kind atIndexPath:indexPath];
      if (ASSizeRangeHasSignificantArea(constrainedSize)) {
        [self _layoutNode:node withConstrainedSize:constrainedSize];
      }
      rowIndex += 1;
    }
    sectionIndex += 1;
  }
}

#pragma mark - Data Querying (Subclass API)

- (NSMutableArray *)editingNodesOfKind:(NSString *)kind
{
  return _editingNodes[kind] ? : [NSMutableArray array];
}

- (NSMutableArray *)completedNodesOfKind:(NSString *)kind
{
  return _completedNodes[kind];
}

#pragma mark - Data Querying (External API)

- (NSUInteger)numberOfSections
{
  ASDisplayNodeAssertMainThread();
  return [_nodeContexts[ASDataControllerRowNodeKind] count];
}

- (NSUInteger)numberOfRowsInSection:(NSUInteger)section
{
  ASDisplayNodeAssertMainThread();
  NSArray *contextSections = _nodeContexts[ASDataControllerRowNodeKind];
  return (section < contextSections.count) ? [contextSections[section] count] : 0;
}

- (NSUInteger)completedNumberOfSections
{
  ASDisplayNodeAssertMainThread();
  return [[self completedNodes] count];
}

- (NSUInteger)completedNumberOfRowsInSection:(NSUInteger)section
{
  ASDisplayNodeAssertMainThread();
  NSArray *completedNodes = [self completedNodes];
  return (section < completedNodes.count) ? [completedNodes[section] count] : 0;
}

- (ASCellNode *)nodeAtIndexPath:(NSIndexPath *)indexPath
{
  ASDisplayNodeAssertMainThread();
  if (indexPath == nil) {
    return nil;
  }
  
  NSArray *contexts = _nodeContexts[ASDataControllerRowNodeKind];
  NSInteger section = indexPath.section;
  NSInteger row = indexPath.row;
  ASIndexedNodeContext *context = nil;

  if (section >= 0 && row >= 0 && section < contexts.count) {
    NSArray *completedNodesSection = contexts[section];
    if (row < completedNodesSection.count) {
      context = completedNodesSection[row];
    }
  }
  return context.node;
}

- (ASCellNode *)nodeAtCompletedIndexPath:(NSIndexPath *)indexPath
{
  ASDisplayNodeAssertMainThread();
  if (indexPath == nil) {
    return nil;
  }

  NSArray *completedNodes = [self completedNodes];
  NSInteger section = indexPath.section;
  NSInteger row = indexPath.row;
  ASCellNode *node = nil;

  if (section >= 0 && row >= 0 && section < completedNodes.count) {
    NSArray *completedNodesSection = completedNodes[section];
    if (row < completedNodesSection.count) {
      node = completedNodesSection[row];
    }
  }

  return node;
}

- (NSIndexPath *)indexPathForNode:(ASCellNode *)cellNode;
{
  ASDisplayNodeAssertMainThread();
  if (cellNode == nil) {
    return nil;
  }

  NSString *kind = cellNode.supplementaryElementKind ?: ASDataControllerRowNodeKind;
  NSArray *contexts = _nodeContexts[kind];

  // Check if the cached index path is still correct.
  NSIndexPath *indexPath = cellNode.cachedIndexPath;
  if (indexPath != nil) {
    ASIndexedNodeContext *context = ASGetElementInTwoDimensionalArray(contexts, indexPath);
    if (context.nodeIfAllocated == cellNode) {
      return indexPath;
    } else {
      indexPath = nil;
    }
  }

  // Loop through each section to look for the node context
  NSInteger section = 0;
  for (NSArray<ASIndexedNodeContext *> *nodeContexts in contexts) {
    NSUInteger item = [nodeContexts indexOfObjectPassingTest:^BOOL(ASIndexedNodeContext * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
      return obj.nodeIfAllocated == cellNode;
    }];
    if (item != NSNotFound) {
      indexPath = [NSIndexPath indexPathForItem:item inSection:section];
      break;
    }
    section += 1;
  }
  cellNode.cachedIndexPath = indexPath;
  return indexPath;
}

- (NSIndexPath *)completedIndexPathForNode:(ASCellNode *)cellNode
{
  ASDisplayNodeAssertMainThread();
  if (cellNode == nil) {
    return nil;
  }

  NSInteger section = 0;
  // Loop through each section to look for the cellNode
  NSString *kind = cellNode.supplementaryElementKind ?: ASDataControllerRowNodeKind;
  for (NSArray *sectionNodes in [self completedNodesOfKind:kind]) {
    NSUInteger item = [sectionNodes indexOfObjectIdenticalTo:cellNode];
    if (item != NSNotFound) {
      return [NSIndexPath indexPathForItem:item inSection:section];
    }
    section += 1;
  }
  
  return nil;
}

/// Returns nodes that can be queried externally. _externalCompletedNodes is used if available, _completedNodes otherwise.
- (NSArray *)completedNodes
{
  ASDisplayNodeAssertMainThread();
  return _externalCompletedNodes ? : _completedNodes[ASDataControllerRowNodeKind];
}

- (void)moveCompletedNodeAtIndexPath:(NSIndexPath *)indexPath toIndexPath:(NSIndexPath *)newIndexPath
{
  ASDisplayNodeAssertMainThread();
  ASMoveElementInTwoDimensionalArray(_externalCompletedNodes, indexPath, newIndexPath);
  ASMoveElementInTwoDimensionalArray(_completedNodes[ASDataControllerRowNodeKind], indexPath, newIndexPath);
}

@end

#if AS_MEASURE_AVOIDED_DATACONTROLLER_WORK

static volatile int64_t _totalExpectedItems = 0;
static volatile int64_t _totalMeasuredNodes = 0;

@implementation ASDataController (WorkMeasuring)

+ (void)_didLayoutNode
{
    int64_t measured = OSAtomicIncrement64(&_totalMeasuredNodes);
    int64_t expected = _totalExpectedItems;
    if (measured % 20 == 0 || measured == expected) {
        NSLog(@"Data controller avoided work (underestimated): %lld / %lld", measured, expected);
    }
}

+ (void)_expectToInsertNodes:(NSUInteger)count
{
    OSAtomicAdd64((int64_t)count, &_totalExpectedItems);
}

@end
#endif
