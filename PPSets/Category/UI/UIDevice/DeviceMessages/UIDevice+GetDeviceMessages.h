//
//  UIDevice+GetDeviceMessages.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 读取设备的一些信息
 */
@interface UIDevice (GetDeviceMessages)
/** 获取手机运营商名称 （如：中国移动）*/
+(NSString *)pp_device_getCarrierName;
@end

