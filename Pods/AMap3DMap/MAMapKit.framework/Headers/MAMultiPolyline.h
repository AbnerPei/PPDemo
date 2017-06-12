//
//  MAMultiPolyline.h
//  MapKit_static
//
//  Created by yi chen on 12/11/15.
//  Copyright © 2016 Amap. All rights reserved.
//

#import "MAConfig.h"
#import "MAPolyline.h"

///此类用于定义一个由多个点相连的多段线，绘制时支持分段采用不同颜色（纹理）绘制，点与点之间尾部相连但第一点与最后一个点不相连, 通常MAMultiPolyline是MAMultiColoredPolylineRenderer（分段颜色绘制）或MAMultiTexturePolylineRenderer（分段纹理绘制）的model
@interface MAMultiPolyline : MAPolyline

///绘制索引数组(纹理、颜色索引数组), 成员为NSNumber, 且为非负数
@property (nonatomic, strong) NSArray *drawStyleIndexes;

/**
 * @brief 分段绘制，根据map point数据生成多段线
 * 
 * 分段纹理绘制：其对应的MAMultiTexturePolylineRenderer必须使用 - (BOOL)loadStrokeTextureImages:(NSArray *)textureImages; 加载纹理图片, 否则使用默认的灰色纹理绘制
 *
 * 分段颜色绘制：其对应的MAMultiColoredPolylineRenderer必须设置strokeColors属性
 *
 * @param points           指定的直角坐标点数组，注意：如果有连续重复点，需要去重处理，只保留一个，否则会导致绘制有问题。
 * @param count            坐标点的个数
 * @param drawStyleIndexes 纹理索引数组(颜色索引数组), 成员为NSNumber, 且为非负数。例子：[1,3,6] 表示 0-1使用第一种颜色\纹理，1-3使用第二种，3-6使用第三种，6-最后使用第四种
 * @return 生成的折线对象
 */
+ (instancetype)polylineWithPoints:(MAMapPoint *)points count:(NSUInteger)count drawStyleIndexes:(NSArray*) drawStyleIndexes;

/**
 * @brief 分段绘制，根据经纬度坐标数据生成多段线
 *
 * 分段纹理绘制：其对应的MAMultiTexturePolylineRenderer必须使用 - (BOOL)loadStrokeTextureImages:(NSArray *)textureImages; 加载纹理图片, 否则使用默认的灰色纹理绘制
 *
 * 分段颜色绘制：其对应的MAMultiColoredPolylineRenderer必须设置strokeColors属性
 *
 * @param coords           指定的经纬度坐标点数组，注意：如果有连续重复点，需要去重处理，只保留一个，否则会导致绘制有问题。
 * @param count            坐标点的个数
 * @param drawStyleIndexes 纹理索引数组(颜色索引数组), 成员为NSNumber, 且为非负数。例子：[1,3,6] 表示 0-1使用第一种颜色\纹理，1-3使用第二种，3-6使用第三种，6-最后使用第四种
 * @return 生成的折线对象
 */
+ (instancetype)polylineWithCoordinates:(CLLocationCoordinate2D *)coords count:(NSUInteger)count drawStyleIndexes:(NSArray*) drawStyleIndexes;

/**
 * @brief 重新设置坐标点. since 5.0.0
 * @param points 指定的直角坐标点数组,C数组，内部会做copy，调用者负责内存管理。注意：如果有连续重复点，需要去重处理，只保留一个，否则会导致绘制有问题。
 * @param count 坐标点的个数
 * @param drawStyleIndexes 纹理索引数组(颜色索引数组), 成员为NSNumber, 且为非负数。例子：[1,3,6] 表示 0-1使用第一种颜色\纹理，1-3使用第二种，3-6使用第三种，6-最后使用第四种
 * @return 是否设置成功
 */
- (BOOL)setPolylineWithPoints:(MAMapPoint *)points
                        count:(NSUInteger)count
             drawStyleIndexes:(NSArray*)drawStyleIndexes;

/**
 * @brief 重新设置坐标点. since 5.0.0
 * @param coords 指定的经纬度坐标点数组,C数组，内部会做copy，调用者负责内存管理。注意：如果有连续重复点，需要去重处理，只保留一个，否则会导致绘制有问题。
 * @param count 坐标点的个数
 * @param drawStyleIndexes 纹理索引数组(颜色索引数组), 成员为NSNumber, 且为非负数。例子：[1,3,6] 表示 0-1使用第一种颜色\纹理，1-3使用第二种，3-6使用第三种，6-最后使用第四种
 * @return 是否设置成功
 */
- (BOOL)setPolylineWithCoordinates:(CLLocationCoordinate2D *)coords
                             count:(NSUInteger)count
                  drawStyleIndexes:(NSArray*)drawStyleIndexes;

@end
