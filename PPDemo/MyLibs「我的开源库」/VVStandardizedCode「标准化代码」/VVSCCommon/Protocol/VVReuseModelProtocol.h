//
//  VVReuseModelProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/13.
//

#ifndef VVReuseModelProtocol_h
#define VVReuseModelProtocol_h

@protocol VVReuseModelProtocol <NSObject>

@optional
/// 可重用视图（cell/reusableView）的类名字符串
@property (nonatomic, copy, nullable) NSString *reuseViewClassName;

@end

#endif /* VVReuseModelProtocol_h */
