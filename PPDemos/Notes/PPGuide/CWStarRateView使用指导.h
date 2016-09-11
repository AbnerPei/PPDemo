//
//  CWStarRateView使用指导.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/2/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef CWStarRateView_____h
#define CWStarRateView_____h


#endif /* CWStarRateView_____h */

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"广场";
    /** 星星标 */
    if (!_starRateView) {
        _starRateView=[[CWStarRateView alloc]initWithFrame:CGRectMake(PPMT_SCREENWIDTH-192, 275, 160, 20) numberOfStars:5];
        _starRateView.scorePercent=2.5/5.0;
        [self.view addSubview:_starRateView];
    }
    _starRateView.allowIncompleteStar = YES;
    _starRateView.delegate = self;
    
}

#pragma mark --- CWStarRateViewDelegate
-(void)starRateView:(CWStarRateView *)starRateView scroePercentDidChange:(CGFloat)newScorePercent
{
    NSLog(@"newScorePercent is %f",newScorePercent);
}
