//
//  PPWCDBMessage.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/3/12.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPWCDBMessage.h"
#import "PPWCDBMessage+WCTTableCoding.h"

@implementation PPWCDBMessage

WCDB_IMPLEMENTATION(PPWCDBMessage)
WCDB_SYNTHESIZE(PPWCDBMessage, localID)
WCDB_SYNTHESIZE(PPWCDBMessage, content)

@end
