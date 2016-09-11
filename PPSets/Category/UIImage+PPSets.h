//
//  UIImage+PPSets.h
//  PPDemos
//
//  Created by Abner on 16/9/8.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>
//blur<
#import <Accelerate/Accelerate.h>
#import <QuartzCore/QuartzCore.h>
//blur>

@interface UIImage (PPSets)
/**001-全屏截图*/
+ (UIImage *)pp_shotScreen;

/**002-截取view生成一张图片*/
+ (UIImage *)pp_shotWithView:(UIView *)view;

/**003-截取view中某个区域生成一张图片*/
+ (UIImage *)pp_shotWithView:(UIView *)view scope:(CGRect)scope;

/**004-压缩图片到指定尺寸大小*/
+ (UIImage *)pp_compressOriginalImage:(UIImage *)image toSize:(CGSize)size;

/**005-压缩图片到指定文件大小*/
+ (NSData *)pp_compressOriginalImage:(UIImage *)image toMaxDataSizeKBytes:(CGFloat)size;

//------------滤镜--------------------\\
// 怀旧 --> CIPhotoEffectInstant                         单色 --> CIPhotoEffectMono
// 黑白 --> CIPhotoEffectNoir                            褪色 --> CIPhotoEffectFade
// 色调 --> CIPhotoEffectTonal                           冲印 --> CIPhotoEffectProcess
// 岁月 --> CIPhotoEffectTransfer                        铬黄 --> CIPhotoEffectChrome
// CILinearToSRGBToneCurve, CISRGBToneCurveToLinear, CIGaussianBlur, CIBoxBlur, CIDiscBlur, CISepiaTone, CIDepthOfField
/**006-对图片进行滤镜处理*/
+ (UIImage *)pp_filterWithOriginalImage:(UIImage *)image filterName:(NSString *)name;

/**007-对图片进行模糊处理*/
// CIGaussianBlur ---> 高斯模糊
// CIBoxBlur      ---> 均值模糊(Available in iOS 9.0 and later)
// CIDiscBlur     ---> 环形卷积模糊(Available in iOS 9.0 and later)
// CIMedianFilter ---> 中值模糊, 用于消除图像噪点, 无需设置radius(Available in iOS 9.0 and later)
// CIMotionBlur   ---> 运动模糊, 用于模拟相机移动拍摄时的扫尾效果(Available in iOS 9.0 and later)
+ (UIImage *)pp_blurWithOriginalImage:(UIImage *)image blurName:(NSString *)name radius:(NSInteger)radius;


@end


@interface UIImage (PPColor)
+ (UIImage *)pp_imageWithColor:(UIColor *)color size:(CGSize)size;

/** 根据颜色返回一张图片 */
+ (UIImage *)pp_imageWithColor:(UIColor *)color;

/**
 *  008-调整图片饱和度, 亮度, 对比度
 *
 *  @param image      目标图片
 *  @param saturation 饱和度
 *  @param brightness 亮度: -1.0 ~ 1.0
 *  @param contrast   对比度
 *
 */
+ (UIImage *)pp_colorControlsWithOriginalImage:(UIImage *)image
                                    saturation:(CGFloat)saturation
                                    brightness:(CGFloat)brightness
                                      contrast:(CGFloat)contrast;

@end


static const NSString *DSRoundImagePreString = @"DSIsRound";

@interface UIImage (Blurr)

/** 图片模糊效果 */
- (UIImage*)PP_blurredImage:(CGFloat)blurAmount;// 0.0 to 1.0

@end

@interface UIImage (DSRoundImage)
//  简书链接：http://www.jianshu.com/p/c509d7b1ef54
//  GitHub: https://github.com/walkdianzi/DSRoundedImageArticle/tree/master

/**
 *  主要SDWebImage里使用，key会缓存key
 *
 *  @param image 原始图片
 *  @param key   缓存key
 *
 *  @return 圆角图片
 */
+ (id)pp_createRoundedRectImage:(UIImage*)image withKey:(NSString *)key;


+ (id)pp_createRoundedRectImage:(UIImage*)image size:(CGSize)size radius:(int)radius;
@end

