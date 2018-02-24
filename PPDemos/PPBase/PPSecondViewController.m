//
//  PPSecondViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/24.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPSecondViewController.h"

@interface PPSecondViewController ()
{
    UIImageView *_imgV;
    UIView *_line;
}
@end

@implementation PPSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    UIImageView *imgV = [UIImageView pp_imgVMakeWithSuperV:self.view imgName:@"meinv"];
//    imgV.frame = CGRectMake(20, 84, [UIScreen pp_width]-40, [UIScreen pp_height]-150);
//    _imgV = imgV;
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(10, 100, 8, 100)];
    [self.view addSubview:line];
    line.backgroundColor = [UIColor blackColor];
    _line = line;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//当有一个或多个手指触摸事件在当前视图或window窗体中响应
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];    //返回与当前接收者有关的所有的触摸对象
    UITouch *touch = [allTouches anyObject];   //视图中的所有对象
    CGPoint point = [touch locationInView:[touch view]]; //返回触摸点在视图中的当前坐标
    int x = point.x;
    int y = point.y;
    NSLog(@"touch (x, y) is (%d, %d)", x, y);
    
//    UIColor *currentColor = [_imgV.image pp_colorAtPixel:point];
//    _line.backgroundColor = currentColor;
}



@end
