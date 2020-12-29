//
//  PPMakerBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/20.
//

#import "PPMakerBaseTableViewController.h"

@interface PPMakerBaseTableViewController ()

@end

@implementation PPMakerBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
}

- (NSArray *)titles
{
    return @[
        @"验证PPMaker的block会不会引起循环引用",
        @"SystemAPI「系统API」",
        @"Special「专题」",
        @"OpenSourceLibs「开源库」"
    ];
}

- (NSArray *)vcs
{
    return @[
        @"PPMakerInfiniteLoopVerifyViewController",
        @"SystemAPIBaseTableViewController",
        @"SpecialBaseTableViewController",
        @"OpenSourceLibsBaseTableViewController"
    ];
}

@end
