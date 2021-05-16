//
//  CABasicAnimationViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/4/23.
//

#import "CABasicAnimationViewController.h"

@interface CABasicAnimationViewController ()
@property (nonatomic, strong) UIView *redView;
@end

@implementation CABasicAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.redView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CABasicAnimation *basicAnimation = [CABasicAnimation animation];
    basicAnimation.keyPath = @"position.y";
    basicAnimation.duration = 1;
    basicAnimation.toValue = @400;
    [self.redView.layer addAnimation:basicAnimation forKey:nil];
}


#pragma mark --- lazy load
- (UIView *)redView
{
    if (!_redView) {
        _redView = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 80, 80)];
        _redView.backgroundColor = UIColor.redColor;
    }
    return _redView;
}
@end
