//
//  VVCollectionReusableViewProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVCollectionReusableViewProtocol_h
#define VVCollectionReusableViewProtocol_h
#import "VVReuseViewProtocol.h"

@protocol VVCollectionReusableViewProtocol <VVReuseViewProtocol>

@required
/// section头视图的kind,只能为以下两个之一：
/// UICollectionElementKindSectionHeader
/// UICollectionElementKindSectionFooter
+ (nonnull NSString *)kind;

@optional
/// section的hader大小
+ (CGSize)headerSizeWithModel:(nullable id)model;

/// section的footer大小
+ (CGSize)footerSizeWithModel:(nullable id)model;

@end

#endif /* VVCollectionReusableViewProtocol_h */
