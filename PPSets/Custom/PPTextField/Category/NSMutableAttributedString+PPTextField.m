//
//  NSMutableAttributedString+PPTextField.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSMutableAttributedString+PPTextField.h"

@implementation NSMutableAttributedString (PPTextField)

#pragma mark --- 文字字体
- (void)pp_setFont:(UIFont *)font
{
    [self pp_setFont:font range:NSMakeRange(0, self.length)];
}
- (void)pp_setFont:(UIFont *)font range:(NSRange)range
{
    [self setAttribute:NSFontAttributeName value:font range:range];
}

#pragma mark --- 文字间距
- (void)pp_setKern:(NSNumber *)kern
{
    [self pp_setKern:kern range:NSMakeRange(0, self.length)];
}
- (void)pp_setKern:(NSNumber *)kern range:(NSRange)range
{
    [self setAttribute:NSKernAttributeName value:kern range:range];
}

#pragma mark --- 文字颜色
- (void)pp_setColor:(UIColor *)color
{
    [self pp_setColor:color range:NSMakeRange(0, self.length)];
}
- (void)pp_setColor:(UIColor *)color range:(NSRange)range
{
    [self setAttribute:NSForegroundColorAttributeName value:color range:range];
}

#pragma mark --- 通用的设置属性
- (void)setAttribute:(NSString *)name value:(id)value range:(NSRange)range {
    if (!name || [NSNull isEqual:name]){
        return;
    }
    if (value && ![NSNull isEqual:value]){
       [self addAttribute:name value:value range:range];
    }
    else {
       [self removeAttribute:name range:range];
    }
}
@end


//======================

@implementation NSAttributedString (PPTextField)


@end
