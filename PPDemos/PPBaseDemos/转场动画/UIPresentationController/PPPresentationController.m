//
//  PPPresentationController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/1.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPPresentationController.h"
#import "UIView+BlocksKit.h"

@interface PPPresentationController ()<UIViewControllerTransitioningDelegate>
/** 模糊效果  */
@property(nonatomic,strong)UIVisualEffectView *visualEffectView;
@end

@implementation PPPresentationController

-(instancetype)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
   self = [super initWithPresentedViewController:presentedViewController presentingViewController:presentingViewController];
    _presentedViewFrame = CGRectMake(0, ScreenHeight-300, ScreenWidth, 300);
    presentedViewController.transitioningDelegate = self;
    presentedViewController.modalPresentationStyle = UIModalPresentationCustom;
    return self;
}

-(void)setPresentedViewFrame:(CGRect)presentedViewFrame
{
    _presentedViewFrame = presentedViewFrame;
    
}

-(void)present
{
    [self.presentingViewController presentViewController:self.presentedViewController animated:YES completion:nil];
}
#pragma mark - UIViewControllerTransitioningDelegate
// 返回控制控制器弹出动画的对象
/**
 *  参数: presentedViewController     将要跳转到的目标控制器
 presentingViewController    跳转前的原控制器
 */
- (nullable UIPresentationController *)presentationControllerForPresentedViewController:(UIViewController *)presented presentingViewController:(nullable UIViewController *)presenting sourceViewController:(UIViewController *)source
{
    return self;
    
}

//presentationTransitionWillBegin 是在呈现过渡即将开始的时候被调用的。
- (void)presentationTransitionWillBegin
{
    //我们在这个方法中把半透明黑色背景 View 加入到 containerView 中，并且做一个 alpha 从0到1的渐变过渡动画。
    //使用UIVisualEffectView实现模糊效果
    UIBlurEffect *blur  = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.visualEffectView = [[UIVisualEffectView alloc]initWithEffect:blur];
    [self.containerView addSubview:self.visualEffectView];
    
    self.visualEffectView.frame = self.containerView.bounds;
    self.visualEffectView.alpha = 0.2;
    self.visualEffectView.backgroundColor = [UIColor blackColor];
    
    [self.visualEffectView bk_whenTapped:^{
        [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    }];
    
}
//presentationTransitionDidEnd: 是在呈现过渡结束时被调用的，并且该方法提供一个布尔变量来判断过渡效果是否完成。

- (void)presentationTransitionDidEnd:(BOOL)completed
{
    //在我们的例子中，我们可以使用它在过渡效果已结束但没有完成时移除半透明的黑色背景 View。
    // 如果呈现没有完成，那就移除背景 View
    if (!completed) {
        [self.visualEffectView removeFromSuperview];
    }
}
//以上就涵盖了我们的背景 View 的呈现部分，我们现在需要给它添加淡出动画并且在它消失后移除它。
- (void)dismissalTransitionWillBegin
{
    //正如你预料的那样，dismissalTransitionWillBegin 正是我们把它的 alpha 重新设回0的地方。
    self.visualEffectView.alpha = 0;
}
//我们还需要在消失完成后移除背景 View。做法与上面 presentationTransitionDidEnd: 类似，我们重载 dismissalTransitionDidEnd: 方法
- (void)dismissalTransitionDidEnd:(BOOL)completed
{
    if (completed) {
        [self.visualEffectView removeFromSuperview];
    }
}

//还有最后一个方法需要重载。在我们的自定义呈现中，被呈现的 view 并没有完全完全填充整个屏幕，而是很小的一个矩形。被呈现的 view 的过渡动画之后的最终位置，是由 UIPresentationViewController 来负责定义的。我们重载 frameOfPresentedViewInContainerView 方法来定义这个最终位置
- (CGRect)frameOfPresentedViewInContainerView
{
    CGRect frame = self.presentedViewFrame;
    self.presentedView.frame = frame;
    return frame;
}
@end
