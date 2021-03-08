//
//  CV_AtomicViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/12/20.
//

#import "CV_AtomicViewController.h"

@interface CV_AtomicViewController ()

@property (atomic, assign) NSInteger age;

@end

@implementation CV_AtomicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self test];
}

- (void)test
{
    dispatch_queue_t globalQueue = dispatch_get_global_queue(0, 0);
    dispatch_async(globalQueue, ^{
        for (int i = 0; i < 1000; i++) {
            self.age += 1;
        }
        NSLog(@"self.age = %ld",(long)self.age);
    });
}



@end
