//
//  PPJianFriendRequest.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/29.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPJianFriendRequest.h"

@interface PPJianFriendRequest ()
{
    PPJianFriendName _jianFriendName;
}
@end

@implementation PPJianFriendRequest

-(id)initWithJianFriendName:(PPJianFriendName)name
{
    self = [super init];
    if (self) {
        _jianFriendName = name;
    }
    return self;
}
-(NSString *)baseUrl
{
    return @"http://www.epeimall.com";
}
-(NSString *)requestUrl
{
    switch (_jianFriendName) {
        case PPJianFriendNameEPei:
            return @"appapi/GetOrderlist?user_id=81&key=epeimall&pay_status=0&page=3";

            break;
            
        default:
            break;
    }
    return @"";
}

@end
