//
//  VVListViewProtocol.h
//  PPDemo
//
//  Created by AbnerPei on 2021/6/12.
//

#ifndef VVListViewProtocol_h
#define VVListViewProtocol_h
#import "VVViewProtocol.h"

@protocol VVListViewProtocol <VVViewProtocol>

@optional
/// tableView或者collectionView上的所有`cell`的类的数组
/// 说明：
/// ①：tableView或者collectionView在初始化时会获取该数组进行`cell`的注册
/// ②：获取`cell`时，不会依据该数组，所以数组元素的顺序随意
- (NSArray<Class> *)cellClasses;

/// tableView或者collectionView上的所有`可重用view`（headerView/footerView）的类的数组
/// 说明：
/// ①：tableView或者collectionView在初始化时会获取该数组进行`可重用view`的注册
/// ②：获取`可重用view`时，不会依据该数组，所以数组元素的顺序随意
- (NSArray<Class> *)reusableViewClasses;

/// 注册`cell`
- (void)registerCells;

/// 注册`可重用view`
- (void)registerReusableViews;

#warning pp605
- (UITableViewStyle)tableViewStyle;

- (UICollectionViewLayout *)collectionViewLayout;

@end


#endif /* VVListViewProtocol_h */
