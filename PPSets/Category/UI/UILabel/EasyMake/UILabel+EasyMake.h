//
//  UILabel+EasyMake.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (EasyMake)
+(UILabel *)pp_lb_makeWithSuperV:(UIView *)superV
                        fontSize:(CGFloat)fontSize
                       alignment:(NSTextAlignment)alignment
                       textColor:(UIColor *)textColor;
@end
