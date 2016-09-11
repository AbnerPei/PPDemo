//
//  UIColor+PPSets.m
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "UIColor+PPSets.h"
#define PPMT_RGB(R,G,B)   [UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:1.0];

@implementation UIColor (PPSets)
/** 随机色 */
+(UIColor *)pp_randomColor
{
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    return PPMT_RGB(aRedValue, aGreenValue, aBlueValue);
}


@end

@implementation UIColor (Hex)

+ (UIColor *)pp_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha
{
    //删除字符串中的空格
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    // String should be 6 or 8 characters
    if ([cString length] < 6)
    {
        return [UIColor clearColor];
    }
    // strip 0X if it appears
    //如果是0x开头的，那么截取字符串，字符串从索引为2的位置开始，一直到末尾
    if ([cString hasPrefix:@"0X"])
    {
        cString = [cString substringFromIndex:2];
    }
    //如果是#开头的，那么截取字符串，字符串从索引为1的位置开始，一直到末尾
    if ([cString hasPrefix:@"#"])
    {
        cString = [cString substringFromIndex:1];
    }
    if ([cString length] != 6)
    {
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

//默认alpha值为1
+ (UIColor *)pp_colorWithHexString:(NSString *)color
{
    return [self pp_colorWithHexString:color alpha:1.0f];
}

@end

@implementation UIColor (System)

/** 黑色 */
+(UIColor *)pp_blackColor
{
    return [UIColor blackColor];
}

/** 深灰色 */
+(UIColor *)pp_darkGrayColor
{
    return [UIColor darkGrayColor];
}

/** 浅灰色 */
+(UIColor *)pp_lightGrayColor
{
    return [UIColor lightGrayColor];
}

/** 灰色 */
+(UIColor *)pp_grayColor
{
    return [UIColor grayColor];
}

/** 白色 */
+(UIColor *)pp_whiteColor
{
    return [UIColor whiteColor];
}

/** 红色 */
+(UIColor *)pp_redColor
{
    return [UIColor redColor];
}

/** 绿色 */
+(UIColor *)pp_greenColor
{
    return [UIColor greenColor];
}

/** 蓝色 */
+(UIColor *)pp_blueColor
{
    return [UIColor blueColor];
}

/** 蓝绿色 */
+(UIColor *)pp_cyanColor
{
    return [UIColor cyanColor];
}

/** 黄色 */
+(UIColor *)pp_yellowColor
{
    return [UIColor yellowColor];
}

/** 品红色 */
+(UIColor *)pp_magentaColor
{
    return [UIColor magentaColor];
}

/** 橙色 */
+(UIColor *)pp_orangeColor
{
    return [UIColor orangeColor];
}

/** 紫色 */
+(UIColor *)pp_purpleColor
{
    return [UIColor purpleColor];
}

/** 棕色 */
+(UIColor *)pp_brownColor
{
    return [UIColor brownColor];
}

/** 无色 */
+(UIColor *)pp_clearColor
{
    return [UIColor clearColor];
}

@end

@implementation UIColor (Custom)

/** 天蓝色 */
+(UIColor *)pp_skyBlueColor
{
    return PPMT_RGB(135, 206, 235);
}

/** 金黄色 */
+(UIColor *)pp_goldenYellowColor
{
    return PPMT_RGB(255, 215, 0);
}

/** 森林绿 */
+(UIColor *)pp_forestGreenColor
{
    return PPMT_RGB(34, 139, 34);
}

/** 巧克力色 */
+(UIColor *)pp_chocolateColor
{
    return PPMT_RGB(210, 105, 30);
}

/** 印度红 */
+(UIColor *)pp_IndiaRedColor
{
    return PPMT_RGB(176, 23, 31);
}

/** 栗色 */
+(UIColor *)pp_marronColor
{
    return PPMT_RGB(176, 48, 96);
}

/** 草莓色 */
+(UIColor *)pp_strawberryColor
{
    return PPMT_RGB(135, 38, 87);
}

/** 番茄色 */
+(UIColor *)pp_tomatoColor
{
    return PPMT_RGB(255, 99, 71);
}

/** 深红色 */
+(UIColor *)pp_deepRedColor
{
    return PPMT_RGB(255, 0, 255);
}

/** 孔雀蓝 */
+(UIColor *)pp_peacockBlueColor
{
    return PPMT_RGB(51, 161, 201);
}

/** 紫罗兰色 */
+(UIColor *)pp_violetColor
{
    return PPMT_RGB(138, 43, 226);
}

/** 黄褐色 */
+(UIColor *)pp_tawnyColor
{
    return PPMT_RGB(240, 230, 140);
}

/** 淡黄色 */
+(UIColor *)pp_jasmineColor
{
    return PPMT_RGB(245, 222, 179);
}

/** 蛋壳色 */
+(UIColor *)pp_eggShellColor
{
    return PPMT_RGB(252, 230, 201);
}

@end
