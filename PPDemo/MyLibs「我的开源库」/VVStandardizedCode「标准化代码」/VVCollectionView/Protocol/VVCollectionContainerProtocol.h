//
//  VVCollectionContainerProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVCollectionContainerProtocol_h
#define VVCollectionContainerProtocol_h
#import "VVCollectionVMProtocol.h"

@protocol VVCollectionContainerProtocol <NSObject>

@required
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) __kindof id<VVCollectionVMProtocol> collectionVM;

@optional
- (void)preloadAtIndexPath:(NSIndexPath *)indexPath;

@end

#endif /* VVCollectionContainerProtocol_h */
