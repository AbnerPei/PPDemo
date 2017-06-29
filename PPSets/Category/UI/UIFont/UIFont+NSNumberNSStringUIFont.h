//
//  UIFont+NSNumberNSStringUIFont.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (NSNumberNSStringUIFont)
/**
 根据传入的id类型的font设置YYLabel对象的font
 
 @param idFont 只接受NSNumber/NSString/NSMutableAttributedString三种类型
 【@"B18"将会解析为粗体18号大小】
 */
+(void)pp_fontWithIdFont:(id)idFont
              forYYLabel:(YYLabel *)lb;

/**
 根据传入的id类型的font设置NSAttributedString对象的font
 
 @param idFont 只接受NSNumber/NSString/NSMutableAttributedString三种类型
 【@"B18"将会解析为粗体18号大小】
 */
+(void)pp_fontWithIdFont:(id)idFont
        forAttributedStr:(NSMutableAttributedString *)attributedStr;


/**
 根据传入的id类型的font设置【特殊字符串】NSAttributedString对象的font
 
 @param idFont 只接受NSNumber/NSString/NSMutableAttributedString三种类型
 【@"B18"将会解析为粗体18号大小】
 */
+(void)pp_fontWithIdFont:(id)idFont
        forAttributedStr:(NSMutableAttributedString *)attributedStr
             specailText:(NSString *)specialText;
@end

@interface UIFont (AttributedStr)

/**
 获取一个计算字符串size时用的font字典
 */
+(NSDictionary<NSString *, id> *)pp_fontForAttributedStrWithIdFont:(id)idFont;
@end
