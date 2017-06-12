//
//  MAMapVersion.h
//  MAMapKit
//
//  Created by yi chen on 2/24/16.
//  Copyright © 2016 Amap. All rights reserved.
//

#import <AMapFoundationKit/AMapFoundationVersion.h>

#ifndef MAMapVersion_h
#define MAMapVersion_h

#define MAMapVersionNumber                40600
#define MAMapMinRequiredFoundationVersion 10200

// 依赖库版本检测
#if AMapFoundationVersionNumber < MAMapMinRequiredFoundationVersion
#error "The AMapFoundationKit version is less than minimum required, please update! Any questions please to visit http://lbs.amap.com"
#endif

FOUNDATION_EXTERN NSString * const MAMapKitVersion;
FOUNDATION_EXTERN NSString * const MAMapKitName;


#endif /* MAMapVersion_h */
