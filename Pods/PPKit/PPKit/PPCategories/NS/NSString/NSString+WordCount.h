//
//  NSString+WordCount.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/29.
//  Copyright © 2017年 PPAbner. All rights reserved.

//  http://stackoverflow.com/questions/13366234/ios-most-efficient-way-to-find-word-occurrence-count-in-a-string/13367063#13367063
/*
  知识补充：
   typedef long NSInteger;               //可以为负数
   typedef unsigned long NSUInteger;     //NSUInteger是无符号的，即没有负数
 */

#import <Foundation/Foundation.h>

@interface NSString (WordCount)

/**
 获取字符串中【单词个数】,示例如下
          NSString *testStr = @"This is a test. This is only a test.";
          NSInteger wordCount = [testStr pp_wordCount];
          NSLog(@"wordCount is %ld",wordCount);
 
          // 2017-03-29 10:05:15.291 PPDemos[71127:44167843] wordCount is 9
 */
-(NSUInteger)pp_StrWordCount;

/**
 获取字符串中【给定的某个单词个数】,【区分大小写】
 */
-(NSUInteger)pp_StrWordCountWithGivenStr:(NSString *)givenStr;

/**
 获取字符串中【给定的某个单词个数】，【是否区分大小写】
 */
-(NSUInteger)pp_strWordCountWithGivenStr:(NSString *)givenStr
                           ignoreCase:(BOOL)ignoreCase;

@end
