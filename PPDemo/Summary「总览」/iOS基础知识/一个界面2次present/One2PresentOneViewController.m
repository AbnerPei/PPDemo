//
//  One2PresentOneViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/10.
//

#import "One2PresentOneViewController.h"
#import "One2PresentFirstViewController.h"
#import "One2PresentSecondViewController.h"

@interface One2PresentOneViewController ()
@property (nonatomic, strong)One2PresentFirstViewController *firstVC;
@property (nonatomic, strong)One2PresentSecondViewController *secondVC;
@property (nonatomic, assign)BOOL hasHiddenFirst;

@end

@implementation One2PresentOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.hasHiddenFirst) {
        [self presentViewController:self.secondVC animated:YES completion:^{
            NSLog(@"2present完成");
        }];
    }
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    __weak typeof(self) weakSelf = self;
    self.firstVC.block = ^{
//        weakSelf.hasHiddenFirst = YES;
        [weakSelf presentViewController:weakSelf.secondVC animated:YES completion:^{
            NSLog(@"2present完成");
        }];
    };
    
    [self presentViewController:self.firstVC animated:YES completion:^{
        NSLog(@"1present完成");
    }];
    
    [self presentViewController:self.secondVC animated:YES completion:^{
        NSLog(@"2present完成");
    }];
}



- (One2PresentFirstViewController *)firstVC
{
    if (!_firstVC) {
        _firstVC = [[One2PresentFirstViewController alloc] init];
        _firstVC.view.backgroundColor = UIColor.purpleColor;
    }
    return _firstVC;
}

- (One2PresentSecondViewController *)secondVC
{
    if (!_secondVC) {
        _secondVC = [[One2PresentSecondViewController alloc] init];
        _secondVC.view.backgroundColor = UIColor.yellowColor;
    }
    return _secondVC;
}


@end
