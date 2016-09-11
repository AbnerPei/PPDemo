//
//  UIButton+PPSets.m
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "UIButton+PPSets.h"
#import <objc/runtime.h>
static char btnKey;

@implementation UIButton (PPSets)

@end


@implementation UIButton (PPAction)

-(void)pp_handleEvent:(UIControlEvents )event withBlock:(handleAction)block{
    objc_setAssociatedObject(self, &btnKey, block, OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)clickAction:(UIButton *)button{
    handleAction block =objc_getAssociatedObject(self, &btnKey);
    if (block) {
        block();
    }
}

@end

@implementation UIButton (Timer)

-(void)pp_startTime:(NSInteger )timeout tittle:(NSString *)tittle waitTittle:(NSString *)waitTittle{
    __block NSInteger timeOut=timeout; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeOut<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                [self setTitle:tittle forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
            });
        }else{
            //            int minutes = timeout / 60;
            int seconds = timeOut % 60;
            NSString *strTime = [NSString stringWithFormat:@"%.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                //设置界面的按钮显示 根据自己需求设置
                NSLog(@"____%@",strTime);
                if (waitTittle == nil) {
                    [self setTitle:[NSString stringWithFormat:@"%@",strTime] forState:UIControlStateNormal];
                }else{
                    [self setTitle:[NSString stringWithFormat:@"%@ %@",strTime,waitTittle] forState:UIControlStateNormal];
                }
                self.userInteractionEnabled = NO;
                
            });
            timeOut--;
            
        }
    });
    dispatch_resume(_timer);
}


@end