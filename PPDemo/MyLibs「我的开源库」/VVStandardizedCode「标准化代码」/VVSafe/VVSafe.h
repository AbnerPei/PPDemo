//
//  VVSafe.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#ifndef VVSafe_h
#define VVSafe_h
#import "VVSafeArray.h"

static inline BOOL vv_isEmptyStr(NSString * _Nullable str) {
    if (!str || str.length == 0) {
        return YES;
    }
    if (![str isKindOfClass:NSString.class]) {
#if DEBUG
        NSLog(@"str is must is kind of NSSTring");
        assert(NO);
#endif
        return YES;
    }
    return NO;
}


#endif /* VVSafe_h */
