//
//  MJRefreshCell.m
//  PPDemos
//
//  Created by Abner on 2016/10/24.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import "MJRefreshCell.h"
#import "UIImageView+WebCache.h"

@implementation MJRefreshCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.imageV = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 34, 34)];
        [self.contentView addSubview:self.imageV];
        
        self.lb = [[UILabel alloc]initWithFrame:CGRectMake(45, 5, ScreenWidth-54, 34)];
        [self.contentView addSubview:self.lb];
        
    }
    return self;
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *indetifier = @"MJRefreshCellIdentifier";
    MJRefreshCell *cell = [tableView dequeueReusableCellWithIdentifier:indetifier];
    if (!cell) {
        cell = [[MJRefreshCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indetifier];
    }
    return cell;
}
-(void)setupMJRefreshCellData:(MJPicture *)pic
{
    [self.imageV sd_setImageWithURL:[NSURL URLWithString:pic.profile_image] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        PPLog(@"图片下载设置完成");
    }];
    self.lb.text = pic.name;
}
@end
