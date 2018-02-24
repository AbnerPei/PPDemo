//
//  PPLabel.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/12.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,PPTextVerticalAlignment) {
    PPTextVerticalAlignmentTop,
    PPTextVerticalAlignmentCenter,
    PPTextVerticalAlignmentBottom
};

@interface PPLabel : UILabel
/** 垂直Alignment*/
@property(nonatomic,assign) PPTextVerticalAlignment verticalAlignment;
@end
