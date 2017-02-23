//
//  PPSizeTool.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/23.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>
#define RTSizeToolsW(w)  ([PPSizeTool rt_getWidth:w])
#define RTSizeToolsH(h)  ([PPSizeTool rt_getHeight:h])

@interface PPSizeTool : NSObject

+(CGFloat)pp_getWidth:(CGFloat)width;
+(CGFloat)pp_getHeight:(CGFloat)height;

@end
