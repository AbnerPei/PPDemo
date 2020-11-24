//
//  GCD_BarrierViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/24.
//

#import "GCD_BarrierViewController.h"

@interface GCD_BarrierViewController ()

@end

@implementation GCD_BarrierViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self demo];
}

- (void)demo
{
    ///创建一个并发队列
    dispatch_queue_t queue = dispatch_queue_create("com.ppabner.gcd.barrier", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        sleep(2);
        NSLog(@"任务1 %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        sleep(5);
        NSLog(@"任务2 %@",[NSThread currentThread]);
    });
    
    dispatch_barrier_async(queue, ^{
        NSLog(@"任务3 %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        sleep(1);
        NSLog(@"任务4 %@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        sleep(6);
        NSLog(@"任务5 %@",[NSThread currentThread]);
    });
    
    /**
     执行结果：
     ///第①次
     PPDemo[15115:344118] 任务1 <NSThread: 0x600000384800>{number = 7, name = (null)}
     PPDemo[15115:344114] 任务2 <NSThread: 0x600000364e40>{number = 8, name = (null)}
     PPDemo[15115:344118] 任务3 <NSThread: 0x600000384800>{number = 7, name = (null)}
     PPDemo[15115:344118] 任务4 <NSThread: 0x600000384800>{number = 7, name = (null)}
     PPDemo[15115:344114] 任务5 <NSThread: 0x600000364e40>{number = 8, name = (null)}
     
     ///第②次
     PPDemo[15115:344091] 任务1 <NSThread: 0x600000306980>{number = 3, name = (null)}
     PPDemo[15115:345297] 任务2 <NSThread: 0x600000385b00>{number = 10, name = (null)}
     PPDemo[15115:345297] 任务3 <NSThread: 0x600000385b00>{number = 10, name = (null)}
     PPDemo[15115:345297] 任务4 <NSThread: 0x600000385b00>{number = 10, name = (null)}
     PPDemo[15115:344091] 任务5 <NSThread: 0x600000306980>{number = 3, name = (null)}
     */
}

@end
