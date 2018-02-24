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
    
    UIImageView *_faceImgV;
}
@end

@implementation CGAffineTransformDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *v1 = [[UIView alloc]initWithFrame:CGRectMake(120, 100, 200, 200)];
    [self.view addSubview:v1];
    v1.backgroundColor = [UIColor purpleColor];
    _v1 = v1;
    
    
    UIView *v2 = [[UIView alloc]initWithFrame:CGRectMake(170, 150, 100, 100)];
    [self.view addSubview:v2];
    v2.backgroundColor = [UIColor yellowColor];
    _v2 = v2;
    
    UIImageView *faceImgV = [[UIImageView alloc]initWithFrame:CGRectMake(90, 320, 40, 40)];
    [self.view addSubview:faceImgV];
    faceImgV.image = [UIImage imageNamed:@"020"];
    _faceImgV = faceImgV;

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    
    [UIView animateWithDuration:2.0 animations:^{
//        CGAffineTransform t = CGAffineTransformMakeTranslation(160, 0);
//        _faceImgV.transform = CGAffineTransformTranslate(t, 20, 30);
        
        _v1.transform = CGAffineTransformMake(0.5, 0, 0, 1, 0, 0);


        if (_clicked) {
            _v2.transform = CGAffineTransformIdentity;
            _v1.transform = CGAffineTransformIdentity;
            _faceImgV.transform = CGAffineTransformMakeScale(1, 1);
            
        }else{
            CGAffineTransform t = CGAffineTransformMakeScale(2, 2);
            _faceImgV.transform = CGAffineTransformScale(t, 2, 2);
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
//            _v2.transform = CGAffineTransformMake(0.2, 0, 0, 1, 0, 0);
            
            //根据本身的transform进行缩放
            //
            CGPoint v2CenterPotint0 = _v2.center;
            NSLog(@"_v2转换前的frame %@",NSStringFromCGRect(_v2.frame));
            NSLog(@"_v2转换前的bound %@",NSStringFromCGRect(_v2.bounds));
            NSLog(@"_v2转换前的transform %@",NSStringFromCGAffineTransform(_v2.transform));
            NSLog(@"_v2转换前的center %@",NSStringFromCGPoint(v2CenterPotint0));

            
//            _v2.transform = CGAffineTransformMakeScale(0.5, 0.5);

   

            
            //根据给定的transform进行缩放
//            _v2.transform = CGAffineTransformScale(_v1.transform, 0.5, 0.5);
            _v2.transform = CGAffineTransformTranslate(_v1.transform, 20, 20);
            
            //顺时针旋转90度（此处传的是弧度）
//            _v2.transform = CGAffineTransformMakeRotation(PPAngleToRadian(90));
            
            //???
//            _v2.transform = CGAffineTransformRotate(_v1.transform, PPAngleToRadian(45));
            
            //
//            _v2.transform = CGAffineTransformInvert(_v1.transform);
            
            //得到两个矩阵相加后得到的最终矩阵
//            _v2.transform = CGAffineTransformConcat(_v1.transform, _v2.transform);
            
            NSLog(@"_v2转换【后】的frame %@",NSStringFromCGRect(_v2.frame));
            NSLog(@"_v2转换【后】的bound %@",NSStringFromCGRect(_v2.bounds));
            NSLog(@"_v2转换【后】的transform %@",NSStringFromCGAffineTransform(_v2.transform));
            NSLog(@"_v2转换【后】的center %@",NSStringFromCGPoint(v2CenterPotint0));
            
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
