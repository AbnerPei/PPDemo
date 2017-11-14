//
//  UIDevice+GetDeviceMessages.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIDevice+GetDeviceMessages.h"
//----获取手机运营商名称 start
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
//----获取手机运营商名称 end


@implementation UIDevice (GetDeviceMessages)
#pragma mark ---  获取手机运营商名称 （如：中国移动）
+(NSString *)pp_device_getCarrierName
{
    CTTelephonyNetworkInfo *telephonyNetworkInfo = [[CTTelephonyNetworkInfo alloc]init];
    return telephonyNetworkInfo.subscriberCellularProvider.carrierName;
}
@end
