//
//  ModalCustomPresentViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/31.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "ModalCustomPresentViewController.h"
#import "ModalMoveTransitionAnimation.h"
#import "ModalInterActiveTransitionAnimation.h"
#import "ModalViewController.h"
#import "ModalTransitionAnimation.h"
@interface ModalCustomPresentViewController ()<ModalViewControllerDelegate,UIViewControllerTransitioningDelegate>
@property(nonatomic,strong)ModalTransitionAnimation *animation;
@property(nonatomic,strong)ModalInterActiveTransitionAnimation *interActive;
@property(nonatomic,strong)ModalMoveTransitionAnimation *interActiveAnimation;
@end

@implementation ModalCustomPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _animation = [[ModalTransitionAnimation alloc] init];
    _interActive = [[ModalInterActiveTransitionAnimation alloc] init];
    _interActiveAnimation = [[ModalMoveTransitionAnimation alloc] init];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"push" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setFrame:CGRectMake(0, 0, 130, 200)];
    [self.view addSubview:button];
}


-(void)pushViewController {
    ModalViewController *controller = [[ModalViewController alloc] init];
    controller.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    controller.delegate = self;
    controller.transitioningDelegate = self;
    [_interActive wireToViewController:controller];
    
    
    [self presentViewController:controller animated:YES completion:nil];
    
}

-(void)dismissViewController:(ModalViewController *)mcv {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return _animation;
}

- (id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return self.interActive.interacting ? _interActiveAnimation : _animation;
    
}

- (id <UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id <UIViewControllerAnimatedTransitioning>)animator {
    return self.interActive.interacting ? self.interActive : nil;
}

@end
