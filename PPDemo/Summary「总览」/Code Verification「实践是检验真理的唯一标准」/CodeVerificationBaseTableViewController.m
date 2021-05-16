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
        @"UnderlyingInquiry「底层探究」",
        @"atomic 修饰的属性是绝对安全的吗？为什么？",
        @"深拷贝和浅拷贝",
        @"layoutSubviews调用时机",
        @"Context Menus",
    ];
}

- (NSArray *)vcs
{
    return @[
        @"UnderlyingInquiryBaseTableViewController",
        @"CV_AtomicViewController",
        @"CV_ObjectCopyingViewController",
        @"CV_layoutSubviewsViewController",
        @"ContextMenusViewController",
    ];
}

@end
