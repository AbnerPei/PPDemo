//
//  AnimationShowViewController.m
//  PPDemos
//
//  Created by Abner on 16/7/29.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "AnimationShowViewController.h"

@interface AnimationShowViewController ()

@end

@implementation AnimationShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    SEL sel = NSSelectorFromString(self.selName);

//    [self performSelector:sel withObject:nil];
    
    [self shadowAndBorder];
}
-(void)shadowAndBorder
{
    UIView *viewSample = [[UIView alloc] init];
    [self.view addSubview:viewSample];
    
    viewSample.backgroundColor = [UIColor greenColor];
    viewSample.frame = CGRectMake(100, 100, 100, 100);
    
    
    //Test 1 阴影
    //viewSample.layer.shadowPath = [UIBezierPath bezierPathWithRect:viewSample.bounds].CGPath;
    viewSample.layer.shadowPath = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 100, 100)].CGPath;
    viewSample.layer.masksToBounds = NO;
    viewSample.layer.shadowOffset = CGSizeMake(10, 10);
    viewSample.layer.shadowRadius = 5;
    viewSample.layer.shadowOpacity = 0.5;
    
    //Test 2 边框
    viewSample.layer.borderWidth = 2;
    viewSample.layer.borderColor = [[UIColor redColor] CGColor];
}
- (void)transformAnimation
{
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画, 调整哪个属性来执行动画
    anim.keyPath = @"transform.rotation";//转圈
    //    anim.keyPath = @"transform.scale.x";//平铺扩充
    //    anim.keyPath = @"transform.translation.y";//平移
#warning 以下两个效果一样，都是包装成对象类型
    anim.toValue = @(100);
    
    // anim.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    anim.duration = 2.0;
    
    
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新的状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.view.layer addAnimation:anim forKey:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
