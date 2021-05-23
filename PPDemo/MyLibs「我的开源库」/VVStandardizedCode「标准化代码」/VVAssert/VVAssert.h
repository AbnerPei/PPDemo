//
//  VVAssert.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//
/**
 /// 使用断言的好处:
 /// 1. 及时发现问题
 /// 2. 别人帮你发现问题(牵涉到多模块合作时,更有效)
 /// 3. 问题出在哪里,一目了然
 */

#ifndef VVAssert_h
#define VVAssert_h

#if DEBUG

/// 常用断言
#define VVAssert(condition, desc, ...) NSAssert(condition, desc, ## __VA_ARGS__)

/// 验证参数断言
#define VVAssertParameter(condition) VVAssert((condition), @"Invalid parameter not satisfying: %@", @#condition)

/// 条件为假,断言+返回result
#define VVAssertReturn(condition, desc, result)   NSAssert(condition, desc); \
                                                  if (!condition) { return result; }

/// 条件为假,断言+返回
#define VVAssertReturnVoid(condition, desc)       NSAssert(condition, desc); \
                                                  if (!condition) { return; }

/// 条件为假,断言+返回nil
#define VVAssertReturnNil(condition, desc)        NSAssert(condition, desc); \
                                                  if (!condition) { return nil; }
#else

#define VVAssert(condition, desc, ...)
#define VVAssertParameter(condition)
#define VVAssertReturn(condition, desc, result)   if (!condition) { return result; }
#define VVAssertReturnVoid(condition, desc)       if (!condition) { return; }
#define VVAssertReturnNil(condition, desc)        if (!condition) { return nil; }

#endif


#endif /* VVAssert_h */
