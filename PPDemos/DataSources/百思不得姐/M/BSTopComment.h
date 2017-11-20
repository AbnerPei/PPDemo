//
//  BSTopComment.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/19.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Realm/Realm.h>
#import "BSUser.h"

@interface BSTopComment : RLMObject
@property NSNumber<RLMInt> *hate_count;
@property NSNumber<RLMInt> *like_count;
@property NSString *commentId;
@property NSString *comment;
@property BSUser *u;
@end
RLM_ARRAY_TYPE(BSTopComment)
