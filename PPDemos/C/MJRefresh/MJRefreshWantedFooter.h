//
//  MJRefreshWantedFooter.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/2/23.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "MJRefreshFooter.h"

@interface MJRefreshWantedFooter : MJRefreshFooter
/** <#注释#> */
@property(nonatomic,assign) void(^wantedActionBlock)(void);

/** 文字距离圈圈、箭头的距离 */
@property (assign, nonatomic) CGFloat labelLeftInset;
/** 显示刷新状态的label */
@property (weak, nonatomic, readonly) UILabel *stateLabel;

+(instancetype)mj_wantedFooterWithBottomExtraHeight:(CGFloat)bottomExtraHeight
                               nomalRecommenderText:(NSString *)nomalRecommenderText
                               extraRecommenderText:(NSString *)extraRecommenderText;

/** 底部额外增加的高度（才触发文字变化） */
@property(nonatomic,assign) CGFloat bottomExtraHeight;
/** 正常情况下的文字 */
@property(nonatomic,copy) NSString *nomalRecommenderText;
/** 超多规定高度后的文字 */
@property(nonatomic,copy) NSString *extraRecommenderText;

@end
