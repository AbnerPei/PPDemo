//
//  换个花样学习runtime(按照arc以及返回值类型).h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/8.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#ifndef ______runtime___arc_________h
#define ______runtime___arc_________h

//========== arc不可用 ==========

/**
* 001 拷贝对象【arc不可用】.
*/
OBJC_EXPORT id _Nullable object_copy(id _Nullable obj, size_t size) OBJC_ARC_UNAVAILABLE;

/**
 * 002 释放对象内存【arc不可用】.
 */
OBJC_EXPORT id _Nullable object_dispose(id _Nullable obj) OBJC_ARC_UNAVAILABLE;

/**
 * 009 改变一个类对象的实例变量的值 ☠☠【arc不可用】☠☠.
 *
 * @param obj   类对象的指针。传递一个包含你想要修改它值的实例变量的object。
 * @param name  一个C字符串。传递一个你想要修改的实例变量的名字。
 * @param value 实例变量的新值.
 *
 * @return  一个通过name指定的 定义了实例变量的类型和name的 指向Ivar数据结构 的指针。
 *
 * @note 知道内存管理（如ARC的strong和weak）的实例变量用内存管理。而那些不知道内存管理的实例变量被分配,好像他们是不安   全的。
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
object_setInstanceVariableWithStrongDefault(id _Nullable obj,const char * _Nonnull name,void * _Nullable value) OBJC_ARC_UNAVAILABLE;

/**
 * 011 获取类对象的实例变量的值 ☠☠【arc不可用】☠☠.
 */
OBJC_EXPORT Ivar _Nullable
object_getInstanceVariable(id _Nullable obj, const char * _Nonnull name,
                           void * _Nullable * _Nullable outValue) OBJC_ARC_UNAVAILABLE;


#endif /* ______runtime___arc_________h */
