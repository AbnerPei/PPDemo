//
//  ClassClassModel.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2016/11/3.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "ClassClassModel.h"

@implementation ClassClassModel

+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ppClass" : @"class"
             };
}

+(NSDictionary *)mj_objectClassInArray
{
    return @{
             @"ppClass" : @"ClassObj"
             };
}
@end
