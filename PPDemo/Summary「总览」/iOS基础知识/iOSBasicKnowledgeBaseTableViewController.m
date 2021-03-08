//
//  iOSBasicKnowledgeBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/12/30.
//

#import "iOSBasicKnowledgeBaseTableViewController.h"

@interface iOSBasicKnowledgeBaseTableViewController ()

@end

@implementation iOSBasicKnowledgeBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
}

- (NSArray *)titles
{
    return @[
        @"点语法和->的区别",
        @"掌握layoutSubviews、setNeedsLayout、layoutIfNeeded",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"PointGrammarAndLineArrowViewController",
        @"LS_SNL_LIN_ViewController",
    ];
}

@end
