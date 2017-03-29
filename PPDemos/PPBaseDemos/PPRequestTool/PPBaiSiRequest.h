//
//  PPBaiSiRequest.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/29.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@interface PPBaiSiRequest : YTKRequest

/**
 发送一个【百思不得姐】的网络请求

 @param categoryType 分类类型 
 @param maxtime 第一次请求成功返回的
 @param currentPage 当前页
 @param perPageCount 每页的数据个数（默认20）
 */
-(id)initWithCategoryType:(PPMissBaiSiCategoryType)categoryType
                  maxtime:(NSString *)maxtime
              currentPage:(NSUInteger)currentPage
             perPageCount:(NSUInteger)perPageCount;

@end
