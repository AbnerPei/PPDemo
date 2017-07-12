//
//  PPVerificationCodeView.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/5.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPVerificationCodeView.h"
#define ARC4RAND_MAX 0x100000000

@interface PPVerificationCodeView ()
@property (nonatomic, strong) NSArray *textArray;
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) NSString *codeStr;
/** 是否偏转一点 */
@property(nonatomic,assign)BOOL hasRoated;

@end

@implementation PPVerificationCodeView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addTapGesture];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame hasRoated:(BOOL)hasRoated
{
    self = [self initWithFrame:frame];
    self.hasRoated = hasRoated;
    return self;
}

+(instancetype)pp_withFrame:(CGRect)frame hasRoated:(BOOL)hasRoated
{
    return [[self alloc] initWithFrame:frame hasRoated:hasRoated];
}

-(void)addTapGesture
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(refreshVerificationCode)];
    [self addGestureRecognizer:tap];
}
-(NSArray *)textArray
{
    if (_textArray == nil) {
        _textArray = [NSMutableArray arrayWithObjects:@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"A",@"B",@"C",@"D",@"E",@"F",@"G",@"H",@"I",@"J",@"K",@"L",@"M",@"N",@"O",@"P",@"Q",@"R",@"S",@"T",@"U",@"V",@"W",@"X",@"Y",@"Z",@"a",@"b",@"c",@"d",@"e",@"f",@"g",@"h",@"i",@"j",@"k",@"l",@"m",@"n",@"o",@"p",@"q",@"r",@"s",@"t",@"u",@"v",@"w",@"x",@"y",@"z", nil];
    }
    return _textArray;
}


-(void)refreshVerificationCode
{
    [self getCodeStrAndTellThem];
    [self initImageCodeView];
}

- (void)getCodeStrAndTellThem
{
    for(NSInteger i = 0; i < 4; i++){
        NSInteger index = arc4random() % ([self.textArray count] - 1);
        NSString *oneText = [self.textArray objectAtIndex:index];
        self.codeStr = (i==0)?oneText:[self.codeStr stringByAppendingString:oneText];
    }
    if (self.verificationCodeBlock) {
        self.verificationCodeBlock(self.codeStr);
    }
    if ([self.delegate respondsToSelector:@selector(pp_verificationCodeView:verificationCodeStr:)]) {
        [self.delegate pp_verificationCodeView:self verificationCodeStr:self.codeStr];
    }
    
    [self setValue:self.codeStr forKey:NSStringFromSelector(@selector(verificationCode))];

}
-(void)initImageCodeView{
    
    if (_bgView) {
        [_bgView removeFromSuperview];
    }
    _bgView = [[UIView alloc]initWithFrame:self.bounds];
    [self addSubview:_bgView];
    [_bgView setBackgroundColor:getRandomBgColorWithAlpha(0.5)];
    CGSize textSize = [@"W" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    int randWidth = (self.frame.size.width)/self.codeStr.length - textSize.width;
    int randHeight = self.frame.size.height - textSize.height;
    
    for (int i = 0; i<self.codeStr.length; i++) {
        
        CGFloat px = arc4random()%randWidth + i*(self.frame.size.width-3)/self.codeStr.length;
        CGFloat py = arc4random()%randHeight;
        UILabel * label = [[UILabel alloc] initWithFrame: CGRectMake(px+3, py, textSize.width, textSize.height)];
        label.text = [NSString stringWithFormat:@"%C",[self.codeStr characterAtIndex:i]];
        label.font = [UIFont systemFontOfSize:20];
        if (self.hasRoated) {
            double r = (double)arc4random() / ARC4RAND_MAX * 2 - 1.0f;//随机-1到1
            if (r>0.3) {
                r=0.3;
            }else if(r<-0.3){
                r=-0.3;
            }
            label.transform = CGAffineTransformMakeRotation(r);
        }
        
        [_bgView addSubview:label];
    }
    for (int i = 0; i<10; i++) {
        
        UIBezierPath *path = [UIBezierPath bezierPath];
        CGFloat pX = arc4random() % (int)CGRectGetWidth(self.frame);
        CGFloat pY = arc4random() % (int)CGRectGetHeight(self.frame);
        [path moveToPoint:CGPointMake(pX, pY)];
        CGFloat ptX = arc4random() % (int)CGRectGetWidth(self.frame);
        CGFloat ptY = arc4random() % (int)CGRectGetHeight(self.frame);
        [path addLineToPoint:CGPointMake(ptX, ptY)];
        
        CAShapeLayer *layer = [CAShapeLayer layer];
        layer.strokeColor = getRandomBgColorWithAlpha(0.2).CGColor;//layer的边框色
        layer.lineWidth = 1.0f;
        layer.strokeEnd = 1;
        layer.fillColor = [UIColor clearColor].CGColor;
        layer.path = path.CGPath;
        [_bgView.layer addSublayer:layer];
    }
    
}

static inline UIColor* getRandomBgColorWithAlpha(CGFloat alpha){
    float red = arc4random() % 100 / 100.0;
    float green = arc4random() % 100 / 100.0;
    float blue = arc4random() % 100 / 100.0;
    UIColor *color = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
    return color;
}

@end
