//
//  UILabel+EasyMake.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/14.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UILabel+EasyMake.h"

@implementation UILabel (EasyMake)
+(UILabel *)pp_lb_makeWithSuperV:(UIView *)superV fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor
{
    return creatLB(superV, nil, fontSize, alignment, textColor);
}

static UILabel *creatLB(UIView *superV,NSString *text,CGFloat fontSize,NSTextAlignment alignment,UIColor *textColor){
    UILabel *lb = [[UILabel alloc]init];
    if (superV) {
        [superV addSubview:lb];
    }
    if (text) {
        lb.text = text;
    }
    if (fontSize > 0) {
        lb.font = [UIFont systemFontOfSize:fontSize];
    }
    lb.textAlignment = alignment;
    if (textColor) {
        lb.textColor = textColor;
    }
    return lb;
}


@end
