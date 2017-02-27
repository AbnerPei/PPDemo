//
//  MasonryBaseViewController.m
//  PPDemos
//
//  Created by Abner on 16/8/2.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MasonryBaseViewController.h"

@interface MasonryBaseViewController ()
@property(nonatomic,strong)NSMutableArray *titles;
@property(nonatomic,strong)NSMutableArray *vcs;
@end

@implementation MasonryBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MasonryDemos";
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                     @"单个view相对某个view的约束",
                     @"多个view相互约束",
                     @"批发平台cell",
                     @"至少两个view相互约束",
                     @"长按图片保存到本地",
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"CenterOneViewController",
                  @"MoreViewController",
                  @"WholesaleViewController",
                  @"TwoMoreViewController",
                  @"LongPressToSaveViewController",
                  ] mutableCopy];
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
