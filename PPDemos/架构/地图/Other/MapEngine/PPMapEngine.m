//
//  PPMapEngine.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPMapEngine.h"


@implementation PPMapEngine

+(id<PPMapViewProtocol>)pp_engineGetMapViewWithFrame:(CGRect)frame engineType:(PPMapEngineType)engineType
{
    id<PPMapFactoryProtocol> mapFactory ;
    if (engineType == PPMapEngineTypeBaidu) {
        mapFactory = [[PPBaiduFactory alloc]init];
    }else if (engineType == PPMapEngineTypeGaode){
        mapFactory = [[PPGaodeFactory alloc]init];
    }
    id<PPMapViewProtocol> mapView = [mapFactory getMapViewWithFrame:frame];
    
    return mapView;
}
@end
