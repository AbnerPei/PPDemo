//
//  PPPushPopAnimationManager.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPPushPopAnimationManager.h"
@interface PPPushPopAnimationManager ()
/** 是否是push */
@property(nonatomic,assign)BOOL isPush;
@end

@implementation PPPushPopAnimationManager

+(instancetype)managerWithIsPush:(BOOL)isPush
{
    PPPushPopAnimationManager *manager = [[PPPushPopAnimationManager alloc]init];
    manager.isPush = isPush;
    return manager;
}



- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext
{
    return _isPush ? 0.7:0.5;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext

{
    //目的ViewController
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //起始ViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    //添加toView到上下文
    [transitionContext.containerView insertSubview:toViewController.view belowSubview:fromViewController.view];
 
    
    if (_isPush) {
        //自定义动画
        toViewController.view.transform = CGAffineTransformMakeTranslation(ScreenWidth, ScreenHeight);
        
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
            fromViewController.view.transform = CGAffineTransformMakeTranslation(-ScreenWidth, -ScreenHeight);
            
            toViewController.view.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            fromViewController.view.transform = CGAffineTransformIdentity;
            
            // 声明过渡结束时调用 completeTransition: 这个方法
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
    }else{
        [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
            
            fromViewController.view.transform = CGAffineTransformMakeTranslation(0, 568);
            
            toViewController.view.transform = CGAffineTransformIdentity;
            
        } completion:^(BOOL finished) {
            
            fromViewController.view.transform = CGAffineTransformIdentity;
            
            // 声明过渡结束时调用 completeTransition: 这个方法
            
            [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            
        }];
    }
    
}
@end
