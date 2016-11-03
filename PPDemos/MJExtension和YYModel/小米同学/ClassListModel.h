//
//  ClassListModel.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2016/11/3.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ClassEntryModel;

@interface ClassListModel : NSObject

/** ClassEntryModel 模型数组 */
@property(nonatomic,strong)NSMutableArray *list;

@property (nonatomic,copy) NSString *weekDay;

@end
