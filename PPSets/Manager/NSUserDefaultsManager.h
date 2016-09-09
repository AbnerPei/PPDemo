//
//  NSUserDefaultsManager.h
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSUserDefaultsManager : NSObject

/** 存数据*/
+ (void)pp_storageValue:(id)value forKey:(NSString *)key;

/** 取数据*/
+ (id)pp_getValueByKey:(NSString *)key;

@end
