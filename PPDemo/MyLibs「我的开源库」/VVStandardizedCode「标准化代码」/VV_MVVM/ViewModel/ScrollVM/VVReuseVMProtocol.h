//
//  VVReuseVMProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>

#ifndef VVReuseVMProtocol_h
#define VVReuseVMProtocol_h

@protocol VVReuseVMProtocol <NSObject>

@optional
/// 可复用类的名称
@property (nonatomic, copy, nullable) NSString *vv_reuseClassName;

@end

#endif /* VVReuseVMProtocol_h */
