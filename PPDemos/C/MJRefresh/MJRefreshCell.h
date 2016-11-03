//
//  MJRefreshCell.h
//  PPDemos
//
//  Created by Abner on 2016/10/24.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJPicture.h"

@interface MJRefreshCell : UITableViewCell

/** <#note#> */
@property(nonatomic,strong)UIImageView *imageV;
/** <#note#> */
@property(nonatomic,strong)UILabel *lb;

-(void)setupMJRefreshCellData:(MJPicture *)pic;

+(instancetype)cellWithTableView:(UITableView *)tableView;
@end
