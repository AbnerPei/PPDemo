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
    NSAssert(idFont, @"%s PP警告：您传入的font类型不是我们约定的，请检查后再试！！！",__func__);
    NSAssert(lb, @"%s PP警告：不传入一个(YYLable *)怎么给它设置font！！！",__func__);
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
    }
}

+(void)pp_fontWithIdFont:(id)idFont forAttributedStr:(NSMutableAttributedString *)attributedStr
{
    NSAssert(idFont, @"%s PP警告：您传入的font类型不是我们约定的，请检查后再试！！！",__func__);
    NSAssert(attributedStr, @"%s PP警告：不传入一个(NSMutableAttributedString *)怎么给它设置font！！！",__func__);
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
    }
}

+(void)pp_fontWithIdFont:(id)idFont forAttributedStr:(NSMutableAttributedString *)attributedStr specailText:(NSString *)specialText
{
    NSAssert(idFont, @"%s PP警告：您传入的font类型不是我们约定的，请检查后再试！！！",__func__);
    NSAssert((specialText && specialText.length > 0), @"%s PP警告：不传入一个(NSString *)，谁知道specialText是啥，你让我怎给它设置font！！！",__func__);
    NSAssert((attributedStr && [attributedStr.string containsString:specialText]), @"%s PP警告：不传入一个(NSMutableAttributedString *)怎么给它设置font！！！",__func__);
    
    NSRange specialRange = [attributedStr.string rangeOfString:specialText];
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
    }
}
@end

@implementation UIFont (AttributedStr)

+(NSDictionary<NSString *, id> *)pp_fontForAttributedStrWithIdFont:(id)idFont
{
    NSAssert(idFont, @"%s PP警告：您传入的font类型不是我们约定的，请检查后再试！！！",__func__);
    if ([idFont isKindOfClass:[UIFont class]]) {
        return @{NSFontAttributeName:idFont};
    }else if ([idFont isKindOfClass:[NSString class]]){
        NSString *fontStr = (NSString *)idFont;
        if ([fontStr hasPrefix:@"B"] && fontStr.length > 2) {
            NSString *secondStr = [[fontStr componentsSeparatedByString:@"B"] objectAtIndex:1];
            CGFloat fontSize = [secondStr floatValue];
            if (fontSize >= 0) {
                return @{NSFontAttributeName:[UIFont boldSystemFontOfSize:fontSize]};
            }
        }else{
            CGFloat fontSize = [fontStr floatValue];
            if (fontSize >= 0) {
                return @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
            }
        }
    }else if ([idFont isKindOfClass:[NSNumber class]]){
        NSNumber *fontSizeN = (NSNumber *)idFont;
        CGFloat fontSizeF =  [fontSizeN floatValue];
        return @{NSFontAttributeName:[UIFont systemFontOfSize:fontSizeF]};
    }
    return nil;
}

@end
