//
//  AppleLoginUtils.h
//  sango
//
//  Created by PeterZhang on 2020/5/22.
//

#ifndef AppleLoginUtils_h
#define AppleLoginUtils_h

#import <Foundation/Foundation.h>
#import <AuthenticationServices/AuthenticationServices.h>

@interface AppleLoginUtils : NSObject <ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding> {
    UIWindow *mWindow;
}

+ (void)initialize:(UIWindow *)window;

+ (AppleLoginUtils *)getInstance;

- (void)login API_AVAILABLE(ios(13.0));

@end

#endif
