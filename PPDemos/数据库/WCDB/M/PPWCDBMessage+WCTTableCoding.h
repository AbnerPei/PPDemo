//
//  PPWCDBMessage+WCTTableCoding.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/3/13.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPWCDBMessage.h"
#import <WCDB/WCDB.h>

@interface PPWCDBMessage (WCTTableCoding) <WCTTableCoding>
WCDB_PROPERTY(localID)
WCDB_PROPERTY(content)
WCDB_PROPERTY(creatTime)
WCDB_PROPERTY(modifiedTime)
@end

