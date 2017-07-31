//
//  ModalViewController.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/31.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaseViewController.h"
@class ModalViewController;
@protocol ModalViewControllerDelegate <NSObject>
-(void)dismissViewController:(ModalViewController *)mcv;
@end

@interface ModalViewController : PPBaseViewController
@property(nonatomic,weak)id<ModalViewControllerDelegate> delegate;

@end
