//
//  JRCalculateTool.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/17.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
  "计算lb宽or高的工具"
 */
@interface JRCalculateTool : NSObject

//==================系统UILabel==================
/**
 计算 宽
 */
+(CGFloat)jr_calculateWidthWithFont:(UIFont *)font
                             height:(CGFloat)height
                               text:(NSString *)text;

@end
