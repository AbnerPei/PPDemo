//
//  CGAffineTransformDemoViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/1.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "CGAffineTransformDemoViewController.h"

@interface CGAffineTransformDemoViewController ()
{
    UIView *_v1;
    UIView *_v2;
    BOOL _clicked;
}
@end

@implementation CGAffineTransformDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
    [self.view addSubview:v1];
    v1.backgroundColor = [UIColor purpleColor];
    _v1 = v1;
    
    
    UIView *v2 = [[UIView alloc]initWithFrame:CGRectMake(60, 100, 200, 200)];
    [self.view addSubview:v2];
    v2.backgroundColor = [UIColor yellowColor];
    _v2 = v2;
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _v1.transform = CGAffineTransformMake(0.5, 0, 0, 1, 0, 0);
    [UIView animateWithDuration:2.0 animations:^{
          
        if (_clicked) {
            _v2.transform = CGAffineTransformIdentity;
        }else{
            /*
               基本算法公式：
     矩阵  =   [ a   b   0
                c   d   0
                tx  ty  1  ]
             
             [X Y 1] = [x y 1] * 矩阵
             
             X = ax+cy+tx;
             Y = bx+dy+ty;
             
             */
            
            //左右向中间缩小
            _v2.transform = CGAffineTransformMake(0.2, 0, 0, 1, 0, 0);
            
            //根据本身的transform进行缩放
//            _v2.transform = CGAffineTransformMakeScale(0.5, 0.5);
            
            //根据给定的transform进行缩放
//            _v2.transform = CGAffineTransformScale(_v1.transform, 0.5, 0.5);
            
            //顺时针旋转90度（此处传的是弧度）
//            _v2.transform = CGAffineTransformMakeRotation(pAngleToRadian(90));
            
            //???
//            _v2.transform = CGAffineTransformRotate(_v1.transform, pAngleToRadian(45));
            
            //
//            _v2.transform = CGAffineTransformInvert(_v1.transform);
            
            //得到两个矩阵相加后得到的最终矩阵
//            _v2.transform = CGAffineTransformConcat(_v1.transform, _v2.transform);
            
            //某点通过矩阵变换之后的点
            CGPoint point = CGPointApplyAffineTransform(CGPointMake(100, 100), _v1.transform);
            NSLog(@"point %f---%f",point.x,point.y);
            
            //某个size通过矩阵变换之后的点
            CGSize size = CGSizeApplyAffineTransform(CGSizeMake(100, 100), _v1.transform);
            NSLog(@"size %f---%f",size.width,size.height);
            
            //某个Rect通过矩阵变换之后的区域
            CGRect rect = CGRectApplyAffineTransform(CGRectMake(100, 100, 100, 100), _v1.transform);
            NSLog(@"rect %f--%f--%f--%f",rect.origin.x,rect.origin.y,rect.size.width,rect.size.height);
        }
        
        _clicked = !_clicked;
    }];
    
    
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
