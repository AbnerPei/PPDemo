//
//  VVScrollVMConfigProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>

#ifndef VVScrollVMConfigProtocol_h
#define VVScrollVMConfigProtocol_h

// !!!: UIScrollView类型的ViewModel的配置协议
@protocol VVScrollVMConfigProtocol <NSObject>

@optional
/// cell的类名
@property (nonatomic, copy, nullable) NSString *vv_cellClassName;

/// 分区区头的类名
@property (nonatomic, copy, nullable) NSString *vv_sectionHeaderClassName;

/// 分区区尾的类名
@property (nonatomic, copy, nullable) NSString *vv_sectionFooterClassName;

/// 分区区头的数据源模型
@property (nonatomic, strong, nullable) NSObject *vv_sectionHeaderModel;

/// 分区区尾的数据源模型
@property (nonatomic, strong, nullable) NSObject *vv_sectionFooterModel;

/// 是否是多section,默认NO.
@property (nonatomic, assign) BOOL vv_isMutipleSection;

/// 是否有多种cell
@property (nonatomic, assign, readonly) BOOL vv_isMutipleCell;

@end

#endif /* VVScrollVMConfigProtocol_h */
