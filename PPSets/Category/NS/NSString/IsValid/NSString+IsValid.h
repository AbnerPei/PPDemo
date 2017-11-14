//
//  NSString+IsValid.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

UIKIT_EXTERN NSString * _Nonnull const PPStringIsValidTypePhoneNO;
UIKIT_EXTERN NSString * _Nonnull const PPStringIsValidTypeEmail;
UIKIT_EXTERN NSString * _Nonnull const PPStringIsValidTypeIDCard;
UIKIT_EXTERN NSString * _Nonnull const PPStringIsValidTypeBankCard;

typedef NS_ENUM(NSInteger,PPStringIsValidStyle) {
    PPStringIsValidStylePhoneNO = 0,
    PPStringIsValidStyleEmail,
    PPStringIsValidStyleIDCard,
    PPStringIsValidStyleBankCard
};

NS_ASSUME_NONNULL_BEGIN

/**
 字符串验证，统一用类方法
 */
@interface NSString (IsValid)

/** 001 验证字符串是否是【手机号码】 */
+(BOOL)pp_string_isPhoneNO:(NSString *)str;
/** 002 验证字符串是否是【邮箱】 */
+(BOOL)pp_string_isEmail:(NSString *)str;
/** 003 验证字符串是否是【身份证】 */
+(BOOL)pp_string_isIDCard:(NSString *)str;
/** 004 验证字符串是否是【银行卡】 */
+(BOOL)pp_string_isBankCard:(NSString *)str;

//====根据字符串标示or枚举判断
+(BOOL)pp_string_isValidWithValidIdentifier:(NSString *)validIdentifier str:(NSString *)str;
+(BOOL)pp_string_isValidWithValidStyle:(PPStringIsValidStyle)validStyle str:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
