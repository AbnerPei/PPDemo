 //
//  UIImageView+MakeImgV.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/26.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "UIImageView+MakeImgV.h"

@implementation UIImageView (MakeImgV)
+(instancetype)pp_imgVMakeWithSuperV:(UIView *)superV
{
    UIImageView *imgV = [[UIImageView alloc]init];
    if (superV) {
        [superV addSubview:imgV];
    }
    imgV.contentMode = UIViewContentModeScaleToFill;
    return imgV;
}

+(instancetype)pp_imgVMakeWithSuperV:(UIView *)superV
                             imgName:(NSString *)imgName
{
    UIImageView *imgV = [self pp_imgVMakeWithSuperV:superV];
    if (imgName.length > 0) {
        imgV.image = [UIImage imageNamed:imgName];
    }
    return imgV;
}
@end
