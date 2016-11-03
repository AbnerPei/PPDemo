//
//  Student.m
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "Student.h"
#import "Bag.h"

@implementation Student


+(NSDictionary *)mj_replacedKeyFromPropertyName
{
    
    /*
     
     dict_nokey = @{
     @"id" : @"20",
     @"desciption" : @"kids",
     @"name" : @{
     @"newName" : @"lufy",
     @"oldName" : @"kitty",
     @"info" : @[
                 @"test-data",
                 @{
                    @"nameChangedTime" : @"2013-08"
                  }
                ]
     },
     @"other" : @{
     @"bag" : @{
     @"name" : @"a red bag",
     @"price" : @100.7
     }
     }
     };
     */
    return @{
             @"ID" : @"id",
             @"desc" : @"desciption",
             @"oldName" : @"name.oldName",
             @"nowName" : @"name.newName",
             @"nameChangedTime" : @"name.info[1].nameChangedTime",
             @"bag" : @"other.bag"
             };
}


@end
