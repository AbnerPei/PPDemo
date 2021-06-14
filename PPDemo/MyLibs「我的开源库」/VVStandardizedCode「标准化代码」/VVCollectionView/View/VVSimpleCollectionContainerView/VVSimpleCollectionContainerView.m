//
//  VVSimpleCollectionContainerView.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/14.
//

#import "VVSimpleCollectionContainerView.h"
#import <Masonry/Masonry.h>
#import "VVAssert.h"

@interface VVSimpleCollectionContainerView ()

@property (nonatomic, copy) NSArray<Class> *cellClassArray;
@property (nonatomic, copy) NSArray<Class> *reusableViewClassArray;
@property (nonatomic, assign) UICollectionViewScrollDirection scrollDirection;
@property (nonatomic, strong) __kindof id<VVCollectionVMProtocol> collectionVM;

@end

@implementation VVSimpleCollectionContainerView
@synthesize collectionVM = _collectionVM;

// !!!: life cycle
- (instancetype)initWithCellClassArray:(NSArray<Class> *)cellClassArray reusableViewClassArray:(NSArray<Class> *)reusableViewClassArray scrollDirection:(UICollectionViewScrollDirection)scrollDirection collectionVM:(__kindof NSObject<VVCollectionVMProtocol> *)collectionVM
{
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.cellClassArray = cellClassArray;
        self.reusableViewClassArray = reusableViewClassArray;
        self.scrollDirection = scrollDirection;
        self.collectionVM = collectionVM;
        [self setupUI];
        [self setupConstraints];
        [self registerCells];
        [self registerReusableViews];
    }
    return self;
}

// !!!: VVViewProtocol
- (void)setupUI
{
    [self addSubview:self.collectionView];
}

- (void)setupConstraints
{
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.inset(0);
    }];
}

- (void)updateWithModel:(__kindof NSObject<VVCollectionVMProtocol> *)model
{
    VVAssertReturnVoid([model conformsToProtocol:@protocol(VVCollectionVMProtocol)], @"请核查：该model应该遵循VVCollectionVMProtocol");
    self.collectionVM = model;
    [self.collectionView reloadData];
}

// !!!: VVListViewProtocol
- (NSArray<Class> *)cellClasses
{
    return self.cellClassArray;
}

- (NSArray<Class> *)reusableViewClasses
{
    return self.reusableViewClassArray;
}

- (UICollectionViewLayout *)collectionViewLayout
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    return layout;
}

@end
