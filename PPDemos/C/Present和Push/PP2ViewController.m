//
//  PP2ViewController.m
//  PPDemos
//
//  Created by Abner on 16/8/9.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PP2ViewController.h"
#import "PP3ViewController.h"
@interface PP2ViewController ()

@end

@implementation PP2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self creatNeededBT:CGRectMake(20, 80, ScreenWidth-40, 40) title:@"[2]（1present）2present3" tag:101];
    [self creatNeededBT:CGRectMake(20, 160, ScreenWidth-40, 40) title:@"[2]（1present）2push3" tag:102];
    
}

-(void)creatNeededBT:(CGRect)btFrame title:(NSString *)title tag:(NSInteger)tag
{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:bt];
    bt.frame = btFrame;
    bt.backgroundColor = [UIColor lightGrayColor];
    [bt setTitle:title forState:UIControlStateNormal];
    [bt setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
    bt.tag = tag;
    [bt addTarget:self action:@selector(btClicked:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)btClicked:(UIButton *)bt
{
    switch (bt.tag) {
        case 101:
            [self present];
            break;
            
        default:
            [self push];
            break;
    }
}
-(void)present
{
    PP3ViewController *pp3 = [[PP3ViewController alloc]init];
    [self presentViewController:pp3 animated:YES completion:nil];
}
-(void)push
{
    
}
@end
