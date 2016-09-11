//
//  iOS开发基础知识2.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/15.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//  适用面试①②③④⑤⑥⑦⑧⑨⑩  【20条/页】2


#ifndef iOS______2_h
#define iOS______2_h

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#目录
1.谈谈你对多线程开发的理解？iOS中有几种实现多线程的方法？
2.简述OC中内存管理机制。与retain配对使用的方法是dealloc还是release，为什么？需要与alloc配对使用的方法是dealloc还是release，为什么？readwrite，readonly，assign，retain，copy，nonatomic 、atomic、strong、weak属性的作用？
3.线程同步和异步的区别？IOS中如何实现多线程的同步？
4.iOS类是否可以多继承？如果没有，那可以用其他方法实现吗？简述实现过程。
5.iOS本地数据存储都有哪几种方式？iOS如何实现复杂对象的存储？
6.RunLoop是什么？
7.SDWebImage加载图片的流程。
8.下面程序输出结果是？

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1.谈谈你对多线程开发的理解？iOS中有几种实现多线程的方法？
   ● 1.1 使用多线程的好处：
       ● 1.1.1 使用线程可以把程序中占据时间长的任务放到后台去处理，如图片、视频的下载
       ● 1.1.2 发挥多核处理器的优势，并发执行让系统运行的更快、更流畅，用户体验更好
   ● 1.2 使用多线程的缺点：
       ● 1.2.1 大量的线程降低代码的可读性
       ● 1.2.2 更多的线程需要更多的内存空间
       ● 1.2.3 当多个线程对同一个资源出现争夺的时候要注意线程安全的问题。

   ● 1.3 iOS有三种多线程编程的技术：
       ● 1.3.1 NSThread(两种创建方式)
         ● 1.3.1.1 [NSThread detachNewThreadSelector:@selector(doSomething:) toTarget:self withObject:nil];
         ● 1.3.1.2 NSThread *myThread = [[NSThread alloc] initWithTarget:self selector:@selector(doSomething:) object:nil];
                   [myThread start];
       ● 1.3.2 NSOperationQueue
              NSOperationQueue *oprationQueue = [[NSOperationQueue alloc] init];
              oprationQueue addOperationWithBlock:^{ //这个block语句块在子线程中执行
              }
       ● 1.3.3 Grand Central Dispatch (GCD)
              dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                   // 耗时的操作
               dispatch_async(dispatch_get_main_queue(), ^{
                   // 更新界面
                    });
              });
#pragma mark --- 【PS】
        `PS` : 不显示的创建线程的方法：用NSObject的类方法 performSelectorInBackground:withObject: 创建一个线程：[Obj performSelectorInBackground:@selector(doSomething) withObject:nil];

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2.简述OC中内存管理机制。与retain配对使用的方法是dealloc还是release，为什么？需要与alloc配对使用的方法是dealloc还是release，为什么？readwrite，readonly，assign，retain，copy，nonatomic 、atomic、strong、weak属性的作用？
   ● 2.1 管理机制：使用了一种叫做引用计数的机制来管理内存中的对象。OC中每个对象都对应着他们自己的引用计数，引用计数可以理解为一个整数计数器，当使用alloc方法创建对象的时候，持有计数会自动设置为1。当你向一个对象发送retain消息 时，持有计数数值会增加1。相反，当你像一个对象发送release消息时，持有计数数值会减小1。当对象的持有计数变为0的时候，对象会释放自己所占用的内存。

   ● 2.2 retain(引用计数加1)->release（引用计数减1）
         alloc（申请内存空间）->dealloc(释放内存空间)
         readwrite: 表示既有getter，也有setter   (默认)
         readonly: 表示只有getter，没有setter
         nonatomic:不考虑线程安全
         atomic:线程操作安全   （默认）

   ● 2.3 retain: release旧的对象，将旧对象的值赋予输入对象，再提高输入对象的索引计数为1
         assign: 简单赋值，不更改索引计数    （默认）
         copy: 其实是建立了一个相同的对象,地址不同（retain：指针拷贝  copy：内容拷贝）
         strong:（ARC下的）和（MRC）retain一样    （默认）
         weak:（ARC下的）和（MRC）assign一样， weak当指向的内存释放掉后自动nil化，防止野指针
         unsafe_unretained 声明一个弱引用，但是不会自动nil化，也就是说，如果所指向的内存区域被释放了，这个指针就是一个野指针了。
         autoreleasing 用来修饰一个函数的参数，这个参数会在函数返回的时候被自动释放。

   ● 2.4 【扩展】虽然ARC给我们编程带来的很多好多，但也可能出现内存泄露。如下面两种情况：
       ● 2.4.1 循环参照
               A有个属性参照B，B有个属性参照A，如果都是strong参照的话，两个对象都无法释放。
       ● 2.4.2 死循环
               如果有个ViewController中有无限循环，也会导致即使ViewController对应的view消失了，ViewController也不能释放。
       ● 2.4.3 block一般使用copy关键字进行修饰，block使用copy是从MRC遗留下来的“传统”，在MRC中，方法内容的block是在栈区的，使用copy可以把它放到堆区。但在ARC中写不写都行：编译器自动对block进行了copy操作。
       ● 2.4.4 retain属性的setter方法是保留新值并释放旧值，然后更新实例变量，令其指向新值。顺序很重要。假如还未保留新值就先把旧值释放了，而且两个值又指向同一个对象，先执行的release操作就可能导致系统将此对象永久回收。

   ● 2.5 用@property声明的NSString（或NSArray，NSDictionary）经常使用copy关键字，为什么？如果改用strong关键字，可能造成什么问题？
      答：用@property声明 NSString、NSArray、NSDictionary 经常使用copy关键字，是因为他们有对应的可变类型：NSMutableString、NSMutableArray、NSMutableDictionary，他们之间可能进行赋值操作，为确保对象中的字符串值不会无意间变动，应该在设置新属性值时拷贝一份。
         如果我们使用是strong,那么这个属性就有可能指向一个可变对象,如果这个可变对象在外部被修改了,那么会影响该属性.。
         copy此特质所表达的所属关系与strong类似。然而设置方法并不保留新值，而是将其“拷贝” (copy)。 当属性类型为NSString时，经常用此特质来保护其封装性，因为传递给设置方法的新值有可能指向一个NSMutableString类的实例。这个类是NSString的子类，表示一种可修改其值的字符串，此时若是不拷贝字符串，那么设置完属性之后，字符串的值就可能会在对象不知情的情况下遭人更改。所以，这时就要拷贝一份“不可变” (immutable)的字符串，确保对象中的字符串值不会无意间变动。只要实现属性所用的对象是“可变的” (mutable)，就应该在设置新属性值时拷贝一份。

   ● 2.6 说说assign vs weak，_block vs _weak的区别
         assign适用于基本数据类型，weak是适用于NSObject对象，并且是一个弱引用。
         assign其实也可以用来修饰OC对象，那么为什么不用它呢？因为被assign修饰的对象在被释放之后，指针的地址还是存在的，也就是说指针并没有被置为nil。如果在后续内存分配中，分到了刚才这块地址，程序就会崩溃掉。而weak修饰的对象在释放之后，指针地址会被置为nil。
         __block不管是ARC还是MRC模式下都可以使用，可以修饰对象，还可以修饰基本数据类型。
         __weak只能在ARC模式下使用，也只能修饰对象（NSString），不能修饰基本数据类型（int）。
         __block对象可以在block中被重新赋值，__weak不可以。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

3.线程同步和异步的区别？IOS中如何实现多线程的同步？
   ● 3.1 同步：一个线程要等待上一个线程执行完之后才能执行当前的线程，生活中的例子（上厕所）。
   ● 3.2 异步：同时去做两件或者多件事。比如边听歌边看报。原子操作(atomic)、
    undefined
   ● 3.3 加锁（NSLock、NSRecursive、NSConditionLock）、@synchronized    GCD串行队列,GCD当中的屏障,NSOperationQueue设置最大并发数为1。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

4.iOS类是否可以多继承？如果没有，那可以用其他方法实现吗？简述实现过程。
   不可以，可以通过消息转发、delegate和protocol和类别来实现类似多继承。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

5.iOS持久化存储都有哪几种方式？iOS如何实现复杂对象的存储？
   ● 5.1 Write写入方式：永久保存在磁盘中。但是只支持NSString、NSData、NSArray、NSDictionary。
   ● 5.2 NSUserDefaults(偏好设置)【NSUserDefaults是个单例类，用于存储少量数据。NSUserDefaults实际上对plist文件操作的封装，更方便我们直接操作，一般用于存储系统级别的偏好设置。】
   ● 5.3 plist文件存储 【注意：操作plist文件时，文件路径一定要是全路径。】
   ● 5.4 NSKeyedArchiver（归档）采用归档的形式来保存数据，该数据对象需要遵守NSCod-ing协议，并且该对象对应的类必须提供encodeWithCoder:和initWithCoder:方法。
   ● 5.5 SQLite3（FMDB）注意FMDB不是数据库, 而是一个SQLITE管理框架.
   ● 5.6 CoreData切记coredata不是数据库, 他的存储核心思想是托管对象, 只是咱们经常用的存储文件为SQLite.还可以用XML, 二进制等方式.

   ● 5.7 沙盒
     ● 5.7.1 每个iOS应用都有自己的应用沙盒(应用沙盒就是文件系统目录)，与其他文件系统隔离。应用必须待在自己的沙盒里，其他应用不能访问该沙盒。沙盒下的目录如图`iOS沙盒图.png`所示.
     ● 5.7.2 Documents: 保存应⽤运行时生成的需要持久化的数据,iTunes同步设备时会备份该目录。
     ● 5.7.3.1 Library/Caches: 保存应用运行时⽣成的需要持久化的数据,iTunes同步设备时不会备份 该目录。⼀一般存储体积大、不需要备份的非重要数据，比如网络数据缓存存储到Caches下
     ● 5.7.3.2 Library/Preference: 保存应用的所有偏好设置，如iOS的Settings(设置) 应⽤会在该目录中查找应⽤的设置信息。iTunes同步设备时会备份该目录
     ● 5.7.4 tmp: 保存应⽤运行时所需的临时数据,使⽤完毕后再将相应的文件从该目录删除。应用没有运行时,系统也可能会清除该目录下的文件。iTunes同步设备时不会备份该目录。


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

6.RunLoop是什么？
    一个RunLoop就是一个事件处理的循环，用来不停的调度工作以及处理输入时间。使用runloop的目的是让你的线程在有工作的时候忙于工作,而没工作的时候处于休眠状态。runloop的设计是为了减少cpu无谓的空转。每个开辟的线程都有一个Runloop, 主线程的Runloop时默认开启的, 咱们手动开辟的子线程Runloop是默认不开启的, 如果需要开启, 需要调用API[[NSRunloop  currentRunloop] run]开启.最常见的需要开启Runloop的是在子线程里面调用计时器(NSTimer), 如果不开启runloop循环方法就不能正常执行.

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

7.SDWebImage加载图片的流程(原文链接：//http://www.cnblogs.com/jys509/p/5199997.html)

   ● 7.1 入口 setImageWithURL:placeholderImage:options: 会先把 placeholderImage 显示，然后 SDWebImageManager 根据 URL 开始处理图片。
   ● 7.2 进入 SDWebImageManager-downloadWithURL:delegate:options:userInfo:，交给 SDImageCache 从缓存查找图片是否已经下载 queryDiskCacheForKey:delegate:userInfo:.
   ● 7.3 先从内存图片缓存查找是否有图片，如果内存中已经有图片缓存，SDImageCacheDelegate 回调 imageCache:didFindImage:forKey:userInfo: 到 SDWebImageManager。
   ● 7.4 SDWebImageManagerDelegate 回调 webImageManager:didFinishWithImage: 到 UIImageView+WebCache 等前端展示图片。
   ● 7.5 如果内存缓存中没有，生成 NSInvocationOperation 添加到队列开始从硬盘查找图片是否已经缓存。
   ● 7.6 根据 URLKey 在硬盘缓存目录下尝试读取图片文件。这一步是在 NSOperation 进行的操作，所以回主线程进行结果回调 notifyDelegate:。
   ● 7.7 如果上一操作从硬盘读取到了图片，将图片添加到内存缓存中（如果空闲内存过小，会先清空内存缓存）。SDImageCacheDelegate 回调 imageCache:didFindImage:forKey:userInfo:。进而回调展示图片。
   ● 7.8 如果从硬盘缓存目录读取不到图片，说明所有缓存都不存在该图片，需要下载图片，回调 imageCache:didNotFindImageForKey:userInfo:。
   ● 7.9 共享或重新生成一个下载器 SDWebImageDownloader 开始下载图片。
   ● 7.10 图片下载由 NSURLConnection 来做，实现相关 delegate 来判断图片下载中、下载完成和下载失败。
   ● 7.11 connection:didReceiveData: 中利用 ImageIO 做了按图片下载进度加载效果。
   ● 7.12 connectionDidFinishLoading: 数据下载完成后交给 SDWebImageDecoder 做图片解码处理。
   ● 7.13 图片解码处理在一个 NSOperationQueue 完成，不会拖慢主线程 UI。如果有需要对下载的图片进行二次处理，最好也在这里完成，效率会好很多。
   ● 7.14 在主线程 notifyDelegateOnMainThreadWithInfo: 宣告解码完成，imageDecoder:didFinishDecodingImage:userInfo: 回调给 SDWebImageDownloader。
   ● 7.15 imageDownloader:didFinishWithImage: 回调给 SDWebImageManager 告知图片下载完成。
   ● 7.16 通知所有的 downloadDelegates 下载完成，回调给需要的地方展示图片。
   ● 7.17 将图片保存到 SDImageCache 中，内存缓存和硬盘缓存同时保存。写文件到硬盘也在以单独 NSInvocationOperation 完成，避免拖慢主线程。
   ● 7.18 SDImageCache 在初始化的时候会注册一些消息通知，在内存警告或退到后台的时候清理内存图片缓存，应用结束的时候清理过期图片。
   ● 7.19 SDWI 也提供了 UIButton+WebCache 和 MKAnnotationView+WebCache，方便使用。
   ● 7.20 SDWebImagePrefetcher 可以预先下载图片，方便后续使用

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

8.下面程序输出结果是？
```
int main() {
int a[5]={1,2,3,4,5};
int *ptr=(int *)(&a+1);
printf(“%d,%d”,*(a+1),*(ptr-1));
}
```
答案是 2 和 5。a 是指向数组开头元素的指针，a + 1 就是指向下一个元素的指针，所以星号求值以后是 2。&a 相当于是数组的指针，&a + 1 是数组后面一个数组的指针，然后转换成int *类型是 5 这个数字后面的一个数字的指针。再减一就是指向 5 的指针，所以星号求值以后是 5。


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~



#endif /* iOS______2_h */
