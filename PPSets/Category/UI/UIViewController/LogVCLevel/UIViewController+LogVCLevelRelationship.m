//
//  UIViewController+LogVCLevelRelationship.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/15.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIViewController+LogVCLevelRelationship.h"

static BOOL isSwizzled;                //是否已经Swizzled
static NSString *identifierStr = @"";  //控制台标示，便于看到是打印for log的。

@implementation UIViewController (LogVCLevelRelationship)

+(void)load
{
    isSwizzled = NO;
}
+(void)pp_vc_openLogVCLevelRelationship
{
    if (isSwizzled) {
        return;
    }
    [NSObject pp_runtime_exchangeWithClass:[self class] originalSelector:@selector(viewDidAppear:) swizzledSelector:@selector(swizzledViewDidAppear:)];
    isSwizzled = YES;
}
+(void)pp_vc_openLogVCLevelRelationshipWithIndentifier:(NSString *)identifier
{
    identifierStr = identifier;
    [self pp_vc_openLogVCLevelRelationship];
}
+(void)pp_vc_cancelLogVCLevelRelationship
{
    if (!isSwizzled) {
        return;
    }
    isSwizzled = NO;
    [NSObject pp_runtime_exchangeWithClass:[self class] originalSelector:@selector(swizzledViewDidAppear:) swizzledSelector:@selector(viewDidAppear:)];
}
-(void)swizzledViewDidAppear:(BOOL)animated
{
    [self consoleLogAction];
    //相当于调用系统的`viewDidAppear:`
    [self swizzledViewDidAppear:animated];
}
#pragma mark --- 控制台打印VCs关系信息
-(void)consoleLogAction
{
    if (self.parentViewController == nil) {  //最base的VC类（如：tabbarVC）
        [self consoleLogWithLevel:0];
    }else if ([self.parentViewController isMemberOfClass:[UINavigationController class]]){
        UINavigationController *nav = (UINavigationController *)self.parentViewController;
        NSInteger level = [[nav viewControllers] indexOfObject:self];
        [self consoleLogWithLevel:level];
    }else if ([self.parentViewController isMemberOfClass:[UITabBarController class]]){
        [self consoleLogWithLevel:1];
    }
}
-(void)consoleLogWithLevel:(NSInteger)level
{
    NSString *paddingStr = @"";
    for (NSUInteger i = 0; i<=level; i++){
        paddingStr = [paddingStr stringByAppendingFormat:@"--"];
    }
    NSLog(@"%@%@-> %@", identifierStr, paddingStr, [self.class description]);
}
@end
