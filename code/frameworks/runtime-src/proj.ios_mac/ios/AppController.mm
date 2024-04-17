/****************************************************************************
 Copyright (c) 2010-2013 cocos2d-x.org
 Copyright (c) 2013-2016 Chukong Technologies Inc.
 Copyright (c) 2017-2018 Xiamen Yaji Software Co., Ltd.
 
 http://www.cocos2d-x.org
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 ****************************************************************************/

#import "AppController.h"
#import "cocos2d.h"
#import "AppDelegate.h"
#import "RootViewController.h"

#import "utils/ApplePay.h"
#import "utils/AppleLoginUtils.h"
#import "utils/FacebookUtils.h"
#import "Openinstall.h"
#import "utils/AFTrackerUtils.h"
#import <DataCollection/TFDataManager.h>
#import "utils/RollLineUtils.h"
#include "MessageDispatcher.h"
#import <AudioToolbox/AudioToolbox.h>
#import<UserNotifications/UNNotificationSettings.h>
#import <AppTrackingTransparency/AppTrackingTransparency.h>

@implementation AppController

@synthesize window;

#pragma mark -
#pragma mark Application lifecycle

static std::string s_appPushToken = "";

// cocos2d application instance
static AppDelegate s_sharedApplication;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    [[FacebookUtils getInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    [[AFTrackerUtils getInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    [AFTrackerUtils setATT];
    // IOS8新系统需要使用新的代码咯
    if([[[UIDevice currentDevice]systemVersion]floatValue] >=8.0){
        [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound|UIUserNotificationTypeAlert|UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }else{
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeBadge)];
    }

    cocos2d::Application *app = cocos2d::Application::getInstance();
    // Initialize the GLView attributes
    app->initGLContextAttrs();
    cocos2d::GLViewImpl::convertAttrs();
    // Override point for customization after application launch.

    // Add the view controller's view to the window and display.
    window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    // Use RootViewController to manage CCEAGLView
    _viewController = [[RootViewController alloc] init];
    _viewController.wantsFullScreenLayout = YES;


    // Set RootViewController to window
    if ([[UIDevice currentDevice].systemVersion floatValue] < 6.0) {
        // warning: addSubView doesn't work on iOS6
        [window addSubview:_viewController.view];
    } else {
        // use this method on ios6
        [window setRootViewController:_viewController];
    }

    [window makeKeyAndVisible];
    
    [RollLineUtils setupLineSDK];

    UIApplication.sharedApplication.statusBarHidden = true;
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    // IMPORTANT: Setting the GLView should be done after creating the RootViewController
    cocos2d::GLView *glview = cocos2d::GLViewImpl::createWithEAGLView((__bridge void *) _viewController.view);
    cocos2d::Director::getInstance()->setOpenGLView(glview);

    //run the cocos2d-x game scene
    app->run();
    
    [Openinstall init];//尽早调用
    return YES;
}
-(BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler{
    [Openinstall setUserActivity:userActivity];
    
    //其他第三方回调；
    [[AFTrackerUtils getInstance] application:application continueUserActivity:userActivity restorationHandler:restorationHandler];
    [RollLineUtils roll_application:application continueUserActivity:userActivity];
    return YES;
}
//支持目前所有版本的iOS
-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    [Openinstall setLinkURL:url];
    [[AFTrackerUtils getInstance] application:application openURL:url sourceApplication:sourceApplication annotation:annotation];
    //其他第三方回调；
    return YES;
}

//iOS9以上，会优先走这个方法
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(nonnull NSDictionary *)options{
    [Openinstall setLinkURL:url];
    //其他第三方回调；
    [[FacebookUtils getInstance] application:app openURL:url options:options];
    [[AFTrackerUtils getInstance] application:app openURL:url options:options];
    [RollLineUtils roll_application:app openURL:url options:options];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
    // We don't need to call this method any more. It will interrupt user defined game pause&resume logic
    /* cocos2d::Director::getInstance()->pause(); */
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
    // We don't need to call this method any more. It will interrupt user defined game pause&resume logic
    [[FacebookUtils getInstance] requestIDFA];
    [[FacebookUtils getInstance] applicationDidBecomeActive];
    [[AFTrackerUtils getInstance] applicationDidBecomeActive:application];
    
    if (@available(iOS 14, *)) {
      [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
        NSLog(@"ATTStatus: %lu", (unsigned long)status);
      }];
    }
    /* cocos2d::Director::getInstance()->resume(); */
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    cocos2d::Application::getInstance()->applicationDidEnterBackground();
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
    cocos2d::Application::getInstance()->applicationWillEnterForeground();
}

- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     See also applicationDidEnterBackground:.
     */
}

// Report Push Notification attribution data for re-engagements
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    [[AFTrackerUtils getInstance] application:application didReceiveRemoteNotification:userInfo];
}
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(nonnull NSData *)deviceToken {
    NSUInteger dataLength = deviceToken.length;
    const unsigned char *dataBuffer = (const unsigned char *) deviceToken.bytes;
    NSMutableString *hexString = [NSMutableString stringWithCapacity:(dataLength * 2)];
    for (int i = 0; i < dataLength; ++i) {
        [hexString appendFormat:@"%02x", dataBuffer[i]];
    }
    NSLog(@"推送token=%@", hexString);
    s_appPushToken = [hexString UTF8String];
}
- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error
{
     NSLog(@"didFailToRegisterForRemoteNotificationsWithError:%@", [error localizedDescription]);
}

+ (void)queryProducts:(NSDictionary *)dict {
    NSString *jsonArrayStr = dict[@"jsonArrayStr"];
    NSLog(@"Apple native查询收费点=%@", jsonArrayStr);
    id arr = [self arrayWithJsonString:jsonArrayStr];
    [[ApplePay getInstance] queryProducts:arr];
}

+ (void)recharge {
    NSLog(@"Apple native查询已付款未兑换的单");
    [[ApplePay getInstance] recharge];
}

+ (void)finishTransaction:(NSDictionary *)dict {
    NSString *transactionIdentifier = dict[@"transactionIdentifier"];
    NSLog(@"Apple native购买核销凭据=%@", transactionIdentifier);
    if (transactionIdentifier != nil) {
        [[ApplePay getInstance] finishTransaction:transactionIdentifier];
    }
}

+ (void)pay:(NSDictionary *)dict {
    NSString *productId = dict[@"productId"];
    NSLog(@"Apple native购买商品ID=%@", productId);
    if (productId != nil) {
        [[ApplePay getInstance] pay:productId];
    }
}
+ (void)vibrate {
    
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    //AudioServicesPlaySystemSoundWithCompletion(1519,^{});
    
}
+ (NSString *)getVersion {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];

    NSString *version = info[@"CFBundleShortVersionString"];

    // NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
    // NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];

    return version;
}

+ (NSString *)getPackageName {
    return [[NSBundle mainBundle] bundleIdentifier];
}

+ (NSString *)getAppName {
    NSDictionary *info = [[NSBundle mainBundle] infoDictionary];

    return info[@"CFBundleDisplayName"];
}

+ (void)facebookLogin {
    [[FacebookUtils getInstance] login];
}

+ (void)facebookLogout {
    [[FacebookUtils getInstance] logout];
}

+ (void)facebookShare:(NSDictionary *)dict {
    [[FacebookUtils getInstance] share:dict];
}

+ (void)appleLogin {
    [AppleLoginUtils.getInstance login];
}
+(int)checkVoiceAuthority{
    AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio];
    //AVAuthoriza
    return (int)authStatus;
//    //权限定义
//    typedef NS_ENUM(NSInteger, AVAuthorizationStatus) {
//        AVAuthorizationStatusNotDetermined = 0, /* 没有询问是否开启麦克风*/
//        AVAuthorizationStatusRestricted    = 1, /* 未授权，家长限制*/
//        AVAuthorizationStatusDenied        = 2, /* 玩家未授权*/
//        AVAuthorizationStatusAuthorized    = 3, /* 玩家授权*/
//    } API_AVAILABLE(macos(10.14), ios(7.0)) __WATCHOS_PROHIBITED __TVOS_PROHIBITED;
}
+ (void)AFSetCustomerUserID:(NSDictionary *)dict {
    [[AFTrackerUtils getInstance] setCustomerUserID:dict];
}

+ (void)AFTrackEvent:(NSDictionary *)dict {
    [[AFTrackerUtils getInstance] trackEvent:dict];
}
+ (NSString *)AFGetAppsFlyerId {
    return [[AFTrackerUtils getInstance] GetAppsFlyerId];
}
+(int)getFringeScreenTop{
    if (@available(iOS 13.0, *)) {
        NSSet *set = [UIApplication sharedApplication].connectedScenes;
        UIWindowScene *windowScene = [set anyObject];
        UIWindow *window = windowScene.windows.firstObject;
        return window.safeAreaInsets.top;
    } else if (@available(iOS 11.0, *)) {
        UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
        return window.safeAreaInsets.top;
    }
    return 0;
}

+(int)copyToClipboard:(NSDictionary *)dict{
    //把char*转换成OC的NSString
    NSString *nsMessage= dict[@"text"];;
    //获得ios的剪切板
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
    //改变剪切板的内容
    pasteboard.string = nsMessage;
    return 0;
}
+ (NSString *)getAppPushToken {
    if (s_appPushToken != "") {
        return [NSString stringWithUTF8String:s_appPushToken.c_str()];
    } else {
        return @"";
    }
}

#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


#if __has_feature(objc_arc)
#else

- (void)dealloc {
    [window release];
    [_viewController release];
    [super dealloc];
}

#endif


//utils function

#pragma mark -json串转换成数组

+ (id)arrayWithJsonString:(NSString *)jsonString {

    if (jsonString == nil) {
        return nil;
    }

    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err = nil;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];

    if (err) {
        NSLog(@"IOS json解析失败：%@", err);
        return nil;
    }
    return arr;
}
+ (BOOL)isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"] || [string isEqualToString:@"null"]) {
        return YES;
    }
    
    return NO;
}
+ (void)initTFDataManager:(NSDictionary *)dict {
    NSString *appKey = dict[@"appKey"];
    NSString *uid = dict[@"user_id"];
    NSString *deviceid = @"";
    [AppController isBlankString:uid];
    [TFDataManager startWithAppKey:appKey deviceId:deviceid uid:[AppController isBlankString:uid] ? @"" : uid success:^{
        NSLog(@"TFDataManager数据打点初始化成功，appKey=%@", appKey);
    }                      failure:^(int errorCode, NSString *_Nonnull errorMessage) {
        NSLog(@"TFDataManager数据打点初始化错误码=%@,原因=%@，appKey=%@", @(errorCode), errorMessage, appKey);
    }];
};

+ (void)uploadTFUserData:(NSDictionary *)dict {
    NSLog(@"TFEvent，userData=%@", dict[@"userData"]);
    [TFDataManager uploadUserData:dict[@"userData"]];
};

+ (void)onTFEventCode:(NSDictionary *)dict {
    NSString *eventCode = dict[@"eventName"];
    NSNumber *value = dict[@"value"] ? dict[@"value"] : @(0);
    NSLog(@"TFEvent，eventCode=%@", eventCode);
    NSLog(@"TFEvent，value=%@", value);
    [TFDataManager onEventCode:eventCode withValue:[value floatValue]];
};

+ (void)onTFEventExtends:(NSDictionary *)dict {
    NSDictionary *extends = dict[@"extends"];
    NSString *eventCode = dict[@"code"];
    NSNumber *value = dict[@"value"] ? dict[@"value"] : @(0);
    [TFDataManager onEventExtends:extends code:eventCode withValue:[value floatValue]];
};

+ (NSString *)getTFDeviceId {
    NSLog(@" getDeviceId，id=%@", [TFDataManager getDeviceId]);
    return [TFDataManager getDeviceId];
};

+ (void)lineLogin {
    [RollLineUtils roll_lineLogin:^(NSDictionary *dict) {
        int ret_code = [dict[@"ret_code"] intValue];
        NSString *retString = dict[@"ret_str"];
        std::string ret_str = retString.UTF8String;
        int ret_len = (int) ret_str.length();
        MessageDispatcher::getInstance()->callLuaFunction("app/native/AppleLoginHandle.lua", "lineLoginCallBackHandle", 1, ret_code, ret_str.c_str(), ret_len);
    }];
}

@end
