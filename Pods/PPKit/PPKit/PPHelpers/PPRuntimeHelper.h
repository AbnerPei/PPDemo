//
//  PPRuntimeHelper.h
//  PPKitExamples
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/21.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PPRuntimeHelper : NSObject
/** 根据类名打印类的所有属性名 */
+(void)pp_hrt_printIvarListWithClass:(Class)yourClass;
@end
