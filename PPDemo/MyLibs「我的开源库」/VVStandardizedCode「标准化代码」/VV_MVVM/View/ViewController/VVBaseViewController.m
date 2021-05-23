//
//  VVBaseViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/5/18.
//

#import "VVBaseViewController.h"

@interface VVBaseViewController ()

@end

@implementation VVBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)setupIfSubviewsNeed
{
    if ([self respondsToSelector:@selector(vv_setupUI)]) {
        [self vv_setupUI];
    }
    
    if ([self respondsToSelector:@selector(vv_setupConstraints)]) {
        [self vv_setupConstraints];
    }
    
    if ([self respondsToSelector:@selector(vv_addObservers)]) {
        [self vv_addObservers];
    }
}

// !!!: private methods
- (void)vv_setupUI
{
    
}

- (void)vv_setupConstraints
{
    
}

- (void)vv_addObservers
{
    
}
@end
