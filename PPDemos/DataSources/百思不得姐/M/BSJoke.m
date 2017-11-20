//
//  BSJoke.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/19.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "BSJoke.h"

@implementation BSJokeListResultInfo

@end

@implementation BSJoke
+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"jokeId":@"id"
             };
}
+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"tags":@"BSTag",
             @"top_comments":@"BSTopComment"
             };
}

@end


@implementation BSJokeListResult
+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list":@"BSJoke"
             };
}

@end


