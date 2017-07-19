//
//  PPDebugTool.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/19.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPDebugTool.h"

@implementation PPDebugTool
+(void)pp_printIvarListWithClass:(Class)yourClass
{
    unsigned int count = 0;
    Ivar *ivars = class_copyIvarList([UITextField class] , &count);
    for (int i = 0; i < count; i++) {
        //取出成员变量
        Ivar ivar = *(ivars + i);
        //打印成员变量名字
        NSLog(@"成员变量名字 is %s",ivar_getName(ivar));
    }
}
@end
