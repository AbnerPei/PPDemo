//
//  PP_LabelManager.m
//  PPDemos
//
//  Created by Abner on 2016/11/2.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PP_LabelManager.h"

@implementation PP_LabelManager
+(UILabel *)pp_creatLabel:(CGRect)frame text:(NSString *)text fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor superV:(UIView *)superV
{
    UILabel *lb = [self creatLB:frame text:text fontSize:fontSize alignment:alignment textColor:textColor];
    if (superV) {
        [superV addSubview:lb];
    }
    return lb;
}
+(void)pp_creatLabel1:(CGRect)frame text:(NSString *)text fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor superV:(UIView *)superV
{
    
    UILabel *lb = [self creatLB:frame text:text fontSize:fontSize alignment:alignment textColor:textColor];
    if (superV) {
        [superV addSubview:lb];
    }
}
+(UILabel *)creatLB:(CGRect)frame text:(NSString *)text fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor
{
    UILabel *lb = [[UILabel alloc]init];
    lb.frame = frame;
    if (text) {
        lb.text = text;
    }
    if (fontSize > 0) {
        lb.font = [UIFont systemFontOfSize:fontSize];
    }
    if (alignment != NSTextAlignmentLeft) {
        lb.textAlignment = alignment;
    }else{
        lb.textAlignment = NSTextAlignmentLeft;
    }
    if (textColor) {
        lb.textColor = textColor;
    }
    return lb;
}

@end
