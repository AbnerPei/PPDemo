//
//  NSDate+Helper.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/10/11.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSDateFormatter+Helper.h"

@interface NSDate (Helper)

/**
 世界标准时间UTC/GMT 转为当前系统时区对应的时间
 */
-(NSDate *)pp_dateFromUTC;

/**
 获取当前日期是周/星期几 返回结果如：@"周三"  ios8以后

 @param isZhou 是否是周X，而不是星期X
 */
-(NSString *)pp_strForWeekWithIsZhou:(BOOL)isZhou;


/**
 NSDate转NSString

 @param dateFormatterType <#dateFormatterType description#>
 @return <#return value description#>
 */
-(NSString *)pp_strForDateWithDateFormatterType:(PPDateFormatterType)dateFormatterType;


/**
 NSString转NSDate

 @param dateFormatterType <#dateFormatterType description#>
 @param dateStr <#dateStr description#>
 @return <#return value description#>
 */
+(NSDate *)pp_dateWithDateFormatterType:(PPDateFormatterType)dateFormatterType
                                dateStr:(NSString *)dateStr;


/**
 返回一个保护周XX的日期字符串 如“08-09 周三”

 @param dateFormatterType <#dateFormatterType description#>
 @param extraIsZhou <#extraIsZhou description#>
 @return <#return value description#>
 */
+(NSString *)pp_strForNeededWithDateFormatterType:(PPDateFormatterType)dateFormatterType
                                      extraIsZhou:(BOOL)extraIsZhou
                                          dateStr:(NSString *)dateStr;
@end
