//
//  VVSectionModelProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/13.
//

#ifndef VVSectionModelProtocol_h
#define VVSectionModelProtocol_h
#import "VVReuseModelProtocol.h"
#import "VVDecorationModelProtocol.h"

@protocol VVSectionModelProtocol <NSObject>

/// 分区列表的数据源数组
@property (nonatomic, strong, nullable) __kindof NSArray<id<VVReuseModelProtocol>> *datas;

#warning pp605
/// 装饰视图的模型
@property (nonatomic, strong, nullable) __kindof NSObject<VVDecorationModelProtocol> *decorationModel;

/// 区头的数据源
@property (nonatomic, strong, nullable) __kindof NSObject<VVReuseModelProtocol> *headerModel;

/// 区尾的数据源
@property (nonatomic, strong, nullable) __kindof NSObject<VVReuseModelProtocol> *footerModel;

/// 分区列数
@property (nonatomic, assign) NSInteger columnCount;

/// 每个分区的lineSpacing
@property (nonatomic, assign) CGFloat minimumLineSpacing;

/// 每个分区的interitemSpacing
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

/// 每个分区的sectionInsets
@property (nonatomic, assign) UIEdgeInsets sectionInsets;

@end

#endif /* VVSectionModelProtocol_h */
