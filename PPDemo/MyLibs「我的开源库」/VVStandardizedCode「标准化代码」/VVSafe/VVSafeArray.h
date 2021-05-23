//
//  VVSafeArray.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>

#ifndef VVSafeArray_h
#define VVSafeArray_h

NS_INLINE _Nullable id vv_objectAtIndexInArray(NSInteger index, NSArray * _Nullable array) {
    if (index < 0 || !array || index >= array.count) {
        return nil;
    }
    return array[index];
}

#endif /* VVSafeArray_h */
