//
//  PPFourthViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/24.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPFourthViewController.h"
#import "PPButton.h"
#import "RegistViewController.h"

@interface PPFourthViewController ()

@end

@implementation PPFourthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   
    

    PPButton * bt = [[PPButton alloc]initWithFrame:CGRectMake(100, 240, 100, 100)];
    bt.bgColor = [UIColor redColor];
    [self.view addSubview:bt];
    NSString *titleStr = NSLocalizedString(@"text", nil);
    [bt setTitle:titleStr forState:UIControlStateNormal];
    [bt setTitle:@"88888888" forState:UIControlStateHighlighted];
    
    bt.highlightedAlpha = 0.4;
//    bt.enabled = NO;
    

    [bt addTarget:self action:@selector(showRegist:) forControlEvents:UIControlEventTouchUpInside];
    
    
}

- (void)showRegist:(id)sender {
    
    NSLog(@"sender = %@", sender);
    RegistViewController *registVC = [[RegistViewController alloc]init];
//    registVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    registVC.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:registVC animated:YES completion:nil];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
