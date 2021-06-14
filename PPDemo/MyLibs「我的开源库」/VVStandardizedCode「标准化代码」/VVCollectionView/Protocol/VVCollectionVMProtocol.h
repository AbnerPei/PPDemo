//
//  VVCollectionVMProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVCollectionVMProtocol_h
#define VVCollectionVMProtocol_h
#import "VVListVMProtocol.h"
#import "VVCollectionVMConfigProtocol.h"

@protocol VVCollectionVMProtocol <VVListVMProtocol>

@required
#warning pp605
/// <#注释#>
@property (nonatomic, strong, nonnull) __kindof NSObject<VVCollectionVMConfigProtocol> *config;

/// 获取section的列数
- (NSInteger)columnCountInSection:(NSInteger)section;

/// 获取section里item的数量
- (NSInteger)itemCountInSection:(NSInteger)section;

#warning pp605 是否必须？？？
/// <#注释#>
- (CGFloat)minimumLineSpacingInSection:(NSInteger)section;

/// <#注释#>
- (CGFloat)minimumInteritemSpacingInSection:(NSInteger)section;

/// 获取section的内边距
- (UIEdgeInsets)insetsInSection:(NSInteger)section;

@end

#endif /* VVCollectionVMProtocol_h */
