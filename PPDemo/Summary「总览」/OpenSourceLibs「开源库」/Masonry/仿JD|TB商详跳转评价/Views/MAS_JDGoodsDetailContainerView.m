//
//  MAS_JDGoodsDetailContainerView.m
//  PPDemo
//
//  Created by AbnerPei on 2021/5/18.
//

#import "MAS_JDGoodsDetailContainerView.h"
#import "MAS_JDGoodsDetailCommentListView.h"
#import <PPMaker/PPMakeUIKitCategory.h>
#import <Masonry/Masonry.h>

@interface MAS_JDGoodsDetailContainerView () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) UIView *commentListTempView;
@property (nonatomic, strong) MAS_JDGoodsDetailCommentListView *commentListView;
@end

@implementation MAS_JDGoodsDetailContainerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.grayColor;
        [self setupUI];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self layoutIfNeeded];
}

- (void)setupUI
{
    [self addSubview:self.commentListTempView];
    [self addSubview:self.commentListView];
    
    [self.commentListTempView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(kNavBarH);
        make.leading.trailing.mas_equalTo(0);
        make.bottom.equalTo(self.mas_bottom).offset(-kReallBottomH(260));
    }];
    
    [self.commentListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(kScreenW);
        make.top.width.height.equalTo(self.commentListTempView).offset(0);
    }];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    CGPoint locationPoint = [gestureRecognizer locationInView:self];
    NSLog(@"locationPoint is %@",NSStringFromCGPoint(locationPoint));
    if (locationPoint.x > 18.0) {
        return NO;
    }
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self showCommentListView];
}

- (void)showCommentListView
{
    self.commentListView.hidden = NO;
    self.commentListView.userInteractionEnabled = NO;
    
    [self.commentListView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(0);
    }];
    
    [UIView animateWithDuration:0.25 animations:^{
        [self.commentListView.superview layoutIfNeeded];
    } completion:^(BOOL finished) {
        self.commentListTempView.hidden = NO;
        self.commentListTempView.alpha = 1;
        self.commentListView.userInteractionEnabled = YES;
    }];
}

- (void)panAction:(UIPanGestureRecognizer *)gestureRecognizer
{

    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    NSLog(@"translation is %@",NSStringFromCGPoint(translation));
    
    CGFloat totalW = CGRectGetWidth(self.bounds);
    
    CGFloat progress = fabs(translation.x) / totalW;
    
    if (gestureRecognizer.state == UIGestureRecognizerStateChanged) {
        
        if (progress <= 0) {
            progress = fabs(progress);
            progress = MIN(1.0, MAX(0.0, progress));
        }
        
        self.commentListTempView.alpha = 1 - progress;
        CGFloat offsetX = translation.x;
        if (offsetX <= 0) {
            offsetX = 0;
        }
        if (offsetX > totalW) {
            offsetX = totalW;
        }
        [self.commentListView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.mas_equalTo(offsetX);
        }];
        [self.commentListView.superview layoutIfNeeded];
    }
    else if (gestureRecognizer.state == UIGestureRecognizerStateEnded || gestureRecognizer.state == UIGestureRecognizerStateCancelled) {
        
        CGPoint speed = [gestureRecognizer velocityInView:gestureRecognizer.view];
        NSLog(@"速度 方向 %f",speed.x);
        
        BOOL canChangeFrame = NO;
        
        canChangeFrame = (fabs(translation.x) + speed.x) > totalW * 0.1;
        
        NSLog(@"canChangeFrame = %d",canChangeFrame);
        if (canChangeFrame) {
            /// 改变位置
            self.commentListView.userInteractionEnabled = NO;
            
            [self.commentListView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.leading.mas_equalTo(kScreenW);
            }];
            
            [UIView animateWithDuration:0.25 animations:^{
                self.commentListTempView.alpha = 0;
                [self layoutIfNeeded];
            } completion:^(BOOL finished) {
                self.commentListView.userInteractionEnabled = YES;
                self.commentListTempView.hidden = YES;
                
            }];
            
        } else {
            
            self.commentListView.userInteractionEnabled = NO;
            
            // 还原位置
            [self.commentListView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.leading.mas_equalTo(0);
            }];
            [UIView animateWithDuration:0.25 animations:^{
                self.commentListTempView.alpha = 1.0;
                [self layoutIfNeeded];
            } completion:^(BOOL finished) {
                self.commentListView.userInteractionEnabled = YES;
                self.commentListTempView.hidden = NO;
                
            }];
        }
    }
}

- (UIView *)commentListTempView
{
    if (!_commentListTempView) {
        _commentListTempView = [[UIView alloc] init];
        _commentListTempView.backgroundColor = PPMakeUIColorHexA(0x000000, 0.8);
        _commentListTempView.alpha = 0;
        _commentListTempView.hidden = YES;
    }
    return _commentListTempView;
}

- (MAS_JDGoodsDetailCommentListView *)commentListView
{
    if (!_commentListView) {
        _commentListView = [[MAS_JDGoodsDetailCommentListView alloc] init];
        _commentListView.backgroundColor = UIColor.redColor;
        _commentListView.hidden = YES;
        
        UIPanGestureRecognizer *panG = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
        panG.delegate = self;
        [_commentListView addGestureRecognizer:panG];
    }
    return _commentListView;
}

@end
