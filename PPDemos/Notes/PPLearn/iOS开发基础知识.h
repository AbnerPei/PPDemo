//
//  iOS开发基础知识.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/9.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//  适用面试①②③④⑤⑥⑦⑧⑨⑩  【20条/页】1

#ifndef iOS_______h
#define iOS_______h

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

#目录
> 1.iOS常用的设计模式。
2.UIView和CALayer的区别和联系。
3.浅拷贝和深拷贝区别是什么?
4.iOS的单例模式有两种官方写法。
5.__block和__weak修饰符的区别。
6.strong，weak，retain，assign，copy nomatic 等的区别。
7.static 关键字的作用。
8.请写出UIViewController的完整生命周期。
9.说下你对block的理解？
10.简述你对工厂方法的理解。
11.如何使用UIScrollView实现无限加载多张图片：【待亲测】。
12.UITableView有哪些优化方式？
13.简述IOS中的事件传递机制。
14.简述Http协议中get请求和post请求的区别。
15.类别的作用?继承和类别在实现中有何区别?
16.什么是KVO和KVC?
17.KVO，NSNotification，delegate及block区别。
18.将一个函数在主线程执行的4种方法。
19.写个冒泡排序。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

1.iOS常用的设计模式。
① target - action设计模式
② 代理模式 : 代理的目的是改变或传递控制链。允许一个类在某些特定时刻通知到其他类，而不需要获取到那些类的指针。可以减少框架复杂度。
③ 单例模式 : 保证一个类只有一个实例，并提供一个访问它的全局访问点，一个app只有一个实列，也就是说他一直存在，除非你手动置空，然后在内存里面只会用到一个地址。一个app开启，就有了很多单列，例如：
         ● UIApplication类提供了 ＋sharedAPplication方法创建和获取UIApplication单例
         ● NSFileManager类提供了 ＋defaultManager方法创建和获得NSFileManager单例。
         ● NSNotificationCenter提供了 ＋defaultCenter方法创建和获取NSNotificationCenter单例（PS：该类还遵循了另一个重要的设计模式：观察者模式）
         ● NSBundle类提供了 +mainBunle方法获取NSBundle单例]
         ● NSUserDefaults类提供了 ＋defaultUserDefaults方法去创建和获取NSUserDefaults单例
         ● NSTimer, UIWindow等等；
④ 观察者模式  : 一个对象状态改变，通知正在对他进行观察的对象，这些对象根据各自要求做出相应的改变这个KVO就是。也有很多大神把KVO自己重写了一次。通知(notification)机制也是。通知的好处在于我只管自己变动的时候发通知就行，有人会接受这个通知然后做相应的管理。
⑤ MVC模式
         ● 特点：⑤.1 View接受用户的交互信息
                ⑤.2 View将请求转交给Controller
                ⑤.3 Controller操作Model进行数据更新
                ⑤.4 数据更新之后，Model通知View数据变化
                ⑤.5 View显示更新之后的数据
⑥ MVVM模式
         ● 特点：在MVC基础上，加入VM，把大量原来放在 ViewController 里的视图逻辑和数据逻辑移到 ViewModel 里，从而有效的减轻了 ViewController 的负担

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

2.UIView和CALayer的区别和联系
   ● 2.1 uiview 是uikit的(只能iOS使用)  calayer 是QuartzCore的(ios 和mac os通用)
   ● 2.2 calayer 比uiview更加轻量级别, 但是可以实现同样的效果
   ● 2.3 uiview比calayer多了一个事件处理的功能,也就是说，CALayer 不能处理用户的触摸事件，而UIView可以
   ● 2.4 UIView的CALayer类似UIView的子View树形结构
   ● 2.5 UIView有个重要属性layer，可以返回它的主CALayer实例。CALayer *layer = myView.layer
   ● 2.6 坐标系统：CALayer的坐标系统比UIView多了一个anchorPoint属性
   ● 2.7 UIView是iOS系统中界面元素的基础，所有的界面元素都是继承自它。它本身完全是由CoreAnimation来实现的。它真正的绘图部分，是由一个CALayer类来管理。UIView本身更像是一个CALayer的管理器，访问它的跟绘图和跟坐标有关的属性，例如frame，bounds等，实际上内部都是在访问它所包含的CALayer的相关属性。最后：layer可以设置圆角显示（cornerRadius），也可以设置阴影 (shadowColor)。但是如果layer树中某个layer设置了圆角，树种所有layer的阴影效果都将不显示了。因此若是要有圆角又要阴影，变通方法只能做两个重叠的UIView，一个的layer显示圆角，一个layer显示阴影
   ● 2.8 渲染 当更新层，改变不能立即显示在屏幕上。当所有的层都准备好时，可以调用setNeedsDisplay方法来重绘显示。
   ● 2.9 变换 要在一个层中添加一个3D或仿射变换，可以分别设置层的transform或affineTransform属性。
   ● 2.10 变形 Quartz Core的渲染能力，使二维图像可以被自由操纵，就好像是三维的。图像可以在一个三维坐标系中以任意角度被旋转，缩放和倾斜。CATransform3D的一套方法提供了一些魔术般的变换效果。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

3.浅拷贝和深拷贝区别是什么?
   ● 3.1
   ● 浅层复制：只复制指向对象的指针，而不复制引用对象本身。
   ● 深层复制：复制引用对象本身。
    意思就是说我有个A对象，复制一份后得到A_copy对象后，对于浅复制来说，A和A_copy指向的是同一个内存资源，复制的只不过是是一个指针，对象本身资源还是只有一份，那如果我们对A_copy执行了修改操作,那么发现A引用的对象同样被修改，这其实违背了我们复制拷贝的一个思想。深复制就好理解了,内存中存在了两份独立对象本身。
   ● 用网上一哥们通俗的话将就是：
    浅复制好比你和你的影子，你完蛋，你的影子也完蛋
    深复制好比你和你的克隆人，你完蛋，你的克隆人还活着。

   ● 3.2【原文】//http://www.cnblogs.com/zy1987/p/4615698.html
        ● 3.2.1 深拷贝同浅拷贝的区别：浅拷贝是指针拷贝，对一个对象进行浅拷贝，相当于对指向对象的指针进行复制，产生一个新的指向这个对象的指针，那么就是有两个指针指向同一个对象，这个对象销毁后两个指针都应该置空。深拷贝是对一个对象进行拷贝，相当于对对象进行复制，产生一个新的对象，那么就有两个指针分别指向两个对象。当一个对象改变或者被销毁后拷贝出来的新的对象不受影响。
        ● 3.2.2 实现深拷贝需要实现NSCoying协议，实现- (id)copyWithZone:(NSZone *)zone 方法。当对一个property属性含有copy修饰符的时候，在进行赋值操作的时候实际上就是调用这个方法。
        ● 3.2.3 父类实现深拷贝之后，子类只要重写copyWithZone方法，在方法内部调用父类的copyWithZone方法，之后实现自己的属性的处理。
        ● 3.2.4 父类没有实现深拷贝，子类除了需要对自己的属性进行处理，还要对父类的属性进行处理。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

4.iOS的单例模式有两种官方写法
【4.1使用GCD】

#import "PP_UserManager.h"

@implementation PP_UserManager
+(PP_UserManager *)PP_SharedInstance
{
    static PP_UserManager *aUser = nil;
    static dispatch_once_t onceUser;
    dispatch_once(&onceUser, ^{
        aUser = [[PP_UserManager alloc]init];
    });
    return aUser;
}
@end

【4.2不使用GCD】

#import "PP_UserManager.h"

static PP_UserManager *aUser;  //不使用GCD

@implementation PP_UserManager
/** 不使用GCD */
+(PP_UserManager *)PP_SharedInstance
{
    if (!aUser) {
        aUser = [[self allocWithZone:NULL] init];
    }
    return aUser;
}
@end

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

5.__block和__weak修饰符的区别：

__block不管是ARC还是MRC模式下都可以使用，可以修饰对象，还可以修饰基本数据类型。
__weak只能在ARC模式下使用，也只能修饰对象（NSString），不能修饰基本数据类型（int）。
__block对象可以在block中被重新赋值，__weak不可以。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

6.strong，weak，retain，assign，copy nomatic 等的区别

 ● assign： 简单赋值，不更改索引计数（Reference Counting）对基础数据类
/*
 6.1 assign与weak区别
 assign适用于基本数据类型，weak是适用于NSObject对象，并且是一个弱引用。
 
 assign其实也可以用来修饰对象。那么我们为什么不用它修饰对象呢？
  因为被assign修饰的对象（一般编译的时候会产生警告：Assigning retained object to unsafe property; object will be released after assignment）在释放之后，指针的地址还是存在的，也就是说指针并没有被置为nil，造成野指针。对象一般分配在堆上的某块内存，如果在后续的内存分配中，刚好分到了这块地址，程序就会崩溃掉。
 
 那为什么可以用assign修饰基本数据类型？因为基础数据类型一般分配在栈上，栈的内存会由系统自己自动处理，不会造成野指针。
 
 weak修饰的对象在释放之后，指针地址会被置为nil。所以现在一般弱引用就是用weak。weak使用场景：
 
 在ARC下,在有可能出现循环引用的时候，往往要通过让其中一端使用weak来解决，比如: delegate代理属性，通常就会声明为weak。
 
 自身已经对它进行一次强引用，没有必要再强引用一次时也会使用weak。比如：自定义 IBOutlet控件属性一般也使用weak，当然也可以使用strong。
 
 */
 ● copy： 建立一个索引计数为1的对象，然后释放旧对象。
 ● retain：释放旧的对象，将旧对象的值赋予输入对象，再提高输入对象的索引计数为1 ,对其他NSObject和其子类
 ● weak 和strong的区别：weak和strong不同的是 当一个对象不再有strong类型的指针指向它的时候 它会被释放 ，即使还有weak型指针指向它。一旦最后一个strong型指针离去 ，这个对象将被释放，所有剩余的weak型指针都将被清除。
 ● copy与retain：
      copy其实是建立了一个相同的对象，而retain不是.
      copy是内容拷贝，retain是指针拷贝.
      copy是内容的拷贝 ,对于像NSString,的确是这样，如果拷贝的是 NSArray这时只是copy了指向array中相对应元素的指针.这便是所谓的"浅复制".
 ● atomic是Objc使用的一种线程保护技术，基本上来讲，是防止在写未完成的时候被另外一个线程读取，造成数据错误。而这种机制是耗费系统资源的，所以在iPhone这种小型设备上，如果没有使用多线程间的通讯编程，那么nonatomic是一个非常好的选择。


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

7.static 关键字的作用

 ● 7.1 函数体内 static 变量的作用范围为该函数体，不同于 auto 变量，该变量的内存只被分配一次，因此其值在下次调用时仍维持上次的值；
 ● 7.2 在模块内的 static 全局变量可以被模块内所用函数访问，但不能被模块外其它函数访问；
 ● 7.3 在模块内的 static 函数只可被这一模块内的其它函数调用，这个函数的使用范围被限制在声明 它的模块内；
 ● 7.4 在类中的 static 成员变量属于整个类所拥有，对类的所有对象只有一份拷贝；
 ● 7.5 在类中的 static 成员函数属于整个类所拥有，这个函数不接收 this 指针，因而只能访问类的static 成员变量。
 ● 7.6 优点：
   ● 7.6.1 节省内存。静态变量只存储一处，但供所有对象使用。
   ● 7.6.2 它的值是可以更新的。
   ● 7.6.3 可提高时间效率。只要某个对象对静态变量更新一次，所有的对象都能访问更新后的值。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

8.请写出UIViewController的完整生命周期

xib/storyboard：-initWithCoder:，
而非xib/storyboard的是-initWithNibName:bundle:然后
-alloc
-init
-loadView
-viewDidLoad
-viewWillAppear:
-viewDidAppear:
-viewWillDisappear:
-viewDidDisappear:
-dealloc


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

9.说下你对block的理解？

 ● 9.1. block说简单了就是C语言的一种数据类型,里面存放一段代码.但是编译器不去执行,只有到用到的时候才去执行block内部的代码.block的标志就是^.
 ● 9.2.使用注意：
     ● 9.2.1  如果 block 中使用了外部变量，会对外部变量做一次 copy。
     ● 9.2.2. 如果要在 block 内部修改栈区变量，需要使用 __block 修饰符，并且定义 block 之后，栈区变量的地址会变化为堆区地址。
     ● 9.2.3. 默认情况下，不允许在block内部修改外部变量的值。
     ● 9.2.4. 如果在一个控制器中使用block并且在这个block里面使用了这个类对象（self），那么一定要在外部将类对象定义成弱指针类型，这就能够避免循环引用，内存泄露的问题。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

10.简述你对工厂方法的理解：

      创建对象的时候，我们一般是alloc一个对象，如果需要创建100个这样的对象，如果是在一个for循环中还好说，直接一句alloc就行了，但是事实并不那么如意，我们可能会在不同的地方去创建这个对象，那么我们可能需要写100句alloc 了，但是如果我们在创建对象的时候，需要在这些对象创建完之后，为它的一个属性添加一个固定的值，比方说都是某某学校的学生，那么可能有需要多些100行重复的代码了，那么，如果写一个-(void)createObj方法，把创建对象和学校属性写在这个方法里边，那么就是会省事很多，也就是说我们可以alloc 创建对象封装到一个方法里边，直接调用这个方法就可以了，这就是简单工厂方法。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

11.如何使用UIScrollView实现无限加载多张图片：【待亲测】

      写一个NSTimer  每隔0.5秒  执行以下回调方法changPic  如果图片数量有限  进行一个if判断  当超过图片总数时候，显示第一张，重新开始从第一张显示。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

12.UITableView有哪些优化方式：

 ● 12.1.图片使用异步加载如SDWebImage。
 ● 12.2.使用重用标识符reuseIdentifier，将重用标识标示符static NSString *CellIdentifier = @"XXX"。
 ● 12.3.将数据绑定写在WillDisPlay这个协议方法中。【//个人习惯在此方法中实现给模型绑定数据
  - (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath】
 ● 12.4.尽量在CELL中少使用不透明的View。
 ● 12.5.如果不是必须，减少使用reloadData全部cell。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

13.简述IOS中的事件传递机制：

 ● 举例：如果view是控制器的view，就传递给控制器；如不是，则将其传递给它的父视图 在视图层次结构的最顶级视图，如果也不能处理收到的事件或消息，则其将事件或消息传递给window对象进行处理 如果window对象也不处理，则其将事件或消息传递给UIApplication对象 如果UIApplication也不能处理该事件或消息，则将其丢弃.
 * 注意：为什么用队列管理事件,而不用栈？
        队列先进先出,能保证先产生的事件先处理。栈先进后出。

//[史上最详细的iOS之事件的传递和响应机制](http://www.jianshu.com/p/2e074db792ba)
 ● 在iOS中不是任何对象都能处理事件，只有继承了UIResponder的对象才能接受并处理事件，我们称之为“响应者对象”。以下都是继承自UIResponder的，所以都能接收并处理事件:
                 ① UIApplication
                 ② UIViewController
                 ③ UIView


 ● 那么为什么继承自UIResponder的类就能够接收并处理事件呢？
     因为UIResponder中提供了以下4个对象方法来处理触摸事件:
```
UIResponder内部提供了以下方法来处理事件触摸事件
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;

```
 * 要注意的是：以上四个方法是由系统自动调用的，所以可以通过重写该方法来处理一些事件。
 * 你如果是在viewController.m文件中重写touchBegan:withEvent:方法，相当于处理的是viewController的触摸事件，因为viewController也是继承自UIResponder，所以会给人一种错觉。所以，还是那句话，想处理UIView的触摸事件，必须自定义UIView子类继承自UIView。

 ● 那么，如何实现UIView的拖拽呢?也就是让UIView随着手指的移动而移动。
　  重写touchsMoved:withEvent:方法此时需要用到参数touches;

 ① 如果两根手指同时触摸一个view，那么view只会调用一次touchesBegan:withEvent:方法，touches参数中装着2个UITouch对象;
 ② 如果这两根手指一前一后分开触摸同一个view，那么view会分别调用2次touchesBegan:withEvent:方法，并且每次调用时的touches参数中只包含一个UITouch对象;

 * 当手指离开屏幕时，系统会销毁相应的UITouch对象.
   `提示`:iPhone开发中，要避免使用双击事件！

 ● 13.1 事件的产生
     ● 13.1.1 发生触摸事件后，系统会将该事件加入到一个由UIApplication管理的事件队列中.
     ● 13.1.2 UIApplication会从事件队列中取出最前面的事件，并将事件分发下去以便处理，通常，先发送事件给应用程序的主窗口（keyWindow）.
     ● 13.1.3 主窗口会在视图层次结构中找到一个最合适的视图来处理触摸事件，这也是整个事件处理过程的第一步。找到合适的视图控件后，就会调用视图控件的touches方法来作具体的事件处理.
 ● 13.2 事件的传递
     ● 13.2.1触摸事件的传递是从父控件传递到子控件【也就是UIApplication->window->寻找处理事件最合适的view】.
     `注意`: 如果父控件不能接受触摸事件，那么子控件就不可能接收到触摸事件.

 * 13.3 应用如何找到最合适的控件来处理事件？
   * 13.3.1.首先判断主窗口（keyWindow）自己是否能接受触摸事件
   * 13.3.2.判断触摸点是否在自己身上
   * 13.3.3.子控件数组中从后往前遍历子控件，重复前面的两个步骤（所谓从后往前遍历子控件，就是首先查找子控件数组中最后一个元素，然后执行1、2步骤）
   * 13.3.4.view，比如叫做fitView，那么会把这个事件交给这个fitView，再遍历这个fitView的子控件，直至没有更合适的view为止。
   * 13.3.5.如果没有符合条件的子控件，那么就认为自己最合适处理这个事件，也就是自己是最合适的view。

    13.3的详述：
         1.主窗口接收到应用程序传递过来的事件后，首先判断自己能否接手触摸事件。如果能，那么在判断触摸点在不在窗口自己身上
         2.如果触摸点也在窗口身上，那么窗口会从后往前遍历自己的子控件（遍历自己的子控件只是为了寻找出来最合适的view）
         3.遍历到每一个子控件后，又会重复上面的两个步骤（传递事件给子控件，1.判断子控件能否接受事件，2.点在不在子控件上）
         4.如此循环遍历子控件，直到找到最合适的view，如果没有更合适的子控件，那么自己就成为最合适的view。找到最合适的view后，就会调用该view的touches方法处理具体的事件。所以，只有找到最合适的view，把事件传递给最合适的view后，才会调用touches方法进行接下来的事件处理。找不到最合适的view，就不会调用touches方法进行事件处理。

   `注意`：之所以会采取从后往前遍历子控件的方式寻找最合适的view只是为了做一些循环优化。因为相比较之下，后添加的view在上面，降低循环次数。



 ● 13.4 UIView不能接收触摸事件的三种情况：
   ● 13.4.1 不允许交互：userInteractionEnabled = NO
   ● 13.4.2 隐藏：如果把父控件隐藏，那么子控件也会隐藏，隐藏的控件不能接受事件
   ● 13.4.3 透明度：如果设置一个控件的透明度<0.01，会直接影响子控件的透明度。alpha：0.0~0.01为透明。
#pragma mark warning --- [UIImageView不能接受触摸事件]
   `注意`:默认UIImageView不能接受触摸事件，因为不允许交互，即userInteractionEnabled = NO，所以如果希望UIImageView可以交互，需要userInteractionEnabled = YES。

   * 不管视图能不能处理事件，只要点击了视图就都会产生事件，关键看该事件是由谁来处理！也就是说，如果视图不能处理事件，点击视图，还是会产生一个触摸事件，只是该事件不会由被点击的视图处理而已！注意：如果设置父控件的透明度或者hidden，会直接影响到子控件的透明度和hidden。如果父控件的透明度为0或者hidden = YES，那么子控件也是不可见的！


 ● 13.5 寻找最合适的view底层剖析, 两个重要的方法：
   ● 13.5.1 hitTest:withEvent:方法
       调用 ：只要事件一传递给一个控件,这个控件就会调用他自己的hitTest：withEvent：方法
       作用 ：寻找并返回最合适的view(能够响应事件的那个最合适的view)
      `注意`：不管这个控件能不能处理事件，也不管触摸点在不在这个控件上，事件都会先传递给这个控件，随后再调用hitTest:withEvent:方法
   ● 13.5.2 pointInside方法

 ● 13.6 拦截事件的处理
        ● 13.6.1 正因为hitTest：withEvent：方法可以返回最合适的view，所以可以通过重写hitTest：withEvent：方法，返回指定的view作为最合适的view。
        ● 13.6.2 不管点击哪里，最合适的view都是hitTest：withEvent：方法中返回的那个view.
        ● 13.6.3 通过重写hitTest：withEvent：，就可以拦截事件的传递过程，想让谁处理事件谁就处理事件.

        ● 13.6.4 事件传递给谁，就会调用谁的hitTest:withEvent:方法。注 意：如果hitTest:withEvent:方法中返回nil，那么调用该方法的控件本身和其子控件都不是最合适的view，也就是在自己身上没有找到更合适的view。那么最合适的view就是该控件的父控件。所以事件的传递顺序是这样的：　　产生触摸事件->UIApplication事件队列->[UIWindow hitTest:withEvent:]->返回更合适的view->[子控件 hitTest:withEvent:]->返回最合适的view
#pragma mark 技巧
        `技巧` ：想让谁成为最合适的view就重写谁自己的父控件的hitTest:withEvent:方法返回指定的子控件，或者重写自己的hitTest:withEvent:方法 return self。但是，建议在父控件的hitTest:withEvent:中返回子控件作为最合适的view！
        `原因` ： 在自己的hitTest:withEvent:方法中返回自己有时候会出现问题，因为会存在这么一种情况，当遍历子控件时，如果触摸点不在子控件A自己身上而是在子控件B身上，还要要求返回子控件A作为最合适的view，采用返回自己的方法可能会导致还没有来得及遍历A自己，就有可能已经遍历了点真正所在的view，也就是B。这就导致了返回的不是自己而是点真正所在的view。所以还是建议在父控件的hitTest:withEvent:中返回子控件作为最合适的view！
        `例如` ：whiteView有redView和greenView两个子控件。redView先添加，greenView后添加。如果要求无论点击那里都要让redView作为最合适的view（把事件交给redView来处理）那么只能在whiteView的hitTest:withEvent:方法中return self.subViews[0];这种情况下在redView的hitTest:withEvent:方法中return self;是不好使的！

 ● 13.7 事件的响应
   ● 13.7.1 触摸事件处理的整体过程
      ● 13.7.1.1 用户点击屏幕后产生的一个触摸事件，经过一系列的传递过程后，会找到最合适的视图控件来处理这个事件
      ● 13.7.1.1 2 找到最合适的视图控件后，就会调用控件的touches方法来作具体的事件处理touchesBegan…touchesMoved…touchedEnded…
      ● 13.7.1.1 3 这些touches方法的默认做法是将事件顺着响应者链条向上传递（也就是touch方法默认不处理事件，只传递事件），将事件交给上一个响应者进行处理

   ● 13.7.2 响应者链条
      ● 13.7.2.1 【响应者链条】 ：在iOS程序中无论是最后面的UIWindow还是最前面的某个按钮，它们的摆放是有前后关系的，一个控件可以放到另一个控件上面或下面，那么用户点击某个控件时是触发上面的控件还是下面的控件呢，这种先后关系构成一个链条就叫“响应者链”。也可以说，响应者链是由多个响应者对象连接起来的链条。在iOS中响应者链的关系可以用【PPImages文件夹下的响应者链条示意图.png】表示.
      ● 13.7.2.2 【响应者对象】 ：能处理事件的对象，也就是继承自UIResponder的对象
      ● 13.7.2.3  作用：能很清楚的看见每个响应者之间的联系，并且可以让一个事件多个对象处理。

   ● 13.7.3 响应者链的事件传递过程:
      ● 13.7.3.1 如果当前view是控制器的view，那么控制器就是上一个响应者，事件就传递给控制器；如果当前view不是控制器的view，那么父视图就是当前view的上一个响应者，事件就传递给它的父视图
      ● 13.7.3.2 在视图层次结构的最顶级视图，如果也不能处理收到的事件或消息，则其将事件或消息传递给window对象进行处理
      ● 13.7.3.3 如果window对象也不处理，则其将事件或消息传递给UIApplication对象
      ● 13.7.3.4 如果UIApplication也不能处理该事件或消息，则将其丢弃

   ● 13.7.4 事件处理的整个流程总结：
   ● 13.7.4.1 触摸屏幕产生触摸事件后，触摸事件会被添加到由UIApplication管理的事件队列中（即，首先接收到事件的是UIApplication）。
   ● 13.7.4.2 UIApplication会从事件队列中取出最前面的事件，把事件传递给应用程序的主窗口（keyWindow）。
   ● 13.7.4.3 主窗口会在视图层次结构中找到一个最合适的视图来处理触摸事件。（至此，第一步已完成)
   ● 13.7.4.4 最合适的view会调用自己的touches方法处理事件
   ● 13.7.4.5 touches默认做法是把事件顺着响应者链条向上抛。

 ● 13.8 事件的传递与响应：
   ● 13.8.1 当一个事件发生后，事件会从父控件传给子控件，也就是说由UIApplication -> UIWindow -> UIView -> initial view,以上就是事件的传递，也就是寻找最合适的view的过程。
   ● 13.8.2 接下来是事件的响应。首先看initial view能否处理这个事件，如果不能则会将事件传递给其上级视图（inital view的superView）；如果上级视图仍然无法处理则会继续往上传递；一直传递到视图控制器view controller，首先判断视图控制器的根视图view是否能处理此事件；如果不能则接着判断该视图控制器能否处理此事件，如果还是不能则继续向上传 递；（对于第二个图视图控制器本身还在另一个视图控制器中，则继续交给父视图控制器的根视图，如果根视图不能处理则交给父视图控制器处理）；一直到 window，如果window还是不能处理此事件则继续交给application处理，如果最后application还是不能处理此事件则将其丢弃
   ● 13.8.3 在事件的响应中，如果某个控件实现了touches...方法，则这个事件将由该控件来接受，如果调用了[supertouches….];就会将事件顺着响应者链条往上传递，传递给上一个响应者；接着就会调用上一个响应者的touches….方法

 ● 13.9 事件的传递和响应的区别：
          事件的传递是从上到下（父控件到子控件）;
          事件的响应是从下到上（顺着响应者链条向上传递：子控件到父控件)。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

14.简述Http协议中get请求和post请求的区别：

 ● 14.1 get 是从服务器获取数据  ，post是向服务器发送数据
 ● 14.2 GET安全性较低，POST安全性较高。因为GET在传输过程，数据被放在请求的URL中，而如今现有的很多服务器、代理服务器或者用户代理都会将请求URL记录到日志文件中，然后放在某个地方，这样就可能会有一些隐私的信息被第三方看到。另外，用户也可以在浏览器上直接看到提交的数据，一些系统内部消息将会一同显示在用户面前。POST的所有操作对用户来说都是不可见的。

 ● 备注：GET请求，将参数直接写在访问路径上。操作简单，不过容易被外界看到，安全性不高，地址最多255字节；POST请求，将参数放到body里面。POST请求操作相对复杂，需要将参数和地址分开，不过安全性高，参数放在body里面，不易被捕获。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

15.类别的作用?继承和类别在实现中有何区别?
　　 ● category 可以在不获悉，不改变原来代码的情况下往里面添加新的方法，只能添加，不能删除修改。并且如果类别和原来类中的方法产生名称冲突，则类别将覆盖原来的方法，因为类别具有更高的优先级。

　　 ● 类别主要有3个作用：
　　   ● 15.1 将类的实现分散到多个不同文件或多个不同框架中。
　　   ● 15.2 创建对私有方法的前向引用。
　　   ● 15.3 向对象添加非正式协议。
　　 ● 继承可以增加，修改或者删除方法，并且可以增加属性。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

16.什么是KVC和KVO?
　　 ● 16.1 KVC概述:
       【理解1】键 – 值编码是一种间接访问对象的属性使用字符串来标识属性，而不是通过调用存取方法，直接或通过实例变量访问的机制。很多情况下可以简化程序代码。
       【理解2】Key Value Coding的简称。它是一种可以通过字符串的名字（key）来访问类属性的机制。而不是通过调用Setter、Getter方法访问。
      *【“当通过KVC调用对象时，比如：[self valueForKey:@”someKey”]时，程序会自动试图通过几种不同的方式解析这个调用。首先查找对象是否带有 someKey 这个方法，如果没找到，会继续查找对象是否带有someKey这个实例变量(iVar)，如果还没有找到，程序会继续试图调用 -(id) valueForUndefinedKey:这个方法。如果这个方法还是没有被实现的话，程序会抛出一个NSUndefinedKeyException异常错误。”】
　　 ● 16.1.1 KVC使用
　　   ● 16.1.1.1 获取值
         ● valueForKey: 传入NSString属性的名字。
         ● valueForKeyPath: 属性的路径，xx.xx
         ● valueForUndefinedKey 默认实现是抛出异常，可重写这个函数做错误处理
　　   ● 16.1.1.2 修改值
         ● setValue:forKey:
         ● setValue:forKeyPath:
         ● setValue:forUnderfinedKey:
         ● setNilValueForKey: 对非类对象属性设置nil时调用，默认抛出异常。
　　   ● 16.1.1.3 比如说如下的一行KVC代码：
```
[site setValue:@"sitename" forKey:@"name"];
//会被编译器处理成
SEL sel = sel_get_uid(setValue:forKey);
IMP method = objc_msg_loopup(site->isa,sel);
method(site,sel,@"sitename",@"name");

```

　　 ● 16.2 KVO概述:
       【理解1】键值观察Key-Value-Observer就是观察者模式。提供了观察某一属性变化的方法，极大的简化了代码。
        `观察者模式`的定义：一个目标对象管理所有依赖于它的观察者对象，并在它自身的状态改变时主动通知观察者对象。这个主动通知通常是通过调用各观察者对象所提供的接口方法来实现的。观察者模式较完美地将目标对象与观察者对象解耦。
         【何时使用】当需要检测其他类的属性值变化，但又不想被观察的类知道，有点像FBI监视嫌疑人，这个时候就可以使用KVO了。
#pragma mark warning 【KVO同KVC一样都依赖于Runtime的动态机制】
        KVO同KVC一样都依赖于Runtime的动态机制

　　 ● 16.2.1 KVO实现步骤
　　   ● 16.2.1.1注册
```
//keyPath就是要观察的属性值
//options给你观察键值变化的选择
//context方便传输你需要的数据
-(void)addObserver:(NSObject *)anObserver
forKeyPath:(NSString *)keyPath
options:(NSKeyValueObservingOptions)options
context:(void *)context

```
　　   ● 16.2.1.2 实现方法
```
//change里存储了一些变化的数据，比如变化前的数据，变化后的数据；如果注册时context不为空，这里context就能接收到。
-(void)observeValueForKeyPath:(NSString *)keyPath
ofObject:(id)object
change:(NSDictionary *)change
context:(void *)context

```
　　   ● 16.2.1.3 移除
```
- (void)removeObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath;

```
　　 ● 16.2.2 KVO的实现分析
         ● 使用观察者模式需要被观察者的配合，当被观察者的状态发生变化的时候通过事先定义好的接口（协议）通知观察者。在KVO的使用中我们并不需要向被观察者添加额外的代码，就能在被观察的属性变化的时候得到通知，这个功能是如何实现的呢？同KVC一样依赖于强大的Runtime机制。
　　   ● 16.2.2.1 系统实现KVO有以下几个步骤：
　　       ● 16.2.2.1.1 当类A的对象第一次被观察的时候，系统会在运行期动态创建类A的派生类。我们称为B。
　　       ● 16.2.2.1.2 在派生类B中重写类A的setter方法，B类在被重写的setter方法中实现通知机制。
　　       ● 16.2.2.1.3 类B重写会 class方法，将自己伪装成类A。类B还会重写dealloc方法释放资源。
　　       ● 16.2.2.1.4 系统将所有指向类A对象的isa指针指向类B的对象。
#pragma mark 【KVC和KVO总结】
    ** KVO同KVC一样，通过 isa-swizzling 技术来实现【isa---is kind of】。当观察者被注册为一个对象的属性的观察对象的isa指针被修改，指向一个中间类，而不是在真实的类。其结果是，isa指针的值并不一定反映实例的实际类。所以不能依靠isa指针来确定对象是否是一个类的成员。应该使用class方法来确定对象实例的类。


~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

17.KVO，NSNotification，delegate及block区别
 ● 17.1 KVO就是cocoa框架实现的观察者模式，一般同KVC搭配使用，通过KVO可以监测一个值的变化，比如View的高度变化。是一对多的关系，一个值的变化会通知所有的观察者。
 ● 17.2 NSNotification是通知，也是一对多的使用场景。在某些情况下，KVO和NSNotification是一样的，都是状态变化之后告知对方。NSNotification的特点，就是需要被观察者先主动发出通知，然后观察者注册监听后再来进行响应，比KVO多了发送通知的一步，但是其优点是监听不局限于属性的变化，还可以对多种多样的状态变化进行监听，监听范围广，使用也更灵活。

 ● 17.3 delegate 是代理，就是我不想做的事情交给别人做。比如狗需要吃饭，就通过delegate通知主人，主人就会给他做饭、盛饭、倒水，这些操作，这些狗都不需要关心，只需要调用delegate（代理人）就可以了，由其他类完成所需要的操作。所以delegate是一对一关系。

 ● 17.4 block是delegate的另一种形式，是函数式编程的一种形式。使用场景跟delegate一样，相比delegate更灵活，而且代理的实现更直观。

 ● 17.5 KVO一般的使用场景是数据，需求是数据变化，比如股票价格变化，我们一般使用KVO（观察者模式）。delegate一般的使用场景是行为，需求是需要别人帮我做一件事情，比如买卖股票，我们一般使用delegate。
 ● 17.6 Notification一般是进行全局通知，比如利好消息一出，通知大家去买入。delegate是强关联，就是委托和代理双方互相知道，你委托别人买股票你就需要知道经纪人，经纪人也不要知道自己的顾客。Notification是弱关联，利好消息发出，你不需要知道是谁发的也可以做出相应的反应，同理发消息的人也不需要知道接收的人也可以正常发出消息。

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

18.将一个函数在主线程执行的4种方法。
 ● 18.1 GCD方法，通过向主线程队列发送一个block块，使block里的方法可以在主线程中执行。
```
dispatch_async(dispatch_get_main_queue(), ^{
    //需要执行的方法
});

```
 ● 18.2 NSOperation 方法
```
NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];  //主队列
NSBlockOperation *operation = [NSBlockOperation blockOperationWithBlock:^{
    //需要执行的方法
}];
[mainQueue addOperation:operation];

```
 ● 18.3 NSThread 方法
```
[self performSelector:@selector(method) onThread:[NSThread mainThread] withObject:nil waitUntilDone:YES modes:nil];
[self performSelectorOnMainThread:@selector(method) withObject:nil waitUntilDone:YES];
[[NSThread mainThread] performSelector:@selector(method) withObject:nil];

```
 ● 18.4 RunLoop方法
```
[[NSRunLoop mainRunLoop] performSelector:@selector(method) withObject:nil];

```

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

19.写个冒泡排序

NSMutableArray *pps = [NSMutableArray arrayWithArray:@[@"3",@"2",@"5",@"6",@"7",@"8",@"1",@"11",@"12",@"34",@"56",@"55"]];
NSString *temp;
for (int i = 0; i < pps.count; i++) {
    for (int j = 0; j < pps.count-1-i; j++) {
        if ([pps[j] intValue] > [pps[j+1] intValue]) {
            temp = [pps objectAtIndex:j];
            [pps replaceObjectAtIndex:j withObject:[pps objectAtIndex:(j+1)]];
            [pps replaceObjectAtIndex:(j+1) withObject:temp];
        }
    }
}
NSLog(@"新的数组-----%@",pps);

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#endif /* iOS_______h */
