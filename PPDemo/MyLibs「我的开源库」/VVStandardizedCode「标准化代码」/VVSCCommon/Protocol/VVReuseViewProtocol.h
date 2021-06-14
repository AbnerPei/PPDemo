//
//  VVReuseViewProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVReuseViewProtocol_h
#define VVReuseViewProtocol_h
#import "VVViewProtocol.h"

@protocol VVReuseViewProtocol <VVViewProtocol>

#warning pp605
///// 视图对应的数据源
//@property (nonatomic, strong) __kindof NSObject<VVTrackProtocol> *vv_model;

/// 重用标识符
+ (NSString *)identifier;

#warning pp605
/// 为重用视图添加对应viewModel的监听,禁止开发者主动调用
- (void)addReuseViewModelObservers;

#warning pp605
/// 移除重用视图对应viewModel上的监听,禁止开发者主动调用
- (void)removeReuseViewModelObservers;

@end

#endif /* VVReuseViewProtocol_h */
