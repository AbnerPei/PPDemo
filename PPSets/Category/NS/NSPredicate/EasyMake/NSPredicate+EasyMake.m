//
//  NSPredicate+EasyMake.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSPredicate+EasyMake.h"

@implementation NSPredicate (EasyMake)
#pragma mark --- 根据字符串标示，返回一个谓词
+(NSPredicate *)pp_predicate_easyMakeWithValidIdentifier:(NSString *)validIdentifier
{
    if ([validIdentifier isEqualToString:PPStringIsValidTypePhoneNO] ) {
        return [NSPredicate predicateWithFormat:@"SELF MATCHES %@", K_Regex_PhoneNO];;
    }else if ([validIdentifier isEqualToString:PPStringIsValidTypeEmail]){
        return [NSPredicate predicateWithFormat:@"SELF MATCHES %@", K_Regex_Email];;
    }else{
        return nil;
    }
}
+(NSPredicate *)pp_predicate_easyMakeWithValidStyle:(PPStringIsValidStyle)validStyle
{
    if (validStyle == PPStringIsValidStylePhoneNO) {
        return [NSPredicate pp_predicate_easyMakeWithValidIdentifier:PPStringIsValidTypePhoneNO];
    }else if (validStyle == PPStringIsValidStyleEmail){
        return [NSPredicate pp_predicate_easyMakeWithValidIdentifier:PPStringIsValidTypeEmail];
    }else{
        return nil;
    }
}
@end
