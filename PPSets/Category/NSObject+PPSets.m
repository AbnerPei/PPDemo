//
//  NSObject+PPSets.m
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "NSObject+PPSets.h"

@implementation NSObject (PPSets)

@end


@implementation NSObject (PPChangeState)

-(NSString*)pp_safeString
{
    if ([self isKindOfClass:[NSNull class]] || self == nil) {
        return @"";
    }else
        return (NSString*)self;
}

-(NSString *)pp_getSafeStr:(NSString *)safeStr
{
    if ([self isKindOfClass:[NSNull class]] || self == nil) {
        return safeStr;
    }
    return (NSString*)self;
}
@end