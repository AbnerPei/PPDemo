//
//  UIFont+EasySetToXX.h
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * UIFont主动去给需要它的主人（XX）配置
 * //重写此category主要是传pod时不能传id类型的,在此也约定下：
 * ☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞
 * ☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞☞
 * font参数只接受字符串：
 * ①: @"18"/@"16.8"/@"8"            等价于 [UIFont systemFontOfSize:18/16.8/8]
 * ②: @"###18"                      等价于 [UIFont boldSystemFontOfSize:18]
 * ③: @"PingFangSC-Regular###18"    等价于 [UIFont fontWithName:@"PingFangSC-Regular" size:18]
 * ☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜
 *☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜☜
 */
@interface UIFont (EasySetToXX)

/**
 * 通过约定的font字符串给NSMutableAttributedString设置font
 */
+(void)pp_fontSetWithSpecifiedFontStr:(NSString *)fontStr
                     forAttributedStr:(NSMutableAttributedString *)attributedStr;

/**
 * 通过约定的font字符串给NSMutableAttributedString设置font,以及specailText的font
 */
+(void)pp_fontSetWithSpecifiedFontStr:(NSString *)fontStr
        forAttributedStr:(NSMutableAttributedString *)attributedStr
             specailText:(NSString *)specialText;


/**
 * 通过约定的font字符串配置一个boundingRectWithSize: options: attributes: context:方法中attributes参数
 */
+(NSDictionary<NSAttributedStringKey, id> *)pp_fontSetForBoundingAttributesWithSpecifiedFontStr:(NSString *)fontStr;
+(NSDictionary<NSAttributedStringKey, id> *)pp_fontSetForBoundingAttributesWithFont:(UIFont *)font;
@end

/**
 * UIFont主动去给需要它的主人（XX）配置,使用系统的UIFont
 **/
@interface UIFont (EasySetToXXUseUIFont)

+(void)pp_fontSetFont:(UIFont *)font
     forAttributedStr:(NSMutableAttributedString *)attributedStr;

+(void)pp_fontSetWithFont:(UIFont *)font
         forAttributedStr:(NSMutableAttributedString *)attributedStr
              specailText:(NSString *)specialText;

+(NSDictionary<NSAttributedStringKey, id> *)pp_fontSetForBoundingAttributesWithFont:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
