//
//  YYLabel+MakeLB.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "YYLabel+MakeLB.h"

@implementation YYLabel (MakeLB)

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
{
    YYLabel *lb = [YYLabel new];
    if (bgColor) {
        lb.backgroundColor = bgColor;
    }
    if (superV) {
        [superV addSubview:lb];
    }
    return lb;
}
+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor
{
    YYLabel *lb = [self pp_lbMakeWithSuperV:superV
                                    bgColor:bgColor];
    
    [UIFont pp_fontWithIdFont:font forYYLabel:lb];
    [UIColor pp_colorWithTextColor:textColor forYYLabel:lb];
    return lb;
}

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor
                     numberOfLines:(NSUInteger)numberOfLines
{
    YYLabel *lb = [self pp_lbMakeWithSuperV:superV bgColor:bgColor font:font textColor:textColor];
    lb.numberOfLines = numberOfLines;
    return lb;
}
+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor
                     textAlignment:(NSTextAlignment)textAlignment
{
    YYLabel *lb = [self pp_lbMakeWithSuperV:superV
                                    bgColor:bgColor
                                       font:font
                                  textColor:textColor];
    
    lb.textAlignment = textAlignment;
    return lb;
}

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor
                     textAlignment:(NSTextAlignment)textAlignment
                   yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment
{
    YYLabel *lb = [self pp_lbMakeWithSuperV:superV
                                    bgColor:bgColor
                                       font:font
                                  textColor:textColor
                              textAlignment:textAlignment];
    
    lb.textVerticalAlignment = yyTextAlignment;
    return lb;
}

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(id)font
                         textColor:(UIColor *)textColor
                     textAlignment:(NSTextAlignment)textAlignment
                   yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment
                     numberOfLines:(NSUInteger)numberOfLines
{
    YYLabel *lb = [self pp_lbMakeWithSuperV:superV
                                    bgColor:bgColor
                                       font:font
                                  textColor:textColor
                              textAlignment:textAlignment
                            yyTextAlignment:yyTextAlignment];
    lb.numberOfLines = numberOfLines;
    return lb;
}


//===========建议富文本使用========
+(instancetype)pp_lbMakeForAttributedWithSuperV:(UIView *)superV
                                        bgColor:(UIColor *)bgColor
                                  numberOfLines:(NSUInteger)numberOfLines
{
    YYLabel *lb = [self pp_lbMakeWithSuperV:superV bgColor:bgColor];
    lb.numberOfLines = numberOfLines;
    return lb;
}
+(instancetype)pp_lbMakeForAttributedWithSuperV:(UIView *)superV
{
    return [self pp_lbMakeWithSuperV:superV bgColor:nil];
}
@end
