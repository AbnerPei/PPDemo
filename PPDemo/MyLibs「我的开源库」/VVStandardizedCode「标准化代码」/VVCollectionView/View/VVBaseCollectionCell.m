//
//  VVBaseCollectionCell.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#import "VVBaseCollectionCell.h"

@implementation VVBaseCollectionCell
#warning pp605
//@synthesize vv_model;
@dynamic viewModel;

// !!!: VVReuseViewProtocol
+ (NSString *)identifier
{
    return [NSString stringWithFormat:@"k_%@_identifier", NSStringFromClass(self)];
}

// !!!: VVCollectionCellProtocol
+ (CGSize)itemSizeWithModel:(id)model
{
    return CGSizeZero;
}

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

#warning pp605
// !!!: private method
- (void)executeMethodsOfViewProtocols
{
    [self setupUI];
    [self setupConstraints];
    [self bindUIActions];
    [self view_addObservers];
}

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

- (void)addReuseViewModelObservers
{
    
}

- (void)removeReuseViewModelObservers
{
    
}

- (void)updateWithModel:(id)model
{
    /// 这个方法必须在基类（也就是当前类`VVBaseCollectionCell`）中实现
    /// 原因：
    /// 详见`VVBaseCollectionContainerView`里的
    /// `collectionView:cellForItemAtIndexPath:`里的
    /// `updateWithModel`的调用，
    /// 如果基类（也就是当前类`VVBaseCollectionCell`）的子类没有实现`updateWithModel`方法，会崩溃。
}

@end
