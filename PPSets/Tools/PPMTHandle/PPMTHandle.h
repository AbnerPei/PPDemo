//
//  PPMTHandle.h
//  PodText
//
//  Created by peijianbo on 15/7/28.
//  Copyright (c) 2015年 PPMT. All rights reserved.
/*
 《参考的资料》
//iPhone开发之确认网络环境
http://blog.csdn.net/caryaliu/article/details/7799432
//iOS检测当前设备运营商类型
http://www.jianshu.com/p/6ee1ceb7dff7
//iOS获取设备型号
http://www.jianshu.com/p/285dd0503b8f
//Reachability.h 和 Reachability.m 百度网盘下载地址
http://pan.baidu.com/s/1gd1wwZx
 */

#import <Foundation/Foundation.h>
//获得设备型号
#import <sys/types.h>
#import <sys/sysctl.h>
#import <UIKit/UIViewController.h>
//获取当前设备运营商类型(导入系统库 CoreTelephony.framework，并在相关.h文件中导入，代码如下)
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>

@interface PPMTHandle : NSObject
//判断字符数(判断字符串为6～12位“字符”)
+ (BOOL)isValidateName:(NSString *)name;

//判断邮箱号//如果符合邮箱格式，返回YES
+(BOOL)isValidateEmail:(NSString *)email;

//判断密码为6～20位字符
+(BOOL)isValidatePassword:(NSString *)password;
   
//判断手机格式
+ (BOOL)checkTel:(NSString *)str;
//手机号码验证
+ (BOOL) validateMobile:(NSString *)mobile;
//判断邮编格式为6位数字
+ (BOOL)checkPostCode:(NSString *)str;

#pragma 正则匹配用户身份证号15或18位
+ (BOOL)checkUserIdCard: (NSString *) idCard;

+ (BOOL) validateIdentityCard: (NSString *)identityCard;

//获得设备型号
+ (NSString *)getCurrentDeviceModel:(UIViewController *)controller;

//获取当前设备运营商(详细信息)
+(void)check;
//获取当前设备运营商(比如：中国移动)
+(NSString *)getCurrentOperatorName;

//获得当前版本号
+(NSString *)getCurrentVersion;

//金额转大写
+(NSString *)digitUppercaseWithMoney:(NSString *)money;

//判断银行卡号正确不
+(BOOL) checkUnionpayCardNo:(NSString*) cardNo;

+ (void)pp_alertError: (NSString *) error title: (NSString *)title delegate: (id)delegate cancelButtonTitle: (NSString *)cancelButtonTitle otherButtonTitle: (NSString *)otherButtonTitle;

/* 是否在系统通知处打开app的通知开关 2016-10-17*/
//+(BOOL)pp_isRemoteNotificationOpen;

@end
