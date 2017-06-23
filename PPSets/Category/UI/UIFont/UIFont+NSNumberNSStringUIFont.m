//
//  UIFont+NSNumberNSStringUIFont.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIFont+NSNumberNSStringUIFont.h"

@implementation UIFont (NSNumberNSStringUIFont)
+(void)pp_fontWithIdFont:(id)idFont forYYLabel:(YYLabel *)lb
{
    if (idFont) {
        if ([idFont isKindOfClass:[UIFont class]]) {
            lb.font = idFont;
        }else if ([idFont isKindOfClass:[NSString class]]){
            NSString *fontStr = (NSString *)idFont;
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
        }else if ([idFont isKindOfClass:[NSNumber class]]){
            NSNumber *fontSizeN = (NSNumber *)idFont;
            CGFloat fontSizeF =  [fontSizeN floatValue];
            if (fontSizeF >= 0) {
                lb.font = [UIFont systemFontOfSize:fontSizeF];
            }
        }else{
            NSLog(@"PP警告：您传入的font类型不是我们约定的，请检查后再试！！！");
        }
    }
}

+(void)pp_fontWithIdFont:(id)idFont forAttributedStr:(NSMutableAttributedString *)attributedStr
{
    if (idFont) {
        if ([idFont isKindOfClass:[UIFont class]]) {
            attributedStr.yy_font = (UIFont *)idFont;
        }else if ([idFont isKindOfClass:[NSString class]]){
            NSString *fontStr = (NSString *)idFont;
            if ([fontStr hasPrefix:@"B"] && fontStr.length > 2) {
                NSString *secondStr = [[fontStr componentsSeparatedByString:@"B"] objectAtIndex:1];
                CGFloat fontSize = [secondStr floatValue];
                if (fontSize >= 0) {
                    attributedStr.yy_font = [UIFont boldSystemFontOfSize:fontSize];
                }
            }else{
                CGFloat fontSize = [fontStr floatValue];
                if (fontSize >= 0) {
                    attributedStr.yy_font = [UIFont systemFontOfSize:fontSize];
                }
            }
        }else if ([idFont isKindOfClass:[NSNumber class]]){
            NSNumber *fontSizeN = (NSNumber *)idFont;
            CGFloat fontSizeF =  [fontSizeN floatValue];
            attributedStr.yy_font = [UIFont systemFontOfSize:fontSizeF];
        }else{
            NSLog(@"PP警告：您传入的font类型不是我们约定的，请检查后再试！！！");
        }
    }
}

+(void)pp_fontWithIdFont:(id)idFont forAttributedStr:(NSMutableAttributedString *)attributedStr specailText:(NSString *)specialText
{
    if (specialText.length > 0 && [attributedStr.string containsString:specialText]) {
        NSRange specialRange = [attributedStr.string rangeOfString:specialText];
        if (idFont) {
            if ([idFont isKindOfClass:[UIFont class]]) {
                [attributedStr yy_setFont:(UIFont *)idFont range:specialRange];
            }else if ([idFont isKindOfClass:[NSString class]]){
                NSString *fontStr = (NSString *)idFont;
                if ([fontStr hasPrefix:@"B"] && fontStr.length > 2) {
                    NSString *secondStr = [[fontStr componentsSeparatedByString:@"B"] objectAtIndex:1];
                    CGFloat fontSize = [secondStr floatValue];
                    if (fontSize >= 0) {
                        [attributedStr yy_setFont:[UIFont boldSystemFontOfSize:fontSize] range:specialRange];
                    }
                }else{
                    CGFloat fontSize = [fontStr floatValue];
                    if (fontSize >= 0) {
                        [attributedStr yy_setFont:[UIFont systemFontOfSize:fontSize] range:specialRange];
                    }
                }
            }else if ([idFont isKindOfClass:[NSNumber class]]){
                NSNumber *fontSizeN = (NSNumber *)idFont;
                CGFloat fontSizeF =  [fontSizeN floatValue];
                [attributedStr yy_setFont:[UIFont systemFontOfSize:fontSizeF] range:specialRange];
            }else{
                NSLog(@"PP警告：您传入的font类型不是我们约定的，请检查后再试！！！");
            }
        }
    }
}
@end
