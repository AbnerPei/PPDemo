//
//  PPJianFriendRequest.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/29.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

typedef NS_ENUM(NSInteger,PPJianFriendName) {
    PPJianFriendNameEPei
};
#import "YTKRequest.h"

@interface PPJianFriendRequest : YTKRequest

-(id)initWithJianFriendName:(PPJianFriendName)name;

@end
