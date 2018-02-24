//
//  UIColor+EasyMake.m
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIColor+EasyMake.h"

@implementation UIColor (EasyMake)
#pragma mark --- 通用rgb，无alpha
+(UIColor *)pp_colorMakeWithR:(CGFloat)r
                            g:(CGFloat)g
                            b:(CGFloat)b
{
    return [UIColor pp_colorMakeWithR:r g:g b:b a:1.0f];
}
#pragma mark --- 通用rgb，有alpha
+(UIColor *)pp_colorMakeWithR:(CGFloat)r
                            g:(CGFloat)g
                            b:(CGFloat)b
                            a:(CGFloat)a
{
    return [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a];
}

//默认alpha值为1
+ (UIColor *)pp_colorMakeWithHexStr:(NSString *)hexStr
{
    return [self pp_colorMakeWithHexStr:hexStr alpha:1.0f];
}

+ (UIColor *)pp_colorMakeWithHexStr:(NSString *)hexStr alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[hexStr stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6){
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"] || [cString hasPrefix:@"0x"]){
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"]){
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6){
        return [UIColor clearColor];
    }
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [cString substringWithRange:range];
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    return [UIColor colorWithRed:((float)r / 255.0f) green:((float)g / 255.0f) blue:((float)b / 255.0f) alpha:alpha];
}
#pragma mark --- 随机色
+(UIColor *)pp_colorRandom
{
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    return PPColor_rgb(aRedValue, aGreenValue, aBlueValue);
}
@end

@implementation UIColor (System)

/** 黑色 */
+(UIColor *)pp_colorBlack{
    return [UIColor blackColor];
}
/** 深灰色 */
+(UIColor *)pp_colorDarkGray{
    return [UIColor darkGrayColor];
}
/** 浅灰色 */
+(UIColor *)pp_colorLightGray{
    return [UIColor lightGrayColor];
}
/** 灰色 */
+(UIColor *)pp_colorGray{
    return [UIColor grayColor];
}
/** 白色 */
+(UIColor *)pp_colorWhite{
    return [UIColor whiteColor];
}
/** 红色 */
+(UIColor *)pp_colorRed{
    return [UIColor redColor];
}
/** 绿色 */
+(UIColor *)pp_colorGreen{
    return [UIColor greenColor];
}
/** 蓝色 */
+(UIColor *)pp_colorBlue{
    return [UIColor blueColor];
}
/** 蓝绿色 */
+(UIColor *)pp_colorCyan{
    return [UIColor cyanColor];
}
/** 黄色 */
+(UIColor *)pp_colorYellow{
    return [UIColor yellowColor];
}
/** 品红色 */
+(UIColor *)pp_colorMagenta{
    return [UIColor magentaColor];
}
/** 橙色 */
+(UIColor *)pp_colorOrange{
    return [UIColor orangeColor];
}
/** 紫色 */
+(UIColor *)pp_colorPurple{
    return [UIColor purpleColor];
}
/** 棕色 */
+(UIColor *)pp_colorBrown{
    return [UIColor brownColor];
}
/** 无色 */
+(UIColor *)pp_colorClear{
    return [UIColor clearColor];
}

@end

@implementation UIColor (PPBeautiful)
/** 浅粉红 */
+(UIColor *)pp_colorLightPink{
    return PPColor_rgb(255, 182, 193);
}
/** 天蓝色 */
+(UIColor *)pp_colorSkyBlue{
    return PPColor_rgb(135, 206, 235);
}
/** 金黄色 */
+(UIColor *)pp_colorGoldenYellow{
    return PPColor_rgb(255, 215, 0);
}
/** 森林绿 */
+(UIColor *)pp_colorForestGreen{
    return PPColor_rgb(34, 139, 34);
}
/** 巧克力色 */
+(UIColor *)pp_colorChocolate{
    return PPColor_rgb(210, 105, 30);
}
/** 印度红 */
+(UIColor *)pp_colorIndiaRed{
    return PPColor_rgb(176, 23, 31);
}
/** 栗色 */
+(UIColor *)pp_colorMarron{
    return PPColor_rgb(176, 48, 96);
}
/** 草莓色 */
+(UIColor *)pp_colorStrawberry{
    return PPColor_rgb(135, 38, 87);
}
/** 番茄色 */
+(UIColor *)pp_colorTomato{
    return PPColor_rgb(255, 99, 71);
}
/** 深红色 */
+(UIColor *)pp_colorDeepRed{
    return PPColor_rgb(255, 0, 255);
}
/** 孔雀蓝 */
+(UIColor *)pp_colorPeacockBlue{
    return PPColor_rgb(51, 161, 201);
}
/** 紫罗兰色 */
+(UIColor *)pp_colorViolet{
    return PPColor_rgb(138, 43, 226);
}
/** 黄褐色 */
+(UIColor *)pp_colorTawny{
    return PPColor_rgb(240, 230, 140);
}
/** 淡黄色 */
+(UIColor *)pp_colorJasmine{
    return PPColor_rgb(245, 222, 179);
}
/** 蛋壳色 */
+(UIColor *)pp_colorEggShell{
    return PPColor_rgb(252, 230, 201);
}
@end
