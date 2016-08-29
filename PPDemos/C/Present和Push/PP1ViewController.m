//
//  PP1ViewController.m
//  PPDemos
//
//  Created by Abner on 16/8/9.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PP1ViewController.h"
#import "PP2ViewController.h"
@interface PP1ViewController ()

@end

@implementation PP1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNeededBT:CGRectMake(20, 80, ScreenWidth-40, 40) title:@"[1]1present2present3" tag:101];
    [self creatNeededBT:CGRectMake(20, 160, ScreenWidth-40, 40) title:@"[1]1present2push3" tag:102];
    [self creatNeededBT:CGRectMake(20, 240, ScreenWidth-40, 40) title:@"[1]1push2present3" tag:103];
    [self creatNeededBT:CGRectMake(20, 320, ScreenWidth-40, 40) title:@"[1]1push2push3" tag:104];
    

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
            [self twoPresent];
            break;
            
        case 102:
            [self presentPush];
            break;
            
        case 103:
            [self pushPresent];
            break;
            
        case 104:
            [self twoPush];
            break;
            
        default:
            break;
    }
}
-(void)twoPresent
{
    /*
     [PP1 presentViewController:PP2 animated: YES];
     [PP2 presentViewController:PP3 animated: YES];
     PP3--(直接)-->PP1
     */
    PP2ViewController *pp2 = [[PP2ViewController alloc]init];
    [self presentViewController:pp2 animated:YES completion:nil];
}
-(void)presentPush
{
    
}
-(void)pushPresent
{
    
}
-(void)twoPush
{
    
}
@end
