//
//  object_getIvarViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "object_getIvarViewController.h"
#import "PPRuntimeStudent.h"
#import <objc/runtime.h>

@interface object_getIvarViewController ()

@end

@implementation object_getIvarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    PPRuntimeStudent *stu = [[PPRuntimeStudent alloc]init];
    stu.name = @"PPAbner";
    
    //1. 获取实例变量的值
    id p1 = [self demo1:stu];
    //2. 获取所谓的“私有变量”的值
    id p2 = [self demo2:stu];
    //3. 获取成员变量的值
    id p3 = [self demo3:stu];
    
    //
    [self demo4:stu];
    
    
}
-(id)demo1:(PPRuntimeStudent *)stu
{
    Ivar ivar = class_getInstanceVariable([stu class], "_name");
    id nameValue = object_getIvar(stu, ivar);
    
    NSLog(@"%s--%@",__func__,nameValue);
    return nameValue;
}
-(id)demo2:(PPRuntimeStudent *)stu
{
    Ivar ivar = class_getInstanceVariable([stu class], "_selfIntroduce");
    id selfIntroduceValue = object_getIvar(stu, ivar);
    
    NSLog(@"%s--%@",__func__,selfIntroduceValue);
    return selfIntroduceValue;
}
-(id)demo3:(PPRuntimeStudent *)stu
{
#warning pp605 暂时无效
    Ivar ivar = class_getInstanceVariable([stu class], "_hasFriend");
    id hasFriendValue = object_getIvar(stu, ivar);
    NSLog(@"%s--%@",__func__,hasFriendValue);
    
    Ivar ivar1 = class_getInstanceVariable([stu class], "__isGood3");
    id isGood3Value = object_getIvar(stu, ivar1);
    NSLog(@"%s--%@",__func__,isGood3Value);
    
    return isGood3Value;
}
-(void)demo4:(PPRuntimeStudent *)stu
{
    Ivar ivar = class_getInstanceVariable([stu class], "_country");
    //属性如果没有默认memory management 就实用strong 类型的 。
    object_setIvarWithStrongDefault(stu, ivar, @"China");
}

@end
