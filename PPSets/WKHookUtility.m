//
//  WKHookUtility.m
//  AutoSDKTest
//
//  Created by liranhui on 2017/6/16.
//  Copyright © 2017年 liranhui. All rights reserved.
//

#import "WKHookUtility.h"
#import <objc/runtime.h>
@implementation WKHookUtility
+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector
{
    Method originalMethod = class_getInstanceMethod(cls, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}
+ (void)swizzlingClassMethodInClass:(Class)cls originalSelector:(SEL)originalSelector sizzledSelector:(SEL)swizzledSelector
{
    Method originalMethod = class_getClassMethod(cls, originalSelector);
    Method swizzledMethod = class_getClassMethod(cls, swizzledSelector);
    method_exchangeImplementations(originalMethod, swizzledMethod);
}

@end
