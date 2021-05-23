//
//  VVScrollVMProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>

#ifndef VVScrollVMProtocol_h
#define VVScrollVMProtocol_h

@protocol VVScrollVMProtocol <NSObject>

@required
/// 分区数量
- (NSInteger)vv_sectionCount;

/// 根据indexPath获取数据源model
/// ⚠️:model只能是数据模型,不能是ViewModel
/// @param indexPath indexPath
- (nullable id)vv_modelAtIndexPath:(nonnull NSIndexPath *)indexPath;

/// 根据indexPath获取cell的名字字符串
/// @param indexPath indexPath
- (nullable NSString *)vv_cellClassNameAtIndexPath:(nonnull NSIndexPath *)indexPath;

@optional
- (nullable id)vv_headerModelInSection:(NSInteger)section;
- (nullable id)vv_footerModelInSection:(NSInteger)section;

- (nullable NSString *)vv_headerClassNameInSection:(NSInteger)section;
- (nullable NSString *)vv_footerClassNameInSection:(NSInteger)section;

/// 数据源
/// ①如果vv_config的vv_isMutipleSection为YES,则vv_datas里的model是section级别的model;
/// ②如果vv_config的vv_isMutipleSection为NO,则vv_datas里的model是row/item级别的model;
/// 除①和②外,特殊情况(刻意包装的数据)除外
@property (nonatomic, strong, nullable) __kindof NSArray *vv_datas;

@end

#endif /* VVScrollVMProtocol_h */
