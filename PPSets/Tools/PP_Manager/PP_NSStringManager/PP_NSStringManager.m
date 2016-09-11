//
//  PP_NSStringManager.m
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import "PP_NSStringManager.h"

@implementation PP_NSStringManager

+(PP_NSStringManager *)pp_shareInstance
{
    static PP_NSStringManager *aStringManager = nil;
    static dispatch_once_t onceStrManager;
    dispatch_once(&onceStrManager, ^{
        aStringManager = [[PP_NSStringManager alloc]init];
    });
    return aStringManager;
}

-(NSString *)pp_allStringUpper:(NSString *)aStr
{
    return [aStr uppercaseString];
}

-(NSString *)pp_allStringLower:(NSString *)aStr
{
    return [aStr lowercaseString];
}

-(NSString *)pp_firstStringUpper:(NSString *)aStr
{
    return [aStr capitalizedString];
}

-(NSMutableString *)pp_transformString:(NSString *)aStr
{
    NSMutableString *aMutableStr = [NSMutableString string];
    NSInteger aLength = aStr.length;
    for (int i = 0; i < aLength ; i++) {
        NSString *str = [aStr substringWithRange:NSMakeRange(i, 1)];
        [aMutableStr insertString:str atIndex:0];
    }
    return aMutableStr;
}
@end
