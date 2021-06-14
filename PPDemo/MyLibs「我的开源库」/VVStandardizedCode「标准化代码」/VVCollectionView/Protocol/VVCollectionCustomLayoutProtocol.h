//
//  VVCollectionCustomLayoutProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVCollectionCustomLayoutProtocol_h
#define VVCollectionCustomLayoutProtocol_h

@protocol VVCollectionCustomLayoutDelegate <NSObject>

@optional
/// 每个分区的列数，默认1列
- (NSInteger)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout columnCountInSection:(NSInteger)section;

/// cell的size
- (CGSize)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;

/// section的insets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout *)customLayout insetInSection:(NSInteger)section;

#warning pp605
- (CGFloat)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout*)customLayout minimumLineSpacingInSection:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout*)customLayout minimumInteritemSpacingInSection:(NSInteger)section;

- (CGSize)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout*)customLayout referenceSizeForHeaderInSection:(NSInteger)section;

- (CGSize)collectionView:(UICollectionView *)collectionView customLayout:(UICollectionViewLayout*)customLayout referenceSizeForFooterInSection:(NSInteger)section;

@end

@protocol VVCollectionCustomLayoutProtocol <NSObject>

@property (nonatomic, weak) id<VVCollectionCustomLayoutDelegate> vv_layoutDelegate;

@end

#endif /* VVCollectionCustomLayoutProtocol_h */
