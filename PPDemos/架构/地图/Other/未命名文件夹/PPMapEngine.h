//
//  PPMapEngine.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger,PPMapEngineType) {
    PPMapEngineTypeGaode,
    PPMapEngineTypeBaidu
};

@interface PPMapEngine : NSObject
+(id<PPMapViewProtocol>)pp_engineGetMapViewWithFrame:(CGRect)frame
                                          engineType:(PPMapEngineType)engineType;
@end
