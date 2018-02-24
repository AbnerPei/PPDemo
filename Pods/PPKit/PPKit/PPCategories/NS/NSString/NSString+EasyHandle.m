//
//  NSString+EasyHandle.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+EasyHandle.h"

@implementation NSString (EasyHandle)
#pragma mark --- 替换字符串中所有的某个字符串为另一个字符串
-(NSString *)pp_strEasyReplace:(NSString *)replaceStr withStr:(NSString *)str
{
    NSString *ppStr = @"";
    if (self.length > 0) {
        if ([self containsString:replaceStr]) {
            ppStr = [self stringByReplacingOccurrencesOfString:replaceStr withString:str];
        }else{
            ppStr = self;
        }
    }
    return ppStr;
}
@end
