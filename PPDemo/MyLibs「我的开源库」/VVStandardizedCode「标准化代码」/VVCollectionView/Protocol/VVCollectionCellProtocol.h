//
//  VVCollectionCellProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVCollectionCellProtocol_h
#define VVCollectionCellProtocol_h
#import <CoreGraphics/CoreGraphics.h>
#import "VVReuseViewProtocol.h"

@protocol VVCollectionCellProtocol <VVReuseViewProtocol>

@optional
/// item的大小
+ (CGSize)itemSizeWithModel:(nullable id)model;

@end

#endif /* VVCollectionCellProtocol_h */
