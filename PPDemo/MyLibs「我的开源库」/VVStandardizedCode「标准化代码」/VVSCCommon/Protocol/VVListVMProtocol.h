//
//  VVListVMProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVListVMProtocol_h
#define VVListVMProtocol_h

@protocol VVListVMProtocol <NSObject>

@required
/// 数据源
/// ①如果vv_config的vv_isMutipleSection为YES,则vv_datas里的model是section级别的model;
/// ②如果vv_config的vv_isMutipleSection为NO,则vv_datas里的model是row/item级别的model;
/// 除①和②外,特殊情况(刻意包装的数据)除外
@property (nonatomic, strong, nullable) __kindof NSArray *datas;

#warning pp605
/// 是否还有更多
@property (nonatomic, assign) BOOL hasMore;

/// section的数量
- (NSInteger)sectionCount;

#warning pp605
/// 根据indexPath获取对应的model（警告⚠️：model只能是数据模型，不能是viewModel）
- (nullable id)modelAtIndexPath:(nonnull NSIndexPath *)indexPath;

/// 根据indexPath获取对应的cell的类名字符串
- (nullable NSString *)cellClassNameAtIndexPath:(nonnull NSIndexPath *)indexPath;

@optional
- (nullable id)modelForHeaderInSection:(NSInteger)section;
- (nullable id)modelForFooterInSection:(NSInteger)section;

- (nullable NSString *)classNameForHeaderInSection:(NSInteger)section;
- (nullable NSString *)classNameForFooterInSection:(NSInteger)section;

@end


#endif /* VVListVMProtocol_h */
