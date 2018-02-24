//
//  UIFont+EasySetToXX.m
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIFont+EasySetToXX.h"
#import "YYText.h"


@implementation UIFont (EasySetToXX)
/**
 * 通过约定的font字符串给YYLabel设置font
 */
//+(void)pp_fontSetWithSpecifiedFontStr:(NSString *)fontStr
//                           forYYLabel:(YYLabel *)lb
//{
//    if (fontStr.length == 0 || !fontStr || !lb) {
//        return;
//    }
//    lb.font = pp_getFontWithFontStr(fontStr);
//}

/**
 * 通过约定的font字符串给NSMutableAttributedString设置font
 */
+(void)pp_fontSetWithSpecifiedFontStr:(NSString *)fontStr
                     forAttributedStr:(NSMutableAttributedString *)attributedStr
{
    if (fontStr.length == 0 || !fontStr || !attributedStr) {
        return;
    }
    attributedStr.yy_font = pp_getFontWithFontStr(fontStr);
}

/**
 通过约定的font字符串给NSMutableAttributedString设置font,以及specailText的font
 */
+(void)pp_fontSetWithSpecifiedFontStr:(NSString *)fontStr
                     forAttributedStr:(NSMutableAttributedString *)attributedStr
                          specailText:(NSString *)specialText
{
    if (fontStr.length == 0 || !fontStr || !attributedStr || !specialText) {
        return;
    }
    if (![attributedStr.string containsString:specialText]) {
        return;
    }
    NSRange specialRange = [attributedStr.string rangeOfString:specialText];
    [attributedStr yy_setFont:pp_getFontWithFontStr(fontStr) range:specialRange];

}

/**
 * 通过约定的font字符串配置一个boundingRectWithSize: options: attributes: context:方法中attributes参数
 */
+(NSDictionary<NSAttributedStringKey, id> *)pp_fontSetForBoundingAttributesWithSpecifiedFontStr:(NSString *)fontStr
{
    if (fontStr.length == 0 || !fontStr ) {
        return nil;
    }
    return @{NSFontAttributeName:pp_getFontWithFontStr(fontStr)};
}
+(NSDictionary<NSAttributedStringKey,id> *)pp_fontSetForBoundingAttributesWithFont:(UIFont *)font
{
    return @{NSFontAttributeName:font};
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

@implementation UIFont(EasySetToXXUseUIFont)

+(void)pp_fontSetFont:(UIFont *)font
     forAttributedStr:(NSMutableAttributedString *)attributedStr
{
    if (!font || !attributedStr) {
        return;
    }
    attributedStr.yy_font = font;
}

+(void)pp_fontSetWithFont:(UIFont *)font
         forAttributedStr:(NSMutableAttributedString *)attributedStr
              specailText:(NSString *)specialText
{
    if (!font || !attributedStr || !specialText) {
        return;
    }
    if (![attributedStr.string containsString:specialText]) {
        return;
    }
    NSRange specialRange = [attributedStr.string rangeOfString:specialText];
    [attributedStr yy_setFont:font range:specialRange];
}

+(NSDictionary<NSAttributedStringKey, id> *)pp_fontSetForBoundingAttributesWithFont:(UIFont *)font
{
    if (!font) {
        return nil;
    }
    return @{NSFontAttributeName:font};
}
@end
