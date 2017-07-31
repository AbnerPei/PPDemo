//
//  NSString+CATransitionType.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/31.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
//kCATransitionFade                //交叉淡化过渡（不支持过渡方向） @"fade"
//kCATransitionMoveIn              //新视图移到旧视图上面  @"moveIn"
//kCATransitionPush                //新视图把旧视图推出  @"push"
//kCATransitionReveal              //将旧视图移开，显示下面的新视图  @"reveal"
////上面4种，系统已经提供了，不用再自己写

CA_EXTERN NSString * const kCATransitionCube;                    //立方体翻转效果
CA_EXTERN NSString * const kCATransitionOglFlip;                 //上下左右翻转效果
CA_EXTERN NSString * const kCATransitionSuckEffect;              //收缩效果，如一块布被抽走（不支持过渡方向）
CA_EXTERN NSString * const kCATransitionRippleEffect;            //滴水效果（不支持过渡方向）
CA_EXTERN NSString * const kCATransitionPageCurl;                //向上翻页效果
CA_EXTERN NSString * const kCATransitionPageUnCurl;              //向下翻页效果
CA_EXTERN NSString * const kCATransitionCameraIrisHollowOpen;    //相机镜头打开效果
CA_EXTERN NSString * const kCATransitionCameraIrisHollowClosse;  //相机镜头关闭效果

@interface NSString (CATransitionType)

@end

