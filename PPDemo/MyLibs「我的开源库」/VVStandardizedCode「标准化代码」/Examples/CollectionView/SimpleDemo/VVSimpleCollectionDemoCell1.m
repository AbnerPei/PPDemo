//
//  VVSimpleCollectionDemoCell1.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/14.
//

#import "VVSimpleCollectionDemoCell1.h"

@implementation VVSimpleCollectionDemoCell1

+ (CGSize)itemSizeWithModel:(id)model
{
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 50);
}

- (void)setupUI
{
    self.contentView.backgroundColor = UIColor.redColor;
}

@end
