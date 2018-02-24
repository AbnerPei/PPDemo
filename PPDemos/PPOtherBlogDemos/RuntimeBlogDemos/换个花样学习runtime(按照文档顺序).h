//
//  换个花样学习runtime.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#ifndef ______runtime_h
#define ______runtime_h

/**
 * 001 拷贝对象 ☠☠【arc不可用】☠☠.
 */
OBJC_EXPORT id _Nullable object_copy(id _Nullable obj, size_t size) OBJC_ARC_UNAVAILABLE;

/**
 * 002 释放对象内存 ☠☠【arc不可用】☠☠.
 */
OBJC_EXPORT id _Nullable object_dispose(id _Nullable obj) OBJC_ARC_UNAVAILABLE;

/**
 * 003 获取一个object的类型
 *
 * @param obj  你想要检查的object.
 *
 * @return     如果object是个对象，就返回一个类对象；如果object为nil,就返回nil.
 */
OBJC_EXPORT Class _Nullable object_getClass(id _Nullable obj);

/**
 * 004 修改object的类型
 *
 * @param obj  要修改的obje.
 * @param cls  你想要修改后的类对象.
 *
 * @return     object被修改前的类类型，如果object为nil，返回值也为nil.
 */
OBJC_EXPORT Class _Nullable object_setClass(id _Nullable obj, Class _Nonnull cls);

/**
 * 005 判断object是否是一个类对象
 *
 * @param obj  一个OC对象.
 *
 * @return     如果object是一个类或者元类，返回true，否则返回false.
 */
OBJC_EXPORT BOOL object_isClass(id _Nullable obj);

/**
 * 006 读取object的某个实例变量的值(包括所谓的“私有变量”)。
 *
 * @param obj  包含你想要读取的实例变量的object.
 * @param ivar 描述你想要读取的实例变量的Ivar.
 *
 * @return     根据ivar获取到的你指定的实例变量的值，如果object是nil，返回结果也是nil.
 *
 * @note       如果已经知道了实例变量，object_getIvar比object_getInstanceVariable更快.
 */
OBJC_EXPORT id _Nullable object_getIvar(id _Nullable obj, Ivar _Nonnull ivar);

/**
 * 007 设置object的实例变量的值
 *
 * @param obj   包含你想要读取的实例变量的object.
 * @param ivar  描述你想要读取的实例变量的Ivar.
 * @param value 实例变量的新值.
 *
 * @note  知道内存管理（如ARC的strong和weak）的实例变量用内存管理。而那些不知道内存管理的实例变量被分配,好像他们是unsafe_unretained。
 * @note  如果已经知道了实例变量，object_setIvar比object_setInstanceVariable更快.
 */
OBJC_EXPORT void object_setIvar(id _Nullable obj, Ivar _Nonnull ivar, id _Nullable value);

/**
 * 008 设置object的实例变量的值【☠☠iOS10及以后可用，属性如果没有默认的内存管理，就用strong类型的☠☠】
 *
 * 参考007（object_setIvar）的注释。
 * @note  知道内存管理（如ARC的strong和weak）的实例变量用内存管理。而那些不知道内存管理的实例变量被分配,好像他们是strong。
 */
OBJC_EXPORT void 
object_setIvarWithStrongDefault(id _Nullable obj, Ivar _Nonnull ivar,id _Nullable value);

/**
 * 009 改变一个类对象的实例变量的值 ☠☠【arc不可用】☠☠.
 *
 * @param obj   类对象的指针。传递一个包含你想要修改它值的实例变量的object。
 * @param name  一个C字符串。传递一个你想要修改的实例变量的名字。
 * @param value 实例变量的新值.
 *
 * @return  一个通过name指定的 定义了实例变量的类型和name的 指向Ivar数据结构 的指针。
 *
 * @note 知道内存管理（如ARC的strong和weak）的实例变量用内存管理。而那些不知道内存管理的实例变量被分配,好像他们是unsafe_unretained。
 */
OBJC_EXPORT Ivar _Nullable
object_setInstanceVariable(id _Nullable obj, const char * _Nonnull name,void * _Nullable value) OBJC_ARC_UNAVAILABLE;

/**
 * 010 改变一个类对象的实例变量的值 ☠☠【arc不可用】☠☠.
 *
 * 参考009（object_setInstanceVariable）的注释。
 * @note  知道内存管理（如ARC的strong和weak）的实例变量用内存管理。而那些不知道内存管理的实例变量被分配,好像他们是strong。
 */
OBJC_EXPORT Ivar _Nullable
object_setInstanceVariableWithStrongDefault(id _Nullable obj,const char * _Nonnull name,
                                            void * _Nullable value) OBJC_ARC_UNAVAILABLE;

/**
 * 011 获取类对象的实例变量的值 ☠☠【arc不可用】☠☠.
 */
OBJC_EXPORT Ivar _Nullable
object_getInstanceVariable(id _Nullable obj, const char * _Nonnull name,
                           void * _Nullable * _Nullable outValue) OBJC_ARC_UNAVAILABLE;

/**
 * 012 返回指定类的类型.
 *
 * @param name 要查阅的类的名字.
 *
 * @return 已命名的类，或者如果类没用runtime注册返回nil.
 *
 * @note  objc_getClass与objc_lookUpClass的不同在于：\c objc_getClass is different from \c objc_lookUpClass in that if the class
 *  is not registered, \c objc_getClass calls the class handler callback and then checks
 *  a second time to see whether the class is registered. \c objc_lookUpClass does
 *  not call the class handler callback.
 *
 * @warning Earlier implementations of this function (prior to OS X v10.0)
 *  terminate the program if the class does not exist.
 */
OBJC_EXPORT Class _Nullable objc_getClass(const char * _Nonnull name);


#endif /* ______runtime_h */
