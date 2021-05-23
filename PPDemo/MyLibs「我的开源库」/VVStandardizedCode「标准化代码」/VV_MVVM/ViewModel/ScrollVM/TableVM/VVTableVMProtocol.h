//
//  VVTableVMProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import "VVScrollVMProtocol.h"
#import "VVTableVMConfigProtocol.h"

#ifndef VVTableVMProtocol_h
#define VVTableVMProtocol_h

@protocol VVTableVMProtocol <NSObject, VVScrollVMProtocol>

@required
/// 返回UITableView每个分区的row数量
/// @param section section
- (NSInteger)vv_numberOfRowsInSection:(NSInteger)section;

@property (nonatomic, strong, nonnull) __kindof NSObject<VVTableVMConfigProtocol> *vv_config;

@end

#endif /* VVTableVMProtocol_h */
