//
//  PPRealmHelper.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPRealmHelper.h"

@implementation PPRealmHelper
+(RLMRealm *)pp_rlm_saveModelWithRealmName:(NSString *)realmName
{
    RLMRealmConfiguration *defaultConfiguration = [RLMRealmConfiguration defaultConfiguration];
    defaultConfiguration.fileURL = getURLWithRealmName(realmName);
    [RLMRealmConfiguration setDefaultConfiguration:defaultConfiguration];
    
    RLMRealm *realm = [RLMRealm realmWithConfiguration:defaultConfiguration error:nil];
    return realm;
}
+(void)pp_rlm_removeDefaultFile
{
    RLMRealmConfiguration *defaultConfiguration = [RLMRealmConfiguration defaultConfiguration];
    [[NSFileManager defaultManager]removeItemAtURL:defaultConfiguration.fileURL error:nil];
}
+(void)pp_rlm_removeFileWithRealmName:(NSString *)realmName
{
    [[NSFileManager defaultManager]removeItemAtURL:getURLWithRealmName(realmName) error:nil];
}

static NSURL *getURLWithRealmName(NSString *realmName){
    RLMRealmConfiguration *defaultConfiguration = [RLMRealmConfiguration defaultConfiguration];
    NSURL *realmParentURL = [defaultConfiguration.fileURL URLByDeletingLastPathComponent];
    NSString *finalRealmName = realmName;
    if (finalRealmName.length == 0) {
        finalRealmName = [NSString stringWithFormat:@"%@.realm",@"JRRealmDefault"];
    }else{
        if (![realmName containsString:@".realm"]) {
            finalRealmName = [NSString stringWithFormat:@"%@.realm",realmName];
        }
    }
    NSURL *savedURL = [realmParentURL URLByAppendingPathComponent:finalRealmName];
    
    return savedURL;
}
@end
