//
//  Singleton.m
//  RealSingletonExample
//
//  Created by PPAbner on 2019/11/20.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import "Singleton.h"
#import <objc/runtime.h>

@interface Singleton ()<NSCopying,NSMutableCopying>

@end

@implementation Singleton

/*
 * 正常的严谨单例
 **
+ (instancetype)shareInstance
{
    static Singleton *s;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        ///用super避免死循环
        s = [[super allocWithZone:NULL] init];
    });
    return s;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [Singleton shareInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [Singleton shareInstance];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [Singleton shareInstance];
}
 */

///可继承单例
+ (instancetype)shareInstance
{
    id s = objc_getAssociatedObject(self, "single_can_inherit");
    if (!s) {
        s = [[super allocWithZone:NULL] init];
        objc_setAssociatedObject(self, "single_can_inherit", s, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return s;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone
{
    return [self shareInstance];
}

- (id)copyWithZone:(NSZone *)zone
{
    return [[self class] shareInstance];
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [[self class] shareInstance];
}

@end
