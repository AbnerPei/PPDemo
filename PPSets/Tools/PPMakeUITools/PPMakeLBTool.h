//
//  PPMakeLBTool.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPMakeLBTool : NSObject

+(UILabel *)pp_makeLabelWithFontSize:(CGFloat)fontSize
                           textColor:(UIColor *)textColor
                           andSuperV:(UIView *)superV;
/**
 快速创建一个label 【frame、text、textColor、fontSize、alignment、superV】
 */
+(UILabel *)pp_makeLabelWithFrame:(CGRect)frame
                             text:(NSString *)text
                        textColor:(UIColor *)textColor
                         fontSize:(CGFloat)fontSize
                        alignment:(NSTextAlignment)alignment
                           superV:(UIView *)superV;
@end
