//
//  PointGrammarAndLineArrowViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/12/30.
//

#import "PointGrammarAndLineArrowViewController.h"
#import "PGLAStudent.h"

@interface PointGrammarAndLineArrowViewController ()

@end

@implementation PointGrammarAndLineArrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    PGLAStudent *stu = [[PGLAStudent alloc] init];
    stu->name = @"ppabner_name";
    stu.nickName = @"ppabner_nickName";
    NSLog(@"name is     %@",stu->name);
    NSLog(@"nickName is %@",stu.nickName);
}

@end
