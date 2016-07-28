//
//  PPLabel.m
//  PPDemos
//
//  Created by Abner on 16/6/17.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "PPLabel.h"

@implementation PPLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
@synthesize verticalAlignment;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _verticalAlignment = VerticalAlignmentTop;
    }
    return self;
}


- (VerticalAlignment)verticalAlignment
{
    return _verticalAlignment;
}

- (void)setVerticalAlignment:(VerticalAlignment)align
{
    _verticalAlignment = align;
    [self setNeedsDisplay];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    CGRect rc = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    switch (_verticalAlignment) {
        case VerticalAlignmentTop:
            rc.origin.y = bounds.origin.y;
            break;
        case VerticalAlignmentBottom:
            rc.origin.y = bounds.origin.y + bounds.size.height - rc.size.height;
            break;
        case VerticalAlignmentMidele:
        default:
            rc.origin.y = bounds.origin.y + (bounds.size.height - rc.size.height)/2;
            break;
    }
    
    return rc;
}

- (void)drawTextInRect:(CGRect)rect
{
    CGRect rc = [self textRectForBounds:rect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:rc];
}
@end
