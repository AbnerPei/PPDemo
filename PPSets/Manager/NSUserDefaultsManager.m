//
//  NSUserDefaultsManager.m
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "NSUserDefaultsManager.h"

@implementation NSUserDefaultsManager

+ (void)pp_storageValue:(id)value forKey:(NSString *)key {
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+ (id)pp_getValueByKey:(NSString *)key {
    id value = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    return value;
}
@end
