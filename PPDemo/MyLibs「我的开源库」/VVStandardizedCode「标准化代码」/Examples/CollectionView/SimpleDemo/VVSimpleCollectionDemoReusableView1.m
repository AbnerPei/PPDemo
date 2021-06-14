//
//  VVSimpleCollectionDemoReusableView1.m
//  PPDemo
//
//  Created by AbnerPei on 2021/6/14.
//

#import "VVSimpleCollectionDemoReusableView1.h"

@implementation VVSimpleCollectionDemoReusableView1

+ (CGSize)headerSizeWithModel:(id)model
{
    return CGSizeMake(UIScreen.mainScreen.bounds.size.width, 30);
}

- (void)setupUI
{
    self.backgroundColor = UIColor.purpleColor;
}

@end
