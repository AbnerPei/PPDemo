//
//  UIDevice+GetAPPMessages.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIDevice+GetAPPMessages.h"

@implementation UIDevice (GetAPPMessages)
#pragma mark --- 获取APP的版本号【字符串类型】
+(NSString *)pp_device_getAPPVersionStr
{
    NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return version;
}
#pragma mark --- 获取APP的版本号【interger类型】
+(NSInteger)pp_device_getAPPVersionInteger
{
    NSString *version = [UIDevice pp_device_getAPPVersionStr];
    NSString *versionHandled = [version pp_string_easyReplace:@"." withStr:@""];
    return [versionHandled integerValue];
}
@end
