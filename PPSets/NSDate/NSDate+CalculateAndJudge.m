//
//  NSDate+CalculateAndJudge.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/10/12.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import "NSDate+CalculateAndJudge.h"
#import "NSDate+Helper.h"

#define K_PT_ValidMonths 6

@implementation NSDate (CalculateAndJudge)

#pragma mark --- 获取给定Date XX个月后的Date
+(NSDate *)pp_calculateDateFromDate:(NSDate *)fromDate monthInterval:(NSUInteger)monthInterval
{
    //获取当年的月份，当月的总天数
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitCalendar fromDate:fromDate];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateStyle:NSDateFormatterFullStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    //    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"Asia/Shanghai"]];
    
    NSString *dateStr = @"";
    NSInteger endDay = 0;//天
    NSDate *newDate = [NSDate date];//新的年&月
    //判断是否是下一年
    if (components.month+monthInterval > 12) {
        //是下一年
        dateStr = [NSString stringWithFormat:@"%zd-%zd-01",components.year+(components.month+monthInterval)/12,(components.month+monthInterval)%12];
        newDate = [formatter dateFromString:dateStr];
        //新月份的天数
        NSInteger newDays = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:newDate].length;
        if ([NSDate pp_isEndOfMonthWithDate:fromDate]) {//当前日期处于月末
            endDay = newDays;
        } else {
            endDay = newDays < components.day?newDays:components.day;
        }
        dateStr = [NSString stringWithFormat:@"%zd-%zd-%zd",components.year+(components.month+monthInterval)/12,(components.month+monthInterval)%12,endDay];
    } else {
        //依然是当前年份
        dateStr = [NSString stringWithFormat:@"%zd-%zd-01",components.year,components.month+monthInterval];
        newDate = [formatter dateFromString:dateStr];
        //新月份的天数
        NSInteger newDays = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:newDate].length;
        if ([NSDate pp_isEndOfMonthWithDate:fromDate]) {//当前日期处于月末
            endDay = newDays;
        } else {
            endDay = newDays < components.day?newDays:components.day;
        }
        
        dateStr = [NSString stringWithFormat:@"%zd-%zd-%zd",components.year,components.month+monthInterval,endDay];
    }
    
    newDate = [[formatter dateFromString:dateStr] pp_dateFromUTC];
    
    return newDate;
}

#pragma mark --- 给定日期是否是月末
+(BOOL)pp_isEndOfMonthWithDate:(NSDate *)date
{
    NSCalendar *calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    NSInteger daysInMonth = [calendar rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:date].length;
    NSDateComponents *componets = [calendar components:NSCalendarUnitDay fromDate:date];
    if (componets.day >= daysInMonth) {
        return YES;
    }
    return NO;
}

#pragma mark --- 获取当前日期距离monthInterval个月后的👼天数
+(NSUInteger)pp_getDaysWithMonthInterval:(NSUInteger)monthInterval
{
    NSDate *lastDate = [NSDate pp_calculateDateFromDate:[NSDate date] monthInterval:K_PT_ValidMonths];
    
    NSInteger days = [NSDate pp_getIntervalDaysFromDate:[NSDate date] toDate:lastDate];

    //防止意外
    if (days <= monthInterval*30 ) {
        days = monthInterval*30;
    }
    if (days >= monthInterval*31) {
        days = monthInterval*31;
    }
    
    return days+1;
}
#pragma mark --- 获取两个date间隔天数
+(NSUInteger)pp_getIntervalDaysFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate
{
    fromDate = [fromDate pp_dateFromUTC];
    toDate = [toDate pp_dateFromUTC];
    
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    unsigned int unitFlags = NSCalendarUnitDay;
    BOOL isAscend = NO;
    if ([fromDate earlierDate:toDate] == fromDate) {
        isAscend = YES;
    }
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:isAscend?fromDate:toDate  toDate:isAscend?toDate:fromDate  options:0];
    return [comps day];
}
@end
