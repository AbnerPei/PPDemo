//
//  VVBaseCollectionContainerView.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#import "VVBaseCollectionContainerView.h"
#import "VVSafe.h"
#import "VVAssert.h"
#import "VVCollectionCellProtocol.h"
#import "VVCollectionReusableViewProtocol.h"
#import "VVBaseCollectionCell.h"
#import "VVBaseCollectionReusableView.h"
#import "VVCollectionCustomLayoutProtocol.h"
#import "VVReuseModelProtocol.h"

@implementation VVBaseCollectionContainerView
@dynamic collectionVM;
@synthesize collectionView = _collectionView;

/// 默认cell的标识符
static NSString * const kDefaultCollectionViewCellIdentifier = @"vv_collectionViewCell_identifier";
/// 默认headerView/footerView的标识符
static NSString * const kDefaultCollectionViewReusableViewIdentifier = @"vv_collectionViewReusableView_identifier";

// !!!: life cycle
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self executeMethodsOfViewProtocols];
    }
    return self;
}

- (void)dealloc
{
    [self view_removeObservers];
}

// !!!: private method
- (void)executeMethodsOfViewProtocols
{
    [self setupUI];
    [self setupConstraints];
    [self bindUIActions];
    [self view_addObservers];

    [self registerCells];
    [self registerReusableViews];
}

#pragma mark - VVViewProtocol
/// 子类，可以重写
- (void)setupUI
{
    
}

- (void)setupConstraints
{
    
}

- (void)bindUIActions
{
    
}

- (void)view_addObservers
{
    
}

- (void)view_removeObservers
{
    
}

- (void)updateWithModel:(id)model
{
    
}

#pragma mark - VVListViewProtocol
- (NSArray<Class> *)cellClasses
{
    NSString *cellClassName = self.collectionVM.config.cellClassName;
    Class cellClass = NSClassFromString(cellClassName);

    if (!vv_isEmptyStr(cellClassName) && cellClass) {
        return @[cellClass];
    }
    
    return @[];
}

- (NSArray<Class> *)reusableViewClasses
{
    NSMutableArray *array = [NSMutableArray array];
    
    BOOL hasHeaderClassName = NO;
    if (self.collectionVM.config.headerModel) {
        id headerModel = self.collectionVM.config.headerModel;
        if ([headerModel conformsToProtocol:@protocol(VVReuseModelProtocol)] && [headerModel respondsToSelector:@selector(reuseViewClassName)]) {
            NSString *headerClassName = [headerModel reuseViewClassName];
            if (!vv_isEmptyStr(headerClassName)) {
                [array addObject:headerClassName];
                hasHeaderClassName = YES;
            }
        }
    }
    
    if (!hasHeaderClassName) {
        NSString *headerClassName = self.collectionVM.config.headerClassName;
        Class headerClass = NSClassFromString(headerClassName);
        if (!vv_isEmptyStr(headerClassName) && headerClass) {
            [array addObject:headerClass];
        }
    }
    
    NSString *footerClassName = self.collectionVM.config.footerClassName;
    Class footerClass = NSClassFromString(footerClassName);
    if (!vv_isEmptyStr(footerClassName) && footerClass) {
        [array addObject:footerClass];
    }
    
    return [array copy];
}

- (void)registerCells
{
    for (Class cellClass in [self cellClasses]) {
        if ([cellClass conformsToProtocol:@protocol(VVCollectionCellProtocol)] && [cellClass respondsToSelector:@selector(identifier)]) {
            [self.collectionView registerClass:cellClass forCellWithReuseIdentifier:[cellClass identifier]];
        }
    }
    
#warning pp605
//    [self.collectionView registerClass:VVBaseCollectionCell.class forCellWithReuseIdentifier:defaultReuseIdentifier];
}

- (void)registerReusableViews
{
    for (Class reuseViewClass in [self reusableViewClasses]) {
        if ([reuseViewClass conformsToProtocol:@protocol(VVCollectionReusableViewProtocol)] && [reuseViewClass respondsToSelector:@selector(kind)] && [reuseViewClass respondsToSelector:@selector(identifier)]) {
            [self.collectionView registerClass:reuseViewClass forSupplementaryViewOfKind:[reuseViewClass kind] withReuseIdentifier:[reuseViewClass identifier]];
        }
    }
#warning pp605
//    [self.collectionView registerClass:VVBaseCollectionReuseView.class
//            forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
//                   withReuseIdentifier:defaultViewReuseIdentifier];
//
//    [self.collectionView registerClass:VVBaseCollectionReuseView.class
//            forSupplementaryViewOfKind:UICollectionElementKindSectionFooter
//                   withReuseIdentifier:defaultViewReuseIdentifier];
}

- (UICollectionViewLayout *)collectionViewLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    return layout;
}

// !!!: UICollectionView代理
#pragma mark - UICollectionViewDataSource【required】
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collectionVM itemCountInSection:section];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
#warning pp605
    if ([self respondsToSelector:@selector(preloadAtIndexPath:)]) {
        [self preloadAtIndexPath:indexPath];
    }
    
    NSString *cellClassName = [self.collectionVM cellClassNameAtIndexPath:indexPath];
    NSString *cellIdentifier = [NSClassFromString(cellClassName) identifier];
    if (vv_isEmptyStr(cellIdentifier)) {
        VVAssert(NO, @"cell的标识符为nil，请核查！");
        cellIdentifier = kDefaultCollectionViewCellIdentifier;
    }
    VVBaseCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
#warning pp605
//    cell.vv_nextResponder = self;
//    cell.vv_delegate = self;
    id model = [self.collectionVM modelAtIndexPath:indexPath];
#warning pp605
//    cell.vv_model = model;
    [cell updateWithModel:model];
    return cell;
}

#pragma mark - UICollectionViewDataSource【optional】
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return [self.collectionVM sectionCount];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        /// header
        NSString *headerClassName = [self.collectionVM classNameForHeaderInSection:indexPath.section];
        NSString *headerIdentifier = nil;
        if (!headerClassName && ![self.collectionVM modelForHeaderInSection:indexPath.section]) {
#warning pp605 为什么？
            headerClassName = NSStringFromClass(VVBaseCollectionReusableView.class);
            headerIdentifier = kDefaultCollectionViewReusableViewIdentifier;
        } else {
            headerIdentifier = [NSClassFromString(headerClassName) identifier];
        }
        if (vv_isEmptyStr(headerIdentifier)) {
            VVAssert(NO, @"headerReusableView的标识符为nil，请核查！");
            headerIdentifier = kDefaultCollectionViewReusableViewIdentifier;
        }
        NSString *headerKindStr = [NSClassFromString(headerClassName) kind];
        VVAssert([headerKindStr isEqualToString:kind], @"header kind不一致");
        VVBaseCollectionReusableView *headerReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:headerKindStr withReuseIdentifier:headerIdentifier forIndexPath:indexPath];
#warning pp605
//        reuseHeaderView.vv_delegate = self;
        id model = [self.collectionVM modelForHeaderInSection:indexPath.section];
        [headerReusableView updateWithModel:model];
        return headerReusableView;
    } else {
        /// footer
        NSString *footerClassName = [self.collectionVM classNameForFooterInSection:indexPath.section];
        NSString *footerIdentifier = nil;
        if (!footerClassName && ![self.collectionVM modelForFooterInSection:indexPath.section]) {
#warning pp605 为什么？
            footerClassName = NSStringFromClass(VVBaseCollectionReusableView.class);
            footerIdentifier = kDefaultCollectionViewReusableViewIdentifier;
        } else {
            footerIdentifier = [NSClassFromString(footerClassName) identifier];
        }
        if (vv_isEmptyStr(footerIdentifier)) {
            VVAssert(NO, @"footerReusableView的标识符为nil，请核查！");
            footerIdentifier = kDefaultCollectionViewReusableViewIdentifier;
        }
        NSString *footerKindStr = [NSClassFromString(footerClassName) kind];
        VVAssert([footerKindStr isEqualToString:kind], @"footer kind不一致");
        VVBaseCollectionReusableView *footerReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:footerKindStr withReuseIdentifier:footerIdentifier forIndexPath:indexPath];
#warning pp605
//        reuseHeaderView.vv_delegate = self;
        id model = [self.collectionVM modelForFooterInSection:indexPath.section];
        [footerReusableView updateWithModel:model];
        return footerReusableView;
    }
}

// !!!:【系统layout代理】UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellClassName = [self.collectionVM cellClassNameAtIndexPath:indexPath];
    id model = [self.collectionVM modelAtIndexPath:indexPath];
    CGSize size = [NSClassFromString(cellClassName) itemSizeWithModel:model];
    return size;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    UIEdgeInsets insets = [self.collectionVM insetsInSection:section];
    return insets;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat minimumLineSpacing = [self.collectionVM minimumLineSpacingInSection:section];
    return minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    CGFloat minimumInteritemSpacing = [self.collectionVM minimumInteritemSpacingInSection:section];
    return minimumInteritemSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    NSString *headerClassName = [self.collectionVM classNameForHeaderInSection:section];
    id model = [self.collectionVM modelForHeaderInSection:section];
    CGSize headerSize = [NSClassFromString(headerClassName) headerSizeWithModel:model];
    return headerSize;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    NSString *footerClassName = [self.collectionVM classNameForFooterInSection:section];
    id model = [self.collectionVM modelForHeaderInSection:section];
    CGSize footerSize = [NSClassFromString(footerClassName) footerSizeWithModel:model];
    return footerSize;
}

// !!!:【自定义layout代理】VVCollectionCustomLayoutDelegate
/// 每个分区有多少列
- (NSInteger)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout columnCountInSection:(NSInteger)section
{
    NSInteger columnCount = [self.collectionVM columnCountInSection:section];
    return columnCount;
}

/// item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellClassName = [self.collectionVM cellClassNameAtIndexPath:indexPath];
    id model = [self.collectionVM modelAtIndexPath:indexPath];
    CGSize size = [NSClassFromString(cellClassName) itemSizeWithModel:model];
    return size;
}

/// 每个分区的内边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout insetInSection:(NSInteger)section
{
    UIEdgeInsets insets = [self.collectionVM insetsInSection:section];
    return insets;
}

#warning pp605 注释
- (CGFloat)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout minimumLineSpacingInSection:(NSInteger)section
{
    CGFloat minimumLineSpacing = [self.collectionVM minimumLineSpacingInSection:section];
    return minimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout minimumInteritemSpacingInSection:(NSInteger)section
{
    CGFloat minimumInteritemSpacing = [self.collectionVM minimumInteritemSpacingInSection:section];
    return minimumInteritemSpacing;
}

/// headerSize
- (CGSize)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    NSString *headerClassName = [self.collectionVM classNameForHeaderInSection:section];
    id model = [self.collectionVM modelForHeaderInSection:section];
    CGSize headerSize = [NSClassFromString(headerClassName) headerSizeWithModel:model];
    return headerSize;
}

/// footerSize
- (CGSize)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout referenceSizeForFooterInSection:(NSInteger)section
{
    NSString *footerClassName = [self.collectionVM classNameForFooterInSection:section];
    id model = [self.collectionVM modelForHeaderInSection:section];
    CGSize footerSize = [NSClassFromString(footerClassName) footerSizeWithModel:model];
    return footerSize;
}

#warning pp605 注意下面4个方法
- (void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    if ([view conformsToProtocol:@protocol(VVReuseViewProtocol)]
        && [view respondsToSelector:@selector(addReuseViewModelObservers)]) {
        UIView<VVReuseViewProtocol> *reuseView = (UIView<VVReuseViewProtocol> *)view;
        [reuseView addReuseViewModelObservers];
    }
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell conformsToProtocol:@protocol(VVReuseViewProtocol)]
        && [cell respondsToSelector:@selector(addReuseViewModelObservers)]) {
        UIView<VVReuseViewProtocol> *reuseView = (UIView<VVReuseViewProtocol> *)cell;
        [reuseView addReuseViewModelObservers];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath
{
    if ([view conformsToProtocol:@protocol(VVReuseViewProtocol)]
        && [view respondsToSelector:@selector(removeReuseViewModelObservers)]) {
        UIView<VVReuseViewProtocol> *reuseView = (UIView<VVReuseViewProtocol> *)view;
        [reuseView removeReuseViewModelObservers];
    }
}

- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell conformsToProtocol:@protocol(VVReuseViewProtocol)]
        && [cell respondsToSelector:@selector(removeReuseViewModelObservers)]) {
        UIView<VVReuseViewProtocol> *reuseView = (UIView<VVReuseViewProtocol> *)cell;
        [reuseView removeReuseViewModelObservers];
    }
}

// !!!: lazy load
- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewLayout *layout = [self collectionViewLayout];
        if ([layout conformsToProtocol:@protocol(VVCollectionCustomLayoutProtocol)]) {
            UICollectionViewLayout<VVCollectionCustomLayoutProtocol> *customLayout = (UICollectionViewLayout<VVCollectionCustomLayoutProtocol> *)layout;
            if ([customLayout respondsToSelector:@selector(setVv_layoutDelegate:)] && [customLayout respondsToSelector:@selector(vv_layoutDelegate)]) {
                customLayout.vv_layoutDelegate = self;
            }
        }
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    }
    return _collectionView;
}
@end
