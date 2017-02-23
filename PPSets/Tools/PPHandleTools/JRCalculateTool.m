//
//  JRCalculateTool.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/17.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import "JRCalculateTool.h"

@implementation JRCalculateTool

#pragma mark --- 计算 宽
+(CGFloat)jr_calculateWidthWithFont:(UIFont *)font height:(CGFloat)height text:(NSString *)text
{
    CGSize size = [text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
    return size.width;
}
@end
