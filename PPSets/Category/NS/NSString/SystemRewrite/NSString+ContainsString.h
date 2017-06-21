//
//  NSString+ContainsString.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/21.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 判断一个字符串中是否包含另一个字符串：
 ContainsString   ios8起才可以
 适配7，就不能用这个方法，用：[self rangeOfString:str].location != NSNotFound
 */
@interface NSString (ContainsString)

@end
