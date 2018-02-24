//
//  NSDate+EasyDateHelper.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/25.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import "NSDate+EasyDateHelper.h"
#define PPNSDate           [NSDate pp_date_sharedInstance];


@implementation NSDate (EasyDateHelper)

static NSCalendar *_calendar = nil;
static NSDateFormatter *_formatter = nil;

-(NSInteger)pp_date_year{
    return splitDate(NSCalendarUnitYear,self);
}
-(NSInteger)pp_date_month{
    return splitDate(NSCalendarUnitMonth, self);
}
-(NSInteger)pp_date_day{
    return splitDate(NSCalendarUnitDay, self);
}
-(NSInteger)pp_date_hour{
    return splitDate(NSCalendarUnitHour, self);
}
-(NSInteger)pp_date_minute{
    return splitDate(NSCalendarUnitMinute, self);
}
-(NSInteger)pp_date_second{
    return splitDate(NSCalendarUnitSecond, self);
}

/** 拆分(split)某个日期 年/月/日/时/分/秒 */
static NSInteger splitDate(NSCalendarUnit calendarUnit,NSDate *date){
    PPNSDate
    NSDateComponents *dateComponents = [_calendar components:calendarUnit fromDate:date];
    switch (calendarUnit) {
        case NSCalendarUnitYear:
            return dateComponents.year;
            break;
        case NSCalendarUnitMonth:
            return dateComponents.month;
            break;
        case NSCalendarUnitDay:
            return dateComponents.day;
            break;
        case NSCalendarUnitHour:
            return dateComponents.hour;
            break;
        case NSCalendarUnitMinute:
            return dateComponents.minute;
            break;
        case NSCalendarUnitSecond:
            return dateComponents.second;
            break;
            
        default:
            return 0;
            break;
    }
}

#pragma mark --- 单例初始化（内部用）
+(void)pp_date_sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (!_calendar) {
            _calendar = [NSCalendar currentCalendar];
        }
        if (!_formatter) {
            _formatter = [[NSDateFormatter alloc]init];
        }
    });
    
}
#pragma mark --- 初始化一个Calendar      【单例】
+(NSCalendar *)pp_date_sharedCalendar
{
    PPNSDate
    return _calendar;
}
#pragma mark --- 初始化一个DateFormatter 【单例】
+(NSDateFormatter *)pp_date_sharedDateFormatter
{
    PPNSDate
    return _formatter;
}

#pragma mark --- 是否是闰年
-(BOOL)pp_date_isLeapYear
{
    return [NSDate pp_date_isLeapYearWithDate:self];
}
+(BOOL)pp_date_isLeapYearWithDate:(NSDate *)date
{
    return [NSDate pp_date_isLeapYearWithYear:date.pp_date_year];
}
+(BOOL)pp_date_isLeapYearWithYear:(NSUInteger)year
{
    if ((year % 4  == 0 && year % 100 != 0) || year % 400 == 0) {
        return YES;
    }
    return NO;
}

#pragma mark --- 获取XX天后的时间，可以指定格式,时间是负值意味着前XX天
-(NSDate *)pp_date_afterDays:(NSInteger)days
{
    return [NSDate pp_date_afterDays:days date:self];
}
+(NSDate *)pp_date_afterDays:(NSInteger)days
                        date:(NSDate *)date
{
    PPNSDate
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setDay:days];
    NSDate *newDate = [_calendar dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}
-(NSString *)pp_date_strAfterDays:(NSInteger)days
                        dateStyle:(PPNSDateStyle)dateStyle
{
    return [NSDate pp_date_strAfterDays:days dateStyle:dateStyle date:self];
}
+(NSString *)pp_date_strAfterDays:(NSInteger)days
                        dateStyle:(PPNSDateStyle)dateStyle
                             date:(NSDate *)date
{
    NSDate *aDate = [NSDate pp_date_afterDays:days date:date];
    return [aDate pp_date_strWithDateStyle:dateStyle];
}

-(NSDate *)pp_date_afterMonths:(NSInteger)months
{
    return [NSDate pp_date_afterMonths:months date:self];
}
+(NSDate *)pp_date_afterMonths:(NSInteger)months
                          date:(NSDate *)date
{
    PPNSDate
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:months];
    NSDate *newDate = [_calendar dateByAddingComponents:dateComponents toDate:date options:0];
    return newDate;
}
-(NSString *)pp_date_strAfterMonths:(NSInteger)months
                          dateStyle:(PPNSDateStyle)dateStyle
{
    NSDate *aDate = [self pp_date_afterMonths:months];
    return [aDate pp_date_strWithDateStyle:dateStyle];
}
+(NSString *)pp_date_strAfterMonths:(NSInteger)months
                          dateStyle:(PPNSDateStyle)dateStyle
                               date:(NSDate *)date
{
    NSDate *aDate = [NSDate pp_date_afterMonths:months date:date];
    return [aDate pp_date_strWithDateStyle:dateStyle];
}

#pragma mark --- 字符串日期转date类型的日期
+(NSDate *)pp_date_withDateStr:(NSString *)dateStr
                     dateStrDateStyle:(PPNSDateStyle)dateStrDateStyle
{
    return [NSDate pp_date_withDateStr:dateStr dateStrDateStyle:dateStrDateStyle afterDays:0];
}
+(NSDate *)pp_date_withDateStr:(NSString *)dateStr
                     dateStrDateStyle:(PPNSDateStyle)dateStrDateStyle
                     afterDays:(NSInteger)days
{
    PPNSDate
    _formatter.dateFormat = [NSDateFormatter pp_dateFormatWithDateStyle:dateStrDateStyle];
    NSDate *aDate = [_formatter dateFromString:dateStr];
    return [aDate pp_date_afterDays:days];
}

#pragma mark --- 字符串日期转指定格式的字符串类型的日期
+(NSString *)pp_date_strWithDateStr:(NSString *)dateStr
                   dateStrDateStyle:(PPNSDateStyle)dateStrDateStyle
                          dateStyle:(PPNSDateStyle)dateStyle
{
    return [NSDate pp_date_strWithDateStr:dateStr dateStrDateStyle:dateStrDateStyle dateStyle:dateStyle afterDays:0];
}
+(NSString *)pp_date_strWithDateStr:(NSString *)dateStr
                   dateStrDateStyle:(PPNSDateStyle)dateStrDateStyle
                          dateStyle:(PPNSDateStyle)dateStyle
                          afterDays:(NSInteger)days
{
    PPNSDate
    _formatter.dateFormat = [NSDateFormatter pp_dateFormatWithDateStyle:dateStrDateStyle];
    NSDate *aDate = [_formatter dateFromString:dateStr];
    return [aDate pp_date_strAfterDays:days dateStyle:dateStyle];
}



#pragma mark --- 明天 【日期】
+(NSDate *)pp_date_tomorrow
{
    return [[NSDate date] pp_date_afterDays:1];
}
#pragma mark --- 根据指定的时间格式（dateStyle）返回明天的时间字符串
+(NSString *)pp_dateTomorrowWithDateStyle:(PPNSDateStyle)dateStyle
{
    NSDate *tomorrowDate = [NSDate pp_date_tomorrow];
    return [tomorrowDate pp_date_strWithDateStyle:dateStyle];
}


#pragma mark --- date转dateStyle字符串
-(NSString *)pp_date_strWithDateStyle:(PPNSDateStyle)dateStyle
{
    return [NSDate pp_date_strWithDateStyle:dateStyle date:self];
}
+(NSString *)pp_date_strWithDateStyle:(PPNSDateStyle)dateStyle
                                 date:(NSDate *)date
{
    PPNSDate
    NSString *formatStr = [NSDateFormatter pp_dateFormatWithDateStyle:dateStyle];
    _formatter.dateFormat = formatStr;
    return [_formatter stringFromDate:date];
}

+(NSInteger)pp_dateIntervalBetweenADateStr:(NSString *)aDateStr bDateStr:(NSString *)bDateStr dateStyle:(PPNSDateStyle)dateStyle
{
    PPNSDate
    NSString *formatStr = [NSDateFormatter pp_dateFormatWithDateStyle:dateStyle];
    _formatter.dateFormat = formatStr;
    NSDate *aDate = [_formatter dateFromString:aDateStr];
    NSDate *bDate = [_formatter dateFromString:bDateStr];
    // 需要对比的时间数据
//    NSCalendarUnit unit = NSCalendarUnitYear | NSCalendarUnitMonth
//    | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
//    NSDateComponents *dateComponents = [_calendar components:unit fromDate:aDate toDate:bDate options:0];
//    NSCalendar *calendar = [NSCalendar currentCalendar];
//    NSCalendarUnit unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
//    NSDateComponents *dateComponents = [calendar components:unit fromDate:aDate toDate:bDate options:0];
    NSTimeInterval ti = [aDate timeIntervalSinceDate:bDate];

    return (NSInteger)ti;
    
}
@end


