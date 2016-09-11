//
//  iOS API学习【NEW1】.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/9.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef iOS_API___NEW1__h
#define iOS_API___NEW1__h

① UIRefreshControl

② NSTimer

 ● 2.1 创建方法
          NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(action:) userInfo:nil repeats:NO];
   ● 2.1.1 参数
          TimerInterval : 执行之前等待的时间。比如设置成1.0，就代表1秒后执行方法
          target : 需要执行方法的对象。
          selector : 需要执行的方法
          repeats : 是否需要循环
 ● 2.2 释放方法
          [timer invalidate];
 * 注意 :
        调用创建方法后，target对象的计数器会加1，直到执行完毕，自动减1。如果是循环执行的话，就必须手动关闭，否则可以不执行释放方法。

 ● 2.3 特性
 ● 2.3.1 存在延迟
            不管是一次性的还是周期性的timer的实际触发事件的时间，都会与所加入的RunLoop和RunLoop Mode有关，如果此RunLoop正在执行一个连续性的运算，timer就会被延时出发。重复性的timer遇到这种情况，如果延迟超过了一个周期，则会在延时结束后立刻执行，并按照之前指定的周期继续执行。
 ● 2.3.2 必须加入Runloop
            使用上面的创建方式，会自动把timer加入MainRunloop的NSDefaultRunLoopMode中。如果使用以下方式创建定时器，就必须手动加入Runloop:
            NSTimer *timer = [NSTimer timerWithTimeInterval:5 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
            [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];

###NSTimer相关参考
> 1. [iOS 中几种定时器 - 控制了时间，就控制了一切](http://www.cnblogs.com/huangjianwu/archive/2015/07/30/4690969.html)
2. []()


③ OpenGL 【待学习】
> 1. [iOS开发OpenGL新手入门](http://www.olinone.com/?p=308)

④

⑤
⑥
⑦
⑧
⑨
⑩
#endif /* iOS_API___NEW1__h */
