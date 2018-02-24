//
//  PPLabel.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2018/1/12.
//  Copyright © 2018年 PPAbner. All rights reserved.
//

#import "PPLabel.h"

@implementation PPLabel
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _verticalAlignment = PPTextVerticalAlignmentCenter;
    }
    return self;
}
-(void)setVerticalAlignment:(PPTextVerticalAlignment)verticalAlignment
{
    _verticalAlignment = verticalAlignment;
    [self setNeedsDisplay];
}
- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (_verticalAlignment) {
        case PPTextVerticalAlignmentTop:
            textRect.origin.y = bounds.origin.y;
            break;
        case PPTextVerticalAlignmentBottom:
            textRect.origin.y = bounds.origin.y + bounds.size.height - textRect.size.height;
            break;
        case PPTextVerticalAlignmentCenter:
        default:
            textRect.origin.y = bounds.origin.y + (bounds.size.height - textRect.size.height) / 2.0;
    }
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
@end
