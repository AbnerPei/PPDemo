//
//  AnimationShowViewController.m
//  PPDemos
//
//  Created by Abner on 16/7/29.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "AnimationShowViewController.h"

@interface AnimationShowViewController ()
{
    UIImageView *_imgV;
    int _imgIndex;
    UIImageView *_shakeImgV;
}
/** <#注释#>  */
@property(nonatomic,strong)CALayer *redLayer;
@end

@implementation AnimationShowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.redLayer = [CALayer layer];
    [self.view.layer addSublayer:self.redLayer];
    self.redLayer.backgroundColor = [UIColor redColor].CGColor;
    self.redLayer.bounds = CGRectMake(0, 0, 60, 60);
    self.redLayer.position = CGPointMake(120, 184);
    self.redLayer.anchorPoint = CGPointMake(1, 1);
    
    [self testShake];
    
    
    [self testImgTransform];
}
#pragma mark --- 图片转场
-(void)testImgTransform
{
    UIImageView *imgV = [UIImageView pp_imgVMakeWithSuperV:self.view imgName:@"001"];
    imgV.frame = CGRectMake(30, ScreenHeight-240, 70, 70);
    NSString *imgName = [NSString stringWithFormat:@"00%d",_imgIndex+1];
    imgV.image = [UIImage imageNamed:imgName];
    imgV.layer.backgroundColor = [UIColor whiteColor].CGColor;
    imgV.backgroundColor = [UIColor whiteColor];
    _shakeImgV = imgV;
    
    
    UIButton * bt = [[UIButton alloc]initWithFrame:CGRectMake(140, ScreenHeight-240, 80, 50)];
    bt.backgroundColor = [UIColor redColor];
    [bt setTitle:@"下一张" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    bt.tag = 30;
    
    UIButton * cancelBt = [[UIButton alloc]initWithFrame:CGRectMake(140, ScreenHeight-160, 80, 50)];
    cancelBt.backgroundColor = [UIColor grayColor];
    [cancelBt setTitle:@"上一张" forState:UIControlStateNormal];
    [cancelBt addTarget:self action:@selector(ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBt];
    cancelBt.tag = 40;
    
}
#pragma mark --- 左右摇摆
-(void)testShake
{
    UIImageView *imgV = [UIImageView pp_imgVMakeWithSuperV:self.view imgName:@"001"];
    imgV.frame = CGRectMake(30, ScreenHeight-80, 40, 40);
    _imgV = imgV;
    
    UIButton * bt = [[UIButton alloc]initWithFrame:CGRectMake(100, ScreenHeight-80, 50, 50)];
    bt.backgroundColor = [UIColor redColor];
    [bt setTitle:@"shake" forState:UIControlStateNormal];
    [bt addTarget:self action:@selector(ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt];
    bt.tag = 10;
    
    UIButton * cancelBt = [[UIButton alloc]initWithFrame:CGRectMake(200, ScreenHeight-80, 80, 50)];
    cancelBt.backgroundColor = [UIColor grayColor];
    [cancelBt setTitle:@"cancel" forState:UIControlStateNormal];
    [cancelBt addTarget:self action:@selector(ButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:cancelBt];
    cancelBt.tag = 20;
}

-(void)ButtonClicked:(UIButton *)sender
{
    if (sender.tag == 10) {
        [_imgV.layer addAnimation:[CAAnimation pp_shakeRepeat] forKey:@"shakeAction"];
    }else if(sender.tag == 20) {
        [_imgV.layer removeAnimationForKey:@"shakeAction"];
    }else if (sender.tag == 30){
        _imgIndex++;
        if (_imgIndex == 8) {
            _imgIndex = 0;
        }
        NSString *imgName = [NSString stringWithFormat:@"00%d",_imgIndex+1];
        _shakeImgV.image = [UIImage imageNamed:imgName];
        CATransition *transition = [CATransition animation];
        transition.type = @"suckEffect";
        transition.subtype = kCATransitionFromLeft;
        [_shakeImgV.layer addAnimation:transition forKey:nil];
    }else if (sender.tag == 40){
        _imgIndex--;
        if (_imgIndex == -1) {
            _imgIndex = 7;
        }
        NSString *imgName = [NSString stringWithFormat:@"00%d",_imgIndex+1];
        _shakeImgV.image = [UIImage imageNamed:imgName];
        CATransition *transition = [CATransition animation];
        transition.type = kCATransitionCameraIrisHollowOpen;
        transition.subtype = kCATransitionFromRight;
        [_shakeImgV.layer addAnimation:transition forKey:nil];
    }
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

//    [self testBasicAnimation];
    
//    [self testKeyFrameAnimation];
    
    [self testAnimationGroup];
    
    NSLog(@"%@---%@--%@--%@",kCATransitionFade,kCATransitionMoveIn,kCATransitionPush,kCATransitionReveal);
    
}
-(void)testAnimationGroup
{
    CABasicAnimation *animation1 = [CABasicAnimation animation];
    animation1.keyPath = kCALayerPosition;
    animation1.toValue = [NSValue valueWithCGPoint:CGPointMake(280, 280)];
    
    CABasicAnimation *animation2 = [CABasicAnimation animation];
    animation2.keyPath = TransformScale;
    animation2.toValue = @(0.0);
    
    CABasicAnimation *animation3 = [CABasicAnimation animation];
    animation3.keyPath = TransformRotation;
    animation3.toValue = @(M_PI);
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[animation1,animation2,animation3];
    animationGroup.duration = 3;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeBoth;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.redLayer addAnimation:animationGroup forKey:nil];
    
}

-(void)testKeyFrameAnimation
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = kCALayerPosition;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddArc(path, NULL, 150, 150, 50, 0, M_PI * 2, 1);
    animation.path = path;
    animation.duration = 3;
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.redLayer addAnimation:animation forKey:nil];
}

-(void)testBasicAnimation
{
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(280, 280)];
    animation.keyPath = kCALayerPosition;
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [self.redLayer addAnimation:animation forKey:nil];
}


@end
