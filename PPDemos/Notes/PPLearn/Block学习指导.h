
//
//  Block学习指导.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/9.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef Block_____h
#define Block_____h

- (void)viewDidLoad {
    [super viewDidLoad];
 
    [self blockDemoWithblock:^(NSString *pp_str) {
        PPLog(@"%@",pp_str);
    }];
    
    [self blockDemoWithblock:[self demo]];
    
}

//将block当做参数传递
- (void)blockDemoWithblock:(void(^)(NSString *pp_str))myBlock
{
    myBlock(@"你好吗？？");//传入参数
}

//将block当做返回值
- (void(^)(NSString *))demo{
    
    void(^block)(NSString *) = ^(NSString *str){
        NSLog(@"%@----我很好啊！！",str);
    };
    
    return block;
}
_______________________________________________________
【1】__block和__weak修饰符的区别:_____________________________________________
/*
 
__block不管是ARC还是MRC模式下都可以使用，可以修饰对象，还可以修饰基本数据类型。
__weak只能在ARC模式下使用，也只能修饰对象（NSString），不能修饰基本数据类型（int）。
__block对象可以在block中被重新赋值，__weak不可以。
 
 */

原文链接：http://www.jianshu.com/p/e25bc6df8921

//为什么ARC下使用copy和strong是相同的
/*
 
要解释这个问题必须要知道block的实现原理，具体的实现原理参阅『参考3』。我在这里直接给出解释，实际上Block是有不同类型的，这些类型的区别在于Block是存储在哪一个内存区间。
 
在MRC下有三种类型（见名知意）：

_NSConcreteGlobalBlock 全局的静态 block，不会访问任何外部变量。
_NSConcreteStackBlock 保存在栈中的 block，当函数返回时会被销毁。
_NSConcreteMallocBlock 保存在堆中的 block，当引用计数为 0 时会被销毁。

但在ARC下只有两种，也就是第一种和第三种，也就是说本来需要在MRC下使用copy所做的操作实际上ARC帮我们做了，因此使用copy和strong也就无所谓了。
 */
_____________________________________________
【2】block新知：
_____________________________________________
  //[相关链接1：]http://www.jianshu.com/p/e7237df7a178
/*
 
【1】block是带有局部变量的匿名函数（即没有名称的函数），就是OC中的闭包（closure）,又名匿名函数，块函数，块.
【2】block都是一些简短代码片段的封装，适用作工作单元，通常用来做并发任务、遍历、以及回调。
【3】bolck块在我们的编程过程中也是很常用的,它叫匿名函数,其实它不是函数,而是一个数据类型,就如同int,char一样,但是要给Bolck赋的值却是一个函数!!Bolck保存的是一个函数..当我们不懂的时候,是可以这样的理解的..当然,我们使用Bolck和代理模式很多时候是用于做传值使用的.
 
 */


Tips：
【内存主要分为】
1、栈区（stack）— 由编译器自动分配释放，存放函数的参数值，局部变量的值等。
2、堆区（heap） — 一般由程序员分配释放， 若程序员不释放，程序结束时可能由OS回收。
3、全局区（静态区）（static）—，全局变量和静态变量的存储是放在一块的，初始化的全局变量和静态变量在一块区域，未初始化的全局变量和未初始化的静态变量在相邻的另一块区域。程序结束后由系统释放。
4、文字常量区 —常量字符串就是放在这里的。程序结束后由系统释放。
5、程序代码区—存放函数体的二进制代码。

例子程序
/*

//main.cpp
int a = 0; //全局初始化区
char *p1; //全局未初始化区
main()
{
    int b; //栈
    char s[] = "abc"; //栈
    char *p2; //栈
    char *p3 = "123456"; //123456\0在常量区，p3在栈上。
    static int c =0；//全局（静态）初始化区
    p1 = (char *)malloc(10);
    p2 = (char *)malloc(20);
    //分配得来得10和20字节的区域就在堆区。
    strcpy(p1, "123456"); //123456\0放在常量区，编译器可能会将它与p3所指向的"123456"优化成一个地方。
}

*/

 


#endif /* Block_____h */
