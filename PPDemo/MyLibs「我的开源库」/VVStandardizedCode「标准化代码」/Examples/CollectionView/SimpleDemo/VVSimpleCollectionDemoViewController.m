//
//  VVSimpleCollectionDemoViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/14.
//

#import "VVSimpleCollectionDemoViewController.h"
#import "VVSimpleCollectionContainerView.h"
#import "VVBaseCollectionVM.h"
#import "VVSimpleCollectionDemoCell1.h"
#import "VVSimpleCollectionDemoReusableView1.h"
#import "VVBaseReuseVM.h"

@interface VVSimpleCollectionDemoViewController ()

@property (nonatomic, strong) VVSimpleCollectionContainerView *containerView;
@property (nonatomic, strong) VVBaseCollectionVM *collectionVM;
@end

@implementation VVSimpleCollectionDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupUI];
    [self makeDatas];
}

// !!!: private method
- (void)setupUI
{
    [self.view addSubview:self.containerView];
    self.containerView.frame = self.view.bounds;
}

- (void)makeDatas
{
    /// 分区头
    VVBaseReuseVM *headerVM = [[VVBaseReuseVM alloc] init];
    headerVM.reuseViewClassName = NSStringFromClass(VVSimpleCollectionDemoReusableView1.class);
    self.collectionVM.config.headerModel = headerVM;
    self.collectionVM.config.headerClassName = NSStringFromClass(VVSimpleCollectionDemoReusableView1.class);

    
    /// 分区cells
    VVBaseReuseVM *cellVM = [[VVBaseReuseVM alloc] init];
    cellVM.reuseViewClassName = NSStringFromClass(VVSimpleCollectionDemoCell1.class);
    self.collectionVM.datas = @[cellVM];
    
    [self.containerView updateWithModel:self.collectionVM];
    
}


// !!!: lazy load
- (VVSimpleCollectionContainerView *)containerView
{
    if (!_containerView) {
        _containerView = [[VVSimpleCollectionContainerView alloc] initWithCellClassArray:@[VVSimpleCollectionDemoCell1.class] reusableViewClassArray:@[VVSimpleCollectionDemoReusableView1.class] scrollDirection:(UICollectionViewScrollDirectionVertical) collectionVM:self.collectionVM];
    }
    return _containerView;
}

- (VVBaseCollectionVM *)collectionVM
{
    if (!_collectionVM) {
        _collectionVM = [[VVBaseCollectionVM alloc] init];
    }
    return _collectionVM;
}

@end
