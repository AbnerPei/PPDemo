//
//  VVBaseViewController.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VVBaseViewController : UIViewController

/// 设置UI
- (void)vv_setupUI;

/// 设置约束
- (void)vv_setupConstraints;

/// 添加观察者
- (void)vv_addObservers;

@end

NS_ASSUME_NONNULL_END
