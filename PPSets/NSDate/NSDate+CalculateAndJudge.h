//
//  NSDate+CalculateAndJudge.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/10/12.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (CalculateAndJudge)

/**
 获取给定Date XX个月后的Date

 @param fromDate givenDate
 @param monthInterval XX个月
 */
+(NSDate *)pp_calculateDateFromDate:(NSDate *)fromDate
                      monthInterval:(NSUInteger)monthInterval;


/**
 给定日期是否是月末

 @param date <#date description#>
 @return <#return value description#>
 */
+(BOOL)pp_isEndOfMonthWithDate:(NSDate *)date;


/**
 获取当前日期距离monthInterval个月后的👼天数

 @param monthInterval <#monthInterval description#>
 @return <#return value description#>
 */
+(NSUInteger)pp_getDaysWithMonthInterval:(NSUInteger)monthInterval;


/**
 获取两个date间隔天数

 @param fromDate <#fromDate description#>
 @param toDate <#toDate description#>
 @return <#return value description#>
 */
+(NSUInteger)pp_getIntervalDaysFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;
@end
