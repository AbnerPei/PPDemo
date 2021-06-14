//
//  One2PresentFirstViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/10.
//

#import "One2PresentFirstViewController.h"

@interface One2PresentFirstViewController ()

@end

@implementation One2PresentFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (self.block) {
        self.block();
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"111dismiss");
    }];
}

@end
