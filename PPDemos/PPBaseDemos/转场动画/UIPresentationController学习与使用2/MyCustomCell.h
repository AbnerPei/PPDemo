//
//  MyCustomCell.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/21.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyCustomCell : UITableViewCell
/** title   */
@property(nonatomic,strong)YYLabel *titleLB;
+(instancetype)cellWithTableView:(UITableView *)tableView;
-(void)setupMyCustomCell:(NSInteger)index isSelected:(BOOL)isSelected;
@end
