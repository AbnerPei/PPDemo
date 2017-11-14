//
//  NSPredicate+EasyMake.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSPredicate (EasyMake)

/**
 根据字符串标示，返回一个谓词
 @param validIdentifier PPStringIsValidTypeXXX, see #import "NSString+IsValid.h"
 */
+(NSPredicate *)pp_predicate_easyMakeWithValidIdentifier:(NSString *)validIdentifier;
+(NSPredicate *)pp_predicate_easyMakeWithValidStyle:(PPStringIsValidStyle)validStyle;
@end
