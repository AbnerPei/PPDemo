//
//  PP_NSArrayManager.m
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/4/6.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import "PP_NSArrayManager.h"

@implementation PP_NSArrayManager

+(PP_NSArrayManager *)pp_shareInstance
{
    static PP_NSArrayManager *aArrayManage = nil;
    static dispatch_once_t onceArrayManager;
    dispatch_once(&onceArrayManager, ^{
        aArrayManage = [[PP_NSArrayManager alloc]init];
    });
    return aArrayManage;
}


-(NSMutableArray *)pp_sortArrayJustContainsDictionary:(NSArray *)givenArray dicKey:(NSString *)dicKey ascending:(BOOL)ascending
{
    NSMutableArray *pp_newArray = [givenArray mutableCopy];
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:dicKey ascending:ascending]];
    [pp_newArray sortUsingDescriptors:sortDescriptors];
    
//    givenArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//        <#code#>
//    }
    return pp_newArray;
}
@end
