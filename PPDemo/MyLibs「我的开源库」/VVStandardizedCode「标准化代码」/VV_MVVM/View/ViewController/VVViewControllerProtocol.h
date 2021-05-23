//
//  VVViewControllerProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/18.
//

#import <Foundation/Foundation.h>

#ifndef VVViewControllerProtocol_h
#define VVViewControllerProtocol_h

@protocol VVViewControllerProtocol <NSObject>

+ (instancetype)vv_controller;

- (void)vv_setupUI;

@end

#endif /* VVViewControllerProtocol_h */
