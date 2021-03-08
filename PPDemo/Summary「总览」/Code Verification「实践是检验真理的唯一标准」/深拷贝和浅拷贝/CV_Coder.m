//
//  CV_Coder.m
//  PPDemo
//
//  Created by AbnerPei on 2021/3/8.
//

#import"CV_Coder.h"

@interface CV_Coder()<NSCopying, NSMutableCopying>

@end

@implementation CV_Coder
- (instancetype)initWithTitle:(NSString *)title subTitle:(NSMutableString *)subTitle norArray:(NSArray *)array mutArrry:(NSMutableArray *)mutArray
{
    if (self = [super init]) {
        _title = title;
        _subTitle = subTitle;
        _norArray = array;
        _mutArray = mutArray;}return self;
}

- (id)copyWithZone:(nullable NSZone *)zone
{
    CV_Coder *model = [[[self class] allocWithZone:zone] init];
    model.title = [self.title copyWithZone:zone];
    model.subTitle = [self.subTitle copyWithZone:zone];
    model.norArray = [self.norArray copyWithZone:zone];
    model.mutArray = [self.mutArray copyWithZone:zone];
    return model;
    
}

- (id)mutableCopyWithZone:(NSZone *)zone
{
    CV_Coder *model = [[[self class] allocWithZone:zone] init];
    model.title = [self.title mutableCopyWithZone:zone];
    model.subTitle = [self.subTitle mutableCopyWithZone:zone];
    model.norArray = [self.norArray mutableCopyWithZone:zone];
    model.mutArray = [self.mutArray mutableCopyWithZone:zone];
    return model;
}
@end



@implementation CV_Person

//#pragma mark --- 伪代码
//- (void)setNameCopy:(NSString *)nameCopy
//{
//    [_nameCopy release];
//    _nameCopy = [nameCopy copy];
//}
//
//- (void)setNameStrong:(NSString *)nameStrong
//{
//    [_nameStrong release];
//    _nameStrong = nameStrong;
//}

@end


@implementation CV_User


@end
