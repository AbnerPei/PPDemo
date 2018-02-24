//
//  NSDate+Helper.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/10/11.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import "NSDate+Helper.h"

@implementation NSDate (Helper)
#pragma mark --- 世界标准时间UTC /GMT 转为当前系统时区对应的时间
-(NSDate *)pp_dateFromUTC
{
    //设置源日期时区
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];//或GMT
    //设置转换后的目标日期时区
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    //得到源日期与世界标准时间的偏移量
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:self];
    //目标日期与本地时区的偏移量
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:self];
    //得到时间偏移量的差值
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    //转为现在时间
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:self];
    
    return destinationDateNow;
}

#pragma mark --- 获取当前日期是周/星期几 返回结果如：@"周三"
-(NSString *)pp_strForWeekWithIsZhou:(BOOL)isZhou
{
    NSArray *weekdays;
    if (isZhou) {
        weekdays = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    }else{
        weekdays  = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    }
    
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:self];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

#pragma mark --- NSDate转NSString
-(NSString *)pp_strForDateWithDateFormatterType:(PPDateFormatterType)dateFormatterType
{
    NSDateFormatter *df = [NSDateFormatter pp_dateFormatterWithFormatterType:dateFormatterType];
    NSDate *date = [self pp_dateFromUTC];
    NSString *str = [df stringFromDate:date];
    return str;
}
#pragma mark --- 返回一个保护周XX的日期字符串 如“08-09 周三”
+(NSString *)pp_strForNeededWithDateFormatterType:(PPDateFormatterType)dateFormatterType extraIsZhou:(BOOL)extraIsZhou dateStr:(NSString *)dateStr
{
    NSDate *aDate = [NSDate pp_dateWithDateFormatterType:PPDateFormatterTypeLineYearMonthDay dateStr:dateStr];
    NSString *weekStr = [aDate pp_strForWeekWithIsZhou:extraIsZhou];
    
    NSString *dateTimeStr = [aDate pp_strForDateWithDateFormatterType:dateFormatterType];
    NSString *str = [NSString stringWithFormat:@"%@ %@",dateTimeStr,weekStr];
    return str;
}

#pragma mark --- NSString转NSDate
+(NSDate *)pp_dateWithDateFormatterType:(PPDateFormatterType)dateFormatterType dateStr:(NSString *)dateStr
{
    NSDateFormatter *df = [NSDateFormatter pp_dateFormatterWithFormatterType:dateFormatterType];
    NSDate *aDate = [[df dateFromString:dateStr] pp_dateFromUTC];
    return aDate;
}
@end
