//
//  SortDescriptorPeople.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/2.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "SortDescriptorPeople.h"

@implementation SortDescriptorPeople
-(NSString *)description
{
  return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

@end
