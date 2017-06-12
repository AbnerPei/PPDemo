//
//  MyCustomCell.m
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/4/21.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "MyCustomCell.h"

@implementation MyCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self creatMyCustomCell];
    }
    return self;
}
-(void)creatMyCustomCell
{
    self.titleLB = [YYLabel new];
    self.titleLB.frame = CGRectMake(15, 0, ScreenWidth-30, 45);
    self.titleLB.textColor = [UIColor pp_lightGrayColor];
    self.titleLB.textVerticalAlignment = YYTextVerticalAlignmentCenter;
    [self.contentView addSubview:self.titleLB];
}
-(void)setupMyCustomCell:(NSInteger)index isSelected:(BOOL)isSelected
{
    self.titleLB.text = [NSString stringWithFormat:@"ppabner %ld",index];
    if (isSelected) {
        self.titleLB.textColor = [UIColor pp_blueColor];
    }
    else{
        self.titleLB.textColor = [UIColor pp_orangeColor];

    }
}
+(instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString * identifier = @"MyCustomCellIdentifier";
    MyCustomCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[MyCustomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
@end
