//
//  PPGaodeMapView.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPGaodeMapView.h"
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <MAMapKit/MAMapKit.h>

@interface PPGaodeMapView ()
@property(nonatomic,strong)MAMapView *mapView;
@end

@implementation PPGaodeMapView

-(UIView *)getMapView
{
    return self.mapView;
}

/*
 //被 AppStore 拒绝的解决办法
 //【注意】2、如果您的应用没有广告，而又获取了 IDFA。我们建议选择 2 和 4。
 
   当前版本：基础    1.4.0
           3D     5.2.0
           搜索    5.1.0
 */
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        //配置高德 Key 前，添加开启 HTTPS 功能的代码
        [[AMapServices sharedServices] setEnableHTTPS:YES];
        [AMapServices sharedServices].apiKey = K_GaodeMap_key;
        self.mapView = [[MAMapView alloc] initWithFrame:frame];
    }
    return self;
}
@end
