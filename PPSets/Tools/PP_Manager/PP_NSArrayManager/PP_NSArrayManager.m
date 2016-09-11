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

-(NSMutableArray *)pp_exchangedArray:(NSMutableArray *)givenArray
{
    NSMutableArray *pp_newArray = [givenArray mutableCopy];
    for (int i = 0; i < pp_newArray.count/2.0; i++) {
        [pp_newArray exchangeObjectAtIndex:i withObjectAtIndex:pp_newArray.count-1-i];
    }
    return pp_newArray;
}

-(NSArray *)pp_exchangedArrayUsingShortTime:(NSArray *)givenArray
{
    return [givenArray reverseObjectEnumerator].allObjects;
}

-(NSMutableArray *)pp_sortArrayJustContainsDictionary:(NSArray *)givenArray dicKey:(NSString *)dicKey ascending:(BOOL)ascending
{
    NSMutableArray *pp_newArray = [givenArray mutableCopy];
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:dicKey ascending:ascending]];
    [pp_newArray sortUsingDescriptors:sortDescriptors];
    return pp_newArray;
}
@end
