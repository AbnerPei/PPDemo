//
//  MACircleRenderer.h
//  MAMapKit
//
//  Created by yin cai on 11-12-30.
//  Copyright © 2016 Amap. All rights reserved.
//

#import "MAConfig.h"
#import "MACircle.h"
#import "MAOverlayPathRenderer.h"

///该类是MACircle的显示圆Renderer,可以通过MAOverlayPathRenderer修改其fill和stroke attributes
@interface MACircleRenderer : MAOverlayPathRenderer

///关联的MAcirlce model
@property (nonatomic, readonly) MACircle *circle;

/**
 * @brief 根据指定圆生成对应的Renderer
 * @param circle 指定的MACircle model
 * @return 生成的Renderer
 */
- (instancetype)initWithCircle:(MACircle *)circle;

/**
 * @brief 当关联circle数据发生变化时(如半径、中心点改变)，调用此接口更新, since 4.6.0
 */
- (void)setNeedsUpdate;

@end
