//
//  PPHomeViewController.m
//  PPDemos
//
//  Created by Abner on 16/6/14.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PPHomeViewController.h"
#import "PPLabel.h"
@interface PPHomeViewController ()

@end

@implementation PPHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupArrs];
}
-(void)setupArrs
{
    self.titles = [@[
                 @"MJRefrsh使用Demos",
                 @"MJExtension使用Demos",
//                 @"Masonry使用Demos",
                 @"label垂直位置（居上，居中，居下）",
                 @"JavaScriptCore使用",
//                 @"长按图片保存到本地",
                 ] mutableCopy];
    
    self.vcs = [@[
              @"MJBaseViewController",
              @"MJExtensionBaseViewController",
              @"PPLabelViewController",
              @"JSViewController",
//              @"TwoMoreViewController",
//              @"LongPressToSaveViewController",
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
