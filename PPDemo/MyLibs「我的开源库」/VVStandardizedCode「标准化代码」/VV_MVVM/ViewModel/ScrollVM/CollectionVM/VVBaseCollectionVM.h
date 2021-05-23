//
//  VVBaseCollectionVM.h
//  PPDemo
//
//  Created by AbnerPei on 2021/5/22.
//

#import <Foundation/Foundation.h>
#import "VVCollectionVMConfigProtocol.h"
#import "VVCollectionVMProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVBaseCollectionVMConfig : NSObject <VVCollectionVMConfigProtocol>

@end

@interface VVBaseCollectionVM : NSObject <VVCollectionVMProtocol>

@end

NS_ASSUME_NONNULL_END
