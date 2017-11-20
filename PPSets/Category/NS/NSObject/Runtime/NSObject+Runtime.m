//
//  NSObject+Runtime.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/15.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSObject+Runtime.h"
#import <objc/runtime.h>

@implementation NSObject (Runtime)
#pragma mark --- 交换两个方法
+(void)pp_runtime_exchangeWithClass:(Class)cls
                   originalSelector:(SEL)originalSelector
                   swizzledSelector:(SEL)swizzledSelector
{
    swizzExchange(cls, originalSelector, swizzledSelector);
}


#pragma mark --- 【内部】（交换两个方法）
static void swizzExchange(Class class, SEL originalSelector, SEL swizzledSelector)
{
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod = class_addMethod(class, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod){
        class_replaceMethod(class, swizzledSelector, method_getImplementation(originalMethod),method_getTypeEncoding(originalMethod));
    }else{
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}
@end
