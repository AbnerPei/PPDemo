//
//  UIImageView+MakeImgV.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/26.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (MakeImgV)
+(instancetype)pp_imgVMakeWithSuperV:(UIView *)superV;

+(instancetype)pp_imgVMakeWithSuperV:(UIView *)superV
                             imgName:(NSString *)imgName;

@end
