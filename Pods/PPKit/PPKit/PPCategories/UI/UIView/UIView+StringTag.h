//
//  UIView+StringTag.h
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//  思路来自：https://www.cnblogs.com/mkai/p/6594668.html

#import <UIKit/UIKit.h>


@interface UIView (StringTag)
/** 字符串tag */
@property(nonatomic,copy) NSString *pp_strTag;
/** 根据字符串tag取出对应的view */
-(UIView *)pp_viewWithStrTag:(NSString *)strTag;
@end
