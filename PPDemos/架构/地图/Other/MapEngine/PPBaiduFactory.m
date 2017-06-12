//
//  PPBaiduFactory.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaiduFactory.h"
#import "PPBaiduMapView.h"

@implementation PPBaiduFactory
-(id<PPMapViewProtocol>)getMapViewWithFrame:(CGRect)frame
{
    return [[PPBaiduMapView alloc]initWithFrame:frame];
}
@end
