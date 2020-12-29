//
//  CodeVerificationBaseTableViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/12/20.
//

#import "CodeVerificationBaseTableViewController.h"

@interface CodeVerificationBaseTableViewController ()

@end

@implementation CodeVerificationBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
}

- (NSArray *)titles
{
    return @[
        @"atomic 修饰的属性是绝对安全的吗？为什么？",
        @"Context Menus",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"CV_AtomicViewController",
        @"ContextMenusViewController",
    ];
}

@end
