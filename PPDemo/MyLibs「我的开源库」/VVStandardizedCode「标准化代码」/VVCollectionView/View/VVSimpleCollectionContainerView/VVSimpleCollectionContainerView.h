//
//  VVSimpleCollectionContainerView.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/14.
//

#import "VVBaseCollectionContainerView.h"
#import "VVCollectionVMProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface VVSimpleCollectionContainerView : VVBaseCollectionContainerView

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)coder NS_UNAVAILABLE;
- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;

- (instancetype)initWithCellClassArray:(NSArray<Class> *)cellClassArray
        reusableViewClassArray:(nullable NSArray<Class> *)reusableViewClassArray
               scrollDirection:(UICollectionViewScrollDirection)scrollDirection
                  collectionVM:(__kindof NSObject<VVCollectionVMProtocol> *)collectionVM NS_DESIGNATED_INITIALIZER;
@end

NS_ASSUME_NONNULL_END
