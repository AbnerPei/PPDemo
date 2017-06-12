//
//  MyPresentationConytollrt.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/18.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "MyPresentationConytollrt.h"

@interface MyPresentationConytollrt ()

@end

@implementation MyPresentationConytollrt

- (instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
    if ((self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController])) {
        _dimmingView = [[UIView alloc] init];
        _dimmingView.backgroundColor = [UIColor clearColor];
        _dimmingView.alpha = 0;
        UITapGestureRecognizer *hidssTouch = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hidssViewTouch)];
        [_dimmingView addGestureRecognizer:hidssTouch];
    }
    return self;
}

//点击透明部分视图消失时间
-(void)hidssViewTouch{
    if (self.hidssView) {
        self.hidssView();
    }
}

//页面进入的时候调用
- (void)presentationTransitionWillBegin
{
    _dimmingView.frame = self.containerView.bounds;
    [self.containerView addSubview:_dimmingView];
    [self.containerView addSubview:self.presentedView];
    
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        _dimmingView.alpha = 1;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

//页面消失的时候调用
- (void)presentationTransitionDidEnd:(BOOL)completed
{
    if (!completed) {
        [_dimmingView removeFromSuperview];
    }
}

- (void)dismissalTransitionWillBegin
{
    id<UIViewControllerTransitionCoordinator> coordinator = self.presentingViewController.transitionCoordinator;
    [coordinator animateAlongsideTransition:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        _dimmingView.alpha = 0.0;
    } completion:^(id<UIViewControllerTransitionCoordinatorContext>  _Nonnull context) {
        
    }];
}

- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed) {
        [_dimmingView removeFromSuperview];
    }
}

//改变页面的frame
- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect frame = self.containerView.bounds;
    frame.origin.x = CGRectGetWidth([UIScreen mainScreen].bounds);
    frame = CGRectInset(frame, 0, 0);
    return frame;
}


@end
