//
//  Block2ViewController.m
//  PPDemo
//
//  Created by PPAbner on 2021/3/27.
//

#import "Block2ViewController.h"

@interface Block2ViewController ()
@property (nonatomic, assign) NSInteger count;
@end

@implementation Block2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.cyanColor;
    self.title = @"Blcok2VC";
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.title = [NSString stringWithFormat:@"第%ld标题",(long)self.count];
    self.count += 1;
    if (self.didChangedTitleBlock) {
        self.didChangedTitleBlock(self.title);
    }
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}

@end
