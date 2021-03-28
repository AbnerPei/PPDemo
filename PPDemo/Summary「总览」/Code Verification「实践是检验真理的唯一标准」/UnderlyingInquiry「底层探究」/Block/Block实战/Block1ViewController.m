//
//  Block1ViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/27.
//

#import "Block1ViewController.h"
#import "Block2ViewController.h"

@interface Block1ViewController ()
@property (nonatomic, strong) Block2ViewController *b2vc;
@end

@implementation Block1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    Block2ViewController *block2VC = [[Block2ViewController alloc] init];
    self.b2vc = block2VC;
    
    __weak typeof(self) weakSelf = self;
    block2VC.didChangedTitleBlock = ^(NSString * _Nonnull title) {
        weakSelf.title = title;
    };
    [self.navigationController pushViewController:block2VC animated:YES];
}

#pragma mark --- 回循环引用，导致1和2的dealloc都不走
//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    Block2ViewController *block2VC = [[Block2ViewController alloc] init];
//    self.b2vc = block2VC;
//    block2VC.didChangedTitleBlock = ^(NSString * _Nonnull title) {
//        self.title = title;
//    };
//    [self.navigationController pushViewController:block2VC animated:YES];
//}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end
