//
//  UITableViewCell+ShowAnimations.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/01.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import "UITableViewCell+ShowAnimations.h"

@implementation UITableViewCell (ShowAnimations)

-(void)pp_showAnimationWithAnimationStyle:(UITableViewCellShowAnimationStyle)showAnimationStyle cellHeight:(CGFloat)cellHeight tableView:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath
{
    CGFloat rowHeight = cellHeight;
    CGFloat displayRowFloat = tableView.frame.size.height/rowHeight;
    NSInteger rowCount = [[JRNumberTool jr_Ceilf:[NSString stringWithFormat:@"%f",displayRowFloat] decimalCount:0] integerValue];
    //由下到上
    if (showAnimationStyle == UITableViewCellShowAnimationStyleBottomTop) {
        if (indexPath.row+1 <= rowCount) {
            CGRect originFrame = self.frame;
            CGRect frame = self.frame;
            frame.origin.y = originFrame.origin.y+60;
            self.frame = frame;
            
            NSTimeInterval duration = 0.3;
            
            self.alpha = 0;
            [UIView animateWithDuration:0.1 delay:duration*(indexPath.row) options:UIViewAnimationOptionCurveLinear animations:^{
                self.alpha = 1.0;
            } completion:nil];
            
            [UIView animateWithDuration:duration delay:duration*(indexPath.row) options:UIViewAnimationOptionCurveLinear animations:^{
                self.frame = originFrame;
            } completion:^(BOOL finished) {
                
            }];
            
        }
    }
    

}
@end
