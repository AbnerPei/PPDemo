//
//  RTDateFormatterTool.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/13.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import "RTDateFormatterTool.h"

/**
   DateFormatter创建工具
 */
@implementation RTDateFormatterTool

#pragma mark --- 创建一个NSDateFormatter对象，根据【传入的格式】 (默认如：2017-02-13)
+(NSDateFormatter *)rt_getDateFormatterWithType:(RTDateFormatterType)type
{
    NSString *typeStr = @"yyyy-MM-dd"; //RTDateFormatterTypeYearMonthDayLine
    if (type == RTDateFormatterTypeYearMonthDayBackslash) {
        typeStr = @"yyyy/MM/dd";
    }else if (type == RTDateFormatterTypeYearMonthDayHourMinuteSecondLine){
        
        typeStr = @"yyyy-MM-dd HH:mm:ss";
        
    }else if (type == RTDateFormatterTypeYearMonthDayHourMinuteLine){
        typeStr = @"yyyy-MM-dd HH:mm";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:typeStr];
    [dateFormatter setTimeZone:[[NSTimeZone alloc] initWithName:@"Asia/Shanghai"]];
    
    return dateFormatter;
}

#pragma mark --- 获取一个NSDate对象，根据传入的【格式化格式】以及【时间字符串】
+(NSDate *)rt_getDateWithFormatterType:(RTDateFormatterType)formatterType timeStr:(NSString *)timeStr
{
    NSDateFormatter *dateFormatter = [RTDateFormatterTool rt_getDateFormatterWithType:formatterType];
    
    NSDate *date = [dateFormatter dateFromString:timeStr];
    
    return date;
}

#pragma mark ---  获取一个时间字符串，根据传入的【格式化格式】以及【时间】
+(NSString *)rt_getTimeStrWithFormatterType:(RTDateFormatterType)formatterType date:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [RTDateFormatterTool rt_getDateFormatterWithType:formatterType];
    NSString *timeStr = [dateFormatter stringFromDate:date];
    return timeStr;
}
@end
