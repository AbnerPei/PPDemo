//
//  NSString+WordCount.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/29.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+WordCount.h"

@implementation NSString (WordCount)

#pragma mark --- 获取字符串中【单词个数】
-(NSUInteger)pp_wordCount
{
    __block NSUInteger wordCount = 0;
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByWords | NSStringEnumerationLocalized
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
                              wordCount++;
                          }];
    return wordCount;
}

#pragma mark --- 获取字符串中【给定的某个单词个数】,【区分大小写】
-(NSUInteger)pp_wordCountWithGivenStr:(NSString *)givenStr
{
    return [self pp_wordCountWithGivenStr:givenStr ignoreCase:YES];
}

#pragma mark --- 获取字符串中【给定的某个单词个数】，【是否区分大小写】
-(NSUInteger)pp_wordCountWithGivenStr:(NSString *)givenStr ignoreCase:(BOOL)ignoreCase
{
    if (givenStr.length == 0 || !givenStr) {
        return 0;
    }
    
    NSCountedSet *countedSet = [NSCountedSet new];
    [self enumerateSubstringsInRange:NSMakeRange(0, [self length])
                             options:NSStringEnumerationByWords | NSStringEnumerationLocalized
                          usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop){
                              if (ignoreCase) {
                                  [countedSet addObject:substring];
                              }else{
                                  [countedSet addObject:[substring lowercaseString]];
                              }
                          }];
    
    return [countedSet countForObject:givenStr];
}
@end
