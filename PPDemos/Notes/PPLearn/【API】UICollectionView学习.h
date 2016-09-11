//
//  【API】UICollectionView学习.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/4/10.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef _API_UICollectionView___h
#define _API_UICollectionView___h
 ● 1. UICollectionView 和 UICollectionViewController 类是iOS6 新引进的API，用于展示集合视图，布局更加灵活，可实现多列布局，用法类似于UITableView 和 UITableViewController 类。

 ● 2. 使用UICollectionView 必须实现UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout这三个协议。

 ● 3. 必须实现的协议
```
@protocol UICollectionViewDataSource <NSObject>
@required
//定义展示的UICollectionViewCell的个数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;
//每个UICollectionView展示的内容
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
```
 ● 4.UICollectionViewDelegateFlowLayout代理
```
@protocol UICollectionViewDelegateFlowLayout <UICollectionViewDelegate>
@optional
//定义每个UICollectionView 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath;
//定义每个UICollectionView 的 margin
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section;

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section;
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section;
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section;

@end

```
#endif /* _API_UICollectionView___h */
