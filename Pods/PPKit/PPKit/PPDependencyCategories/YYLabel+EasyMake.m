//
//  YYLabel+EasyMake.m
//  PPKitExample
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/29.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "YYLabel+EasyMake.h"
#import "UIFont+EasySetToXX.h"
#import "UIColor+EasySetToXX.h"
#import "YYLabel+Attributed.h"

@implementation YYLabel (EasyMake)
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
                              font:(NSString *)font
                         textColor:(UIColor *)textColor
{
    YYLabel *lb = [self pp_lbMakeWithSuperV:superV
                                    bgColor:bgColor];
    [lb pp_lbSetFontStr:font];
    [lb pp_lbSetTextColor:textColor];
    return lb;
}

+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(NSString *)font
                         textColor:(UIColor *)textColor
                     numberOfLines:(NSUInteger)numberOfLines
{
    YYLabel *lb = [self pp_lbMakeWithSuperV:superV bgColor:bgColor font:font textColor:textColor];
    lb.numberOfLines = numberOfLines;
    return lb;
}
+(instancetype)pp_lbMakeWithSuperV:(UIView *)superV
                           bgColor:(UIColor *)bgColor
                              font:(NSString *)font
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
                              font:(NSString *)font
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
                              font:(NSString *)font
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

@implementation YYLabel(EasyConfigure)
-(void)pp_lbSetTextColor:(UIColor *)textColor
{
    if (textColor) {
        self.textColor = textColor;
    }
}
-(void)pp_lbSetFont:(UIFont *)font
{
    if (font) {
        self.font = font;
    }
}
-(void)pp_lbSetFontStr:(NSString *)fontStr
{
    if (fontStr) {
        self.font = pp_getFontWithFontStr(fontStr);
    }
}

static UIFont *pp_getFontWithFontStr(NSString *fontStr){
    UIFont *ppFont = nil;
    if ([fontStr containsString:@"###"]) {
        if ([fontStr hasSuffix:@"###"]) {
            //粗体
            NSString *fontSizeStr = [fontStr substringFromIndex:3];
            ppFont = [UIFont boldSystemFontOfSize:fontSizeStr.floatValue];
        }else{
            //字体名+字体大小
            NSArray *fontSizeArr = [fontStr componentsSeparatedByString:@"###"];
            ppFont = [UIFont fontWithName:fontSizeArr[0] size:[fontSizeArr[1] floatValue]];
        }
    }else{
        //普通字体
        ppFont = [UIFont systemFontOfSize:fontStr.floatValue];
    }
    return ppFont;
}
@end
