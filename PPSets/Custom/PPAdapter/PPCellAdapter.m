//
//  PPCellAdapter.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/27.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPCellAdapter.h"

@implementation PPCellAdapter
/**【获取一个(PPCellAdapter *)对象.】 cell的重用标示符 cell的高 cell上的数据源 */
+(instancetype)pp_cellAdapterMakeWithCellIdentifier:(NSString *)cellIdentifier
                                         cellHeight:(CGFloat)cellHeight
                                           cellData:(id)cellData
                                           cellType:(NSInteger)cellType
{
    NSParameterAssert(cellIdentifier);
    PPCellAdapter *cellAdapter = [[PPCellAdapter alloc]init];
    cellAdapter.cellIdentifier = cellIdentifier;
    cellAdapter.cellHeight = cellHeight;
    cellAdapter.cellData = cellData;
    cellAdapter.cellType = cellType;
    return cellAdapter;
}
/**【获取一个(PPCellAdapter *)对象.】 cell的重用标示符@"cell名Identifier" cell的高 cell上的数据源 */
+(instancetype)pp_cellAdapterMakeWithCellClass:(Class)cellClass
                                    cellHeight:(CGFloat)cellHeight
                                      cellData:(id)cellData
                                      cellType:(NSInteger)cellType
{
    NSString *identifier = [NSString stringWithFormat:@"%@Identifier",NSStringFromClass(cellClass)];
    return [self pp_cellAdapterMakeWithCellIdentifier:identifier
                                           cellHeight:cellHeight
                                             cellData:cellData
                                             cellType:cellType];
}
@end
