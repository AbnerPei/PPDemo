//
//  BSTag.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/19.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Realm/Realm.h>

@interface BSTag : RLMObject
@property NSString *name;
@property NSString *image_list;
@property NSInteger tagId;
@end
RLM_ARRAY_TYPE(BSTag)
