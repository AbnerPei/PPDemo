//
//  CalendarEventViewController.m
//  PPDemos
//
//  Created by Abner on 2016/10/21.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "CalendarEventViewController.h"
#import "CalendarEvent.h"


@interface CalendarEventViewController ()<CalendarEventDelegate>

@end

@implementation CalendarEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor pp_violetColor];
    
    [self creatBtWithFrame:CGRectMake(10, 70, 190, 40) title:@"1给日历添加一个事件" andTarget:@selector(addEvent)];
    
    [self creatBtWithFrame:CGRectMake(10, 130, ScreenWidth/2-10-50, 40) title:@"2基本的拨打电话" andTarget:@selector(callMe_nomal)];
    
    [self creatBtWithFrame:CGRectMake(ScreenWidth/2-30, 130, ScreenWidth/2-10+30, 40) title:@"3【推荐】用webView拨打电话" andTarget:@selector(callMe_webview)];

    UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(20, 180, ScreenWidth-40, 250)];
    lb.text = @"没进来就会创建一个日历事件\n然后切换到系统对应今天会增加一个事件\n11分钟后会弹出提醒事件\n15分钟后会关闭这个事件";
    lb.numberOfLines = 0;
    lb.font = [UIFont systemFontOfSize:18];
    lb.textColor = [UIColor pp_whiteColor];
    [self.view addSubview:lb];
    
    
}

-(void)creatBtWithFrame:(CGRect)frame title:(NSString *)title andTarget:(SEL)target
{
    UIButton *bt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    bt.frame = frame;
    bt.backgroundColor = [UIColor pp_cyanColor];
    [self.view addSubview:bt];
    [bt setTitle:title forState:UIControlStateNormal];
    [bt addTarget:self action:target forControlEvents:UIControlEventTouchUpInside];
}
-(void)addEvent
{
    NSTimeInterval hour        = 60.f * 10.f;
    NSDate        *currentDate = [NSDate date];
    
    CalendarEvent *event = [CalendarEvent new];
    event.eventTitle     = @"王宝强和马蓉复合你敢信？？？";
    event.startDate      = [NSDate dateWithTimeInterval:hour sinceDate:currentDate];
    event.endDate        = [NSDate dateWithTimeInterval:hour+60*5 sinceDate:currentDate];
    event.alarmDate      = [NSDate dateWithTimeInterval:hour+60 sinceDate:currentDate];
    event.eventLocation  = @"天朝";
    event.delegate       = self;
    [event save];

}

-(void)callMe_nomal
{
    [PPMTHandle pp_callTel:@"13569422574" isUseWebView:NO];
    
}

-(void)callMe_webview
{
    [PPMTHandle pp_callTel:@"13569422574" isUseWebView:YES];
}
- (void)calendarEvent:(CalendarEvent *)event removedStatus:(ECalendarEventStatus)status error:(NSError *)error {
    
    if (status == kCalendarEventAccessSavedSucess) {
        
        NSLog(@"保存成功");
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
