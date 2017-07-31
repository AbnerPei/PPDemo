//
//  ModalInterActiveTransitionAnimation.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/31.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalInterActiveTransitionAnimation : UIPercentDrivenInteractiveTransition
@property(nonatomic,assign)BOOL interacting;
- (void)wireToViewController:(UIViewController*)viewController;
@end
