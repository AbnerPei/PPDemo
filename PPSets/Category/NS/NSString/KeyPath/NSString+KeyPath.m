//
//  NSString+KeyPath.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/4.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+KeyPath.h"
NSString *const Transform = @"transform";

NSString *const TransformTranslation = @"transform.translation";
NSString *const TransformTranslationX = @"transform.translation.x";
NSString *const TransformTranslationY = @"transform.translation.y";
NSString *const TransformTranslationZ = @"transform.translation.z";

NSString *const TransformRotation = @"transform.rotation";
NSString *const TransformRotationX = @"transform.rotation.x";
NSString *const TransformRotationY = @"transform.rotation.y";
NSString *const TransformRotationZ = @"transform.rotation.z";

NSString *const TransformScale = @"transform.scale";
NSString *const TransformScaleX = @"transform.scale.x";
NSString *const TransformScaleY = @"transform.scale.y";
NSString *const TransformScaleZ = @"transform.scale.z";

@implementation NSString (KeyPath)
+(instancetype)pp_kpTransform
{
    return @"transform";
}
+(instancetype)pp_kpTransformTranslation
{
    return @"transform.translation";
}
+(instancetype)pp_kpTransformTranslationX
{
    return @"transform.translation.x";
}
+(instancetype)pp_kpTransformTranslationY
{
    return @"transform.translation.y";
}
+(instancetype)pp_kpTransformTranslationZ
{
    return @"transform.translation.z";
}

+(instancetype)pp_kpTransformRotation
{
    return @"transform.rotation";
}
+(instancetype)pp_kpTransformRotationX
{
    return @"transform.rotation.x";
}
+(instancetype)pp_kpTransformRotationY
{
    return @"transform.rotation.y";
}
+(instancetype)pp_kpTransformRotationZ
{
    return @"transform.rotation.z";
}

+(instancetype)pp_kpTransformScale
{
    return @"transform.scale";
}
+(instancetype)pp_kpTransformScaleX
{
    return @"transform.scale.x";
}
+(instancetype)pp_kpTransformScaleY
{
    return @"transform.scale.y";
}
+(instancetype)pp_kpTransformScaleZ
{
    return @"transform.scale.z";
}
@end

//// CALyer的keyPaths
NSString *const kCAPosition = @"position";

@implementation NSString (KeyPathForCALyer)

@end
