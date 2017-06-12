//
//  PPBaiduMapView.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaiduMapView.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>//引入地图功能所有的头文件

@interface PPBaiduMapView ()
@property(nonatomic,strong)BMKMapManager *mapManager;
@property(nonatomic,strong)BMKMapView *mapView;
@end

@implementation PPBaiduMapView

-(UIView *)getMapView
{
    return self.mapView;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super init];
    if (self) {
        self.mapManager = [[BMKMapManager alloc]init];
        BOOL isSuccess = [self.mapManager start:K_BaiduMap_Key generalDelegate:nil];
        if (isSuccess) {
            NSLog(@"百度地图启动成功") ;
        }
        self.mapView = [[BMKMapView alloc]initWithFrame:frame];
    }
    return self;
}
@end
