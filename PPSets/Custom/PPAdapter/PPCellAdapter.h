//
//  PPCellAdapter.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPCellAdapter : NSObject

/** cell上的数据  can nil  */
@property(nonatomic,strong)id cellData;
/** 持有的indexPath  */
@property(nonatomic,strong)NSIndexPath *indexPath;
/** cell的重用标示符  */
@property(nonatomic,copy)NSString *cellIdentifier;
/** cellType 【同一个cell，可能会用不同的状态、样式等(如：cell显示文字，点击展开)】 */
@property(nonatomic,assign)NSInteger cellType;


//========================= for tableView ============================
/** 持有的tableV  */
@property(nonatomic,strong)UITableView *tableView;
/** cell高 */
@property(nonatomic,assign)CGFloat cellHeight;



/**【获取一个(PPCellAdapter *)对象.】 cell的重用标示符 cell的高 cell上的数据源 */
+(instancetype)pp_cellAdapterMakeWithCellIdentifier:(NSString *)cellIdentifier
                                         cellHeight:(CGFloat)cellHeight
                                           cellData:(id)cellData
                                           cellType:(NSInteger)cellType;
/**【获取一个(PPCellAdapter *)对象.】 cell的重用标示符@"cell名Identifier" cell的高 cell上的数据源 */
+(instancetype)pp_cellAdapterMakeWithCellClass:(Class)cellClass
                                    cellHeight:(CGFloat)cellHeight
                                      cellData:(id)cellData
                                      cellType:(NSInteger)cellType;


//========================= for collectionView ============================
/** 持有的collectionView  */
@property(nonatomic,strong)UICollectionView *collectionView;

@end
