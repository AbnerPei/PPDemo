//
//  PresentPushViewController.m
//  PPDemos
//
//  Created by Abner on 16/8/9.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PresentPushViewController.h"
#import "PP1ViewController.h"
@interface PresentPushViewController ()

@end

@implementation PresentPushViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self creatNeededBT:CGRectMake(20, 80, 140, 40) title:@"1present2present3" tag:101];
    
}

-(void)creatNeededBT:(CGRect)btFrame title:(NSString *)title tag:(NSInteger)tag
{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeCustom];
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
    PP1ViewController *pp1 = [[PP1ViewController alloc]init];
    [self presentViewController:pp1 animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
