//
//  EPeiOrderModel.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2016/12/19.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "EPeiOrderModel.h"

@implementation EPeiOrderModel

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"order_id" : @"id"
             };
}

@end
