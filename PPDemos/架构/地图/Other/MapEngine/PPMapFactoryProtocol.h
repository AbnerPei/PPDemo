//
//  PPMapFactoryProtocol.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PPMapViewProtocol.h"

@protocol PPMapFactoryProtocol <NSObject>
-(id<PPMapViewProtocol>)getMapViewWithFrame:(CGRect)frame;
@end
