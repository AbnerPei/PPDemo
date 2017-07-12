//
//  PPFaceBookBaswViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/11.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPFaceBookBaswViewController.h"

@interface PPFaceBookBaswViewController ()

@end

@implementation PPFaceBookBaswViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupArrs];
    
    
}
-(void)setupArrs
{
    self.titles = [@[
                     @"Shimmering",
                     @""
                     ] mutableCopy];
    
    self.vcs = [@[
                  @"PPFBShimmeringDemoViewController",
                  @""
                  ] mutableCopy];
    
}
@end
