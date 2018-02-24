//
//  PPSectionTitleIndexView.h
//  PPTableViewLearnDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/18.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol PPSectionTitleIndexViewDelegate <NSObject>

@required
/**
 与PPSectionTitleIndexView相关联的view（UITableView）
 */
-(UITableView *)sectionTitleIndexViewAssociatedView;

/**
 section的titles
 */
-(NSArray<NSString *> *)sectionTitleIndexViewSectionTitles;

@end

@interface PPSectionTitleIndexView : UIView
/** 索引是否正在显示 */
@property(nonatomic,assign,readonly) BOOL isShowingIndex;

//这三种不能用于初始化
-(instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
-(instancetype)init NS_UNAVAILABLE;
+(instancetype)new NS_UNAVAILABLE;

-(instancetype)initWithFrame:(CGRect)frame delegate:(_Nullable id<PPSectionTitleIndexViewDelegate>)delegate NS_DESIGNATED_INITIALIZER;

+(instancetype)pp_sectionTitleIndexViewWithFrame:(CGRect)frame delegate:(_Nullable id<PPSectionTitleIndexViewDelegate>)delegate;
@end

NS_ASSUME_NONNULL_END
