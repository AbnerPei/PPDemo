//
//  GCD由浅入深笔记.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/2/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef GCD_______h
#define GCD_______h

//    //GCD由浅入深学习
//    //http://www.henishuo.com/gcd-multiple-thread-learn/
//    /*
//     *
//     * The global concurrent queues may still be identified by their priority,
//     * which map to the following QOS classes:
//     *  - DISPATCH_QUEUE_PRIORITY_HIGH:         QOS_CLASS_USER_INITIATED
//     *  - DISPATCH_QUEUE_PRIORITY_DEFAULT:      QOS_CLASS_DEFAULT
//     *  - DISPATCH_QUEUE_PRIORITY_LOW:          QOS_CLASS_UTILITY
//     *  - DISPATCH_QUEUE_PRIORITY_BACKGROUND:   QOS_CLASS_BACKGROUND
//     *
//     */
//    //1.获取全局并发调度队列
//    dispatch_queue_t pp_globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    //第一个参数为优先级，就是上面提供的这四种。第二个参数没有使用到，这个参数是预留的，使用0即可，看官方说明：
//
//    //2.创建串行调度队列
//    //当任务需要按特定的顺序执行时,就需要使用串行调度队列（Dispatch Queue）,串行调度队列每次只能执行一个任务。
//    dispatch_queue_t pp_serialQueue = dispatch_queue_create("com.baidu.project", NULL);
//
//    //3.3.获取公共队列
//    /*
//     应用提供了几下几种获取公共队列的方法：
//
//     dispatch_get_current_queue：在iOS 6.0之后已经废弃，用于获取当前正在执行任务的队列，主要用于调试
//     dispatch_get_main_queue： 最常用的，用于获取应用主线程关联的串行调度队列
//     dispatch_get_global_queue：最常用的，用于获取应用全局共享的并发队列
//     对于后面这两个分别获取主线程的串行队列和获取应用全局共享的并发队列是非常常用的，当我们需要开一个线程并发地异步执行任务时，我们就会放到全局队列中。当我们在异步执行完成时，通常需要回到主线程更新UI显示。
//
//     */
//
//    //4.调度队列（Dispatch Queue）的内存管理
//
//    /*
//     调度队列，即Dispatch Queue与其它类型的dispatch对象是引用计数的数据类型。当创建一个串行dispatch queue时,初始引用计数为1,我们可用dispatch_retain和dispatch_release函数来增加和减少引用计数。当引用计数为0时,系统会异步地销毁这个queue。
//
//     以上是对于普通创建的调度队列有用，但对于系统本身提供的全局并发队列和主线程串行队列则不需要我们手动内管其内存，系统会自动管理。
//
//     在使用全局并发队列时，我们只通过dispatch_get_global_queue方法来获取即可，我们不需要管理其引用。 在使用主线程串行队列时，我们只通过dispatch_get_main_queue方法来获取即可，我们也不需要管理其内存问题。
//
//     */
//
//    //5.添加任务到调度队列
//    /*
//     要想让调度队列执行任务，那么我们就需要将任务添加到适当的调度队列中。在实际iOS开发中，我们通常配合block的使用，将任务封装到一个block中。
//
//     我们可以异步或者同步添加任务到队列中，但是我们应该尽可能地使用dispatch_async或dispatch_async_f。前者是提交一个block任务到队列中，后者是提供一个函数任务到队列中。基本上都是直接使用dispatch_async提交一个block到队列中，这代码写起来更加地简洁。
//
//     当然，我们也可以同步添加任务。有时候我们可能希望同步地调度任务,以避免竞争条件或其它同步错误。使用dispatch_sync或dispatch_sync_f函数同步地添加任务到Queue,这两个函数会阻塞当前调用线程,直到相应任务完成执行。在实际开发中，当需要同步执行任务时，大多是直接使用dispatch_sync这个提交block任务的方法，使用起来更简洁。
//
//     注意：当队列中有任务正在同步执行时，我们不能使用dispatch_sync或dispatch_sync_f同步调度新任务到当前正在执行的queue中。对于串行queue肯定会导致死锁，而对于并发queue也应该避免这么使用。原来我接手的项目中，有一个同步任务正在执行数据库操作，可是当我也需要操作数据时，调用其所提供的api，使用dispatch_sync将我的任务添加到队列中，结果导致了死锁，每次都crash。
//
//     为什么尽可能地添加异步执行的任务呢？因此同步任务会阻塞主线程，很可能导致事件响应不了。
//
//     */
//
//    //5.1 我们看看如何简单地创建队列、异步、同步任务添加到队列：
//    dispatch_queue_t pp_aQueue = dispatch_queue_create("com.baidu.helloWorld", NULL);
//    dispatch_async(pp_aQueue, ^{
//        NSLog(@"异步队列,%@",[NSThread currentThread]);
//    });
//    dispatch_sync(pp_aQueue, ^{
//        NSLog(@"同步队列,%@",[NSThread currentThread]);
//    });
//
//    //MRC下才起作用,ARC下不能添加
//    //dispatch_release(pp_aQueue);
//
//    //由于这个串行调度队列是我们自己创建的，我们需要管理其内存。不过在实际开发中，使用自己创建创建的方式是比较少见的，通常都是直接使用系统为每个应用提供的全局共享并发队列异步执行任务，然后使用主线程串行队列更新界面。
//
//    //6.控制并发数
//    //太多并发是会带来很多的风险的。在实际开发中，并不是并发数越多就越好，往往是需要控制其并发数量的。比如，在处理网络请求并发数时，通常会设置限制最大并发数为4左右。当并发数量大了，开销也会很大。学过操作系统应该清楚，并发量大了，临界资源访问操作就很难控制，控制不好就会导致死锁等。当我们需要执行循环异步处理任务时，可以考虑使用dispatch_apply来替代。请看下一节！
//
//    //7. 并发地循环迭代任务
//    //如果迭代执行的任务与其它迭代任务是独立无关的,而且循环迭代执行顺序也无关紧要的话,我们可以调用dispatch_apply或dispatch_apply_f函数来替换循环。前者是提交block任务，后者是提交函数任务到队列中。比如，我们需要上传多张图片，这些图片的上传是互不干扰的，迭代执行的顺序是不重要的，那么我们就可以使用dispatch_apply来替换掉for循环。
//
//    //下面代码使用dispatch_apply替换了for循环,所传递的block必须包含一个size_t类型的参数,用来标识当前循环迭代。第一次迭代这个参数值为0,最后一次值为count - 1：
//    dispatch_queue_t pp_gQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    size_t pp_gCount = 10;
//    dispatch_apply(pp_gCount, pp_gQueue, ^(size_t i) {
//        [self uploadImageWithIndex:(NSInteger)(i)];
//    });
//
//    //注意：dispatch_apply或dispatch_apply_f函数也是在所有迭代完成之后才会返回，因此这两个函数会阻塞当前线程。当我们在主线程中使用时，一定要小心，很容易造成事件无法响应，所以如果循环代码需要一定的时间执行,可考虑在另一个线程中调用这两个函数。如果所传递的参数是串行queue，而且正是执行当前代码的queue,就会产生死锁。
//

//    //8. 主线程中执行任务
//    _cartoonImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 80, 280, 360)];
//    _cartoonImageView.backgroundColor = [UIColor redColor];
//    [self.view addSubview:_cartoonImageView];
//
//    //看看下面很常用的异步下载图片的代码：
//    dispatch_queue_t pp_gQueue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(pp_gQueue2, ^{
//        NSURL *url = [NSURL URLWithString:@"http://pic1.win4000.com/pic/5/a1/be6d763262.jpg"];
//        UIImage *pp_image = [UIImage imageWithData:[NSData dataWithContentsOfURL:url]];
//        NSLog(@"22222");
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"7777");
//            _cartoonImageView.image = pp_image;
//        });
//    });
//
//    //这里先将异步下载图片的任务放到dispatch_get_global_queue全局共享并发队列中执行，在完成以后，需要放在dispatch_get_main_queue回到主线程更新UI。
//
//    //9.暂停和继续queue
//    //我们可以使用·dispatch_suspend·函数暂停一个queue以阻止它执行block对象;使用dispatch_resume函数继续dispatch queue。调用dispatch_suspend会增加queue的引用计数,调用dispatch_resume则减少queue的引用计数。当引用计数大于0时,queue就保持挂起状态。因此你必须对应地调用dispatch_suspend和dispatch_resume函数。挂起和继续是异步的,而且只在执行block之间生效，挂起一个queue不会导致正在执行的block停止。
//
//    dispatch_suspend(pp_gQueue2);
//    dispatch_resume(pp_gQueue2);
//
//    //注意：dispatch_suspend和dispatch_resume是成对出现的。

//10.调度组（Dispatch Group）的使用
//当我们需要下载多张图片并且图片要求这几张图片都下载完成以后才能更新UI，那么这种情况下，我们就需要使用dispatch_group_t来完成了。对于调度组，所添加的任务可以是同步的，也可以是异步的，在最近任务全部完成后都会有回调。
//10.1首先，我们通过dispatch_group_create创建一个组，然后通过dispatch_group_async将任务分别添加到该组中。当组中的所有任务都完成以后，我们可以通过dispatch_group_notify得到回调，然后在主线程更新UI。
//代码写法像下面这样：
UIImageView *pp_imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(10, 80, PPMT_SCREENWIDTH-20, 200)];
CGFloat pp_y = CGRectGetMaxY(pp_imageView1.frame)+20;
UIImageView *pp_imageView2 = [[UIImageView alloc]initWithFrame:CGRectMake(10, pp_y, PPMT_SCREENWIDTH-20, 200)];
[self.view addSubview:pp_imageView1];
[self.view addSubview:pp_imageView2];

dispatch_queue_t pp_gQueue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

//异步下载图片
dispatch_async(pp_gQueue3, ^{
    //创建一个组
    dispatch_group_t pp_group = dispatch_group_create();
    __block UIImage *pp_image1 = nil;
    __block UIImage *pp_image2 = nil;
    //分别将任务添加到组中
    dispatch_group_async(pp_group, pp_gQueue3, ^{
        pp_image1 = [self downloadImageWithURL:@"http://pic1.win4000.com/pic/8/41/c37e763255.jpg"];
    });
    
    dispatch_group_async(pp_group, pp_gQueue3, ^{
        pp_image2 = [self downloadImageWithURL:@"http://pic1.win4000.com/wallpaper/d/56ca6189ec2ea.jpg"];
    });
    // 等待组中的任务执行完毕,回到主线程执行block回调
    dispatch_group_notify(pp_group, dispatch_get_main_queue(), ^{
        PPLog(@"通知---%@",[NSThread currentThread]);
        pp_imageView1.image = pp_image1;
        pp_imageView2.image = pp_image2;
    });
    
    CGFloat pp_time = 4.0f;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(pp_time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"4秒后执行的代码 --- %@",[NSThread currentThread]);
    });
    
});

//11.延迟执行
/*
 我们常见的延迟执行方法有：
 
 方法一：使用NSObject的api，同步执行：
 
 [self performSelector:@selector(myFunction) withObject:nil afterDelay:5.0];
 
 方法二：使用NSTimer定时器，不过这种方法没必要。
 
 方法三：使用dispatch_after方法异步延迟执行：
 
 CGFloat time = 5.0f;
 dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)),
 dispatch_get_main_queue(), ^{
 // time秒后异步执行这里的代码...
 
 });
 */

-(void)uploadImageWithIndex:(NSInteger)imageIndex
{
    NSLog(@"上传索引为%lu的图片", imageIndex);
}

-(UIImage *)downloadImageWithURL:(NSString *)aStr
{
    NSURL *url = [NSURL URLWithString:aStr];
    NSData *aData = [NSData dataWithContentsOfURL:url];
    return [UIImage imageWithData:aData];
}


#endif /* GCD_______h */
