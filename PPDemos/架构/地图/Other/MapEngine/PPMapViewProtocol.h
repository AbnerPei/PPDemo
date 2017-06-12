//
//  PPMapViewProtocol.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>




/**
 地图（XX地图、地图frame等信息）协议
 ///>* 当前协议知道具体是哪种地图
 //父类引用指向子类子类实例对象（面向对象：OOP） ？？
 */
@protocol PPMapViewProtocol <NSObject>


/**
 返回要用的地图
 */
-(UIView *)getMapView;

/**
 设置地图frame
 */
-(instancetype)initWithFrame:(CGRect)frame;

@end
