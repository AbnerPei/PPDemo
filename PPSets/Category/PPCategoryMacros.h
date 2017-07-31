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



//label
#import "YYLabel+MakeLB.h"
#import "YYLabel+Attributed.h"

//UIView
#import "UIView+SpecialUI.h"
#import "UIView+Frame.h"


//UIImageView
#import "UIImageView+MakeImgV.h"

//UIImage
#import "UIImage+ColorAtPixel.h"


//UIFont
#import "UIFont+NSNumberNSStringUIFont.h"


//UIColor
#import "UIColor+SpecialAttributedString.h"

//UITableView
#import "UITableView+MakeTableV.h"


//UITableViewCell
#import "UITableViewCell+CellMake.h"

//UIScreen
#import "UIScreen+EasilySize.h"

//字符串
#import "NSMutableAttributedString+EasilyMake.h"

//NSString
#import "NSString+KeyPath.h"
#import "NSString+CATransitionType.h"


//NSObject
#import "NSObject+GCD.h"
#import "NSObject+CalculateSize.h"

//CAAnimation
#import "CAAnimation+LayerAnimation.h"



#endif /* PPCategoryMacros_h */
