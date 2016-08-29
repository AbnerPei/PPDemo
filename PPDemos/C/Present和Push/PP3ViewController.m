//
//  PP3ViewController.m
//  PPDemos
//
//  Created by Abner on 16/8/9.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PP3ViewController.h"

@interface PP3ViewController ()

@end

@implementation PP3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    [self creatNeededBT:CGRectMake(20, 80, ScreenWidth-40, 40) title:@"[3]1present2present3返回" tag:101];
    [self creatNeededBT:CGRectMake(20, 160, ScreenWidth-40, 40) title:@"[3]1present2push3返回" tag:102];
}

-(void)creatNeededBT:(CGRect)btFrame title:(NSString *)title tag:(NSInteger)tag
{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:bt];
    bt.frame = btFrame;
    bt.backgroundColor = [UIColor lightGrayColor];
    [bt setTitle:title forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    bt.tag = tag;
    [bt addTarget:self action:@selector(btClicked:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btClicked:(UIButton *)bt
{
    switch (bt.tag) {
        case 101:
            [self twoPresentBack];
            break;
            
        default:
            break;
    }
}
#pragma mark -- 1present2present3返回
-(void)twoPresentBack
{
        UIViewController *vc = self;
        while (vc.presentingViewController) {
            vc = vc.presentingViewController;
        }
        [vc dismissViewControllerAnimated:YES completion:nil];
    
//    NSArray *viewcontrollers=self.navigationController.viewControllers;
//    if (viewcontrollers.count>1) {
//        for (UIViewController *VC in viewcontrollers) {
//            if ([VC isKindOfClass:[SMSViewController class]]) {
//                
//            }else{
//                [VC dismissViewControllerAnimated:YES completion:nil];
//            }
//        }
//    }
}

@end
