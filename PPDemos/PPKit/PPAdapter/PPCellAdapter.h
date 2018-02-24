//
//  PPCellAdapter.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,PPCellAdapterStyle) {
    PPCellAdapterStyleNone = 0,          //无
    PPCellAdapterStyleTextFold,          //文字---合拢
    PPCellAdapterStyleTextUnFold,        //文字---展开
    PPCellAdapterStyleOther              //其它
};

@interface PPCellAdapter : NSObject
/** cell的数据源 */
@property(nonatomic,readonly,nullable) id pp_ca_dataSource;
/** 重用标示符 */
@property(nonatomic,readonly,nullable) NSString *pp_ca_reuseIdentifier;
/** cell高度 */
@property(nonatomic,assign) CGFloat pp_ca_height;
/** cell类型/样式 同一个cell，可能会用不同的状态、样式等(如：cell显示文字，点击展开(是展开的or不展开的))】*/
@property(nonatomic,assign) PPCellAdapterStyle pp_ca_style;

///** 持有的tableV */
//@property(nonatomic,strong,nullable) UITableView *pp_ca_tableView;
///** 持有的collectionV */
//@property(nonatomic,strong,nullable) UICollectionView *pp_ca_collectionView;
///** 持有的indexPath */
//@property(nonatomic,strong) NSIndexPath *pp_ca_indexPath;

/**
 *  不能通过以下两个方法初始化
 */
- (instancetype)init UNAVAILABLE_ATTRIBUTE;
+ (instancetype)new UNAVAILABLE_ATTRIBUTE;

+(instancetype)pp_ca_makeWithDataSource:(nullable id)dataSource
                           reuseIdentifier:(nullable NSString *)reuseIdentifier
                                    height:(CGFloat)height
                                     style:(PPCellAdapterStyle)style;
-(instancetype)initWithDataSource:(id)dataSource
                  reuseIdentifier:(NSString *)reuseIdentifier
                           height:(CGFloat)height
                            style:(PPCellAdapterStyle)style NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
