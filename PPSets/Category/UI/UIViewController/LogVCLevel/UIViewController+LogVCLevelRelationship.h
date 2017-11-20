//
//  UIViewController+LogVCLevelRelationship.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/15.
//  Copyright © 2017年 PPAbner. All rights reserved.
//  Comes from : https://github.com/RuiAAPeres/UIViewController-Swizzled

#import <UIKit/UIKit.h>

/**
 利用swizzled`viewDidAppear:`方法，打印当前所有（已用的）VC之间的关系
 */
@interface UIViewController (LogVCLevelRelationship)
/** 打开 */
+(void)pp_vc_openLogVCLevelRelationship;
/** 打开，并且给log一个表示，便于控制太查看到 */
+(void)pp_vc_openLogVCLevelRelationshipWithIndentifier:(NSString *)identifier;
/** 取消，一旦取消，就不再打印，除非再次调用`pp_vc_openLogVCLevelRelationship` */
+(void)pp_vc_cancelLogVCLevelRelationship;
@end
