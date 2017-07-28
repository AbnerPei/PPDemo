//
//  PPPushPopAnimationManager.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PPPushPopAnimationManager : NSObject<UIViewControllerAnimatedTransitioning>
+(instancetype)managerWithIsPush:(BOOL)isPush;
@end
