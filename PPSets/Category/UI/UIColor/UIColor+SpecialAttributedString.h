//
//  UIColor+SpecialAttributedString.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SpecialAttributedString)

+(void)pp_colorWithSpecialColor:(UIColor *)specialColor
                    specialText:(NSString *)specialText
               forAttributedStr:(NSMutableAttributedString *)attributedStr;

+(void)pp_colorWithTextColor:(UIColor *)textColor
                  forYYLabel:(YYLabel *)lb;


+(void)pp_colorWithTextColor:(UIColor *)textColor
            forAttributedStr:(NSMutableAttributedString *)attributedStr;
@end
