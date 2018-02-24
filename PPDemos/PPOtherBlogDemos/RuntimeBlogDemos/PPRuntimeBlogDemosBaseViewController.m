//
//  PPRuntimeBlogDemosBaseViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPRuntimeBlogDemosBaseViewController.h"
#import <objc/runtime.h>
#import "PPRuntimeDog.h"

@interface PPRuntimeBlogDemosBaseViewController ()

@end

@implementation PPRuntimeBlogDemosBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupArrs];
    
//    NSObject *p = nil;
//    NSString *pp = @"abc";
//    Class pC1 = object_getClass(p); //__NSCFConstantString
//    Class pC2 = object_getClass(pp);
//    NSString *pStr1 = NSStringFromClass(pC1);
//    NSString *pStr2 = NSStringFromClass(pC2);
//    
//    
//    PPRuntimeDog *dog = [[PPRuntimeDog alloc]init];
//    NSLog(@"最初：dog's class is %@",[dog class]);
//    
//    Class dogClass = object_setClass(dog, [PPRuntimeDog class]);
//    NSLog(@"dogClass is %@",dogClass);
//    NSLog(@"后来：dog's class is %@",[dog class]);
//    
//    Class nilClass = object_setClass(p, [PPRuntimeDog class]);
//    NSLog(@"nilClass is %@",nilClass);
//    NSLog(@"后来：p's class is %@",[p class]);
//    
//    BOOL ppBool1 = object_isClass(p);
//    BOOL ppBool2 = object_isClass(pp);
//    BOOL ppBool3 = object_isClass(dog);
//    BOOL ppBool4 = object_isClass([NSString class]);
//    BOOL ppBool5 = object_isClass(dog.class);
//    
//    
//    Class pClass1 = objc_getClass("NSString");
//    Class pClass2 = objc_getClass([@"NSString" UTF8String]);
//    Class pClass3 = objc_getClass([NSStringFromClass(dog.class) UTF8String]);
//    
//    const char *pChar = [@"NSString" UTF8String];  //"NSString"
    
}

-(void)setupArrs
{
    self.titles = [@[
                     @"自定义KVO",
                     @"006 object_getIvar"
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"PPCustomKVOViewController",
                  @"object_getIvarViewController"
                  ] mutableCopy];
    
}

@end
