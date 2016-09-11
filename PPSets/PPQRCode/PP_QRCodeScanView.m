//
//  PP_QRCodeScanView.m
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/5/22.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#import "PP_QRCodeScanView.h"
#import "UIView+PP_Frame.h"

@interface PP_QRCodeScanView()

/*! 记录当前线条绘制的位置 */
@property (nonatomic,assign) CGPoint position;
/*! 定时器 */
@property (nonatomic,strong)NSTimer  *timer;

@end

@implementation PP_QRCodeScanView

- (void)drawRect:(CGRect)rect {
    CGPoint newPosition = self.position;
    newPosition.y += 1;
    
    //判断y到达底部，从新开始下降
    if (newPosition.y > rect.size.height) {
        newPosition.y = 0;
    }
    
    //重新赋值position
    self.position = newPosition;
    
    // 绘制图片
    UIImage *image = [UIImage imageNamed:@"line"];
    
    [image drawAtPoint:self.position];
}

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        
        UIImageView *areaView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"frame_icon"]];
        areaView.width = self.width;
        areaView.height = self.height;
        [self addSubview:areaView];
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
    }
    
    return self;
}

-(void)pp_startAnimaion{
    [self.timer setFireDate:[NSDate date]];
}

-(void)pp_stopAnimaion{
    [self.timer setFireDate:[NSDate distantFuture]];
}

@end
