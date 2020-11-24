//
//  GCD_SemaphoreViewController.m
//  PPDemo
//
//  Created by PPAbner on 2020/11/24.
//

#import "GCD_SemaphoreViewController.h"

@interface GCD_SemaphoreViewController ()

@end

@implementation GCD_SemaphoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setMaxCount:3];
}


- (void)demo
{
//    dispatch_queue_t queue = dispatch_queue_create("com.ppabner.gcd.semaphore", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
}

- (void)setMaxCount:(NSInteger)maxCount
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(maxCount);
    for (int i = 0; i < 30; i++) {
        dispatch_async(queue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            sleep(4);
            NSLog(@"i is %d, %@",i,[NSThread currentThread]);
            dispatch_semaphore_signal(semaphore);
        });
    }

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%s",__func__);
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
    
    /**
     2020-11-24 13:41:21.373788+0800 PPDemo[16300:411010] i is 1, <NSThread: 0x600002961900>{number = 7, name = (null)}
     2020-11-24 13:41:21.373790+0800 PPDemo[16300:411007] i is 0, <NSThread: 0x600002968ec0>{number = 6, name = (null)}
     2020-11-24 13:41:21.373787+0800 PPDemo[16300:411006] i is 2, <NSThread: 0x600002991a80>{number = 8, name = (null)}
     2020-11-24 13:41:21.959610+0800 PPDemo[16300:410885] -[GCD_SemaphoreViewController touchesBegan:withEvent:]
     2020-11-24 13:41:23.026070+0800 PPDemo[16300:410885] -[GCD_SemaphoreViewController touchesBegan:withEvent:]
     2020-11-24 13:41:25.376540+0800 PPDemo[16300:410989] i is 3, <NSThread: 0x6000029a12c0>{number = 4, name = (null)}
     2020-11-24 13:41:25.376560+0800 PPDemo[16300:411009] i is 4, <NSThread: 0x600002960800>{number = 10, name = (null)}
     2020-11-24 13:41:25.376553+0800 PPDemo[16300:411011] i is 5, <NSThread: 0x600002965180>{number = 9, name = (null)}
     2020-11-24 13:41:29.379477+0800 PPDemo[16300:410991] i is 6, <NSThread: 0x600002990c80>{number = 11, name = (null)}
     2020-11-24 13:41:29.379505+0800 PPDemo[16300:410994] i is 8, <NSThread: 0x600002981180>{number = 12, name = (null)}
     2020-11-24 13:41:29.379477+0800 PPDemo[16300:410992] i is 7, <NSThread: 0x60000298c280>{number = 5, name = (null)}
     2020-11-24 13:41:30.439183+0800 PPDemo[16300:410885] -[GCD_SemaphoreViewController dealloc]
     2020-11-24 13:41:33.385084+0800 PPDemo[16300:410990] i is 9, <NSThread: 0x6000029bc240>{number = 3, name = (null)}
     2020-11-24 13:41:33.385141+0800 PPDemo[16300:411032] i is 11, <NSThread: 0x6000029907c0>{number = 13, name = (null)}
     2020-11-24 13:41:33.385141+0800 PPDemo[16300:411008] i is 10, <NSThread: 0x60000296d700>{number = 14, name = (null)}
     2020-11-24 13:41:37.389403+0800 PPDemo[16300:411033] i is 12, <NSThread: 0x600002991900>{number = 15, name = (null)}
     2020-11-24 13:41:37.389419+0800 PPDemo[16300:411035] i is 14, <NSThread: 0x60000296de00>{number = 17, name = (null)}
     2020-11-24 13:41:37.389417+0800 PPDemo[16300:411034] i is 13, <NSThread: 0x600002960cc0>{number = 16, name = (null)}
     2020-11-24 13:41:41.390021+0800 PPDemo[16300:411038] i is 17, <NSThread: 0x6000029688c0>{number = 18, name = (null)}
     2020-11-24 13:41:41.390052+0800 PPDemo[16300:411036] i is 15, <NSThread: 0x6000029907c0>{number = 19, name = (null)}
     2020-11-24 13:41:41.390053+0800 PPDemo[16300:411037] i is 16, <NSThread: 0x60000296d700>{number = 20, name = (null)}
     2020-11-24 13:41:45.391584+0800 PPDemo[16300:411039] i is 18, <NSThread: 0x60000296de00>{number = 23, name = (null)}
     2020-11-24 13:41:45.391584+0800 PPDemo[16300:411041] i is 20, <NSThread: 0x60000298c000>{number = 21, name = (null)}
     2020-11-24 13:41:45.391582+0800 PPDemo[16300:411040] i is 19, <NSThread: 0x600002964440>{number = 22, name = (null)}
     2020-11-24 13:41:49.397056+0800 PPDemo[16300:411042] i is 21, <NSThread: 0x600002968040>{number = 24, name = (null)}
     2020-11-24 13:41:49.397084+0800 PPDemo[16300:411044] i is 23, <NSThread: 0x600002991640>{number = 25, name = (null)}
     2020-11-24 13:41:49.397090+0800 PPDemo[16300:411043] i is 22, <NSThread: 0x60000299ef80>{number = 26, name = (null)}
     2020-11-24 13:42:08.298109+0800 PPDemo[16300:411046] i is 25, <NSThread: 0x6000029e9740>{number = 28, name = (null)}
     2020-11-24 13:42:08.298109+0800 PPDemo[16300:411047] i is 26, <NSThread: 0x6000029662c0>{number = 29, name = (null)}
     2020-11-24 13:42:08.298121+0800 PPDemo[16300:411045] i is 24, <NSThread: 0x6000029b4100>{number = 27, name = (null)}
     2020-11-24 13:42:12.298414+0800 PPDemo[16300:411048] i is 27, <NSThread: 0x600002994940>{number = 30, name = (null)}
     2020-11-24 13:42:12.298421+0800 PPDemo[16300:411049] i is 28, <NSThread: 0x600002960dc0>{number = 31, name = (null)}
     2020-11-24 13:42:12.298434+0800 PPDemo[16300:411050] i is 29, <NSThread: 0x6000029829c0>{number = 32, name = (null)}
     */
}


@end
