//
//  PPCustomKVOViewController.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/22.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPCustomKVOViewController.h"
#import "PPRuntimeAnimal.h"

@interface PPCustomKVOViewController ()
@property(nonatomic,strong) PPRuntimeAnimal *p;
@end

@implementation PPCustomKVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.p = [[PPRuntimeAnimal alloc]init];
    
    [self.p addObserver:self forKeyPath:@"birthday" options:NSKeyValueObservingOptionNew context:nil];
    
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"观察到name变了");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    static int a = 0;
    a++;
    self.p.birthday = [NSString stringWithFormat:@"%d",a];
}

@end
