//
//  【API】NSString学习.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/3/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef _API_NSString___h
#define _API_NSString___h
//question:KVC KVO 通知

对于NSStringCompareOptions，大家可以看看系统的说明：

enum{
    NSCaseInsensitiveSearch = 1,//不区分大小写比较
    NSLiteralSearch = 2,//区分大小写比较
    NSBackwardsSearch = 4,//从字符串末尾开始搜索
    NSAnchoredSearch = 8,//搜索限制范围的字符串
    NSNumbericSearch = 64//按照字符串里的数字为依据，算出顺序。例如 Foo2.txt < Foo7.txt < Foo25.txt
    //以下定义高于 mac os 10.5 或者高于 iphone 2.0 可用
    ,
    NSDiacriticInsensitiveSearch = 128,//忽略 "-" 符号的比较
    NSWidthInsensitiveSearch = 256,//忽略字符串的长度，比较出结果
    NSForcedOrderingSearch = 512//忽略不区分大小写比较的选项，并强制返回 NSOrderedAscending 或者 NSOrderedDescending
    //以下定义高于 iphone 3.2 可用
    ,
    NSRegularExpressionSearch = 1024//只能应用于 rangeOfString:..., stringByReplacingOccurrencesOfString:...和 replaceOccurrencesOfString:... 方法。使用通用兼容的比较方法，如果设置此项，可以去掉 NSCaseInsensitiveSearch 和 NSAnchoredSearch
}


#endif /* _API_NSString___h */
