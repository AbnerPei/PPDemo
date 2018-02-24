//
//  NSString+Transform.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/1.
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

@interface NSString (Transform)
+(instancetype)pp_transform;

+(instancetype)pp_transformTranslation;
+(instancetype)pp_transformTranslationX;
+(instancetype)pp_transformTranslationY;
+(instancetype)pp_transformTranslationZ;

+(instancetype)pp_transformRotation;
+(instancetype)pp_transformRotationX;
+(instancetype)pp_transformRotationY;
+(instancetype)pp_transformRotationZ;

+(instancetype)pp_transformScale;
+(instancetype)pp_transformScaleX;
+(instancetype)pp_transformScaleY;
+(instancetype)pp_transformScaleZ;
@end
