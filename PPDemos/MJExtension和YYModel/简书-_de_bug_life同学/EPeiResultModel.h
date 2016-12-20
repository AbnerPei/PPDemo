//
//  EPeiResultModel.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2016/12/19.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@class EPeiDataModel;

@interface EPeiResultModel : NSObject

/** <#注释#> */
@property (nonatomic,copy) NSString *state_code;
/** <#注释#> */
@property (nonatomic,copy) NSString *msg;
/** <#注释#> */
@property (nonatomic,strong) EPeiDataModel *data;

@end
