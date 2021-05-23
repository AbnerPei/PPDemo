//
//  VVCollectionVMProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import "VVScrollVMProtocol.h"
#import "VVCollectionVMConfigProtocol.h"

#ifndef VVCollectionVMProtocol_h
#define VVCollectionVMProtocol_h

@protocol VVCollectionVMProtocol <NSObject, VVScrollVMProtocol>

@required
/// 返回UICollection每个分区的row数量
/// @param section section
- (NSInteger)vv_numberOfItemsInSection:(NSInteger)section;

@optional
@property (nonatomic, strong, nonnull) __kindof NSObject<VVCollectionVMConfigProtocol> *vv_config;

@end

#endif /* VVCollectionVMProtocol_h */
