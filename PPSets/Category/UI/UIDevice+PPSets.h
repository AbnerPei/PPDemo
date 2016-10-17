//
//  UIDevice+PPSets.h
//  PPDemos
//
//  Created by Abner on 16/10/11.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (PPSets)

/**
 *  /// 获取iOS系统的版本号
 */
+ (NSString *)pp_systemVersion;

/**
 *  /// 判断当前系统是否有摄像头
 */
+ (BOOL)pp_hasCamera;

@end

/**
 *  内存相关的
 */
@interface UIDevice (RAM)

/**
 *  001 获取手机内存总量, 返回的是字节数
 */
+ (NSUInteger)pp_totalMemoryBytes;

/**
 *  002 获取手机可用内存, 返回的是字节数
 */
+ (NSUInteger)pp_freeMemoryBytes;

/**
 *  003 获取手机硬盘空闲空间, 返回的是字节数
 */
+ (long long)pp_freeDiskSpaceBytes;

/**
 *  004 获取手机硬盘总空间, 返回的是字节数
 */
+ (long long)pp_totalDiskSpaceBytes;
@end