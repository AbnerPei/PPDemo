//
//  NSString+Safe.m
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/4.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+Safe.h"

@implementation NSString (Safe)
#pragma mark --- 对字符串安全处理
-(NSString *)pp_str_safe
{
    NSString *str = self;
    if (isSafeStr(str)) {
        return str;
    }else{
        return @"";
    }
}
#pragma mark --- 判断字符串是不是安全的
-(BOOL)pp_str_isSafe
{
    NSString *str = self;
    return isSafeStr(str);
}

static BOOL isSafeStr(NSString *str){
    if ([str isKindOfClass:[NSNull class]] || str == nil || str.length == 0 || [str isEqualToString:@"(null)"]  || [str isEqualToString:@"null"] || [str isEqualToString:@"NULL"] || [str isEqualToString:@"（null）"] || [str isEqualToString:@"<null>"] || [str isEqualToString:@"<NULL>"]) {
        return NO;
    }else{
        return YES;
    }
}
@end
