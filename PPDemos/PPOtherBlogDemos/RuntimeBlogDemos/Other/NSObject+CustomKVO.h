//
//  NSObject+CustomKVO.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/22.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface NSObject (CustomKVO)

//自定义KVO
- (void)pp_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;

@end

NS_ASSUME_NONNULL_END

