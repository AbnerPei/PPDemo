//
//  NSMutableAttributedString+PPTextField.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//
/*
  说明：2017-04-12
     1> 该类主要参考YYText <https://github.com/ibireme/YYText>，包括作者的思路
     2> 为什么要自己再重写：
        2.1> 不依赖别的库，方便使用
        2.2> 重写（抑或拷贝过来）可以自己调用方便
     3> 编码规范参考[纽约时报 移动团队 Objective-C 规范指南](https://github.com/NYTimes/objective-c-style-guide/blob/master/README_zh-Hans.md) 之前的先那样，以后这样来
 */

#import <Foundation/Foundation.h>

@interface NSMutableAttributedString (PPTextField)

/** 字体 */
- (void)pp_setFont:(nullable UIFont *)font;
- (void)pp_setFont:(nullable UIFont *)font range:(NSRange)range;

/** 字体间距 */
- (void)pp_setKern:(nullable NSNumber *)kern;
- (void)pp_setKern:(nullable NSNumber *)kern range:(NSRange)range;

/** 文字颜色 */
- (void)pp_setColor:(nullable UIColor *)color;
- (void)pp_setColor:(nullable UIColor *)color range:(NSRange)range;


@end


//=====================

@interface NSAttributedString (PPTextField)

@end
