//
//  StatusResult.m
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "StatusResult.h"
#import "MJExtension.h"
#import "YYModel.h"
@implementation StatusResult
/* 数组中存储模型数据，需要说明数组中存储的模型数据类型 */
+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"statuses" : @"Status",
             @"ads" : @"Ad"
             };
}

//yy
+(NSDictionary *)modelContainerPropertyGenericClass
{
    return @{
             @"statuses" : @"Status",
             @"ads" : @"Ad"
             };
}
@end


