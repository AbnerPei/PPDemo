//
//  PPPresentDismissViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/28.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPPresentDismissViewController.h"

@interface PPPresentDismissViewController ()

@end

@implementation PPPresentDismissViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor pp_marronColor];
    
    // Present
    
    UIButton *presentButton = [UIButton buttonWithType:UIButtonTypeSystem];
    
    presentButton.frame = CGRectMake(110, 400, 100, 40);
    
    [presentButton setTitle:@"dismiss" forState:UIControlStateNormal];
    
    [presentButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:presentButton];
}

-(void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
