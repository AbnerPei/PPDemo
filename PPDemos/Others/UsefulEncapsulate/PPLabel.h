//
//  PPLabel.h
//  PPDemos
//
//  Created by Abner on 16/6/17.
//  Copyright © 2016年 PPAbner. All rights reserved.
//  label上的文字上下位置对齐方式【encapsulate [ɪn'kæpsjʊleɪt; en-] 封装】

//参考链接：http://blog.csdn.net/yexiaozi_007/article/details/8636522
//UITextField,UILabel的复写方法: http://www.360doc.com/content/14/0517/16/16257530_378529276.shtml
//label加动画，类似转轴数字： https://github.com/MellongLau/AMAnimatedNumber
//抽奖三个数字一样的转轴：https://github.com/jonathantribouharet/JTNumberScrollAnimatedView

//iOS UIWindow基本介绍: http://blog.csdn.net/zhonggaorong/article/details/51200690

// iOS开发之直播App流程介绍，直播资料收集汇总，视频推流，视频拉流，SMTP、RTMP、HLS、 PLPlayerKit: http://blog.csdn.net/zhonggaorong/article/details/51483282

//iOS开发学习之YYKit中YYText的深入解析，YYTextShadow的代码解析:http://blog.csdn.net/zhonggaorong/article/details/51482738
typedef enum {
    VerticalAlignmentTop = 0,
    VerticalAlignmentMidele,
    VerticalAlignmentBottom,
    VerticalAlignmentMax
}VerticalAlignment;
#import <UIKit/UIKit.h>

@interface PPLabel : UILabel
{
    VerticalAlignment _verticalAlignment;
}

@property (nonatomic, assign)VerticalAlignment verticalAlignment;
@end
