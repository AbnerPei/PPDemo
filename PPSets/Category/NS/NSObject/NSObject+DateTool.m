//
//  NSObject+DateTool.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/3.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import "NSObject+DateTool.h"

@implementation NSObject (DateTool)
/**
 判断当前日期是周几（星期几）
 */
+(NSString *)pp_dateToolForGetWeekMesWithDate:(NSDate *)date
                                     weekType:(DateToolWeekType)weekType
{
    //iOS 8有效
    NSCalendar* calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents* components = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    components = [calendar components:unitFlags fromDate:date];
    NSInteger week  = [components weekday];
    NSString *strWeek = nil;
    if (week == 1){
        strWeek = @"日";
    }else if(week == 2){
        strWeek = @"一";
    }else if(week == 3){
        strWeek = @"二";
    }else if(week == 4){
        strWeek = @"三";
    }else if(week == 5){
        strWeek = @"四";
    }else if(week == 6){
        strWeek = @"五";
    }else if(week == 7){
        strWeek = @"六";
    }
    if (strWeek.length > 0) {
        if (weekType == DateToolWeekTypeZhou) {
            return [NSString stringWithFormat:@"周%@",strWeek];
        }else{
            return [NSString stringWithFormat:@"星期%@",strWeek];
        }
    }
    return @"";
    
}
@end
