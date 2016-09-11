//
//  PP_NSStringManager.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PP_NSStringManager : NSObject

+(PP_NSStringManager *)pp_shareInstance;
/** 字母全部大写 */
-(NSString *)pp_allStringUpper:(NSString *)aStr;
/** 字母全部小写 */
-(NSString *)pp_allStringLower:(NSString *)aStr;
/** 首字母大写(只有首字母大写) */
-(NSString *)pp_firstStringUpper:(NSString *)aStr;

/** 反转字符串 */
-(NSMutableString *)pp_transformString:(NSString *)aStr;

@end
