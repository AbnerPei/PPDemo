//
//  PPCategoryMacros.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/6/22.
//  Copyright © 2017年 PPAbner. All rights reserved.
//

#ifndef PPCategoryMacros_h
#define PPCategoryMacros_h

#define PPVersion_Category(version)     ([[[UIDevice currentDevice] systemVersion] floatValue] >= version ? YES : NO)

#define KSystemVersionEight  1

//typedef void(^calculateBlock)(CGSize size,NSUInteger lineCount);

#import "NSObject+CalculateSize.h"

//label
#import "YYLabel+MakeLB.h"
#import "YYLabel+Attributed.h"


#import "UIView+SpecialUI.h"

//UIImageView
#import "UIImageView+MakeImgV.h"


//UIFont
#import "UIFont+NSNumberNSStringUIFont.h"


//UIColor
#import "UIColor+SpecialAttributedString.h"

//UITableView
#import "UITableView+MakeTableV.h"


//UITableViewCell
#import "UITableViewCell+CellMake.h"



//字符串
#import "NSMutableAttributedString+EasilyMake.h"

//NSObject
#import "NSObject+GCD.h"


#endif /* PPCategoryMacros_h */
