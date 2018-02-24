//
//  NSString+IsValid.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger,PPStringIsValidStyle) {
    PPStringIsValidStylePhoneNO = 0,
    PPStringIsValidStyleEmail,
    PPStringIsValidStyleIDCard,
    PPStringIsValidStyleBankCard
};

/** 某个字符串类型 */
typedef NS_ENUM(NSInteger,PPStringType){
    PPStringTypeNumber,
    PPStringTypeLetter,
    PPStringTypeChinese
};

//常用正则表达式
//手机号
#define K_Regex_PhoneNO   @"^1[3578]\\d{9}$"
//邮箱
#define K_Regex_Email     @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"

/**
 字符串验证，统一用类方法
 */
@interface NSString (IsValid)

/** 001 验证字符串是否是【手机号码】 */
+(BOOL)pp_strIsPhoneNO:(NSString *)str;
/** 002 验证字符串是否是【邮箱】 */
+(BOOL)pp_strIsEmail:(NSString *)str;
/** 003 验证字符串是否是【身份证】 */
+(BOOL)pp_strIsIDCard:(NSString *)str;
/** 004 验证字符串是否是【银行卡】 */
+(BOOL)pp_strIsBankCard:(NSString *)str;

//====根据字符串标示or枚举判断
+(BOOL)pp_strIsValidWithValidStyle:(PPStringIsValidStyle)validStyle str:(NSString *)str;


/** 字符串是不是纯字母 */
-(BOOL)pp_isAllLetter;
/** 【某个字符串】是不是字母 */
-(BOOL)pp_isLetter;
/** 字符串是不是纯汉字 */
-(BOOL)pp_isAllChinese;
/** 【某个字符串】是不是汉字 */
-(BOOL)pp_isChinese;
/** 字符串是不是纯汉字 */
-(BOOL)pp_isAllNumber;
/** 【某个字符串】是不是汉字 */
-(BOOL)pp_isNumber;

@end

@interface NSPredicate (EasyMake)
/**
 根据字符串标示，返回一个谓词
 */
+(NSPredicate *)pp_predicateMakeWithValidStyle:(PPStringIsValidStyle)validStyle;
@end

NS_ASSUME_NONNULL_END
