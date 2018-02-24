//
//  NSDate+EasyDateHelper.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/25.
//  Copyright © 2017年 JinRi . All rights reserved.
//
/*
   ✎ 声明：✎
    日期处理是所有项目多少都会用到的，尤其项目中用到日历。如果每一次都写一大堆，不仅项目代码不优雅，而且在这个处理上会耗费很多时间，还容易出错，尽管GitHub或者其它地方，有各种处理时间的Category，但是，很多好用是好用，不容易调用，API不清晰，so，本质“傻瓜”的原则，整理该Category,方便你我。
    ------2017-12-05------
   ✎ 使用说明：✎
   ⓵ 所有方法or属性，都是以pp_date_开头
   ⓶
 
 */

#import <Foundation/Foundation.h>
#import "NSDateFormatter+EasyDateFormatterHelper.h"


#define PPNSCalendar       [NSDate pp_date_sharedCalendar]
#define PPNSDateFormatter  [NSDate pp_date_sharedDateFormatter]


@interface NSDate (EasyDateHelper)
@property (readonly) NSInteger pp_date_year;
@property (readonly) NSInteger pp_date_month;
@property (readonly) NSInteger pp_date_day;
@property (readonly) NSInteger pp_date_hour;
@property (readonly) NSInteger pp_date_minute;
@property (readonly) NSInteger pp_date_second;

/** 初始化一个Calendar      【单例】 */
+(NSCalendar *)pp_date_sharedCalendar;
/** 初始化一个DateFormatter 【单例】 */
+(NSDateFormatter *)pp_date_sharedDateFormatter;


/**
 是否是闰年
         ☢示例
          BOOL isLeap1 = [NSDate pp_date_isLeapYearWithYear:2008];
          BOOL isLeap2 = [[NSDate date] pp_date_isLeapYear];
          BOOL isleap3 = [NSDate pp_date_isLeapYearWithDate:[NSDate dateWithTimeIntervalSinceNow:24*3600]];
          JRLog(@"%d--%d--%d",isLeap1,isLeap2,isleap3);
          //2017-12-05 15:58:59  1--0--0
 */
-(BOOL)pp_date_isLeapYear;
+(BOOL)pp_date_isLeapYearWithDate:(NSDate *)date;
+(BOOL)pp_date_isLeapYearWithYear:(NSUInteger)year;

/**
 获取XX天后的时间，可以指定格式,时间是负值意味着前XX天
         ☢示例
          NSDate *aDate = [[NSDate dateWithTimeIntervalSinceNow:-3600*48] pp_date_afterDays:5];
          NSDate *bDate = [NSDate pp_date_afterDays:-5 byDate:[NSDate date]];
          NSLog(@"aDate is %@\n bDate is %@",aDate,bDate);
          //2017-12-05 16:33:54 aDate is Fri Dec  8 16:32:52 2017
          // bDate is Thu Nov 30 16:32:52 2017
 */
-(NSDate *)pp_date_afterDays:(NSInteger)days;
+(NSDate *)pp_date_afterDays:(NSInteger)days
                        date:(NSDate *)date;
-(NSString *)pp_date_strAfterDays:(NSInteger)days
                        dateStyle:(PPNSDateStyle)dateStyle;
+(NSString *)pp_date_strAfterDays:(NSInteger)days
                        dateStyle:(PPNSDateStyle)dateStyle
                             date:(NSDate *)date;

/**
 获取XX月后的时间，可以指定格式,时间是负值意味着前XX月
         ☢示例
         NSDate *date = [NSDate date];
         NSDate *newDate = [date pp_date_afterMonths:6];
         NSDate *newDate1 = [date pp_date_afterDays:180];
         JRLog(@"newDate is %@",newDate);
         JRLog(@"newDate1 is %@",newDate1);
         //2017-12-07 09:33:52 newDate is Thu Jun  7 09:33:52 2018
         //2017-12-07 09:33:52 newDate1 is Tue Jun  5 09:33:52 2018
 */
-(NSDate *)pp_date_afterMonths:(NSInteger)months;
+(NSDate *)pp_date_afterMonths:(NSInteger)months
                          date:(NSDate *)date;
-(NSString *)pp_date_strAfterMonths:(NSInteger)months
                          dateStyle:(PPNSDateStyle)dateStyle;
+(NSString *)pp_date_strAfterMonths:(NSInteger)months
                          dateStyle:(PPNSDateStyle)dateStyle
                               date:(NSDate *)date;

/**
 字符串日期转date类型的日期
         ☢示例
         NSString *dateStr1 = @"2017/08/21 14:24";
         NSString *dateStr2 = @"2017年03月12日";
         NSDate *aDate = [NSDate pp_date_withDateStr:dateStr1 dateStrDateStyle:PPNSDateStyleSlash_yyyyMMdd_HHmm afterDays:3];
         NSString *changedStr = [NSDate pp_date_strWithDateStr:dateStr2 dateStrDateStyle:PPNSDateStyleLine_CN_yyyyMMdd dateStyle:PPNSDateStyleLine_yyyyMMdd afterDays:-3];
         JRLog(@"\naDate is %@\nchangedStr is %@",aDate,changedStr);
        //aDate is Thu Aug 24 14:24:00 2017
        //changedStr is 2017-03-09
 */
+(NSDate *)pp_date_withDateStr:(NSString *)dateStr
              dateStrDateStyle:(PPNSDateStyle)dateStrDateStyle;
+(NSDate *)pp_date_withDateStr:(NSString *)dateStr
              dateStrDateStyle:(PPNSDateStyle)dateStrDateStyle
                     afterDays:(NSInteger)days;

/**
 字符串日期转指定格式的字符串类型的日期
 
 #warning 日期字符串转date时必须知晓日期字符串的格式
 @param dateStr 给定的字符串日期
 @param dateStrDateStyle 给定的字符串日期的格式
 @param dateStyle 返回的字符串的日期格式
 
 */
+(NSString *)pp_date_strWithDateStr:(NSString *)dateStr
                   dateStrDateStyle:(PPNSDateStyle)dateStrDateStyle
                          dateStyle:(PPNSDateStyle)dateStyle;
+(NSString *)pp_date_strWithDateStr:(NSString *)dateStr
                   dateStrDateStyle:(PPNSDateStyle)dateStrDateStyle
                          dateStyle:(PPNSDateStyle)dateStyle
                          afterDays:(NSInteger)afterDays;;

//=====================  明天  =====================
/**
 明天 【日期】
          ☢示例
           NSDate *tomorrowDate = [NSDate pp_dateTomorrow];
           JRLog(@"tomorrowDate is %@\n",tomorrowDate);
           //2017-12-04 15:46:26 tomorrowDate is Tue Dec  5 15:46:26 2017
 */
+(NSDate *)pp_date_tomorrow;
/**
 根据指定的时间格式（dateStyle）返回明天的时间字符串
 @param dateStyle 时间格式
          ☢示例01
          NSString *tomorrowStr_CN1 = [NSDate pp_dateTomorrowWithDateStyle:PPNSDateStyleLine_CN_yyyyMMdd];
          JRLog(@"tomorrowStr(中文) is %@\n",tomorrowStr_CN1);
          // 2017-12-04 15:46:26 tomorrowStr(中文) is 2017年12月05日
 
          ☢示例02
          NSString *tomorrowStr_EN1 = [NSDate pp_dateTomorrowWithDateStyle:PPNSDateStyleLine_yyyyMMdd_HHmmss];
          JRLog(@"tomorrowStr(英文) is %@\n",tomorrowStr_EN1);
          // 2017-12-04 15:46:39 tomorrowStr(英文) is 2017-12-05 15:46:26
     
 */
+(NSString *)pp_date_str_tomorrowWithDateStyle:(PPNSDateStyle)dateStyle;

/**
 date根据dateStyle格式转成字符串
 @param dateStyle 时间格式
         ☢示例
         NSDate *aDate = [NSDate dateWithTimeIntervalSinceNow:3600*24];
         NSString *aDateStr = [aDate pp_dateStrWithDateStyle:PPNSDateStyleLine_CN_yyyyMMdd_HHmmss];
         JRLog(@"aDateStr is %@",aDateStr);
         //2017-12-05 11:52:54 aDateStr is 2017年12月06日 11时52分49秒
 
 */
-(NSString *)pp_date_strWithDateStyle:(PPNSDateStyle)dateStyle;
+(NSString *)pp_date_strWithDateStyle:(PPNSDateStyle)dateStyle date:(NSDate *)date;

+(NSInteger)pp_dateIntervalBetweenADateStr:(NSString *)aDateStr bDateStr:(NSString *)bDateStr dateStyle:(PPNSDateStyle)dateStyle;
@end

