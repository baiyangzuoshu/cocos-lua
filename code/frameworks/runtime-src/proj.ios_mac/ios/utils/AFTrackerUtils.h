#import <Foundation/Foundation.h>

#import <AppsFlyerLib/AppsFlyerLib.h>
#import <UserNotifications/UserNotifications.h>

@interface AFTrackerUtils : NSObject <UIApplicationDelegate, AppsFlyerLibDelegate, UNUserNotificationCenterDelegate> {

}

+ (AFTrackerUtils *)getInstance;

- (void)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options;

- (void)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation;

- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)applicationDidBecomeActive:(UIApplication *)application;

- (void)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray<id <UIUserActivityRestoring>> *restorableObjects))restorationHandler;

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo;

- (void)setCustomerUserID:(NSDictionary *)dict;

- (void)trackEvent:(NSDictionary *)dict;

+ (void)setATT;


@end
