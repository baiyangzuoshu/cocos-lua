//
//  AppleLoginUtils.m
//  sango iOS
//
//  Created by PeterZhang on 2020/5/22.
//


#import "AppleLoginUtils.h"

#import "AppController.h"

//using namespace std;

#include "MessageDispatcher.h"

static AppleLoginUtils *sharedInstance = nil;

@implementation AppleLoginUtils

+ (void)initialize:(UIWindow *)window {
    sharedInstance = [[self alloc] init];
    // sharedInstance.mWindow = window;
}

+ (AppleLoginUtils *)getInstance {
    @synchronized (self) {

        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }

    return sharedInstance;
}

#pragma mark- 点击登录

- (void)login API_AVAILABLE(ios(13.0)) {
    ASAuthorizationAppleIDProvider *provider = [[ASAuthorizationAppleIDProvider alloc] init];
    ASAuthorizationAppleIDRequest *request = [provider createRequest];
    request.requestedScopes = @[ASAuthorizationScopeFullName, ASAuthorizationScopeEmail];

    ASAuthorizationController *vc = [[ASAuthorizationController alloc] initWithAuthorizationRequests:@[request]];
    vc.delegate = self;
    vc.presentationContextProvider = self;
    [vc performRequests];
}

#pragma mark - ASAuthorizationControllerPresentationContextProviding

- (ASPresentationAnchor)presentationAnchorForAuthorizationController:(ASAuthorizationController *)controller API_AVAILABLE(ios(13.0)) {
    return [UIApplication sharedApplication].keyWindow;
}


#pragma mark - ASAuthorizationControllerDelegate

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithAuthorization:(ASAuthorization *)authorization API_AVAILABLE(ios(13.0)) {
    if ([authorization.credential isKindOfClass:[ASAuthorizationAppleIDCredential class]]) {
        ASAuthorizationAppleIDCredential *credential = authorization.credential;

        NSString *state = credential.state;
        NSString *userID = credential.user;
        NSPersonNameComponents *fullName = credential.fullName;
        NSString *email = credential.email;
        NSString *authorizationCode = [[NSString alloc] initWithData:credential.authorizationCode encoding:NSUTF8StringEncoding]; // refresh token
        NSString *identityToken = [[NSString alloc] initWithData:credential.identityToken encoding:NSUTF8StringEncoding]; // access token
        ASUserDetectionStatus realUserStatus = credential.realUserStatus;

//        NSLog(@"state: %@", state);
//        NSLog(@"userID: %@", userID);
//        NSLog(@"fullName: %@", fullName);
//        NSLog(@"email: %@", email);
//        NSLog(@"authorizationCode: %@", authorizationCode);
//        NSLog(@"identityToken: %@", identityToken);
//        NSLog(@"realUserStatus: %@", @(realUserStatus));

        NSString *givenName = fullName.givenName;
        NSString *middleName = fullName.middleName;
        NSString *familyName = fullName.familyName;
        NSString *nickName = fullName.nickname;
        //NSString *authorizationCode = authorizationCode.UTF8String;
        if (nickName == NULL) {
            if (familyName != NULL) {
                nickName = familyName;
            } else {
                nickName = @"";
            }
            if (middleName != NULL) {
                nickName = [nickName stringByAppendingString:middleName];
            }
            if (givenName != NULL) {
                nickName = [nickName stringByAppendingString:givenName];
            }
        }
        if (nickName == NULL) {
            nickName = @"";
        }
        std::string ret_str = "";
        int ret_code = 0;
        int ret_len = 0;
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:nickName, @"openid", identityToken, @"token",authorizationCode,@"authorizationCode", nil];

        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict
                                                           options:NSJSONWritingPrettyPrinted
                                                             error:&error];
        if (jsonData) {
            NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
            ret_str = [jsonString UTF8String];
            ret_code = 1;
            ret_len = (int) ret_str.length();
        }

        MessageDispatcher::getInstance()->callLuaFunction("app/native/AppleLoginHandle.lua", "appLoginCallBackHandle", 8, ret_code, ret_str.c_str(), ret_len);
    }
}

- (void)authorizationController:(ASAuthorizationController *)controller didCompleteWithError:(NSError *)error API_AVAILABLE(ios(13.0)) {
    NSString *errorMsg = nil;
    switch (error.code) {
        case ASAuthorizationErrorCanceled:
            errorMsg = @"用户取消了授权请求";
            break;
        case ASAuthorizationErrorFailed:
            errorMsg = @"授权请求失败";
            break;
        case ASAuthorizationErrorInvalidResponse:
            errorMsg = @"授权请求响应无效";
            break;
        case ASAuthorizationErrorNotHandled:
            errorMsg = @"未能处理授权请求";
            break;
        case ASAuthorizationErrorUnknown:
            errorMsg = @"授权请求失败未知原因";
            break;
    }
    NSLog(@"%@", errorMsg);
    std::string ret_str = "";
    int ret_code = 0;
    int ret_len = 0;

    MessageDispatcher::getInstance()->callLuaFunction("app/native/AppleLoginHandle.lua", "appLoginCallBackHandle", 8, ret_code, ret_str.c_str(), ret_len);
}

@end
