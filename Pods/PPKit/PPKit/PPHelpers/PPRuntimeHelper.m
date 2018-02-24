//
//  PPRuntimeHelper.m
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/21.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPRuntimeHelper.h"
#import <objc/runtime.h>

@implementation PPRuntimeHelper
+(void)pp_hrt_printIvarListWithClass:(Class)yourClass
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList(yourClass , &count);
    for (int i = 0; i < count; i++) {
        //取出成员变量
        Ivar ivar = *(ivars + i);
        //打印成员变量名字
        NSLog(@"成员变量名字 is %s",ivar_getName(ivar));
    }
}
@end
