//
//  YYEnglishIntroduction.h
//  YYCache
//
//  Created by Abner on 16/7/27.
//  Copyright © 2016年 ibireme. All rights reserved.
//

#ifndef YYEnglishIntroduction_h
#define YYEnglishIntroduction_h
/**
 `YYCache` is a thread safe key-value cache.
 
 It use `YYMemoryCache` to store objects in a small and fast memory cache,
 and use `YYDiskCache` to persisting objects to a large and slow disk cache.
 See `YYMemoryCache` and `YYDiskCache` for more information.
 */

/** The name of the cache, readonly. */

/** The underlying memory cache. see `YYMemoryCache` for more information.*/

/** The underlying disk cache. see `YYDiskCache` for more information.*/

/**
 Create a new instance with the specified name.
 Multiple instances with the same name will make the cache unstable.
 
 @param name  The name of the cache. It will create a dictionary with the name in
 the app's caches dictionary for disk cache. Once initialized you should not
 read and write to this directory.
 @result A new cache object, or nil if an error occurs.
 */

/**
 Create a new instance with the specified path.
 Multiple instances with the same name will make the cache unstable.
 
 @param path  Full path of a directory in which the cache will write data.
 Once initialized you should not read and write to this directory.
 @result A new cache object, or nil if an error occurs.
 */

/**
 Convenience Initializers
 Create a new instance with the specified name.
 Multiple instances with the same name will make the cache unstable.
 
 @param name  The name of the cache. It will create a dictionary with the name in
 the app's caches dictionary for disk cache. Once initialized you should not
 read and write to this directory.
 @result A new cache object, or nil if an error occurs.
 */

/**
 Convenience Initializers
 Create a new instance with the specified path.
 Multiple instances with the same name will make the cache unstable.
 
 @param path  Full path of a directory in which the cache will write data.
 Once initialized you should not read and write to this directory.
 @result A new cache object, or nil if an error occurs.
 */

/**
 Returns a boolean value that indicates whether a given key is in cache.
 This method may blocks the calling thread until file read finished.
 
 @param key A string identifying the value. If nil, just return NO.
 @return Whether the key is in cache.
 */

/**
 Returns a boolean value with the block that indicates whether a given key is in cache.
 This method returns immediately and invoke the passed block in background queue
 when the operation finished.
 
 @param key   A string identifying the value. If nil, just return NO.
 @param block A block which will be invoked in background queue when finished.
 */

/**
 Returns the value associated with a given key.
 This method may blocks the calling thread until file read finished.
 
 @param key A string identifying the value. If nil, just return nil.
 @return The value associated with key, or nil if no value is associated with key.
 */

/**
 Returns the value associated with a given key.
 This method returns immediately and invoke the passed block in background queue
 when the operation finished.
 
 @param key A string identifying the value. If nil, just return nil.
 @param block A block which will be invoked in background queue when finished.
 */

/**
 Sets the value of the specified key in the cache.
 This method may blocks the calling thread until file write finished.
 
 @param object The object to be stored in the cache. If nil, it calls `removeObjectForKey:`.
 @param key    The key with which to associate the value. If nil, this method has no effect.
 */

/**
 Sets the value of the specified key in the cache.
 This method returns immediately and invoke the passed block in background queue
 when the operation finished.
 
 @param object The object to be stored in the cache. If nil, it calls `removeObjectForKey:`.
 @param block  A block which will be invoked in background queue when finished.
 */

/**
 Removes the value of the specified key in the cache.
 This method may blocks the calling thread until file delete finished.
 
 @param key The key identifying the value to be removed. If nil, this method has no effect.
 */

/**
 Removes the value of the specified key in the cache.
 This method returns immediately and invoke the passed block in background queue
 when the operation finished.
 
 @param key The key identifying the value to be removed. If nil, this method has no effect.
 @param block  A block which will be invoked in background queue when finished.
 */

/**
 Empties the cache.
 This method returns immediately and invoke the passed block in background queue
 when the operation finished.
 
 @param block  A block which will be invoked in background queue when finished.
 */

/**
 Empties the cache with block.
 This method returns immediately and executes the clear operation with block in background.
 
 @warning You should not send message to this instance in these blocks.
 @param progress This block will be invoked during removing, pass nil to ignore.
 @param end      This block will be invoked at the end, pass nil to ignore.
 */

#endif /* YYEnglishIntroduction_h */
