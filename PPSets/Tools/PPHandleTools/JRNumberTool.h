//
//  JRNumberTool.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 17/3/2.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface JRNumberTool : NSObject

/**
 给定一个字符串以及字符串小数点后保留的位数，返回一个需要的字符串  【5.56888 (2) 】---> 【5.56】
 ①【小数点最多保留16位小数】
 ②【decimalCount == 0,返回oneFloatStr，但oneFloatStr里面有多个“.”时，处理为只有一个】
 
 @param oneFloatStr 传入的float参数
 @param decimalCount 保留几位小数
 */
+(NSString *)jr_getFloat:(NSString *)oneFloatStr
            decimalCount:(int)decimalCount;
/**
 进一取整法  【4.34 (2) 】---> 【5.00】
 */
+(NSString *)jr_Ceilf:(NSString *)oneFloatStr
         decimalCount:(int)decimalCount;
/**
 小数点后第二位进一取整法  【4.342】---> 【5.00】
 */
+(NSString *)jr_twoCeilf:(NSString *)oneFloatStr;

@end
