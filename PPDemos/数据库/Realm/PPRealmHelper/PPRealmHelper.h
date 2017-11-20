//
//  PPRealmHelper.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface PPRealmHelper : NSObject
+(RLMRealm *)pp_rlm_saveModelWithRealmName:(NSString *)realmName;
+(void)pp_rlm_removeDefaultFile;
+(void)pp_rlm_removeFileWithRealmName:(NSString *)realmName;
@end
