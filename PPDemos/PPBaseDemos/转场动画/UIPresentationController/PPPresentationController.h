//
//  PPPresentationController.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/8/1.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

//可以考虑把这些实现放在VC的category里面
@interface PPPresentationController : UIPresentationController
/** presentedView frame  */
@property(nonatomic)CGRect presentedViewFrame;
-(void)present;

@end
