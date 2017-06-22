//
//  YYLabel+MakeLB.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "YYLabel+MakeLB.h"

@implementation YYLabel (MakeLB)

#pragma mark --- YY创建lb font 文字颜色 左右对齐方式 上下对齐方式 父视图
+(YYLabel *)LBWithFont:(id)font
             textColor:(UIColor *)textColor
         textAlignment:(NSTextAlignment)textAlignment
       yyTextAlignment:(YYTextVerticalAlignment)yyTextAlignment
             andSuperV:(UIView *)superV
{
    YYLabel *lb = [YYLabel new];
    [superV addSubview:lb];
    
    if (font) {
        if ([font isKindOfClass:[UIFont class]]) {
            lb.font = font;
        }else if ([font isKindOfClass:[NSString class]]){
            NSString *fontStr = (NSString *)font;
            if ([fontStr hasPrefix:@"B"] && fontStr.length > 2) {
                NSString *secondStr = [[fontStr componentsSeparatedByString:@"B"] objectAtIndex:1];
                CGFloat fontSize = [secondStr floatValue];
                if (fontSize >= 0) {
                    lb.font = [UIFont boldSystemFontOfSize:fontSize];
                }
            }else{
                CGFloat fontSize = [fontStr floatValue];
                if (fontSize >= 0) {
                    lb.font = [UIFont systemFontOfSize:fontSize];
                }
            }
        }else if ([font isKindOfClass:[NSNumber class]]){
            NSNumber *fontSizeN = (NSNumber *)font;
            CGFloat fontSizeF =  [fontSizeN floatValue];
            lb.font = [UIFont systemFontOfSize:fontSizeF];
        }else{
            NSLog(@"PP警告：您传入的font类型不是我们约定的，请检查后再试！！！");
        }
    }
    
    if (textColor) {
        lb.textColor = textColor;
    }
    
    lb.textAlignment = textAlignment;
    lb.textVerticalAlignment = yyTextAlignment;
    return lb;
}


#pragma mark --- YY创建lb font 文字颜色 左右对齐方式 【上下居中】 父视图
+(YYLabel *)LBWithFont:(id)font textColor:(UIColor *)textColor textAlignment:(NSTextAlignment)textAlignment andSuperV:(UIView *)superV
{
    return [YYLabel LBWithFont:font textColor:textColor textAlignment:textAlignment yyTextAlignment:YYTextVerticalAlignmentCenter andSuperV:superV];
}
@end
