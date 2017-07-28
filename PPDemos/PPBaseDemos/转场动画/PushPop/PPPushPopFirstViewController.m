//
//  PPPushPopFirstViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPPushPopFirstViewController.h"
#import "PPPushPopAnimationManager.h"
#import "PPPushPopSecondViewController.h"
#import "PPPresentDismissViewController.h"
#import "PPPresentDIsmissAnimationManager.h"

@interface PPPushPopFirstViewController ()<UINavigationControllerDelegate,UIViewControllerTransitioningDelegate>
{
    PPPushPopAnimationManager *customPush;
    PPPushPopAnimationManager *customPop;
    PPPresentDIsmissAnimationManager *customPresent;
}
@end

@implementation PPPushPopFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.delegate = self;
    
    customPush = [PPPushPopAnimationManager managerWithIsPush:YES];
    customPop = [PPPushPopAnimationManager managerWithIsPush:NO];
    customPresent = [[PPPresentDIsmissAnimationManager alloc]init];
    
    self.view.backgroundColor = [UIColor pp_cyanColor];
    
    
    UIButton * bt = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    bt.backgroundColor = [UIColor redColor];
    [bt addTarget:self action:@selector(ButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    
    
    // Present
    
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    presentButton.frame = CGRectMake(110, 400, 100, 40);
    
    [presentButton setTitle:@"Present" forState:UIControlStateNormal];
    
    [presentButton addTarget:self action:@selector(present) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:presentButton];
}

-(void)present
{
    PPPresentDismissViewController *presentVC = [[PPPresentDismissViewController alloc]init];
    presentVC.transitioningDelegate = self;
    [self presentViewController:presentVC animated:YES completion:nil];
}
- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    customPresent.animationType = AnimationTypePresent;
    
    return customPresent;
}

- (nullable id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    customPresent.animationType = AnimationTypePresent;
    
    return customPresent;
}

-(void)ButtonClicked
{
    PPPushPopSecondViewController *secVc = [[PPPushPopSecondViewController alloc]init];
    [self.navigationController pushViewController:secVc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 动画特效
- (id<UIViewControllerAnimatedTransitioning>) navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC

{
    
    /**
     
     *  typedef NS_ENUM(NSInteger, UINavigationControllerOperation) {
     
     *     UINavigationControllerOperationNone,
     
     *     UINavigationControllerOperationPush,
     
     *     UINavigationControllerOperationPop,
     
     *  };
     
     */
    
    if (operation == UINavigationControllerOperationPush) {
        
        return customPush;
        
    }else if (operation == UINavigationControllerOperationPop) {
        
        return customPop;
        
    }else{
        
        return nil;
        
    }
    
}


@end
