//
//  VVBaseVM.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VVBaseVM : NSObject

/// 源数据，通常指api返回的数据
@property (nonatomic, strong, nullable) id vv_rawData;

@end

NS_ASSUME_NONNULL_END
