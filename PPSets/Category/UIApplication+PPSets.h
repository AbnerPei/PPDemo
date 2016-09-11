//
//  UIApplication+PPSets.h
//  PPDemos
//
//  Created by ╰莪呮想好好宠Nǐつ on 16/9/11.
//  Copyright © 2016年 PPAbner. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (PPSets)

@end

@interface UIApplication (NetworkActivity)
/*!
 *  @author ╰莪呮想好好宠Nǐつ, 16-03-24 21:03:02
 *  @第一个  https://github.com/mdznr/NetworkActivityIndicator
 */
/*
 This category will automatically keep track of concurrent network activity and display the network activity indicator accordingly.
 */

/// Tell the application that network activity has begun. The network activity indicator will then be shown.
/// Display the network activity indicator to provide feedback when your application accesses the network for more than a couple of seconds. If the operation finishes sooner than that, you don’t have to show the network activity indicator, because the indicator would be likely to disappear before users notice its presence.
- (void)pp_beganNetworkActivity;

/// Tell the application that a session of network activity has begun. The network activity indicator will remain showing or hide automatically depending the presence of other ongoing network activity in the app.
- (void)pp_endedNetworkActivity;
@end