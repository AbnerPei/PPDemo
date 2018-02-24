//
//  NSDateFormatter+Helper.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/10/11.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import "NSDateFormatter+Helper.h"

@implementation NSDateFormatter (Helper)
+(instancetype)pp_dateFormatterWithFormatterType:(PPDateFormatterType)dateFormatterType
{
    NSString *dateFormatterStr; //默认
    switch (dateFormatterType) {
        case PPDateFormatterTypeLineYearMonthDayHourMinute:
            dateFormatterStr = @"yyyy-MM-dd HH:mm";
            break;
        case PPDateFormatterTypeLineMonthDay:
            dateFormatterStr = @"MM-dd";
            break;
        case PPDateFormatterTypeHourMinute:
            dateFormatterStr = @"HH:mm";
            break;
        default:
            dateFormatterStr = @"yyyy-MM-dd";
            break;
    }
    NSDateFormatter *df = [[NSDateFormatter alloc]init];
    df.dateFormat = dateFormatterStr;
    return df;
}
@end
