//
//  VVCollectionVMConfigProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVCollectionVMConfigProtocol_h
#define VVCollectionVMConfigProtocol_h
#warning pp605
//#import <Foundation/Foundation.h>
//#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>

@protocol VVCollectionVMConfigProtocol <NSObject>

@optional
/// cell的类名字符串
@property (nonatomic, copy, nullable) NSString *cellClassName;

/// 区头的类名字符串
@property (nonatomic, copy, nullable) NSString *headerClassName;

/// 区尾的类名字符串
@property (nonatomic, copy, nullable) NSString *footerClassName;

/// 区头的数据源模型
@property (nonatomic, strong, nullable) __kindof NSObject *headerModel;

/// 区尾的数据源模型
@property (nonatomic, strong, nullable) __kindof NSObject *footerModel;

#warning pp605
/// <#注释#>
@property (nonatomic, assign) CGFloat minimumLineSpacing;

/// <#注释#>
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;

/// section的insets
@property (nonatomic) UIEdgeInsets sectionInsets;

/// 列数
@property (nonatomic, assign) NSInteger columnCount;

/// 是否是多个section
@property (nonatomic, assign) BOOL isMutipleSection;

/// 是否有多种cell（注意：整个collectionView而言，不在乎分区）
@property (nonatomic, assign, readonly) BOOL isMutipleCell;

@end

#endif /* VVCollectionVMConfigProtocol_h */
