//
//  NSString+Directory.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/9.
//  Copyright © 2017年 JinRi . All rights reserved.
//

#import "NSString+Directory.h"

@implementation NSString (Directory)
#pragma mark --- 获取主目录路径
+(NSString *)pp_directory_homePath
{
    return NSHomeDirectory();
}
#pragma mark --- 获取Documents路径
+(NSString *)pp_directory_documentsPath
{
    return getPath(NSDocumentDirectory);
}
#pragma mark --- 获取Library路径
+(NSString *)pp_directory_libraryPath
{
    return getPath(NSLibraryDirectory);
}
#pragma mark --- 获取Library/Caches路径
+(NSString *)pp_directory_cachesPath
{
    return getPath(NSCachesDirectory);
}
#pragma mark --- 获取Temp路径
+(NSString *)pp_directory_tempPath
{
    return NSTemporaryDirectory();
}

//内部使用
static NSString *getPath(NSSearchPathDirectory directory){
    NSArray *pathArr = NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
    return [pathArr objectAtIndex:0];
}
@end
