//
//  VVBaseCollectionVMConfig.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/13.
//

#import <Foundation/Foundation.h>
#import "VVCollectionVMConfigProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVBaseCollectionVMConfig : NSObject <VVCollectionVMConfigProtocol>

@property (nonatomic, strong, readonly, class) VVBaseCollectionVMConfig *defaultConfig;

@end

NS_ASSUME_NONNULL_END
