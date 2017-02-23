//
//  RTDateFormatterTool.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/13.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger,RTDateFormatterType){
    RTDateFormatterTypeYearMonthDayLine,                          //如 2017-02-13
    RTDateFormatterTypeYearMonthDayBackslash,                     //如 2017/02/13
    RTDateFormatterTypeYearMonthDayHourMinuteLine,                //如 2017-02-13 14:38
    RTDateFormatterTypeYearMonthDayHourMinuteSecondLine           //如 2017-02-13 14:38:26
};
@interface RTDateFormatterTool : NSObject

/**
 创建一个NSDateFormatter对象，根据【传入的格式】 (默认如：2017-02-13)

 @param type 如：RTDateFormatterTypeYearMonthDayLine（2017-02-13）
 */
+(NSDateFormatter *)rt_getDateFormatterWithType:(RTDateFormatterType)type;


/**
 获取一个NSDate对象，根据传入的【格式化格式】以及【时间字符串】
 */
+(NSDate *)rt_getDateWithFormatterType:(RTDateFormatterType)formatterType
                               timeStr:(NSString *)timeStr;

/**
 获取一个时间字符串，根据传入的【格式化格式】以及【时间】
 */
+(NSString *)rt_getTimeStrWithFormatterType:(RTDateFormatterType)formatterType
                                       date:(NSDate *)date;
@end
