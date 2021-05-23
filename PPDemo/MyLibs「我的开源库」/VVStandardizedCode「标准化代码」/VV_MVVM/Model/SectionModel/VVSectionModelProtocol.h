//
//  VVSectionModelProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import "VVReuseVMProtocol.h"
#import "VVDecorationVMProtocol.h"

#ifndef VVSectionModelProtocol_h
#define VVSectionModelProtocol_h

@protocol VVSectionModelProtocol <NSObject>

@optional
/// 分区列表的数据源 ???
@property (nonatomic, strong, nullable) __kindof NSArray<id<VVReuseVMProtocol>> *vv_datas;

/// 装饰视图的模型
@property (nonatomic, strong, nullable) __kindof NSObject<VVDecorationVMProtocol> *vv_decorationModel;

/// 分区区头的数据源
@property (nonatomic, strong, nullable) __kindof NSObject<VVReuseVMProtocol> *vv_headerModel;

/// 分区区尾的数据源
@property (nonatomic, strong, nullable) __kindof NSObject<VVReuseVMProtocol> *vv_footerModel;

/// 分区的列数
@property (nonatomic, assign) NSInteger vv_columnCount;



@end

#endif /* VVSectionModelProtocol_h */
