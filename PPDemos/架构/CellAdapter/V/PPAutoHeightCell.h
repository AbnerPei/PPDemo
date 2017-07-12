//
//  PPAutoHeightCell.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/7/6.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#import "PPBaseCell.h"

@interface PPAutoHeightCell : PPBaseCell
/** <#注释#>  */
@property(nonatomic,copy)void(^autoHeightBlock)(PPCellAdapter *adapter);
@end
