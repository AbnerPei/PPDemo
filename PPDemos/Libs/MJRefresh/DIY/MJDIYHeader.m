//
//  MJDIYHeader.m
//  MJRefreshExample
//
//  Created by MJ Lee on 15/6/13.
//  Copyright © 2015年 小码哥. All rights reserved.
//

#import "MJDIYHeader.h"
@interface MJDIYHeader()
@property (weak, nonatomic) UILabel *label;
@property (weak, nonatomic) UIImageView *s;
@property (weak, nonatomic) UIImageView *logo;
@property (weak, nonatomic) UIActivityIndicatorView *loading;
@end

@implementation MJDIYHeader
#pragma mark - 重写方法
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare
{
    [super prepare];
    
    // 设置控件的高度
    self.mj_h =60;
    
    // 添加label
    UILabel *label = [[UILabel alloc] init];
    label.font = [UIFont boldSystemFontOfSize:11];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = PPSetColor(153, 153, 153, 1);
    [self addSubview:label];
    self.label = label;
    
    // 图片
    UIImageView *s = [[UIImageView alloc] init];
    [self addSubview:s];
    self.s = s;
    [self addSubview:s];
    
    // logo标语
    UIImageView *logo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"biaoyu"]];
    logo.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:logo];
    self.logo = logo;
    
}

#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews
{
    [super placeSubviews];
    self.label.frame = self.bounds;
    self.s.frame = CGRectMake(self.bounds.size.width/2 - 48, 20, 40, 40);
    self.logo.bounds = CGRectMake(0, 0, self.bounds.size.width, 15);
    self.logo.center = CGPointMake(self.mj_w * 0.5, - self.logo.mj_h + 8);
    
    self.loading.center = CGPointMake(self.mj_w - 30, self.mj_h * 0.5);
}

#pragma mark 监听scrollView的contentOffset改变
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change
{
    [super scrollViewContentOffsetDidChange:change];

}

#pragma mark 监听scrollView的contentSize改变
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change
{
    [super scrollViewContentSizeDidChange:change];
    
}

#pragma mark 监听scrollView的拖拽状态改变
- (void)scrollViewPanStateDidChange:(NSDictionary *)change
{
    [super scrollViewPanStateDidChange:change];

}

#pragma mark 监听控件的刷新状态
- (void)setState:(MJRefreshState)state
{
    // 状态检查【方法抽成宏】
    MJRefreshCheckState;
    
    switch (state) {
        case MJRefreshStateIdle:
        {
            [self.s  stopAnimating];
            self.label.text = @"下拉刷新";
            self.s.image = [UIImage imageNamed:@"xiala_icon.png"];
            break;
        }
        case MJRefreshStatePulling:
        {
            self.label.text = @"释放刷新";
            self.s.image = [UIImage imageNamed:@"shifang_icon.png"];
            break;
        }
        case MJRefreshStateRefreshing:
        {
            self.label.text = @"正在加载";
            self.s.animationImages = [NSArray arrayWithObjects:
                                      [UIImage imageNamed:@"load_view_01.png"],
                                      [UIImage imageNamed:@"load_view_02.png"],
                                      [UIImage imageNamed:@"load_view_03.png"],
                                      [UIImage imageNamed:@"load_view_04.png"],
                                      [UIImage imageNamed:@"load_view_05.png"],
                                      [UIImage imageNamed:@"load_view_06.png"],
                                      [UIImage imageNamed:@"load_view_07.png"],
                                      [UIImage imageNamed:@"load_view_08.png"],
                                      [UIImage imageNamed:@"load_view_09.png"],
                                      [UIImage imageNamed:@"load_view_010.png"], nil];
            
            self.s.animationDuration = 0.5;
            self.s.animationRepeatCount = 0;
            [self.s startAnimating];
            
#warning 关于长时间刷新无果的处理
            //在此处可以处理加载超时后，取消刷新控件【而实际上APP中一般都有网路判断，断网就直接提示没网，然后endRefreshing就好！】
            //个人不建议这样设置，但不排除有需求的；【暂时保留】
//            [self  performSelector:@selector(getVersio) withObject:nil afterDelay:8];
            break;
        }
        default:
            break;
    }
}
-(void)getVersio{
    [self endRefreshing];
}

#pragma mark 监听拖拽比例（控件被拖出来的比例）
- (void)setPullingPercent:(CGFloat)pullingPercent
{
    [super setPullingPercent:pullingPercent];
}
@end
