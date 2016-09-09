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