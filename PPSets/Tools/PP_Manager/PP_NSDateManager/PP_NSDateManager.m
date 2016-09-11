//
//  PP_NSDateManager.m
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import "PP_NSDateManager.h"

@implementation PP_NSDateManager
+(PP_NSDateManager *)pp_shareInstance
{
    static PP_NSDateManager *aDateManage = nil;
    static dispatch_once_t onceDateManager;
    dispatch_once(&onceDateManager, ^{
        aDateManage = [[PP_NSDateManager alloc]init];
    });
    return aDateManage;
}
/*
 *
 * Format String         | Output String
 * --------------------- | --------------
 * M/d/y                 | 11/4/2012
 * MM/dd/yy              | 11/04/12
 * MMM d, ''yy           | Nov 4, '12
 * MMMM                  | November
 * E                     | Sun
 * EEEE                  | Sunday
 * 'Week' w 'of 52'      | Week 45 of 52
 * 'Day' D 'of 365'      | Day 309 of 365
 * QQQ                   | Q4
 * QQQQ                  | 4th quarter
 * m 'minutes past' h    | 9 minutes past 8
 * h:mm a                | 8:09 PM
 * HH:mm:ss's'           | 20:09:00s
 * HH:mm:ss:SS           | 20:09:00:00
 * h:mm a zz             | 8:09 PM CST
 * h:mm a zzzz           | 8:09 PM Central Standard Time
 * d HH:mm:ss Z | 2012-11-04 20:09:00 -0600
 *
 */

/** 根据时间戳（如@"1447400310"）返回一个字符串（如2015-11-12） */
-(NSString *)pp_timestampToTimeStr:(NSString *)TimeStr dateFormatterStr:(NSString *)dateFormatterStr
{
    
    NSTimeInterval time=[TimeStr doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    //实例化一个NSDateFormatter对象
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //设置时区（北京东八区）
    NSTimeZone *timeZone=[NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [dateFormatter setTimeZone:timeZone];
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:dateFormatterStr];
    NSString *currentDateStr = [dateFormatter stringFromDate: detaildate];
    
    return currentDateStr;
    
}
/** 当前时间转换为时间戳 */
-(NSString *)pp_toTimeStamp
{
    return [NSString stringWithFormat:@"%.0lf", [[NSDate date] timeIntervalSince1970]];
}

//农历时间
-(NSString*)pp_getChineseCalendarWithDate:(NSDate *)date{
    
    NSArray *chineseYears = [NSArray arrayWithObjects:
                             @"甲子", @"乙丑", @"丙寅", @"丁卯",  @"戊辰",  @"己巳",  @"庚午",  @"辛未",  @"壬申",  @"癸酉",
                             @"甲戌",   @"乙亥",  @"丙子",  @"丁丑", @"戊寅",   @"己卯",  @"庚辰",  @"辛己",  @"壬午",  @"癸未",
                             @"甲申",   @"乙酉",  @"丙戌",  @"丁亥",  @"戊子",  @"己丑",  @"庚寅",  @"辛卯",  @"壬辰",  @"癸巳",
                             @"甲午",   @"乙未",  @"丙申",  @"丁酉",  @"戊戌",  @"己亥",  @"庚子",  @"辛丑",  @"壬寅",  @"癸丑",
                             @"甲辰",   @"乙巳",  @"丙午",  @"丁未",  @"戊申",  @"己酉",  @"庚戌",  @"辛亥",  @"壬子",  @"癸丑",
                             @"甲寅",   @"乙卯",  @"丙辰",  @"丁巳",  @"戊午",  @"己未",  @"庚申",  @"辛酉",  @"壬戌",  @"癸亥", nil];
    
    NSArray *chineseMonths=[NSArray arrayWithObjects:
                            @"正月", @"二月", @"三月", @"四月", @"五月", @"六月", @"七月", @"八月",
                            @"九月", @"十月", @"冬月", @"腊月", nil];
    
    
    NSArray *chineseDays=[NSArray arrayWithObjects:
                          @"初一", @"初二", @"初三", @"初四", @"初五", @"初六", @"初七", @"初八", @"初九", @"初十",
                          @"十一", @"十二", @"十三", @"十四", @"十五", @"十六", @"十七", @"十八", @"十九", @"二十",
                          @"廿一", @"廿二", @"廿三", @"廿四", @"廿五", @"廿六", @"廿七", @"廿八", @"廿九", @"三十",  nil];
    
    
    NSCalendar *localeCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    unsigned unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth |  NSCalendarUnitDay;
    
    NSDateComponents *localeComp = [localeCalendar components:unitFlags fromDate:date];
    
    NSLog(@"%zd_%zd_%zd",localeComp.year,localeComp.month,localeComp.day);
    
    NSString *y_str = [chineseYears objectAtIndex:localeComp.year-1];
    NSString *m_str = [chineseMonths objectAtIndex:localeComp.month-1];
    NSString *d_str = [chineseDays objectAtIndex:localeComp.day-1];
    
    NSString *chineseCal_str =[NSString stringWithFormat: @"%@_%@_%@",y_str,m_str,d_str];
    
    return chineseCal_str;
}
//星期几
-(NSString*)pp_weekdayStringFromDate:(NSDate*)inputDate {
    
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}
/**
 *  获取明天日期
 *  @return NSDate类型
 */
-(NSDate *)pp_dateTomorrow
{
    return [[NSDate date] initWithTimeIntervalSinceNow:24 * 60 * 60 ];
}

/**
 *  获取昨天日期
 *  @return NSDate类型
 */
-(NSDate *)pp_dateYesterday
{
    return [[NSDate date] initWithTimeIntervalSinceNow: -24 * 60 * 60];
}

/**
 *  获取指定天数后的日期
 *  @param days 天数
 *  @return  NSDate类型
 */
-(NSDate *)pp_dateWithDaysFromNow:(NSUInteger) days
{
    return [[NSDate date] initWithTimeIntervalSinceNow:days * 24 * 60 * 60];
}

/**
 *  获取指定天数前的日期
 *  @param days 天数
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithDaysBeforeNow:(NSInteger) days
{
    return [[NSDate date] initWithTimeIntervalSinceNow:((-24) * 60 * 60 * days)];
}

/**
 *  获取指定小时数后的日期
 *  @param dHours 小时数
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithHoursFromNow:(NSUInteger) dHours
{
    return [[NSDate date] initWithTimeIntervalSinceNow:dHours * 60 * 60];
}

/**
 *  获取指定小时数前的日期
 *  @param dHours 小时数
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithHoursBeforeNow:(NSInteger) dHours
{
    return [[NSDate date] initWithTimeIntervalSinceNow:dHours * 60 * 60 * (-1)];
}

/**
 *  获取指定分钟后的日期
 *  @param dMinutes 分钟
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithMinutesFromNow:(NSUInteger) dMinutes
{
    return [[NSDate date] initWithTimeIntervalSinceNow:dMinutes * 60];
}

/**
 *  获取指定分钟前的日期
 *  @param dMinutes 分钟
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithMinutesBeformNow:(NSInteger) dMinutes
{
    return [[NSDate date] initWithTimeIntervalSinceNow:dMinutes * 60 * (-1)];
}

/**
 *  当前日期与指定日期比较是否相等
 *  @param dMinutes 分钟
 *  @return NSDate类型
 */
-(BOOL)pp_isEqualtoDatelgnoringTime:(NSDate *) aDate
{
    return [[NSDate date] isEqualToDate:aDate];
}

/**
 *  是不是今天
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isToday:(NSDate *) aDate
{
    NSCalendar *cld = [NSCalendar currentCalendar];
    return [cld isDateInToday:aDate];
}

/**
 *  是不是明天
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isTomorrow:(NSDate *) aDate
{
    NSCalendar *cld = [NSCalendar currentCalendar];
    return [cld isDateInTomorrow:aDate];
}

/**
 *  是不是昨天
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isYesterday:(NSDate *) aDate
{
    NSCalendar *cld = [NSCalendar currentCalendar];
    return [cld isDateInYesterday:aDate];
}

/**
 *  是不是同一周
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isSameWeekAsDate:(NSDate *) aDate
{
    NSDate *start;
    NSTimeInterval extends;
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDate *today = [NSDate date];
    BOOL success = [cal rangeOfUnit:NSCalendarUnitWeekday startDate:&start interval:&extends forDate:today];
    
    if (!success) {
        return false;
    }
    
    NSTimeInterval dateInSecs = [aDate timeIntervalSinceReferenceDate];
    NSTimeInterval dateStartInSecs = [start timeIntervalSinceReferenceDate];
    if (dateInSecs > dateStartInSecs && dateInSecs < (dateStartInSecs - extends)) {
        return true;
    }else {
        return false;
    }
}

/**
 *  是不是本周
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isThisWeek:(NSDate *) aDate
{
    NSDate *start;
    NSTimeInterval extends;
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDate *today = [NSDate date];
    // 根据参数提供的时间点，返回所在日历单位的开始时间。如果startDate和interval均可以计算，则返回YES；否则返回NO
    // extends获取的是日历单位所对应的秒数
    BOOL success = [cal rangeOfUnit:NSCalendarUnitWeekday startDate:&start interval:&extends forDate:today];
    
    if (!success) {
        return false;
    }
    
    NSTimeInterval dateInSecs = [aDate timeIntervalSinceReferenceDate];
    NSTimeInterval dateStartInSecs = [start timeIntervalSinceReferenceDate];
    if (dateInSecs > dateStartInSecs && dateInSecs < (dateStartInSecs - extends)) {
        return true;
    }else {
        return false;
    }
}

/**
 *  是不是下一周
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isNextWeek:(NSDate *) aDate
{
    NSDate *start;
    NSTimeInterval extends;
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDate *today = [NSDate date];
    BOOL success = [cal rangeOfUnit:NSCalendarUnitWeekday startDate:&start interval:&extends forDate:today];
    
    if (!success) {
        return false;
    }
    
    NSTimeInterval dateInSecs = [aDate timeIntervalSinceReferenceDate];
    NSTimeInterval dateStartInSecs = [start timeIntervalSinceReferenceDate];
    if (dateInSecs > (dateStartInSecs - extends) && dateInSecs < (dateStartInSecs - 2 * extends)) {
        return true;
    }else {
        return false;
    }
}

/**
 *  是不是上一周
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isLastWeek:(NSDate *) aDate
{
    NSDate *start;
    NSTimeInterval extends;
    NSCalendar *cal = [NSCalendar autoupdatingCurrentCalendar];
    NSDate *today = [NSDate date];
    BOOL success = [cal rangeOfUnit:NSCalendarUnitWeekday startDate:&start interval:&extends forDate:today];
    
    if (!success) {
        return false;
    }
    
    NSTimeInterval dateInSecs = [aDate timeIntervalSinceReferenceDate];
    NSTimeInterval dateStartInSecs = [start timeIntervalSinceReferenceDate];
    if (dateInSecs < dateStartInSecs && dateInSecs > (dateStartInSecs - extends)) {
        return true;
    }else {
        return false;
    }
    
}

/**
 *  是不是同一年
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isSameYearAsDate:(NSDate *) aDate andSecDate:(NSDate *) bDate
{
    NSDateFormatter *ds = [[NSDateFormatter alloc] init];
    [ds setDateFormat:@"yyyy"];
    NSString *bDateStr = [ds stringFromDate:bDate];
    NSString *aDateStr = [ds stringFromDate:aDate];
    
    if ([aDateStr isEqual:bDateStr]) {
        return true;
    }else {
        return false;
    }
}

/**
 *  是不是本年
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isThisYear:(NSDate *) aDate
{
    NSDateFormatter *ds = [[NSDateFormatter alloc] init];
    [ds setDateFormat:@"yyyy"];
    NSString *currentDateStr = [ds stringFromDate:[NSDate date]];
    NSString *compareDateStr = [ds stringFromDate:aDate];
    
    if ([currentDateStr isEqual:compareDateStr]) {
        return true;
    }else {
        return false;
    }
}

/**
 *  是不是下一年
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isNextYear:(NSDate *) aDate
{
    NSDateFormatter *ds = [[NSDateFormatter alloc] init];
    [ds setDateFormat:@"yyyy"];
    NSString *currentDateStr = [ds stringFromDate:[NSDate date]];
    NSString *compareDateStr = [ds stringFromDate:aDate];
    
    NSInteger currentDateInt = [currentDateStr integerValue];
    NSInteger compareDateInt = [compareDateStr integerValue];
    if (compareDateInt - currentDateInt == 1) {
        return true;
    }else {
        return false;
    }
}

/**
 *  是不是上一年
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isLastYear:(NSDate *) aDate
{
    NSDateFormatter *ds = [[NSDateFormatter alloc] init];
    [ds setDateFormat:@"yyyy"];
    NSString *currentDateStr = [ds stringFromDate:[NSDate date]];
    NSString *compareDateStr = [ds stringFromDate:aDate];
    
    NSInteger currentDateInt = [currentDateStr integerValue];
    NSInteger compareDateInt = [compareDateStr integerValue];
    if (currentDateInt - compareDateInt == 1) {
        return true;
    }else {
        return false;
    }
}

/**
 *  是不是比dDate早
 *  @param aDate 指定日期
 *  @return NSDate类型
 */
-(BOOL)pp_isEarlierThanDate:(NSDate *) aDate
{
    NSDate *date = [[NSDate alloc] init];
    if ([[date laterDate:aDate] isEqualToDate:aDate]) {
        return true;
    }else {
        return false;
    }
}

/**
 *  是不是比aData晚
 *  @param aDate 指定日期
 *  @return NSDate类型
 */
-(BOOL)pp_isLaterThanDate:(NSDate *) aDate
{
    NSDate *date = [[NSDate alloc] init];
    if ([[date earlierDate:aDate] isEqualToDate:aDate]) {
        return false;
    }else {
        return true;
    }
}


@end
