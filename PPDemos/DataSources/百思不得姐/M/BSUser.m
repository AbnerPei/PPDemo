//
//  BSUser.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/19.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "BSUser.h"
@implementation BSUserHeader
@end

@implementation BSUser
+(NSArray *)mj_ignoredPropertyNames
{
    return @[@"userHeader"];
}

+(NSArray<NSString *> *)ignoredProperties
{
   return @[@"header"];
}

@end
