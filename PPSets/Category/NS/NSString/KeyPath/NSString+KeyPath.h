//
//  NSString+KeyPath.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/4.
//  Copyright © 2017年 PPAbner. All rights reserved.
//



#import <Foundation/Foundation.h>

@interface NSString (KeyPath)

+(instancetype)pp_kpTransformTranslation;
+(instancetype)pp_kpTransformTranslationX;
+(instancetype)pp_kpTransformTranslationY;
+(instancetype)pp_kpTransformTranslationZ;

+(instancetype)pp_kpTransformRotation;
+(instancetype)pp_kpTransformRotationX;
+(instancetype)pp_kpTransformRotationY;
+(instancetype)pp_kpTransformRotationZ;

+(instancetype)pp_kpTransformScale;
+(instancetype)pp_kpTransformScaleX;
+(instancetype)pp_kpTransformScaleY;
+(instancetype)pp_kpTransformScaleZ;

@end
