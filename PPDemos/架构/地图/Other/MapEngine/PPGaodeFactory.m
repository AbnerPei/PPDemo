//
//  PPGaodeFactory.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPGaodeFactory.h"
#import "PPGaodeMapView.h"

@implementation PPGaodeFactory
-(id<PPMapViewProtocol>)getMapViewWithFrame:(CGRect)frame
{
    return [[PPGaodeMapView alloc]initWithFrame:frame];
}
@end
