#import <Foundation/Foundation.h>
//
#import <FBSDKShareKit/FBSDKShareKit.h>
#import <FBSDKCoreKit/FBSDKSettings.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface FacebookUtils : NSObject{
    FBSDKLoginManager *loginManager;
}

+ (FacebookUtils *)getInstance;

- (void)requestIDFA;

- (void)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options;

- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)applicationDidBecomeActive;

- (void)login;

- (void)logout;

- (void)share:(NSDictionary *)dict;
@end
