//
//  AlgorithmGuides.h
//  PPDemos
//
//  Created by Abner on 16/9/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#ifndef AlgorithmGuides_h
#define AlgorithmGuides_h


 NSRegularExpressionCaseInsensitive			 = 1 << 0,   // 不区分大小写的
 NSRegularExpressionAllowCommentsAndWhitespace  = 1 << 1,   // 忽略空格和# -
 NSRegularExpressionIgnoreMetacharacters		= 1 << 2,   // 整体化
 NSRegularExpressionDotMatchesLineSeparators	= 1 << 3,   // 匹配任何字符，包括行分隔符
 NSRegularExpressionAnchorsMatchLines		   = 1 << 4,   // 允许^和$在匹配的开始和结束行
 NSRegularExpressionUseUnixLineSeparators	   = 1 << 5,   // (查找范围为整个的话无效)
 NSRegularExpressionUseUnicodeWordBoundaries	= 1 << 6	// (查找范围为整个的话无效)
 };
 typedef NSUInteger NSRegularExpressionOptions;


typedef NS_OPTIONS(NSUInteger, NSRegularExpressionOptions) {
    NSRegularExpressionCaseInsensitive             = 1 << 0,     /* Match letters in the pattern independent of case. */
    NSRegularExpressionAllowCommentsAndWhitespace  = 1 << 1,     /* Ignore whitespace and #-prefixed comments in the pattern. */
    NSRegularExpressionIgnoreMetacharacters        = 1 << 2,     /* Treat the entire pattern as a literal string. */
    NSRegularExpressionDotMatchesLineSeparators    = 1 << 3,     /* Allow . to match any character, including line separators. */
    NSRegularExpressionAnchorsMatchLines           = 1 << 4,     /* Allow ^ and $ to match the start and end of lines. */
    NSRegularExpressionUseUnixLineSeparators       = 1 << 5,     /* Treat only \n as a line separator (otherwise, all standard line separators are used). */
    NSRegularExpressionUseUnicodeWordBoundaries    = 1 << 6      /* Use Unicode TR#29 to specify word boundaries (otherwise, traditional regular expression word boundaries are used). */
};
#endif /* AlgorithmGuides_h */
