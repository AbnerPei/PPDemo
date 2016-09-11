//
//  iOS多线程学习1.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/25.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef iOS_____1_h
#define iOS_____1_h

##基础知识
1.iOS多线程方案
   ● 1.1 NSThread
//这套方案是经过苹果封装后的，并且完全面向对象的。所以你可以直接操控线程对象，非常直观和方便。但是，它的生命周期还是需要我们手动管理，所以这套方案也是偶尔用用，比如 [NSThread currentThread]，它可以获取当前线程类，你就可以知道当前线程的各种属性，用于调试十分方便。
   ● 1.2 GCD
//它是苹果为多核的并行运算提出的解决方案，所以会自动合理地利用更多的CPU内核（比如双核、四核），最重要的是它会自动管理线程的生命周期（创建线程、调度任务、销毁线程），完全不需要我们管理，我们只需要告诉干什么就行。同时它使用的也是 c语言，不过由于使用了 Block（Swift里叫做闭包），使得使用起来更加方便，而且灵活。所以基本上大家都使用 GCD 这套方案。
   ● 1.3 NSOperation & NSOperationQueue


2.NSThread
```
// 创建一个线程
//法①
NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:nil];
//法② [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:nil];
//法③ [self performSelectorInBackground:@selector(run:) withObject:nil];
// 启动该线程
[thread start];
```

##参考文章
1. [关于iOS多线程，你看我就够了](http://www.jianshu.com/p/0b0d9b1f1f19)


#endif /* iOS_____1_h */
