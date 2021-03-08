//
//  CV_Coder.h
//  PPDemo
//
//  Created by AbnerPei on 2021/3/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CV_Coder : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSMutableString *subTitle;
@property (nonatomic, strong) NSArray *norArray;
@property (nonatomic, strong) NSMutableArray *mutArray;
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSMutableString *)subTitle norArray:(NSArray *)array mutArrry:(NSMutableArray *)mutArray;
@end


@interface CV_Person : NSObject

@property (nonatomic, strong) NSString *nameStrong;

@property (nonatomic, copy) NSString *nameCopy;

@end


@interface CV_User : NSObject

///用户昵称
@property (nonatomic, strong) NSString *nickName;

///用户身份标示（1：认证，0：未认证）
@property (nonatomic, copy) NSString *identifier;

@end

NS_ASSUME_NONNULL_END


