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
+(NSArray *)pp_arrReversed:(NSArray *)originalArray
{
    return [originalArray pp_arrReversed];
}
-(NSArray *)pp_arrReversed
{
    NSEnumerator *reverseEnumerator = [self reverseObjectEnumerator];
    return [reverseEnumerator allObjects];
}
@end
