//
//  BSUser.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/19.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Realm/Realm.h>

@interface BSUserHeader : RLMObject
@property NSString *headerUrl;
@end
RLM_ARRAY_TYPE(BSUserHeader)

@interface BSUser : RLMObject
@property RLMArray<BSUserHeader *><BSUserHeader> *userHeader;
@property NSArray<NSString *> *header;
@property NSString *uid;
@property NSString *name;
@property NSString *sex;
@property NSNumber<RLMBool> *is_vip;
@property NSNumber<RLMBool> *is_v;
@property NSString *room_url;
@property NSString *room_name;
@property NSString *room_role;
@property NSString *room_icon;

@end
RLM_ARRAY_TYPE(BSUser)


