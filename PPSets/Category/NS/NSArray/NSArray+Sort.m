//
//  NSArray+Sort.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/10.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "NSArray+Sort.h"

@implementation NSArray (Sort)
#pragma mark --- 数组倒序
+(NSArray *)pp_array_reversed:(NSArray *)originalArray
{
    return [originalArray pp_array_reversed];
}
-(NSArray *)pp_array_reversed
{
    NSEnumerator *reverseEnumerator = [self reverseObjectEnumerator];
    return [reverseEnumerator allObjects];
}
@end
