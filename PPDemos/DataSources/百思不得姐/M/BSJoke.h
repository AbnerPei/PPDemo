//
//  BSJoke.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/19.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Realm/Realm.h>
#import "BSTag.h"
#import "BSUser.h"
#import "BSTopComment.h"

@interface BSJokeListResultInfo : RLMObject
@property NSNumber<RLMInt> *count;
@property NSString *np;
@end

@interface BSJoke : RLMObject
@property RLMArray<BSTag *><BSTag> *tags;
@property RLMArray<BSTopComment *><BSTopComment> *top_comments;
@property BSUser *u;
/** ?? */
@property NSString *bookmark;
@property NSString *text;
/** 评论 */
@property NSString *comment;
/** 赞 */
@property NSString *up;
/** 踩 */
@property NSString *down;
/** 分享 */
@property NSString *forward;
/** 分享URL */
@property NSString *share_url;
@property NSString *type;
@property NSString *jokeId;
/** 审核通过时间 */
@property NSString *passtime;
@end
RLM_ARRAY_TYPE(BSJoke)

@interface BSJokeListResult : RLMObject
@property BSJokeListResultInfo *info;
@property RLMArray<BSJoke *><BSJoke> *list;
@end



