//
//  UIImage+DSRoundImage使用指导.h
//  MySetsDemo
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/2/29.
//  Copyright © 2016年 い匴了゛僦這様吧へ. All rights reserved.
//

#ifndef UIImage_DSRoundImage_____h
#define UIImage_DSRoundImage_____h

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*-----------本地图片设置圆角-------------*/
    
    UIImage *image = [UIImage createRoundedRectImage:[UIImage imageNamed:@"MouseMi.jpg"] size:CGSizeMake(200, 200) radius:100] ;
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 75,200, 200)];
    [avatarImageView setImage:image];
    [self.view addSubview:avatarImageView];
    
    
    /*-----------网络图片设置圆角-------------*/
    
    
     
     修改SDWebImage代码
     1.找到#import "UIImageView+WebCache.h"
     2.导入UIImage+DSRoundImage.h
     3.添加如下方法：
     - (void)setIsRound:(BOOL)isRound withSize:(CGSize)size;
     4.在import "UIImageView+WebCache.m"文件里添加如下代码：
     - (void)setIsRound:(BOOL)isRound withSize:(CGSize)size
     {
     
     [[SDWebImageManager sharedManager] setCacheKeyFilter:^(NSURL *url) {
     //!!!: 绘制圆角
     if (isRound) {
     NSString *urlStr = [NSString stringWithFormat:@"%@%fx%f%@%@",DSRoundImagePreString,size.width,size.height,DSRoundImagePreString,[url absoluteString]];
     return urlStr;
     }else{
     return [url absoluteString];
     }
     }];
     }
     
     //具体使用如下*
     NSString *imageUrl = @"http://pics.sc.chinaz.com/files/pic/pic9/201311/apic1841.jpg";
     
     //UIImage
     UIImageView  *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 250, 100, 100)];
     [avatarImageView setIsRound:YES withSize:CGSizeMake(100, 100)];
     [avatarImageView sd_setImageWithURL:[NSURL URLWithString:imageUrl]];
     [self.view addSubview:avatarImageView];
     

}

#endif /* UIImage_DSRoundImage_____h */
