//
//  PP_NSArrayManager.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/4/6.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PP_NSArrayManager : NSObject

+(PP_NSArrayManager *)pp_shareInstance;

/*!
 *  @author ╰莪呮想好好宠Nǐつ, 16-04-06 14:04:10
 *  数组倒序排序
 *  方法1相对消耗时间长些，但也很小很小 
 *  @param givenArray 需要排序的数组 如：@[@1,@2,@3,@4,@5,@6]
 *  @return 排序后的数组  结果:@[@6,@5,@4,@3,@2,@1]
 */
-(NSMutableArray *)pp_exchangedArray:(NSMutableArray *)givenArray;
-(NSArray *)pp_exchangedArrayUsingShortTime:(NSArray *)givenArray;
/*!
 *  @author ╰莪呮想好好宠Nǐつ, 16-04-06 15:04:01
 *
 *  包含字典的数组，按照字典的某个key升【降】排序
 *
 *  @param givenArray 包含字典的数组
 *  @param dicKey     字典的某个key
 *  @param ascending  升【降】
 *  @return 排序后的数组
 */
/*
 示例：
 NSDictionary *dicOne = [NSDictionary dictionaryWithObjectsAndKeys:@"1",@"price",@"2",@"number", nil];
 NSDictionary *dicTWo = [NSDictionary dictionaryWithObjectsAndKeys:@"6",@"price",@"5",@"number", nil];
 NSDictionary *dicThree = [NSDictionary dictionaryWithObjectsAndKeys:@"3",@"price",@"1",@"number", nil];
 NSDictionary *dicFour = [NSDictionary dictionaryWithObjectsAndKeys:@"4",@"price",@"3",@"number", nil];
 NSArray *arr = @[dicOne,dicTWo,dicThree,dicFour];
 
 NSMutableArray *aArr = [[PP_NSArrayManager pp_shareInstance] pp_sortArrayJustContainsDictionary:arr dicKey:@"price" ascending:YES];
 
 NSLog(@"888^^^^^%@",aArr);
 
 //打印结果：
 
 2016-04-06 15:38:28.543 MySetsDemo[87350:972248] 888^^^^^(
 {
 number = 2;
 price = 1;
 },
 {
 number = 1;
 price = 3;
 },
 {
 number = 3;
 price = 4;
 },
 {
 number = 5;
 price = 6;
 }
 )
 */
-(NSMutableArray *)pp_sortArrayJustContainsDictionary:(NSArray *)givenArray dicKey:(NSString *)dicKey ascending:(BOOL)ascending;

@end
