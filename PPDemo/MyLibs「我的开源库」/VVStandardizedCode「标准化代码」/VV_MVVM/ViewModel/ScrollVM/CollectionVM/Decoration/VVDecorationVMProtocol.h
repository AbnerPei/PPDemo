//
//  VVDecorationVMProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "VVReuseVMProtocol.h"

#ifndef VVDecorationVMProtocol_h
#define VVDecorationVMProtocol_h

@protocol VVDecorationVMProtocol <NSObject, VVReuseVMProtocol>

/// DecorationView的insets
@property (nonatomic) UIEdgeInsets insets;

/// DecorationView的insets ????
@property (nonatomic, assign) NSInteger zIndex;

@end

#endif /* VVDecorationVMProtocol_h */
