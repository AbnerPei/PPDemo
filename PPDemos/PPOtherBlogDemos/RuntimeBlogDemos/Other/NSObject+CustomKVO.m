//
//  NSObject+CustomKVO.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/22.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "NSObject+CustomKVO.h"
#import <objc/runtime.h>

@implementation NSObject (CustomKVO)
-(void)pp_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(void *)context
{
    //1.创建一个n类
    NSString *oldName = NSStringFromClass([self class]);
    NSString *newName = [@"PPKVO_" stringByAppendingString:oldName];
    //1.1获取类
    Class customClass = objc_allocateClassPair([self class], newName.UTF8String, 0);
    //1.2注册类
    objc_registerClassPair(customClass);
    
    //2.动态修改self的类型
    object_setClass(self, customClass);
    
    
    //3.重写setName:方法  (给子类添加setName:方法)
//    class_addMethod(customClass, @selector(setName:), (IMP)ppsetName, "v@:@");
    
}

void ppSetName(id self,SEL _cmd,NSString *newName){
    struct objc_super runtimePerson = {self,class_getSuperclass([self class])};
    objc_msgSendSuper(&runtimePerson, _cmd,newName);
}
@end
