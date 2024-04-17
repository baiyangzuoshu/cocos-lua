#import "FacebookUtils.h"
#include "MessageDispatcher.h"
#import <AppTrackingTransparency/AppTrackingTransparency.h>

using namespace std;


static FacebookUtils *sharedInstance = nil;
static string facebookAppId = "";
static string facebookDisplayName = "";
static int supportFacebookFlag = 2;

@implementation FacebookUtils

+ (FacebookUtils *)getInstance {
    @synchronized (self) {

        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
            [sharedInstance load];
        }
    }

    return sharedInstance;
}

- (void)requestIDFA {
    if (@available(iOS 14.0, *)) {
//        [ATTrackingManager requestTrackingAuthorizationWithCompletionHandler:^(ATTrackingManagerAuthorizationStatus status) {
//            // Tracking authorization completed. Start loading ads here.
//            // [self loadAd];
//
//            if ([self isSupportFacebook]) {
//                bool trackingEnabled = (status != ATTrackingManagerAuthorizationStatusDenied);
//                [FBSDKSettings setAdvertiserTrackingEnabled:trackingEnabled];
//            }
//        }];
    } else {

    }
}

- (void)application:(UIApplication *)application openURL:(NSURL *)url options:(NSDictionary<NSString *, id> *)options {
    if ([self isSupportFacebook]) {
        [[FBSDKApplicationDelegate sharedInstance] application:application openURL:url sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey] annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
    }
}

- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if ([self isSupportFacebook]) {
        [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    }
}

- (void)applicationDidBecomeActive {
    if ([self isSupportFacebook]) [FBSDKAppEvents activateApp];
}

- (void)login {
    if (![self isSupportFacebook]) {
        return;
    }

    if ([FBSDKAccessToken currentAccessToken]) {
        [self onLoginSuccess];
        return;
    }

    [loginManager logInWithPermissions:@[@"gaming_user_picture", @"gaming_profile", @"email"] fromViewController:nil handler:^(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            [loginManager logOut];
            [self onLoginFailed];
        } else if ([result isCancelled]) {
            [loginManager logOut];
            [self onLoginFailed];
        } else {
            [self onLoginSuccess];
        }
    }];
}

- (void)onLoginFailed {
    string ret_str = "";
    int ret_code = 0;
    int ret_len = 0;

    MessageDispatcher::getInstance()->callLuaFunction("app/native/AppleLoginHandle.lua", "faceBookLoginCallBackHandle", 6, ret_code, ret_str.c_str(), ret_len);
}

- (void)onLoginSuccess {
    string openid = [[[FBSDKAccessToken currentAccessToken] userID] UTF8String];
    string token = [[[FBSDKAccessToken currentAccessToken] tokenString] UTF8String];

    string ret_str = "";
    int ret_code = 0;
    int ret_len = 0;

    auto dict = @{[NSString stringWithFormat:@"openid"]: [NSString stringWithUTF8String:openid.c_str()], [NSString stringWithFormat:@"token"]: [NSString stringWithUTF8String:token.c_str()]};

    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (jsonData) {
        NSString *jsonString = [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] autorelease];
        ret_str = [jsonString UTF8String];
        ret_code = 1;
        ret_len = (int) ret_str.length();
    }

    MessageDispatcher::getInstance()->callLuaFunction("app/native/AppleLoginHandle.lua", "faceBookLoginCallBackHandle", 6, ret_code, ret_str.c_str(), ret_len);
}

- (void)logout {
    if (![self isSupportFacebook]) {
        return;
    }

    [loginManager logOut];
}

- (void)share:(NSDictionary *)dict {
    if (![self isSupportFacebook]) {
        return;
    }

//    NSString *url = dict[@"url"];
//
//    FBSDKShareLinkContent *content = [[[FBSDKShareLinkContent alloc] init] autorelease];
//    content.contentURL = [NSURL URLWithString:url];
//
//    FBSDKShareDialog *dialog = [[[FBSDKShareDialog alloc] init] autorelease];
//    dialog.fromViewController = UIApplication.sharedApplication.keyWindow.rootViewController;
//    dialog.shareContent = content;
//    dialog.mode = FBSDKShareDialogModeNative;
//    dialog.delegate = self;
//
//    [dialog show];
}

- (void)sharer:(id <FBSDKSharing>)sharer didCompleteWithResults:(NSDictionary *)results {
    MessageDispatcher::getInstance()->callLuaFunction("app/native/AppleLoginHandle.lua", "handleShareContent", 10, 1, "", 0);
}

- (void)sharer:(id <FBSDKSharing>)sharer didFailWithError:(NSError *)error {
    MessageDispatcher::getInstance()->callLuaFunction("app/native/AppleLoginHandle.lua", "handleShareContent", 10, 0, "", 0);
}

- (void)sharerDidCancel:(id <FBSDKSharing>)sharer {

}

- (bool)isSupportFacebook {
    if (supportFacebookFlag == 2) {
        NSString *FacebookAppID = [[NSBundle mainBundle] infoDictionary][[NSString stringWithFormat:@"FacebookAppID"]];
        NSString *FacebookDisplayName = [[NSBundle mainBundle] infoDictionary][[NSString stringWithFormat:@"FacebookDisplayName"]];

        facebookAppId = [FacebookAppID UTF8String];
        facebookDisplayName = [FacebookDisplayName UTF8String];

        if (facebookAppId == "") {
            supportFacebookFlag = 0;
        } else {
            supportFacebookFlag = 1;
        }
    }

    return (supportFacebookFlag == 1);
}

- (void)load {
    if (![self isSupportFacebook]) {
        return;
    }

    //[FBSDKSettings setAppID:[NSString stringWithUTF8String:facebookAppId.c_str()]];
    //[FBSDKSettings setDisplayName:[AppController getAppName]];

    loginManager = [[FBSDKLoginManager alloc] init];
    [loginManager retain];
}

- (void)dealloc {
    [super dealloc];
}

@end
