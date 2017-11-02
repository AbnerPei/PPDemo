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
    
   
    

//    PPButton * bt = [[PPButton alloc]initWithFrame:CGRectMake(100, 240, 100, 100)];
//    bt.bgColor = [UIColor redColor];
//    [self.view addSubview:bt];
//    NSString *titleStr = NSLocalizedString(@"text", nil);
//    [bt setTitle:titleStr forState:UIControlStateNormal];
//    [bt setTitle:@"88888888" forState:UIControlStateHighlighted];
//
//    bt.highlightedAlpha = 0.4;
////    bt.enabled = NO;
//
//
//    [bt addTarget:self action:@selector(showRegist:) forControlEvents:UIControlEventTouchUpInside];
    
    
    ppFourView *fourV = [[ppFourView alloc]initWithFrame:CGRectMake(50, 100, 200, 200)];
    [self.view addSubview:fourV];
    
    
}

- (void)showRegist:(id)sender {
    
    NSLog(@"sender = %@", sender);
    RegistViewController *registVC = [[RegistViewController alloc]init];
//    registVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

    registVC.modalPresentationStyle = UIModalPresentationPopover;
    [self presentViewController:registVC animated:YES completion:nil];
}



@end


@implementation ppFourView

- (void)drawRect:(CGRect)rect {
//
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceGray();
//    CGFloat locations[2] = {0.0, 1.0};
//    NSMutableArray *colors = [NSMutableArray arrayWithObject:(id)[[UIColor redColor] CGColor]];
//    [colors addObject:(id)[[UIColor redColor] CGColor]];
//    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
//    CGColorSpaceRelease(colorSpace);  // Release owned Core Foundation object.
//    CGPoint startPoint = CGPointMake(0.0, 0.0);
//    CGPoint endPoint = CGPointMake(CGRectGetMaxX(self.bounds), CGRectGetMaxY(self.bounds));
//    CGContextDrawLinearGradient(ctx, gradient, startPoint, endPoint,
//                                kCGGradientDrawsBeforeStartLocation | kCGGradientDrawsAfterEndLocation);
//    CGGradientRelease(gradient);  // Release owned Core Foundation object.
    
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //创建一个RGB的颜色空间
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    //定义渐变颜色数组
    CGFloat colors[] =
    {
        204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
        29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
        0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
    };
    
    //创建一个渐变的色值 1:颜色空间 2:渐变的色数组 3:位置数组,如果为NULL,则为平均渐变,否则颜色和位置一一对应 4:位置的个数
    CGGradientRef _gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
    CGColorSpaceRelease(rgb);
    
    //获得一个CGRect
    CGRect clip = CGRectInset(CGContextGetClipBoundingBox(ctx), 20.0, 20.0);
    //剪切到合适的大小
    CGContextClipToRect(ctx, clip);
    //定义起始点和终止点
    CGPoint start = CGPointMake(20, 20);
    CGPoint end = CGPointMake(20, 100);
    //绘制渐变, 颜色的0对应start点,颜色的1对应end点,第四个参数是定义渐变是否超越起始点和终止点
    CGContextDrawLinearGradient(ctx, _gradient, start, end, kCGGradientDrawsBeforeStartLocation);
    
    //辐射渐变
    start = CGPointMake(100, 80);//起始点
    end = CGPointMake(100, 140); //终结点
    //辐射渐变 start:起始点 20:起始点的半径 end:终止点 40: 终止点的半径 这个辐射渐变
    CGContextDrawRadialGradient(ctx, _gradient, start, 20, end, 40, 0);  
}

@end
