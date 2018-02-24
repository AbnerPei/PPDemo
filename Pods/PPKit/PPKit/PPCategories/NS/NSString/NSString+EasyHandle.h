//
//  NSString+EasyHandle.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (EasyHandle)
/** 替换字符串中所有的某个字符串为另一个字符串 */
-(NSString *)pp_strEasyReplace:(NSString *)replaceStr withStr:(NSString *)str;
@end
