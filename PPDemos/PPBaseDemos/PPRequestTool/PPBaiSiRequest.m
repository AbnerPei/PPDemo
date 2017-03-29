//
//  PPBaiSiRequest.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/3/29.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaiSiRequest.h"

@interface PPBaiSiRequest ()
{
    PPMissBaiSiCategoryType _categoryType;
    NSString *_maxtime;
    NSUInteger _currentPage;
    NSUInteger _perPageCount;
}
@end


@implementation PPBaiSiRequest

-(id)initWithCategoryType:(PPMissBaiSiCategoryType)categoryType maxtime:(NSString *)maxtime currentPage:(NSUInteger)currentPage perPageCount:(NSUInteger)perPageCount
{
    self = [super init];
    if (self) {
        _categoryType = categoryType;
        _maxtime = maxtime;
        _currentPage = currentPage;
        if (perPageCount > 0) {
            _perPageCount = perPageCount;
        }else{
            _perPageCount = 20;
        }
        
    }
    return self;
}
-(NSString *)baseUrl
{
    return K_Url_MissBaisiBaseUrl;
}
-(NSString *)requestUrl
{
    return [NSString stringWithFormat:@"api/api_open.php?a=list&c=data&maxtime=%@&page=%ld&per=%ld&type=%ld",_maxtime,_currentPage,_perPageCount,_categoryType];
}

-(YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGET;
}

//- (YTKResponseSerializerType)responseSerializerType
//{
//    return YTKResponseSerializerTypeJSON;
//}
//
//- (YTKRequestSerializerType)requestSerializerType
//{
//    return YTKRequestSerializerTypeJSON;
//}
@end
