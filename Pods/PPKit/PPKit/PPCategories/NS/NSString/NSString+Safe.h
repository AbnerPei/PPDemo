//
//  NSString+Safe.h
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/4.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Safe)
/** 对字符串安全处理 */
-(NSString *)pp_str_safe;
/** 判断字符串是不是安全的 */
-(BOOL)pp_str_isSafe;

@end
