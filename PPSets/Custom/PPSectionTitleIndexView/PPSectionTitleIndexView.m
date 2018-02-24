//
//  PPSectionTitleIndexView.m
//  PPTableViewLearnDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/12/18.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPSectionTitleIndexView.h"
#import "UITableView+PPDidSelectedAction.h"

#define kScreenH  [UIScreen mainScreen].bounds.size.height
#define kScreenW  [UIScreen mainScreen].bounds.size.width

@interface PPSectionTitleIndexView ()
{
    NSInteger _selectedBtnTag;  //当前选中的btn的tag
}
@property(nonatomic,assign) id<PPSectionTitleIndexViewDelegate> delegate;
@property(nonatomic,strong) UITableView *tableView;
/** 索引数组 */
@property(nonatomic,strong) NSArray<NSString *> *indexTitles;
/** 当前显示在屏幕中间的lb */
@property(nonatomic,strong) UILabel *currentIndexShowLB;

@end


@interface UIView (PPSectionTitleIndexView)
@property (nonatomic) CGFloat left;        ///< Shortcut for frame.origin.x.
@property (nonatomic) CGFloat top;         ///< Shortcut for frame.origin.y
@property (nonatomic) CGFloat right;       ///< Shortcut for frame.origin.x + frame.size.width
@property (nonatomic) CGFloat bottom;      ///< Shortcut for frame.origin.y + frame.size.height
@property (nonatomic) CGFloat width;       ///< Shortcut for frame.size.width.
@property (nonatomic) CGFloat height;      ///< Shortcut for frame.size.height.
@property (nonatomic) CGSize  size;        ///< Shortcut for frame.size.
@end

@implementation PPSectionTitleIndexView

-(UILabel *)currentIndexShowLB
{
    if (_currentIndexShowLB == nil) {
        _currentIndexShowLB = [[UILabel alloc]initWithFrame:CGRectMake(kScreenW/2-30, kScreenH/2-30, 60, 60)];
        _currentIndexShowLB.backgroundColor = [UIColor colorWithRed:169/225.0 green:169/255.0 blue:169/255.0 alpha:1];
        _currentIndexShowLB.textColor = [UIColor whiteColor];
        _currentIndexShowLB.textAlignment = NSTextAlignmentCenter;
        _currentIndexShowLB.layer.cornerRadius = 30;
        _currentIndexShowLB.layer.masksToBounds = YES;
        _currentIndexShowLB.hidden = YES;
        
        UIWindow *window = [UIApplication sharedApplication].keyWindow;
        [window addSubview:_currentIndexShowLB];
    }
    return _currentIndexShowLB;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame delegate:nil];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    return [self initWithFrame:CGRectZero delegate:nil];
}
-(void)awakeFromNib
{
    [super awakeFromNib];
    [self creatUI];
}

-(instancetype)initWithFrame:(CGRect)frame delegate:(id<PPSectionTitleIndexViewDelegate>)delegate
{
    self = [super initWithFrame:frame];
    if (self) {
        self.delegate = delegate;
        [self creatUI];

    }
    return self;
}
-(BOOL)isShowingIndex
{
    return !self.currentIndexShowLB.hidden;
}
+(instancetype)pp_sectionTitleIndexViewWithFrame:(CGRect)frame delegate:(id<PPSectionTitleIndexViewDelegate>)delegate
{
    return [[PPSectionTitleIndexView alloc]initWithFrame:frame delegate:delegate];
}
-(void)creatUI
{
    //1. 先检验必须实现的协议有没有实现
    [self verifyRequiredProtocol];
    //2. 创建索引UI
    [self creatIndexUI];
    //3. 添加平移手势
    [self addPanGesture];
    
//    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(hiddenIndexShowLB) name:PPTableViewDidSelectedNotificationKey object:nil];
}
-(void)hiddenIndexShowLB
{
    self.currentIndexShowLB.hidden = YES;
}
//-(void)dealloc
//{
//    [[NSNotificationCenter defaultCenter]removeObserver:self name:PPTableViewDidSelectedNotificationKey object:nil];
//}

#pragma mark --- 先检验必须实现的协议有没有实现
-(void)verifyRequiredProtocol
{
    if (self.delegate) {
        NSAssert([self.delegate respondsToSelector:@selector(sectionTitleIndexViewAssociatedView)], @"必须实现 -(UITableView *)sectionTitleIndexViewAssociatedView 方法");
        NSAssert([self.delegate respondsToSelector:@selector(sectionTitleIndexViewSectionTitles)], @"必须实现 -(NSArray<NSString *> *)sectionTitleIndexViewSectionTitles 方法");
    }else{
        NSAssert(NO, @"虽然PPSectionTitleIndexViewDelegate可以为nil，但是它又很关键，如果不设置就什么也看不见。");
        return;
    }
}
#pragma mark --- 创建索引UI
-(void)creatIndexUI
{
    self.tableView   = [self.delegate sectionTitleIndexViewAssociatedView];
    self.indexTitles = [self.delegate sectionTitleIndexViewSectionTitles];
    [self setupIndexUIAndFrame];
    
    __weak typeof(self) weakSelf = self;
    self.tableView.pp_didSelectedBlock = ^(UITableView *tableView, NSIndexPath *indexPath) {
        if (weakSelf.isShowingIndex) {
            weakSelf.currentIndexShowLB.hidden = YES;
        }
    };
    
}
-(void)setupIndexUIAndFrame
{
    _selectedBtnTag = -1;
    
    CGFloat indexVTotalHeight = self.height;
    CGFloat indexVWidth = self.width;
    if (indexVWidth < 35) {
        self.width = 35;
        self.left = 35;
    }
    if (indexVWidth > 45) {
        self.width = 45;
        self.left = 45;
    }
    CGFloat oneIndexWidth = 12;
    CGFloat itemMargin = 5;  //上下item间距
    CGFloat indexAllHeight = oneIndexWidth*self.indexTitles.count+itemMargin*(self.indexTitles.count-1);
    indexAllHeight = MIN(indexVTotalHeight, indexAllHeight);
    
    CGFloat topOrBottomMargin = (indexVTotalHeight-indexAllHeight)/2;
    
    for (int i = 0; i<self.indexTitles.count; i++) {
        UIButton *item = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:item];
        item.tag = 100+i;
        item.frame = CGRectMake(0, topOrBottomMargin+(oneIndexWidth+itemMargin)*i, indexVWidth, oneIndexWidth);
        
        item.titleEdgeInsets = UIEdgeInsetsMake(0, self.width-oneIndexWidth-5, 0, 5);
        [item setTitle:self.indexTitles[i] forState:UIControlStateNormal];
        [item setTitle:self.indexTitles[i] forState:UIControlStateHighlighted];
        [item setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [item setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
        item.backgroundColor = [UIColor clearColor];
        item.titleLabel.font = [UIFont systemFontOfSize:12];
        
        [item addTarget:self action:@selector(btnClickedDown:) forControlEvents:UIControlEventTouchDown]; //只要点击
        [item addTarget:self action:@selector(btnTouchUpInside:) forControlEvents:UIControlEventTouchUpInside]; //点击松手
    }
}
-(void)btnClickedDown:(UIButton *)sender
{
    //1. 获取当前sectionTitle的frame
    CGRect currentSectionTitleRect = [self.tableView rectForSection:sender.tag-100];
    //2. 把tableView当前section滚动到top (不要动画效果更好)
    [self.tableView setContentOffset:CGPointMake(currentSectionTitleRect.origin.x, currentSectionTitleRect.origin.y) animated:NO];
    //3. 把当前的index放大显示到屏幕中间
    NSString *currentIndexStr = sender.titleLabel.text;
    self.currentIndexShowLB.text = currentIndexStr;
    //4. 处理indexStr
    if (currentIndexStr.length == 1) {
        self.currentIndexShowLB.font = [UIFont systemFontOfSize:35];
    }else{
        self.currentIndexShowLB.font = [UIFont systemFontOfSize:18];
    }
    //5. 屏幕中间显示当前index
    self.currentIndexShowLB.hidden = NO;
    
}
-(void)btnTouchUpInside:(UIButton *)sender
{
    //该方法是在btnClickedDown后执行
    self.currentIndexShowLB.hidden = YES;
}
#pragma mark --- 添加平移手势
-(void)addPanGesture
{
    UIPanGestureRecognizer *panGR = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    [self addGestureRecognizer:panGR];
}
-(void)panAction:(UIPanGestureRecognizer *)panGR
{
    //1. 获取手指当前位置的point
    CGPoint fingerTapPoint = [panGR locationInView:self];
    //2. 遍历self上的所有自视图（UIButton *）,如果它的tag和上次不一样，执行touchDown方法
    for (UIView *aV in self.subviews) {
        if ([aV isKindOfClass:[UIButton class]] && aV.tag != _selectedBtnTag && CGRectContainsPoint(aV.frame, fingerTapPoint)) {
            _selectedBtnTag = aV.tag;
            [self btnClickedDown:(UIButton *)aV];
        }
    }
    
    //3. 手势结束时，隐藏屏幕中间的showIndexLB
    if (panGR.state == UIGestureRecognizerStateEnded) {
        self.currentIndexShowLB.hidden = YES;
    }
}
@end


@implementation UIView (PPSectionTitleIndexView)
- (CGFloat)left {
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)top {
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height {
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
@end
