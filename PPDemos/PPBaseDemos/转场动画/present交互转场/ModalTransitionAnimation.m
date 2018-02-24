//
//  ModalTransitionAnimation.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/31.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "ModalTransitionAnimation.h"
#import "ModalViewController.h"

@implementation ModalTransitionAnimation

//动画持续时间，单位是秒
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext {
    return 1;
}

//动画效果
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    //通过键值UITransitionContextToViewControllerKey获取需要呈现的视图控制器toVC
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    //得到toVC完全呈现后的frame
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    
    
    if ([toVC isKindOfClass:[ModalViewController class]]) {
        //需要呈现的视图是模态视图，此时将模态视图的frame放到屏幕空间下方，这样才能实现从下方弹出的效果
        toVC.view.frame = CGRectOffset(finalFrame, 0, [UIScreen mainScreen].bounds.size.height);
    } else {
        //需要呈现的视图是主视图，此时将主视图的frame放在屏幕空间上方，这样才能实现从上方放下的效果
        toVC.view.frame = CGRectOffset(finalFrame, 0, -[UIScreen mainScreen].bounds.size.height);
    }
    
    //切换在containerView中完成，需要将toVC.view加到containerView中
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    
    //开始动画，这里使用了UIKit提供的弹簧效果动画，usingSpringWithDamping越接近1弹性效果越不明显，此API在IOS7之后才能使用
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0
         usingSpringWithDamping:0
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         toVC.view.frame = finalFrame;
                     } completion:^(BOOL finished) {
                         //通知系统动画切换完成
                         [transitionContext completeTransition:YES];
                     }];
}

@end
