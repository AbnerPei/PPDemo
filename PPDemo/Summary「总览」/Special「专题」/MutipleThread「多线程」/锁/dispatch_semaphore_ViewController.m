//
//  dispatch_semaphore_ViewController.m
//  PPDemo
//
//  Created by AbnerPei on 2021/3/21.
//

#import "dispatch_semaphore_ViewController.h"

@interface dispatch_semaphore_ViewController ()

@end

@implementation dispatch_semaphore_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test1];
    [self test2];
    [self test21];
    [self test3];
}

- (void)test1
{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block int a = 10;
    dispatch_async(queue, ^{
        a = 100;
        dispatch_semaphore_signal(semaphore);
    });
    
    NSLog(@"no wait , a is %d",a);
    
}

- (void)test2
{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    __block int a = 10;
    dispatch_async(queue, ^{
        a = 100;
        dispatch_semaphore_signal(semaphore);
    });
    
    /**
     * 判断信号值是否大于0。
     * - 大于0，不会阻塞线程，消耗掉一个信号，执行后续任务。
     * - 如果信号值为 0，该线程会和 NSCondition 一样直接进入 waiting 状态，等待其他线程发送信号唤醒线程去执行后续任务，
     * - 或者当 overTime 时限到了，也会执行后续任务。
     */
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    NSLog(@"has wait , a is %d",a);
    
}


- (void)test21
{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    __block int a = 10;
    dispatch_async(queue, ^{
        a = 100;
        dispatch_semaphore_signal(semaphore);
    });
    
    /**
     *
     */
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    
    NSLog(@"21 has wait , a is %d",a);
    
}

///这种，等于没用
- (void)test3
{
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);

    __block int a = 10;
    dispatch_async(queue, ^{
        a = 100;
        dispatch_semaphore_signal(semaphore);
    });
    
    
    NSLog(@"33 has wait , a is %d",a);
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}
@end
