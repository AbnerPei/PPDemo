//
//  UITableView+Event.m
//  AutoSDKTest
//
//  Created by liranhui on 2017/6/23.
//  Copyright © 2017年 liranhui. All rights reserved.
//

#import "UITableView+Event.h"
#import "WKHookUtility.h"

@implementation UITableView (Event)
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL initTargetOriginalSEL = @selector(setDelegate:);
        SEL initTargetSwizzleSEL = @selector(tableViewSwizzle_setDelegate:);
        [WKHookUtility swizzlingInClass:[self class] originalSelector:initTargetOriginalSEL swizzledSelector:initTargetSwizzleSEL];
    });
}
- (void)tableViewSwizzle_setDelegate:(id<UITableViewDelegate>)delegate
{
    NSString *delegateClassStr = NSStringFromClass([delegate class]);
    if(delegate!=nil && ![delegateClassStr hasPrefix:@"UI"] && ![delegateClassStr hasPrefix:@"_UI"])
    {
        Method actionM = class_getInstanceMethod([delegate class], @selector(tableView:didSelectRowAtIndexPath:));
        IMP actionIMP = method_getImplementation(actionM);
        class_addMethod([delegate class], @selector(originalTableView:didSelectRowAtIndexPath:), actionIMP, method_getTypeEncoding(actionM));
        Method swizzle_actionM = class_getInstanceMethod([self class], @selector(swizzle_tableView:didSelectRowAtIndexPath:));
        IMP swizzle_actionIMP = method_getImplementation(swizzle_actionM);
        class_replaceMethod([delegate class], @selector(tableView:didSelectRowAtIndexPath:), swizzle_actionIMP, method_getTypeEncoding(actionM));
    }
    [self tableViewSwizzle_setDelegate:delegate];
}
- (void)swizzle_tableView:(UITableView*)tableview didSelectRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSLog(@"%@中第%ld行被点击",tableview,(long)indexPath.row);
    [self performSelector:@selector(originalTableView:didSelectRowAtIndexPath:) withObject:tableview withObject:indexPath];
}
@end
