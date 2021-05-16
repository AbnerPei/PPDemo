//
//  CV_layoutSubviewsViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/28.
//

#import "CV_layoutSubviewsViewController.h"
#import "LSCustomView.h"

@interface CV_layoutSubviewsViewController ()

@property (nonatomic, strong) LSCustomView *customView;

@end

@implementation CV_layoutSubviewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    self.customView = [[LSCustomView alloc] initWithFrame:CGRectMake(100, 120, 200, 200)];
    self.customView = [[LSCustomView alloc] initWithFrame:CGRectZero];
    self.customView.backgroundColor = UIColor.redColor;
//    [self.view addSubview:self.customView];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.customView.frame = CGRectMake(100, 300, 200, 200);
}



@end
