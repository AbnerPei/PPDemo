//
//  PPLayerAnimationsViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/30.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPLayerAnimationsViewController.h"

@interface PPLayerAnimationsViewController ()
{
    UIImageView *_imgV;
}
@end

@implementation PPLayerAnimationsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _imgV = [[UIImageView alloc]initWithFrame:CGRectMake(10, 74, 100,80)];
    [self.view addSubview:_imgV];
    _imgV.image = [UIImage imageNamed:@"twogirl"];
    _imgV.backgroundColor = [UIColor purpleColor];
    
}
-(void)testTransiton
{
    //CoreGraphics,图片正向旋转45度
//    _imgV.transform = CGAffineTransformRotate(_imgV.transform, M_PI_4);
    
    //图片沿X轴、Y轴和Z轴，分别移动60、60和40，由于屏幕是2维的，所以Z轴的效果看不出来
//    _imgV.layer.transform = CATransform3DMakeTranslation(60, 60, 40);
    
    //图片沿X轴、Y轴和Z轴，分别放大到1.5、1.5和2倍，由于屏幕是2维的，所以Z轴的效果看不出来
//    _imgV.layer.transform = CATransform3DMakeScale(1.5, 1.5, 0);
    
    //图片绕Y轴，旋转45度
//    _imgV.layer.transform = CATransform3DMakeRotation(pAngleToRadian(45), 0, 1, 0);
    
    //KVC(等价上面的)
//    [_imgV.layer setValue:[NSValue valueWithCATransform3D:CATransform3DMakeRotation(pAngleToRadian(45), 0, 1, 0)] forKey:Transform];
    
    //平易
    [UIView animateWithDuration:0.8 animations:^{
        [_imgV.layer setValue:[NSValue valueWithCGSize:CGSizeMake(200, 200)] forKeyPath:TransformTranslation];
    }];
    
    //forKey 和 forKeyPath的区别
   //forKey 后面是单个key
   //forKeyPath 后面可以是单个key，也可以是比如：@"transform.translation"这样的有路径的字符串
    
    
    // anchorPoint  : 决定layer上的那个点再position上
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self testTransiton];

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
