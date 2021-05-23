//
//  ViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/20.
//

#import "ViewController.h"
#import "PPDemo-Swift.h"
#import <PPMaker/PPMaker.h>
#import "PPMacros.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *okButton;
@property (nonatomic, strong) NSMutableArray<NSString *> *studentNameMArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
//    Person *p = [[Person alloc] init];
//    [p sayHelloWorld];
    
    UITableViewHeaderFooterView *h = nil;
    UICollectionReusableView *c = nil;
    
    [self.tableView addSubview:self.okButton];
    self.okButton.frame = CGRectMake(100, 100, 200, 200);
    self.okButton.backgroundColor = UIColor.redColor;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.okButton removeFromSuperview];
        self.okButton = nil;
    });
    
    [self.studentNameMArray addObject:@"张三"];
    [self.studentNameMArray addObjectsFromArray:@[@"李四",@"王五"]];
    NSLog(@"%@",self.studentNameMArray);
}

- (NSArray *)titles
{
    return @[
        @"Swift",
        @"MyLibs「我的开源库」",
        @"iOS基础知识",
        @"SystemAPI「系统API」",
        @"Special「专题」",
        @"OpenSourceLibs「开源库」",
        @"Code Verification「实践是检验真理的唯一标准」",
        @"Other「其它」"
    ];
}

- (NSArray *)vcs
{
    return @[
        @"SwiftBaseTableViewController",
        @"MyLibsBaseTableViewController",
        @"iOSBasicKnowledgeBaseTableViewController",
        @"SystemAPIBaseTableViewController",
        @"SpecialBaseTableViewController",
        @"OpenSourceLibsBaseTableViewController",
        @"CodeVerificationBaseTableViewController",
        @"OtherBaseTableViewController"
    ];
}



//PPLazy(UIButton, okButton, {
//    [_okButton setTitle:@"AbnerPei:4秒后消失" forState:(UIControlStateNormal)];
//})

PPLazyButton(okButton, {
    [_okButton setTitle:@"AbnerPei:4秒后消失" forState:(UIControlStateNormal)];
})


PPLazyGenArray(NSString, studentNameMArray)

@end
