//
//  WKHookUtility.h
//  AutoSDKTest
//
//  Created by liranhui on 2017/6/16.
//  Copyright © 2017年 liranhui. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKHookUtility : NSObject
+ (void)swizzlingInClass:(Class)cls originalSelector:(SEL)originalSelector swizzledSelector:(SEL)swizzledSelector;
+ (void)swizzlingClassMethodInClass:(Class)cls originalSelector:(SEL)originalSelector sizzledSelector:(SEL)swizzledSelector;
@end
