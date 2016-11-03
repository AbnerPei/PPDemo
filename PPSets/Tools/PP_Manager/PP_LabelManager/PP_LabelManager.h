//
//  PP_LabelManager.h
//  PPDemos
//
//  Created by Abner on 2016/11/2.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PP_LabelManager : NSObject
/**
 快速创建一个label
 
 @param frame     frame (可传值CGRectZero)
 @param text      text （可nil）
 @param fontSize  fontSize （字体大小，如果是负数，此属性无效，走系统默认）
 @param alignment alignment （对齐位置，默认左边）
 @param textColor textColor  （字体颜色，可nil）
 @param superV    label加在其上 （父视图，可nil）
 
 @return label
 */
+(UILabel *)pp_creatLabel:(CGRect)frame text:(NSString *)text fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor superV:(UIView *)superV;

/**
 快速创建一个label ：不需要返回一个Label
 */
+(void)pp_creatLabel1:(CGRect)frame text:(NSString *)text fontSize:(CGFloat)fontSize alignment:(NSTextAlignment)alignment textColor:(UIColor *)textColor superV:(UIView *)superV;
@end
