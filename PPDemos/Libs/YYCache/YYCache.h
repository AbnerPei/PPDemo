//
//  YYCache.h
//  YYCache <https://github.com/ibireme/YYCache>
//
//  Created by ibireme on 15/2/13.
//  Copyright (c) 2015 ibireme.
//
//  This source code is licensed under the MIT-style license found in the
//  LICENSE file in the root directory of this source tree.
//

#import <Foundation/Foundation.h>

#if __has_include(<YYCache/YYCache.h>)
FOUNDATION_EXPORT double YYCacheVersionNumber;
FOUNDATION_EXPORT const unsigned char YYCacheVersionString[];
#import <YYCache/YYMemoryCache.h>
#import <YYCache/YYDiskCache.h>
#import <YYCache/YYKVStorage.h>
#elif __has_include(<YYWebImage/YYCache.h>)
#import <YYWebImage/YYMemoryCache.h>
#import <YYWebImage/YYDiskCache.h>
#import <YYWebImage/YYKVStorage.h>
#else
#import "YYMemoryCache.h"
#import "YYDiskCache.h"
#import "YYKVStorage.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/**
 `YYCache`是一个线程安全的key-value缓存（框架）.
 
 `YYCache`是由内存缓存(`YYMemoryCache`)和磁盘缓存(`YYDiskCache`)组成，内存缓存提供容量小但高速的存取功能，磁盘缓存提供大容量但低速的持久化(persisting)存储。
 更多信息请见`YYMemoryCache`和`YYDiskCache`
 */
@interface YYCache : NSObject

/** 当前数据库的名称【只读】*/
@property (copy, readonly) NSString *name;

/** 底层的内存缓存。更多信息请见`YYMemoryCache`*/
@property (strong, readonly) YYMemoryCache *memoryCache;

/** 底层的磁盘缓存。更多信息请见`YYDiskCache`*/
@property (strong, readonly) YYDiskCache *diskCache;

/**
 *  通过特定的【名称】初始化一个YYCache对象。
    [warning:同一个名称不同的对象将会导致缓存不稳定！！（e.g AAKey——>西瓜，但是下一次AKey——>苹果，这样数据库就不稳定，动荡！）]
 
 *  @param name 特定的名称（e.g KPPAbnerCache）。该方法通过这个名字（在app的缓存字典中）创建一个字典提供给磁盘缓存。一旦初始化了，你就不能对该目录做读写操作！（就是说该目录不可操作）
 *  @return 一个YYCache对象，可以为nil(if an error occurs.)
 */
- (nullable instancetype)initWithName:(NSString *)name;

/**
 *  通过特定的【路径】初始化一个YYCache对象。
    [warning:同一个名称不同的对象将会导致缓存不稳定！！（e.g AAKey——>西瓜，但是下一次AKey——>苹果，这样数据库就不稳定，动荡！）]
 
 *  @param path 缓存写入数据的目录的完整路径。一旦初始化了，你就不能对该目录做读写操作！（就是说该目录不可操作）
 *  @return 一个YYCache对象，可以为nil(if an error occurs.)
 */
- (nullable instancetype)initWithPath:(NSString *)path NS_DESIGNATED_INITIALIZER;

/**
 *  【【类方法】】—— 通过特定的【名称】初始化一个YYCache对象。
     更多注释见- (nullable instancetype)initWithName:(NSString *)name;
 */
+ (nullable instancetype)cacheWithName:(NSString *)name;

/**
 *  【【类方法】】—— 通过特定的【路径】初始化一个YYCache对象。
     更多注释见- (nullable instancetype)initWithPath:(NSString *)path
 */
+ (nullable instancetype)cacheWithPath:(NSString *)path;

/**
 *  不能通过以下两个方法初始化
 */
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

#pragma mark - 调用(访问)的方法s
///=============================================================================
/// @name 调用(访问)的方法s
///=============================================================================

/**
 *  缓存中是否有对应的key。【If nil, just return NO.】
    【warning】这种方法可能会阻塞当前线程,直到文件读取完成。
 */
- (BOOL)containsObjectForKey:(NSString *)key;

/**
 *  缓存中是否有对应的key。【If nil, just return NO.】
    这种方法不会阻塞当前线程,在后台查询一结束就立即回调。
 */
- (void)containsObjectForKey:(NSString *)key withBlock:(nullable void(^)(NSString *key, BOOL contains))block;

/**
 *  根据key去缓存里取对应的值。（If nil, just return nil.）
   【warning】这种方法可能会阻塞当前线程,直到文件读取完成。
 */
- (nullable id<NSCoding>)objectForKey:(NSString *)key;

/**
 *  根据key去缓存里取对应的值。（If nil, just return nil.）
    这种方法不会阻塞当前线程,在后台查询一结束就立即回调。
 */
- (void)objectForKey:(NSString *)key withBlock:(nullable void(^)(NSString *key, id<NSCoding> object))block;

/**
 *  根据特定的【字符】往缓存中缓存数据。
   【warning】这种方法可能会阻塞当前线程,直到文件读取完成。
 
 *  @param object 要往缓存中存的数据（对象）。【If nil, it calls `removeObjectForKey:`】去移除存的数据！
 *  @param key 特定的【字符】。【If nil，该方法无效！】
 */
- (void)setObject:(nullable id<NSCoding>)object forKey:(NSString *)key;

/**
 *  根据特定的【字符】往缓存中缓存数据。
    这种方法不会阻塞当前线程,在后台查询一结束就立即回调。
 
 *  @param object 要往缓存中存的数据（对象）。【If nil, it calls `removeObjectForKey:`】去移除存的数据！
 *  @param key 特定的【字符】。【If nil，该方法不执行！】
 *  @param block 完成后立即回调的block。
 */
- (void)setObject:(nullable id<NSCoding>)object forKey:(NSString *)key withBlock:(nullable void(^)(void))block;

/**
 *  根据特定的【字符】移除对应缓存的数据
   【warning】这种方法可能会阻塞当前线程,直到文件读取完成。

 *  @param key 特定的【字符】。【If nil，该方法不执行！】
 */
- (void)removeObjectForKey:(NSString *)key;

/**
 *  根据特定的【字符】移除对应缓存的数据
    这种方法不会阻塞当前线程,在后台查询一结束就立即回调。

 *  @param key 特定的【字符】。【If nil，该方法不执行！】
 *  @param block 完成后立即回调的block。
 */
- (void)removeObjectForKey:(NSString *)key withBlock:(nullable void(^)(NSString *key))block;

/**
 *  移除所有缓存数据
   【warning】这种方法可能会阻塞当前线程,直到文件读取完成。
 */
- (void)removeAllObjects;

/**
 *  移除所有缓存数据
    这种方法不会阻塞当前线程,在后台查询一结束就立即回调。
 
 *  @param block 完成后立即回调的block。
 */
- (void)removeAllObjectsWithBlock:(void(^)(void))block;

/**
 *  移除所有缓存数据.
    【warning】在这些blocks里你要去设置或者修改缓存的东东！（就是说已经在清理地板上垃圾了，你就不要再往地板上仍垃圾）
 *  @param progress 移除进度block，如果为nil,不管！
 *  @param end 移除完成block，如果为nil,不管！
 */
- (void)removeAllObjectsWithProgressBlock:(nullable void(^)(int removedCount, int totalCount))progress
                                 endBlock:(nullable void(^)(BOOL error))end;

@end

NS_ASSUME_NONNULL_END
