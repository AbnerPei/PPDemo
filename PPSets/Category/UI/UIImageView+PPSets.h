//
//  UIImageView+PPSets.h
//  PPDemos
//
//  Created by Abner on 2016/10/17.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (PPSets)

@end


/* 自动识别人脸到中央 [慎用吧，个人觉得测试多了就没希望了]
 * https://github.com/Julioacarrettoni/UIImageView_FaceAwareFill
 */
@interface UIImageView (FaceAwareFill)

//Ask the image to perform an "Aspect Fill" but centering the image to the detected faces
//Not the simple center of the image
- (void)pp_faceAwareFill;

@end
