

#import "RollLineUtils.h"
#import "AppController.h"

@import LineSDK;

@implementation RollLineUtils
+ (void)setupLineSDK {
    [[LineSDKLoginManager sharedManager] setupWithChannelID:@"1657241132" universalLinkURL:nil];
}

+ (void)roll_application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {
    [[LineSDKLoginManager sharedManager] application:app open:url options:options];
}

+ (void)roll_lineLogin:(kGetDictEventHandler)callBack {
    NSSet *permissions = [NSSet setWithObjects:LineSDKLoginPermission.profile, nil];
    [[LineSDKLoginManager sharedManager] loginWithPermissions:permissions inViewController:nil completionHandler:^(LineSDKLoginResult * _Nullable loginResult, NSError * _Nullable error) {
        if (error) {
            NSLog(@"---error:%@", error);
            NSNumber *ret_code = @0;
            NSDictionary *dict = @{@"ret_str": @"", @"ret_code": ret_code};
            if (callBack) {
                callBack(dict);
            }
        } else {
            NSLog(@"---userID:%@", loginResult.userProfile.userID);
            NSLog(@"---displayName:%@", loginResult.userProfile.displayName);
            NSLog(@"---pictureURL:%@", loginResult.userProfile.pictureURL);
            NSLog(@"---value:%@", loginResult.accessToken.value);
            
            NSDictionary *dict1 = [NSDictionary dictionaryWithObjectsAndKeys:loginResult.userProfile.userID, @"openid", loginResult.accessToken.value, @"token", nil];
            
            NSError *error;
            NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict1
                                                               options:NSJSONWritingPrettyPrinted
                                                                 error:&error];
            
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            
            NSNumber *ret_code = @1;
            NSDictionary *dict = @{@"ret_str": jsonString, @"ret_code": ret_code};
            if (callBack) {
                callBack(dict);
            }
        }
    }];
}

+ (BOOL)roll_application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity {
    return [[LineSDKLoginManager sharedManager] application:application open:userActivity.webpageURL options:@{}];
}
@end
