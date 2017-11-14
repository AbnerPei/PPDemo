//
//  UIDevice+GetAPPMessages.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (GetAPPMessages)
/** 获取APP的版本号【字符串类型】*/
+(NSString *)pp_device_getAPPVersionStr;
/** 获取APP的版本号【interger类型】*/
+(NSInteger)pp_device_getAPPVersionInteger;
@end
