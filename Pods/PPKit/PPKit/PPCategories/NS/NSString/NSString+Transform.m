//
//  NSString+Transform.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/1.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSString+Transform.h"

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

@implementation NSString (Transform)
+(instancetype)pp_transform
{
    return @"transform";
}
+(instancetype)pp_transformTranslation
{
    return @"transform.translation";
}
+(instancetype)pp_transformTranslationX
{
    return @"transform.translation.x";
}
+(instancetype)pp_transformTranslationY
{
    return @"transform.translation.y";
}
+(instancetype)pp_transformTranslationZ
{
    return @"transform.translation.z";
}

+(instancetype)pp_transformRotation
{
    return @"transform.rotation";
}
+(instancetype)pp_transformRotationX
{
    return @"transform.rotation.x";
}
+(instancetype)pp_transformRotationY
{
    return @"transform.rotation.y";
}
+(instancetype)pp_transformRotationZ
{
    return @"transform.rotation.z";
}

+(instancetype)pp_transformScale
{
    return @"transform.scale";
}
+(instancetype)pp_transformScaleX
{
    return @"transform.scale.x";
}
+(instancetype)pp_transformScaleY
{
    return @"transform.scale.y";
}
+(instancetype)pp_transformScaleZ
{
    return @"transform.scale.z";
}
@end
