//
//  VVBaseCollectionContainerView.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#import <UIKit/UIKit.h>
#import "VVCollectionContainerProtocol.h"
#import "VVCollectionCustomLayoutProtocol.h"
#import "VVListViewProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVBaseCollectionContainerView : UIView <VVCollectionContainerProtocol,
UICollectionViewDataSource,
UICollectionViewDelegateFlowLayout, ///包含UICollectionViewDelegate
VVCollectionCustomLayoutDelegate,
VVListViewProtocol>


//// !!!: VVViewProtocol
///// 添加UI子视图
//- (void)setupUI;
///// 设置UI控件约束
//- (void)setupConstraints;
///// 绑定UI事件
//- (void)bindUIActions;
//
//
//// !!!: VVListViewProtocol
///// 注册`cell`
//- (void)registerCells;
///// 注册`可重用view`
//- (void)registerReusableViews;

@end

NS_ASSUME_NONNULL_END
