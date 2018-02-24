//
//  PPCellAdapter.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/11/20.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPCellAdapter.h"

@implementation PPCellAdapter
- (instancetype) init {
    NSLog(@"Use \"initWithDataSource:reuseIdentifier:height:style:\" to create PPCellAdapter instance.");
    return nil;
}

+(instancetype)pp_ca_makeWithDataSource:(id)dataSource
                           reuseIdentifier:(NSString *)reuseIdentifier
                                    height:(CGFloat)height
                                     style:(PPCellAdapterStyle)style
{
    return [[PPCellAdapter alloc]initWithDataSource:dataSource reuseIdentifier:reuseIdentifier height:height style:style];
}
-(instancetype)initWithDataSource:(id)dataSource
                  reuseIdentifier:(NSString *)reuseIdentifier
                           height:(CGFloat)height
                            style:(PPCellAdapterStyle)style
{
    self = [super init];
    if (self) {
        _pp_ca_dataSource = dataSource;
        _pp_ca_reuseIdentifier = reuseIdentifier;
        _pp_ca_height = height;
        _pp_ca_style = style;
    }
    return self;
}
@end
