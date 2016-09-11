//
//  UIColor+PPSets.h
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (PPSets)
/** 随机色 */
+(UIColor *)pp_randomColor;
@end


@interface UIColor (Hex)
//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)pp_colorWithHexString:(NSString *)color;
+ (UIColor *)pp_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;

@end

@interface UIColor (System)
/** 黑色 */
+(UIColor *)pp_blackColor;

/** 深灰色 */
+(UIColor *)pp_darkGrayColor;

/** 浅灰色 */
+(UIColor *)pp_lightGrayColor;

/** 灰色 */
+(UIColor *)pp_grayColor;

/** 白色 */
+(UIColor *)pp_whiteColor;

/** 红色 */
+(UIColor *)pp_redColor;

/** 绿色 */
+(UIColor *)pp_greenColor;

/** 蓝色 */
+(UIColor *)pp_blueColor;

/** 蓝绿色 */
+(UIColor *)pp_cyanColor;

/** 黄色 */
+(UIColor *)pp_yellowColor;

/** 品红色 */
+(UIColor *)pp_magentaColor;

/** 橙色 */
+(UIColor *)pp_orangeColor;

/** 紫色 */
+(UIColor *)pp_purpleColor;

/** 棕色 */
+(UIColor *)pp_brownColor;

/** 无色 */
+(UIColor *)pp_clearColor;

@end

@interface UIColor (Custom)
/** 天蓝色 */
+(UIColor *)pp_skyBlueColor;

/** 金黄色 */
+(UIColor *)pp_goldenYellowColor;

/** 森林绿 */
+(UIColor *)pp_forestGreenColor;

/** 巧克力色 */
+(UIColor *)pp_chocolateColor;

/** 印度红 */
+(UIColor *)pp_IndiaRedColor;

/** 栗色 */
+(UIColor *)pp_marronColor;

/** 草莓色 */
+(UIColor *)pp_strawberryColor;

/** 番茄色 */
+(UIColor *)pp_tomatoColor;

/** 深红色 */
+(UIColor *)pp_deepRedColor;

/** 孔雀蓝 */
+(UIColor *)pp_peacockBlueColor;

/** 紫罗兰色 */
+(UIColor *)pp_violetColor;

/** 黄褐色 */
+(UIColor *)pp_tawnyColor;

/** 淡黄色 */
+(UIColor *)pp_jasmineColor;

/** 蛋壳色 */
+(UIColor *)pp_eggShellColor;

@end