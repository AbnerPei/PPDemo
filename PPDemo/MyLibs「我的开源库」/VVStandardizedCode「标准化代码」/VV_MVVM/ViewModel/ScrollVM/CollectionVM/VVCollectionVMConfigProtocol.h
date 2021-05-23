//
//  VVCollectionVMConfigProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import "VVScrollVMConfigProtocol.h"

#ifndef VVCollectionVMConfigProtocol_h
#define VVCollectionVMConfigProtocol_h

// !!!: UITableView的ViewModel的配置协议
@protocol VVCollectionVMConfigProtocol <NSObject, VVScrollVMConfigProtocol>

@optional
/// 列数
@property (nonatomic, assign) NSInteger vv_columnCount;

@end

#endif /* VVCollectionVMConfigProtocol_h */
