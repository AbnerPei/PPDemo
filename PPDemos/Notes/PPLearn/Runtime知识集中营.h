//
//  Runtime知识集中营.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/19.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef Runtime______h
#define Runtime______h

##基础知识
 ● RunTime基本概念
     ● 1.1 为Objc是一门动态语言，所以它总是想办法把一些决定工作从编译连接推迟到运行时。也就是说只有编译器是不够的，还需要一个运行时系统 (runtime system) 来执行编译后的代码。这就是 Objective-C Runtime 系统存在的意义，它是整个Objc运行框架的一块基石。
     ● 1.2 RunTime简称运行时。OC就是运行时机制，其中最主要的是消息机制。对于C语言，函数的调用在编译的时候会决定调用哪个函数。对于OC的函数，属于动态调用过程，在编译的时候并不能决定真正调用哪个函数，只有在真正运行的时候才会根据函数的名称找到对应的函数来调用。
     ● 1.3 Runtime基本是用C和汇编写的，可见苹果为了动态系统的高效而作出的努力。
     ● 1.4 【WARNING】主要使用的函数定义在ios的sdk中 usr/include/objc文件夹下面的message.h和runtime.h这两个文件中。 在message.h中主要包含了一些向对象发送消息的函数，这是OC对象方法调用的底层实现。runtime.h是运行时最重要的文件，其中包含了对运行时进行操作的方法。主要包括如下内容：`这些类型的定义，对一个类进行了完全的分解，将类定义或者对象的每一个部分都抽象为一个类型type，对操作一个类属性和方法非常方便。`
```
/// An opaque type that represents a method in a class definition. 一个类型，代表着类定义中的一个方法
typedef struct objc_method *Method;

/// An opaque type that represents an instance variable.代表实例(对象)的变量
typedef struct objc_ivar *Ivar;

/// An opaque type that represents a category.代表一个分类
typedef struct objc_category *Category;

/// An opaque type that represents an Objective-C declared property.代表OC声明的属性
typedef struct objc_property *objc_property_t;

// Class代表一个类，它在objc.h中这样定义的  typedef struct objc_class *Class;
struct objc_class {
    Class isa  OBJC_ISA_AVAILABILITY;
    
#if !__OBJC2__
    Class super_class                                        OBJC2_UNAVAILABLE;
    const char *name                                         OBJC2_UNAVAILABLE;
    long version                                             OBJC2_UNAVAILABLE;
    long info                                                OBJC2_UNAVAILABLE;
    long instance_size                                       OBJC2_UNAVAILABLE;
    struct objc_ivar_list *ivars                             OBJC2_UNAVAILABLE;
    struct objc_method_list **methodLists                    OBJC2_UNAVAILABLE;
    struct objc_cache *cache                                 OBJC2_UNAVAILABLE;
    struct objc_protocol_list *protocols                     OBJC2_UNAVAILABLE;
#endif
    
} OBJC2_UNAVAILABLE;

```
     ● 1.5 函数的定义
     ● 1.5.1 对对象进行操作的方法一般以object_开头
     ● 1.5.2 对类进行操作的方法一般以class_开头
     ● 1.5.3 对类或对象的方法进行操作的方法一般以method_开头
     ● 1.5.4 对成员变量进行操作的方法一般以ivar_开头
     ● 1.5.5 对属性进行操作的方法一般以property_开头开头
     ● 1.5.6 对协议进行操作的方法一般以protocol_开头
     * 根据以上的函数的前缀 可以大致了解到层级关系。
     * 对于以objc_开头的方法，则是runtime最终的管家，可以获取内存中类的加载信息,类的列表，关联对象和关联属性等操作。


##示例讲解

```
//获取类名称
PPMT_SoHu *pp_sohu = [[PPMT_SoHu alloc]init];
const char *pp_classname = object_getClassName(pp_sohu);
NSLog(@"pp_classname is %s",pp_classname);
> 打印结果：2016-03-20 10:14:22.925 MySetsDemo[72735:8326129] pp_classname is PPMT_SoHu
```

##参考文章
1.[iOS Runtime原理及使用](http://www.cnblogs.com/jys509/p/5207159.html)

#endif /* Runtime______h */
