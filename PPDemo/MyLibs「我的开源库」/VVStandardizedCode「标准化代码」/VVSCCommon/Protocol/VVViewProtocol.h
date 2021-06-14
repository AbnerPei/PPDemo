//
//  VVViewProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVViewProtocol_h
#define VVViewProtocol_h

@protocol VVViewProtocol <NSObject>

@optional
/// 根据model获取view的高度
+ (CGFloat)viewHeightWithModel:(nullable id)model;

/// 添加UI子视图
- (void)setupUI;

/// 设置UI控件约束
- (void)setupConstraints;

/// 绑定UI事件
- (void)bindUIActions;

/// （init的时候）添加监听
- (void)view_addObservers;

/// （dealloc的时候）移出监听
- (void)view_removeObservers;

#warning pp605
/// 加载初始化数据
- (void)loadInitData;

/// 根据模型更新UI
- (void)updateWithModel:(nullable id)model;

/// 下拉刷新
- (void)pullRefresh;

/// 上拉加载更多
- (void)loadMore;

@end

#endif /* VVViewProtocol_h */
