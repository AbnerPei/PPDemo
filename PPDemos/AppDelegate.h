//
//  AppDelegate.h
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

#warning 第一步

#if kUseScreenShotGesture
#import "ScreenShotView.h"
#endif

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
#warning 第二步

#if kUseScreenShotGesture
@property (nonatomic, strong) ScreenShotView *screenshotView;
#endif

/// func
+ (AppDelegate* )shareAppDelegate;
@end

