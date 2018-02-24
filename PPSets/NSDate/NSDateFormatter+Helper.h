//
//  NSDateFormatter+Helper.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/10/11.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,PPDateFormatterType) {
    PPDateFormatterTypeLineYearMonthDay = 0,                  //2017-10-12
    PPDateFormatterTypeLineYearMonthDayHourMinute,            //2017-10-12 09:44
    PPDateFormatterTypeLineMonthDay,                          //10-12
    PPDateFormatterTypeHourMinute                             //09:44
};

@interface NSDateFormatter (Helper)

+(instancetype)pp_dateFormatterWithFormatterType:(PPDateFormatterType)dateFormatterType;
@end
