//
//  MJRefreshWantedFooter.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/2/23.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "MJRefreshWantedFooter.h"
@interface MJRefreshWantedFooter()
{
    /** 显示刷新状态的label */
    __unsafe_unretained UILabel *_stateLabel;
}
/** 所有状态对应的文字 */
@property (strong, nonatomic) NSMutableDictionary *stateTitles;
@end


@implementation MJRefreshWantedFooter
+(instancetype)mj_wantedFooterWithBottomExtraHeight:(CGFloat)bottomExtraHeight nomalRecommenderText:(NSString *)nomalRecommenderText extraRecommenderText:(NSString *)extraRecommenderText
{
    MJRefreshWantedFooter *wantedFooter = [[self alloc] init];
    wantedFooter.bottomExtraHeight = bottomExtraHeight;
    wantedFooter.nomalRecommenderText = nomalRecommenderText;
    wantedFooter.extraRecommenderText = extraRecommenderText;
    return wantedFooter;
}
- (NSMutableDictionary *)stateTitles
{
    if (!_stateTitles) {
        self.stateTitles = [NSMutableDictionary dictionary];
    }
    return _stateTitles;
}

- (UILabel *)stateLabel
{
    if (!_stateLabel) {
        [self addSubview:_stateLabel = [UILabel mj_label]];
    }
    return _stateLabel;
}


-(void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}
-(void)prepare
{
    [super prepare];
    self.stateLabel.text = self.nomalRecommenderText;
    self.stateLabel.hidden = YES;

}
-(void)placeSubviews
{
    [super placeSubviews];
    if (self.stateLabel.constraints.count) return;
    // 状态标签
    self.stateLabel.frame = self.bounds;
}
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    // 设置位置
    self.mj_y = self.scrollView.mj_contentH;
}
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];
    //手松开
    BOOL isPanEnd = (_scrollView.panGestureRecognizer.state == UIGestureRecognizerStateEnded);
//    NSLog(@"offset %@ \n %f \n %f",NSStringFromUIEdgeInsets(_scrollView.mj_inset),_scrollView.mj_offsetY,_scrollView.mj_contentH);
    if (_scrollView.mj_insetT + _scrollView.mj_contentH <= _scrollView.mj_h) {  // 不够一个屏幕
        if (_scrollView.mj_offsetY >= - _scrollView.mj_insetT+self.bottomExtraHeight) { // 向上拽
            if (!isPanEnd) {
                self.stateLabel.text = self.nomalRecommenderText;
                self.stateLabel.hidden = NO;
            }
        }
    } else { // 超出一个屏幕
        self.stateLabel.hidden = NO;

        if (_scrollView.mj_offsetY >= _scrollView.mj_contentH + _scrollView.mj_insetB - _scrollView.mj_h+self.bottomExtraHeight) {
            if (!isPanEnd) {
                self.stateLabel.text = self.extraRecommenderText;
            }
        }else{
            if (!isPanEnd) {
                self.stateLabel.text = self.nomalRecommenderText;
            }
        }
    }
}
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];
    
    //手松开
    BOOL isPanEnd = (_scrollView.panGestureRecognizer.state == UIGestureRecognizerStateEnded);
//    NSLog(@"PanStateDidChange %@ \n %f \n %f",NSStringFromUIEdgeInsets(_scrollView.mj_inset),_scrollView.mj_offsetY,_scrollView.mj_contentH);

    if (_scrollView.mj_insetT + _scrollView.mj_contentH <= _scrollView.mj_h) {  // 不够一个屏幕
        if (_scrollView.mj_offsetY >= - _scrollView.mj_insetT) { // 向上拽
            if (isPanEnd) {
                [self wantedAction];
            }
        }
    } else { // 超出一个屏幕
        if (_scrollView.mj_offsetY >= _scrollView.mj_contentH + _scrollView.mj_insetB - _scrollView.mj_h+50) {
            if (isPanEnd) {
                [self wantedAction];
            }
        }
    }
}
-(void)wantedAction
{
    if (self.wantedActionBlock) {
        self.wantedActionBlock();
    }
}

@end
