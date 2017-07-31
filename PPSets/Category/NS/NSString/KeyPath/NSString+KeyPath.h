//
//  NSString+KeyPath.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/4.
//  Copyright © 2017年 PPAbner. All rights reserved.
//



#import <Foundation/Foundation.h>
extern NSString * const Transform;

extern NSString * const TransformTranslation;
extern NSString * const TransformTranslationX;
extern NSString * const TransformTranslationY;
extern NSString * const TransformTranslationZ;

extern NSString * const TransformRotation;
extern NSString * const TransformRotationX;
extern NSString * const TransformRotationY;
extern NSString * const TransformRotationZ;

extern NSString *const TransformScale;
extern NSString *const TransformScaleX;
extern NSString *const TransformScaleY;
extern NSString *const TransformScaleZ;

@interface NSString (KeyPath)
+(instancetype)pp_kpTransform;

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

CA_EXTERN NSString * const kCAPosition;

@interface NSString (KeyPathForCALyer)

@end
