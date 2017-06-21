//
//  UILabel+CreatWithYYLabel.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UILabel+CreatWithYYLabel.h"

@implementation UILabel (CreatWithYYLabel)

#pragma mark --- YY创建lb 字体大小 是否加粗 文字颜色 左右对齐方式 上下对齐方式 父视图
+(YYLabel *)LBWithFontSize:(CGFloat)fontSize isBold:(BOOL)isBold textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment andSuperV:(UIView *)superV
{
    YYLabel *lb = [YYLabel new];
    [superV addSubview:lb];
    
    if (fontSize >= 0) {
        if (isBold) {
            lb.font = [UIFont boldSystemFontOfSize:fontSize];
        }else{
            lb.font = [UIFont systemFontOfSize:fontSize];
        }
    }
    
    if (textColor) {
        lb.textColor = textColor;
    }
    
    lb.textAlignment = textAlignment;
    lb.textVerticalAlignment = yyTextAlignment;
    return lb;
}

#pragma mark --- YY创建lb 字体大小 【不加粗】 文字颜色 左右对齐方式 上下对齐方式 父视图
+(YYLabel *)LBWithFontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment andSuperV:(UIView *)superV
{
    return [UILabel LBWithFontSize:fontSize isBold:NO textColor:textColor textAlignment:textAlignment yyTextAlignment:yyTextAlignment andSuperV:superV];
}

#pragma mark --- YY创建lb 字体大小 【不加粗】 文字颜色 左右对齐方式 【上下居中】 父视图
+(YYLabel *)LBWithFontSize:(CGFloat)fontSize textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment andSuperV:(UIView *)superV
{
    return [UILabel LBWithFontSize:fontSize textColor:textColor textAlignment:textAlignment yyTextAlignment:YYTextVerticalAlignmentCenter andSuperV:superV];
}




@end
