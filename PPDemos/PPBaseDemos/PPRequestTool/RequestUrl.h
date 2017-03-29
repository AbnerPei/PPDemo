//
//  RequestUrl.h
//  MJDemos
//
//  Created by Abner on 16/6/13.
//  Copyright © 2016年 PPAbner. All rights reserved.
//
typedef NS_ENUM(NSInteger,PPMissBaiSiCategoryType){
    //全部
    PPMissBaiSiCategoryTypeAll = 1,
    //图片
    PPMissBaiSiCategoryTypePicture = 10,
    //段子
    PPMissBaiSiCategoryTypeWord = 29,
    //声音
    PPMissBaiSiCategoryTypeVoice = 31,
    //视频
    PPMissBaiSiCategoryTypeVideo = 41
};
#ifndef RequestUrl_h
#define RequestUrl_h

//百思姐图片
#define K_Url_MissBaisiBaseUrl @"http://api.budejie.com"

//简友
#define K_Url_JianFriendEPeiUrl @"http://www.epeimall.com"



#endif /* RequestUrl_h */
