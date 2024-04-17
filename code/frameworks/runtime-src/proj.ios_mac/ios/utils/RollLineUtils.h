
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^kGetDictEventHandler)(NSDictionary *dict);

@interface RollLineUtils : NSObject

+ (void)setupLineSDK;

+ (void)roll_application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

+ (void)roll_lineLogin:(kGetDictEventHandler)callBack;
+ (BOOL)roll_application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity;
@end

NS_ASSUME_NONNULL_END
