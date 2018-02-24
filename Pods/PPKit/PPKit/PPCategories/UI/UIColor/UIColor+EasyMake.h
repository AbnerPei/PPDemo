//
//  UIColor+EasyMake.h
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
//rgb
#define PPColor_rgba(r,g,b,a)       [UIColor colorWithRed:r/255.f green:g/255.f blue:b/255.f alpha:a]
#define PPColor_rgb(r,g,b)          PPColor_rgba(r,g,b,1.0f)

//hex
#define PPColor_hexa(hexStr,a)      [UIColor pp_colorMakeWithHexStr:hexStr alpha:a]
#define PPColor_hex(hexStr)         PPColor_hexa(hexStr,1.0f)

// rgb颜色转换（16进制->10进制）,不必是字符串
#define PPColor_rgbValue(rgbValue)  [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define PPColor_random              [UIColor pp_colorMakeRandom]
@interface UIColor (EasyMake)

/** rgb方式 */
+(UIColor *)pp_colorMakeWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b;
+(UIColor *)pp_colorMakeWithR:(CGFloat)r g:(CGFloat)g b:(CGFloat)b a:(CGFloat)a;
/**
 从十六进制字符串获取颜色,支持@“#123456”、 @“0X123456”、 @“123456”,@"0x123456"等四种格式
 */
+(UIColor *)pp_colorMakeWithHexStr:(NSString *)hexStr;
+(UIColor *)pp_colorMakeWithHexStr:(NSString *)hexStr alpha:(CGFloat)alpha;

/** 随机色 */
+(UIColor *)pp_colorRandom;

@end

//=========================iOS系统提供的颜色=====start===============================
@interface UIColor (System)
/** 黑色 */
+(UIColor *)pp_colorBlack;
/** 深灰色 */
+(UIColor *)pp_colorDarkGray;
/** 浅灰色 */
+(UIColor *)pp_colorLightGray;
/** 灰色 */
+(UIColor *)pp_colorGray;
/** 白色 */
+(UIColor *)pp_colorWhite;
/** 红色  FF0000 255,0,0 */
+(UIColor *)pp_colorRed;
/** 绿色 */
+(UIColor *)pp_colorGreen;
/** 蓝色 */
+(UIColor *)pp_colorBlue;
/** 蓝绿色 */
+(UIColor *)pp_colorCyan;
/** 黄色 */
+(UIColor *)pp_colorYellow;
/** 品红色 */
+(UIColor *)pp_colorMagenta;
/** 橙色 */
+(UIColor *)pp_colorOrange;
/** 紫色 */
+(UIColor *)pp_colorPurple;
/** 棕色 */
+(UIColor *)pp_colorBrown;
/** 无色 */
+(UIColor *)pp_colorClear;

@end

//=========================iOS系统提供的颜色=====end===============================


/**
 comes from http://www.sioe.cn/yingyong/yanse-rgb-16/
 */
@interface UIColor (PPBeautiful)
/** 浅粉红     FFB6C1  255,182,193  */
+(UIColor *)pp_colorLightPink;
/** 天蓝色     87CEEB  135,206,235  */
+(UIColor *)pp_colorSkyBlue;
/** 金黄色     FFD700  255,215,0    */
+(UIColor *)pp_colorGoldenYellow;
/** 森林绿     228B22  34,139,34    */
+(UIColor *)pp_colorForestGreen;
/** 巧克力色   D2691E  210,105,30   */
+(UIColor *)pp_colorChocolate;
/** 印度红 */
+(UIColor *)pp_colorIndiaRed;
/** 栗色 */
+(UIColor *)pp_colorMarron;
/** 草莓色 */
+(UIColor *)pp_colorStrawberry;
/** 番茄色 */
+(UIColor *)pp_colorTomato;
/** 深红色 */
+(UIColor *)pp_colorDeepRed;
/** 孔雀蓝 */
+(UIColor *)pp_colorPeacockBlue;
/** 紫罗兰色 */
+(UIColor *)pp_colorViolet;
/** 黄褐色 */
+(UIColor *)pp_colorTawny;
/** 淡黄色 */
+(UIColor *)pp_colorJasmine;
/** 蛋壳色 */
+(UIColor *)pp_colorEggShell;

@end

