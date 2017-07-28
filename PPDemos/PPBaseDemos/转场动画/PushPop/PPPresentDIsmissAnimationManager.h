//
//  PPPresentDIsmissAnimationManager.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/28.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    
    AnimationTypePresent,
    
    AnimationTypeDismiss
    
} AnimationType;
@interface PPPresentDIsmissAnimationManager : NSObject<UIViewControllerAnimatedTransitioning>
@property (nonatomic, assign) AnimationType animationType;

@end
