//
//  PPJiaGouCommonMapViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/12.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPJiaGouCommonMapViewController.h"

@interface PPJiaGouCommonMapViewController ()

@end

@implementation PPJiaGouCommonMapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    id<PPMapViewProtocol> mapView = [PPMapEngine pp_engineGetMapViewWithFrame:self.view.bounds engineType:PPMapEngineTypeGaode];
    [self.view addSubview:[mapView getMapView]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
