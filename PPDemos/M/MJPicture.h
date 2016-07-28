//
//  MJPicture.h
//  MJDemos
//
//  Created by Abner on 16/6/13.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MJPicture : NSObject

/** 用户名 */
@property(nonatomic,copy)NSString *name;
/** 用户头像URL */
@property(nonatomic,copy)NSString *profile_image;
/** 通过审核时间 */
@property(nonatomic,copy)NSString *passtime;

@end

/*
 
 {
 "info": {
 "vendor": "hide.jie.c",
 "count": 2000,
 "page": 100,
 "maxid": "1465750084",
 "maxtime": "1465750084"
 },
 "list": [
 {
 "id": "18011268",
 "type": "10",
 "text": "你敢在百度上输入这些词吗 ? 输完我就震惊了 !",
 "user_id": "7876902",
 "name": "百思葫芦娃VV二娃",
 "screen_name": "百思葫芦娃VV二娃",
 "profile_image": "http://wimg.spriteapp.cn/profile/large/2016/05/23/574294ce7fe3c_mini.jpg",
 "created_at": "2016-06-13 13:52:03",
 "create_time": "2016-04-11 16:02:45",
 "passtime": "2016-06-13 13:52:03",
 "love": "682",
 "hate": "105",
 "comment": "83",
 "repost": "110",
 "bookmark": "163",
 "bimageuri": "",
 "voiceuri": "",
 "voicetime": "0",
 "voicelength": "0",
 "status": "4",
 "theme_id": "0",
 "theme_name": "",
 "theme_type": "0",
 "videouri": "",
 "videotime": "0",
 "original_pid": "0",
 "cache_version": 2,
 "cai": "105",
 "top_cmt": [ ],
 "weixin_url": "http://a.f.winapp111.net/share/18011268.html?wx.qq.com&appname=",
 "themes": [ ],
 "image0": "http://wimg.spriteapp.cn/ugc/2016/04/11/570b5a2601ba2_1.jpg",
 "image2": "http://wimg.spriteapp.cn/ugc/2016/04/11/570b5a2601ba2_1.jpg",
 "image1": "http://wimg.spriteapp.cn/ugc/2016/04/11/570b5a2601ba2_1.jpg",
 "cdn_img": "http://wimg.spriteapp.cn/ugc/2016/04/11/570b5a2601ba2_1.jpg",
 "is_gif": "0",
 "width": "634",
 "height": "3614",
 "tag": "",
 "t": 1465797123,
 "ding": "682",
 "favourite": "163"
 },
 ]
 }
 */