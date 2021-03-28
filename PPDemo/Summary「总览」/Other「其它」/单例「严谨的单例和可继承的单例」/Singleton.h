//
//  Singleton.h
//  RealSingletonExample
//
//  Created by PPAbner on 2019/11/20.
//  Copyright © 2019 艾波er. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Singleton : NSObject

+ (instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END
