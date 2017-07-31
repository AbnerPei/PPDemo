//
//  动画学习资料.h
//  PPDemos
//
//  Created by Abner on 2016/10/21.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#ifndef _______h
#define _______h

1. [iOS学习44之动画](http://www.cnblogs.com/gfxxbk/p/5531887.html)
2. [CALayer设置默认属性](http://www.360doc.com/content/16/0318/15/31697881_543335639.shtml)


自定义图层的2种方法
1. 自定义CALayer的子类,需要显式地调用setNeedsDisplay方法
2. 采用CALayer的代理进行绘制，也需要调用setNeedsDisplay方法
    * 设置代理
    * 调用代理的 drawLayer: inContext 方法进行绘制

#endif /* _______h */
