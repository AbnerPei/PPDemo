//
//  VVDecorationModelProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/14.
//

#ifndef VVDecorationModelProtocol_h
#define VVDecorationModelProtocol_h
#import "VVReuseModelProtocol.h"

@protocol VVDecorationModelProtocol <VVReuseModelProtocol>

/// DecorationView 区域的insets
@property (nonatomic, assign) UIEdgeInsets insets;

/// DecorationView 区域的zIndex
@property (nonatomic, assign) NSInteger zIndex;

@end

#endif /* VVDecorationModelProtocol_h */
