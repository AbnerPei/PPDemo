//
//  PerformSelectorViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/27.
//

#import "PerformSelectorViewController.h"

@interface PerformSelectorViewController ()

@end

@implementation PerformSelectorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self performSelector:@selector(sayHello)];
}

- (void)sayHello
{
    NSLog(@"%s",__func__);
}

@end
