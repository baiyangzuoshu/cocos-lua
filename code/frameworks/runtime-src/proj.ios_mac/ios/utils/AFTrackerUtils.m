#import "AFTrackerUtils.h"
#include "cocos2d.h"

USING_NS_CC;

using namespace std;

static AFTrackerUtils *sharedInstance = nil;
static string appsFlyerDevKey = "";
static string appsAppleid = "";
static int supportAppsFlyerFlag = 2;
static string customerUserId = "";

@implementation AFTrackerUtils

+ (AFTrackerUtils *)getInstance {
    @synchronized (self) {

        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
            [sharedInstance load];
        }
    }

    return sharedInstance;
}

- (void)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
    if ([self isSupportAppsFlyer]) {
        [[AppsFlyerLib shared] handleOpenUrl:url options:options];
    }
}

- (void)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    if ([self isSupportAppsFlyer]) {
        [[AppsFlyerLib shared] handleOpenURL:url sourceApplication:sourceApplication withAnnotation:annotation];
    }
}

- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([self isSupportAppsFlyer]) {
        [AppsFlyerLib shared].appsFlyerDevKey = [NSString stringWithUTF8String:appsFlyerDevKey.c_str()];
        [AppsFlyerLib shared].appleAppID = [NSString stringWithUTF8String:appsAppleid.c_str()];
        [AppsFlyerLib shared].delegate = self;

#ifdef DEBUG
        [AppsFlyerLib shared].isDebug = true;
#endif

        if (@available(iOS 10.0, *)) {
            UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
            center.delegate = self;
            [center requestAuthorizationWithOptions:(UNAuthorizationOptionSound | UNAuthorizationOptionAlert | UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError *_Nullable error) {
                if (granted) {
                    //用户允许了推送权限申请
                } else {
                    //用户拒绝了推送权限申请
                    NSLog(@"用户拒绝了推送授权");
                }
            }];
        } else {
            UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert | UIUserNotificationTypeSound | UIUserNotificationTypeBadge categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        }
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    if ([self isSupportAppsFlyer]) {
        if (customerUserId != "") {
            [[AppsFlyerLib shared] start];
        }

    }
}

- (void)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id <UIUserActivityRestoring>> *restorableObjects))restorationHandler {
    if ([self isSupportAppsFlyer]) {
        [[AppsFlyerLib shared] continueUserActivity:userActivity restorationHandler:restorationHandler];
    }
}

// Report Push Notification attribution data for re-engagements
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [[AppsFlyerLib shared] handlePushNotification:userInfo];
}

+ (void)setATT{
    [[AppsFlyerLib shared]waitForATTUserAuthorizationWithTimeoutInterval:60];
}
- (void)setCustomerUserID:(NSDictionary *)dict {
    if (![self isSupportAppsFlyer]) {
        return;

    }

    NSString *userID = [dict objectForKey:@"id"];

    if (userID == nil) {
        return;
    }

    customerUserId = [userID UTF8String];

    [[AppsFlyerLib shared] setCustomerUserID:userID];
    [[AppsFlyerLib shared] start];
}

- (void)trackEvent:(NSDictionary *)dict {
    if (![self isSupportAppsFlyer]) {
        return;
    }

    NSString *eventName = [dict objectForKey:@"eventName"];
    NSString *values = [dict objectForKey:@"values"];

    if (eventName == nil || values == nil) {
        return;
    }

    NSDictionary *eventValues = [NSJSONSerialization JSONObjectWithData:[values dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];

    if (eventValues == nil) {
        return;
    }

    [[AppsFlyerLib shared] logEvent:eventName withValues:eventValues];
}

- (NSString *)GetAppsFlyerId{
    if (![self isSupportAppsFlyer]) {
        return @"";
    }
    NSLog(@"---afid:%@",[[AppsFlyerLib shared] getAppsFlyerUID]);
    return [[AppsFlyerLib shared] getAppsFlyerUID];
}

- (bool)isSupportAppsFlyer {
    if (supportAppsFlyerFlag == 2) {
        NSString *AFDevKey = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"AFDevKey"];
        NSString *AppleID = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"AppleID"];

        appsFlyerDevKey = [AFDevKey UTF8String];
        appsAppleid = [AppleID UTF8String];

        if (appsFlyerDevKey == "" || appsAppleid == "") {
            supportAppsFlyerFlag = 0;
        } else {
            supportAppsFlyerFlag = 1;
        }
    }

    return (supportAppsFlyerFlag == 1);
}

//Handle Conversion Data (Deferred Deep Link)
- (void)onConversionDataSuccess:(NSDictionary *)conversionInfo {
//    id status = [installData objectForKey:@"af_status"];
//    if([status isEqualToString:@"Non-organic"]) {
//        id sourceID = [installData objectForKey:@"media_source"];
//        id campaign = [installData objectForKey:@"campaign"];
//        NSLog(@"This is a non-organic install. Media source: %@  Campaign: %@",sourceID,campaign);
//    } else if([status isEqualToString:@"Organic"]) {
//        NSLog(@"This is an organic install.");
//    }
}

- (void)onConversionDataFail:(NSError *)error {

}

- (void)onAppOpenAttribution:(NSDictionary *)attributionData {

}

- (void)onAppOpenAttributionFailure:(NSError *)error {

}

- (void)load {
    if (![self isSupportAppsFlyer]) {
        return;
    }
}

- (void)dealloc {
    [super dealloc];
}

@end
