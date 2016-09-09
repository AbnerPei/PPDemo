//
//  NSString+PPSets.h
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (PPSets)

@end


@interface NSString (PPTime)
/**获取当前时间*/
//format: @"yyyy-MM-dd HH:mm:ss"、@"yyyy年MM月dd日 HH时mm分ss秒"
+ (NSString *)pp_currentDateWithFormat:(NSString *)format;
/**
 *  计算上次日期距离现在多久
 *
 *  @param lastTime    上次日期(需要和格式对应)
 *  @param format1     上次日期格式
 *  @param currentTime 最近日期(需要和格式对应)
 *  @param format2     最近日期格式
 *
 *  @return xx分钟前、xx小时前、xx天前
 */
+ (NSString *)pp_timeIntervalFromLastTime:(NSString *)lastTime
                        lastTimeFormat:(NSString *)format1
                         ToCurrentTime:(NSString *)currentTime
                     currentTimeFormat:(NSString *)format2;


/**获取字符串(或汉字)首字母*/
+ (NSString *)pp_firstCharacterWithString:(NSString *)string;

/**将字符串数组按照元素首字母顺序进行排序分组
 key : 首字母大写
 value : 对应的参数
 */
+ (NSDictionary *)pp_dictionaryOrderByCharacterWithOriginalArray:(NSArray *)array;

@end