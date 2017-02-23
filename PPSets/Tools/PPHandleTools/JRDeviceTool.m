//
//  JRDeviceTool.m
//  JRTianTong
//
//  Created by ╰莪呮想好好宠Nǐつ on 2017/2/21.
//  Copyright © 2017年 Guda wei. All rights reserved.
//

#import "JRDeviceTool.h"

@implementation JRDeviceTool
+(NSString *)jr_getAppName
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    return [infoDictionary objectForKey:@"CFBundleDisplayName"];
}


/*
 
 {
 BuildMachineOSBuild = 16C67;
 CFBundleDevelopmentRegion = "zh_CN";
 CFBundleDisplayName = "\U4eca\U65e5\U51fa\U884c";
 CFBundleExecutable = JRTianTong;
 CFBundleIcons =     {
 CFBundlePrimaryIcon =         {
 CFBundleIconFiles =             (
 AppIcon20x20,
 AppIcon29x29,
 AppIcon40x40,
 AppIcon60x60
 );
 };
 };
 CFBundleIdentifier = "com.jinritianxiatong.shanglv";
 CFBundleInfoDictionaryVersion = "6.0";
 CFBundleName = JRTianTong;
 CFBundleNumericVersion = 19103744;
 CFBundlePackageType = APPL;
 CFBundleShortVersionString = "1.2.3";
 CFBundleSupportedPlatforms =     (
 iPhoneOS
 );
 CFBundleURLTypes =     (
 {
 CFBundleTypeRole = Editor;
 CFBundleURLSchemes =             (
 JRTianTong
 );
 },
 {
 CFBundleTypeRole = Editor;
 CFBundleURLName = weixin;
 CFBundleURLSchemes =             (
 wxa39cac53ca8bebd1
 );
 }
 );
 CFBundleVersion = "1.2.3";
 DTCompiler = "com.apple.compilers.llvm.clang.1_0";
 DTPlatformBuild = 14C89;
 DTPlatformName = iphoneos;
 DTPlatformVersion = "10.2";
 DTSDKBuild = 14C89;
 DTSDKName = "iphoneos10.2";
 DTXcode = 0821;
 DTXcodeBuild = 8C1002;
 LSApplicationQueriesSchemes =     (
 alipayshare,
 alipay,
 weixin,
 wechat
 );
 LSRequiresIPhoneOS = 1;
 MinimumOSVersion = "7.0";
 NSAppTransportSecurity =     {
 NSAllowsArbitraryLoads = 1;
 };
 NSCalendarsUsageDescription = "\U8bf7\U5141\U8bb8\U8bbf\U95ee\Uff0c\U4ee5\U4fbf\U66f4\U597d\U4e3a\U4f60\U670d\U52a1";
 NSContactsUsageDescription = "\U8bf7\U5141\U8bb8\U8bbf\U95ee\Uff0c\U4ee5\U4fbf\U66f4\U597d\U4e3a\U4f60\U670d\U52a1";
 NSLocationAlwaysUsageDescription = "\U8bf7\U5141\U8bb8\U8bbf\U95ee\Uff0c\U4ee5\U4fbf\U66f4\U597d\U4e3a\U4f60\U670d\U52a1";
 NSLocationUsageDescription = "\U8bf7\U5141\U8bb8\U8bbf\U95ee\Uff0c\U4ee5\U4fbf\U66f4\U597d\U4e3a\U4f60\U670d\U52a1";
 NSLocationWhenInUseUsageDescription = "\U8bf7\U5141\U8bb8\U8bbf\U95ee\Uff0c\U4ee5\U4fbf\U66f4\U597d\U4e3a\U4f60\U670d\U52a1";
 "RSA private key" = "MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBAMeG24aHNjLImg+dNYEwkj+of8o9ockEd/fsNyjxCHaYffyFRl4mqGbIBTmslOtMKM5aVW7zBPBVB6QHBlC+5H3hFjWD+57JmyzLulcbUGyzK2lI55vMLpskxQhC0ppG1Jp/vvowg0zUH0P/ZKDr/82KPbIWIyNP0qEGsqbgzZPfAgMBAAECgYBLcg3eL5Bp4XqHvu01XXVfhspTYbykMwFeCL7Ox11o4r541rhF754rxyRaq4xf8JtZc8TsQA41BiHufw1/SL9CwnYuEwsCOd8UY0EcX/Lb4PGfS8qRYyrTOjIWt0dLcikF4C8s8RwLfbp+nj5q6edZFDU6/NzLI1uu3n/Iz7OVoQJBAPUzjV4DTsPQLvt4y6S9vN7KLf1MBP1F5lal4q1rUGPSVq3B449fmWnKLP9nmfkru5WSKu35/0G+18hJLiMU9E8CQQDQUFx0WLltCGIGs/LRtMoiEf6G7+znwxF1i3Pf6CoVtME9nHdJ+ItN7HWBivIjvZdWXMGDTHCsuXwildE3fjNxAkBmHVMJTP1XZPK7/YFpmS735WEjtK37QEn92dW9/QwcljNM54s6YUjFmtIEh4PDFihn0NiaBNv96Fl66qcRKx/XAkBKnr6/npitifczV3p/zDcsBS4bwA4o5yN168JSTqPkqp8eJtJEWRftjep5wQAD9YIkmY1oLxWdicQBz5DmQ/rBAkEAwLZNTNx9VOE9sW34EUfdYyiPUKWXdqCVAqi8qVgh1SsU8CtkEeML7Yktdnz3wjMzOIQ+vemxVXhdm0l5hm6fQQ==";
 "RSA public key" = "MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCGhJCDvVU21evAr/HppSQ1fVtwbjsjBYafV7N8zEBcSNUDzMAdy6pzZ7P+5GML6Cj+tFXZvV6hgzdv1v0aGGXoGE7P2QnpbaGMlC6tU7M6GEns9xZa0CaiclTgoOTx2/1ytt0BKLwKrpVj8hkrXhNhVmwf3XxGdTI/jz55gNIj6QIDAQAB";
 UIDeviceFamily =     (
 1
 );
 UILaunchImageFile = "LaunchImage-1";
 UILaunchImages =     (
 {
 UILaunchImageMinimumOSVersion = "8.0";
 UILaunchImageName = "LaunchImage-1-800-Portrait-736h";
 UILaunchImageOrientation = Portrait;
 UILaunchImageSize = "{414, 736}";
 },
 {
 UILaunchImageMinimumOSVersion = "8.0";
 UILaunchImageName = "LaunchImage-1-800-667h";
 UILaunchImageOrientation = Portrait;
 UILaunchImageSize = "{375, 667}";
 },
 {
 UILaunchImageMinimumOSVersion = "7.0";
 UILaunchImageName = "LaunchImage-1-700-568h";
 UILaunchImageOrientation = Portrait;
 UILaunchImageSize = "{320, 568}";
 }
 );
 UIMainStoryboardFile = Main;
 UIRequiredDeviceCapabilities =     (
 armv7
 );
 UISupportedInterfaceOrientations =     (
 UIInterfaceOrientationPortrait
 );
 }
 
 */

@end
