//
//  PPMacros.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/15.
//

#ifndef PPMacros_h
#define PPMacros_h

/// 两个'##'表示连接
#define PPLazy(Class, pName, code) - (Class *)pName\
{\
    if (!_##pName) {\
        _##pName = [[Class alloc] init];\
        code\
    }\
    return _##pName;\
}

#define PPLazyButton(btName, code) - (UIButton *)btName\
{\
    if (!_##btName) {\
         _##btName = [UIButton buttonWithType:UIButtonTypeCustom];\
        code\
    }\
    return _##btName;\
}

#endif /* PPMacros_h */
