//  Created by chris on 01/05/2022.
//

#import <Foundation/Foundation.h>

#import <StoreKit/StoreKit.h>

@interface ApplePay : NSObject <SKProductsRequestDelegate, SKPaymentTransactionObserver> {

}

+ (ApplePay *)getInstance;

- (void)pay:(NSString *)product_Id;

- (void)recharge;

- (void)finishTransaction:(NSString *)productIdentifier;

- (void)queryProducts;

@end
