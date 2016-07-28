//
//  MJRefresh完全解析与最详细使用指导.h
//  PPDemos
//
//  Created by Abner on 16/6/16.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#ifndef MJRefresh_____________h
#define MJRefresh_____________h

1.最初的MJRefresh使用指导

```
#import "UIScrollView+MJRefresh.h"
/**
 MJ友情提示：
 1. 添加头部控件的方法
 [self.tableView addHeaderWithTarget:self action:@selector(headerRereshing)];
 或者
 [self.tableView addHeaderWithCallback:^{ }];
 
 2. 添加尾部控件的方法
 [self.tableView addFooterWithTarget:self action:@selector(footerRereshing)];
 或者
 [self.tableView addFooterWithCallback:^{ }];
 
 3. 可以在MJRefreshConst.h和MJRefreshConst.m文件中自定义显示的文字内容和文字颜色
 
 4. 本框架兼容iOS6\iOS7，iPhone\iPad横竖屏
 
 5.自动进入刷新状态
 1> [self.tableView headerBeginRefreshing];
 2> [self.tableView footerBeginRefreshing];
 
 6.结束刷新
 1> [self.tableView headerEndRefreshing];
 2> [self.tableView footerEndRefreshing];
 */
```

2.     /*
        //【附】：MJRefresh自定义刷新控件步骤
        // 说明：具体操作参考MJDIYHeader.m,就不一一截图说明
        ① 首先创建一个类（譬如MJDIYHeader），继承自MJRefreshHeader；
        ② 重写方法
        `在`MJRefreshComponent.h`中有下面的提示`
        ```
        #pragma mark - 交给子类们去实现
        /** 初始化 */
#pragma mark 在这里做一些初始化配置（比如添加子控件）
- (void)prepare NS_REQUIRES_SUPER;
/** 摆放子控件frame */
#pragma mark 在这里设置子控件的位置和尺寸
- (void)placeSubviews NS_REQUIRES_SUPER;
/** 当scrollView的contentOffset发生改变的时候调用 */
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
/** 当scrollView的contentSize发生改变的时候调用 */
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
/** 当scrollView的拖拽状态发生改变的时候调用 */
- (void)scrollViewPanStateDidChange:(NSDictionary *)change NS_REQUIRES_SUPER;
③ OK啦！嘿嘿！
//④
//⑤
//⑥
//⑦
//⑧ ⑨ ⑩

*/

#endif /* MJRefresh_____________h */
