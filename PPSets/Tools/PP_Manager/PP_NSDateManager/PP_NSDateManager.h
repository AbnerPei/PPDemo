//
//  PP_NSDateManager.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PP_NSDateManager : NSObject

+(PP_NSDateManager *)pp_shareInstance;
/**
 *  根据时间戳（如@"1447400310"）返回一个字符串（如2015-11-12）
 *
 *  @param TimeStr         如： @"1447400310"
 *  @param dateFormatterStr @"yyyy-MM-dd"
 *
 *  @return 如：2015-11-12
 *
 *  timestamp : 时间戳【英---》中】
 */

-(NSString *)pp_timestampToTimeStr:(NSString *)TimeStr dateFormatterStr:(NSString *)dateFormatterStr;

/*!
 *  @author ╰莪呮想好好宠Nǐつ, 15-12-04 14:12:33
 *
 *  当前时间转换为时间戳
 */
-(NSString *)pp_toTimeStamp;
//农历时间
-(NSString*)pp_getChineseCalendarWithDate:(NSDate *)date;
//星期几
-(NSString*)pp_weekdayStringFromDate:(NSDate*)inputDate;
/**
 *  获取明天日期
 *  @return NSDate类型
 */
-(NSDate *)pp_dateTomorrow;

/**
 *  获取昨天日期
 *  @return NSDate类型
 */
-(NSDate *)pp_dateYesterday;

/**
 *  获取指定天数后的日期
 *  @param days 天数
 *  @return  NSDate类型
 */
-(NSDate *)pp_dateWithDaysFromNow:(NSUInteger) days;

/**
 *  获取指定天数前的日期
 *  @param days 天数
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithDaysBeforeNow:(NSInteger) days;

/**
 *  获取指定小时数后的日期
 *  @param dHours 小时数
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithHoursFromNow:(NSUInteger) dHours;

/**
 *  获取指定小时数前的日期
 *  @param dHours 小时数
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithHoursBeforeNow:(NSInteger) dHours;

/**
 *  获取指定分钟后的日期
 *  @param dMinutes 分钟
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithMinutesFromNow:(NSUInteger) dMinutes;

/**
 *  获取指定分钟前的日期
 *  @param dMinutes 分钟
 *  @return NSDate类型
 */
-(NSDate *)pp_dateWithMinutesBeformNow:(NSInteger) dMinutes;

/**
 *  当前日期与指定日期比较是否相等
 *  @param dMinutes 分钟
 *  @return NSDate类型
 */
-(BOOL)pp_isEqualtoDatelgnoringTime:(NSDate *) aDate;

/**
 *  是不是今天
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isToday:(NSDate *) aDate;

/**
 *  是不是明天
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isTomorrow:(NSDate *) aDate;

/**
 *  是不是昨天
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isYesterday:(NSDate *) aDate;

/**
 *  是不是同一周
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isSameWeekAsDate:(NSDate *) aDate;

/**
 *  是不是本周
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isThisWeek:(NSDate *) aDate;

/**
 *  是不是下一周
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isNextWeek:(NSDate *) aDate;

/**
 *  是不是上一周
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isLastWeek:(NSDate *) aDate;

/**
 *  是不是同一年
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isSameYearAsDate:(NSDate *) aDate andSecDate:(NSDate *) bDate;

/**
 *  是不是本年
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isThisYear:(NSDate *) aDate;

/**
 *  是不是下一年
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isNextYear:(NSDate *) aDate;

/**
 *  是不是上一年
 *  @param aDate 日期
 *  @return NSDate类型
 */
-(BOOL)pp_isLastYear:(NSDate *) aDate;

/**
 *  是不是比dDate早
 *  @param aDate 指定日期
 *  @return NSDate类型
 */
-(BOOL)pp_isEarlierThanDate:(NSDate *) aDate;

/**
 *  是不是比aData晚
 *  @param aDate 指定日期
 *  @return NSDate类型
 */
-(BOOL)pp_isLaterThanDate:(NSDate *) aDate;


@end
