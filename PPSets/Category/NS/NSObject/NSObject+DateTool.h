//
//  NSObject+DateTool.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/3.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,DateToolWeekType) {
    DateToolWeekTypeZhou = 1,
    DateToolWeekTypeXingQi
};
@interface NSObject (DateTool)
/**
 判断当前日期是周几（星期几）
 */
+(NSString *)pp_dateToolForGetWeekMesWithDate:(NSDate *)date
                                     weekType:(DateToolWeekType)weekType;
@end
