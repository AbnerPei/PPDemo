//
//  StatusResult.h
//  PPDemos
//
//  Created by Abner on 16/7/4.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StatusResult : NSObject
/** 数组中存储模型Status类型数据 */
@property (strong, nonatomic) NSMutableArray *statuses;
/** 数组中存储模型Ad类型数据 */
@property (strong, nonatomic) NSArray *ads;
@property (strong, nonatomic) NSNumber *totalNumber;
@end
