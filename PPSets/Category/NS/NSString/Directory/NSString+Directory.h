//
//  NSString+Directory.h
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/9.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 APP目录、文件路径等
 */
@interface NSString (Directory)
/** 获取主目录路径 */
+(NSString *)pp_directory_homePath;
/** 获取Documents路径 */
+(NSString *)pp_directory_documentsPath;
/** 获取Library路径 */
+(NSString *)pp_directory_libraryPath;
/** 获取Library/Caches路径 */
+(NSString *)pp_directory_cachesPath;
/** 获取Temp路径 */
+(NSString *)pp_directory_tempPath;
@end
