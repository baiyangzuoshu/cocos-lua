//  Created by chris on 01/05/2022.
//

#import "ApplePay.h"

#import "MessageDispatcher.h"

USING_NS_CC;

static ApplePay *sharedInstance = nil;

@implementation ApplePay

+ (ApplePay *)getInstance {
    @synchronized (self) {

        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
            [sharedInstance load];
        }
    }

    return sharedInstance;
}

- (void)recharge {
    for (SKPaymentTransaction *transaction in [SKPaymentQueue defaultQueue].transactions) {
        if (transaction.transactionState == SKPaymentTransactionStatePurchased) {
            [self onTransactionSuccess:transaction];
        } else if (transaction.transactionState == SKPaymentTransactionStateRestored) {
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
        } else if (transaction.transactionState == SKPaymentTransactionStateFailed) {
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
        }
    }
}

- (void)queryProducts:(id)arr {
    NSSet *set = [[[NSSet alloc] initWithArray:arr] autorelease];
    SKProductsRequest *request = [[[SKProductsRequest alloc] initWithProductIdentifiers:set] autorelease];
    request.delegate = self;
    [request start];
}

- (void)pay:(NSString *)product_Id {
    SKPayment *payment = [SKPayment paymentWithProductIdentifier:product_Id];

    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response {
    NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init] autorelease];

    for (SKProduct *product in response.products) {
        NSNumberFormatter *numberFormatter = [[[NSNumberFormatter alloc] init] autorelease];
        [numberFormatter setFormatterBehavior:NSNumberFormatterBehavior10_4];
        [numberFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [numberFormatter setLocale:product.priceLocale];
        NSString *formattedPrice = [numberFormatter stringFromNumber:product.price];

        dict[product.productIdentifier] = formattedPrice;
    }

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *jsonStr = [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] autorelease];

    string ret = [jsonStr UTF8String];
    int len = static_cast<int>(ret.length());

    MessageDispatcher::getInstance()->callLuaFunction("app/native/ApplePayHandle.lua", "handleQueryProducts", 1, 0, ret.c_str(), len);
}

- (void)doRequest:(SKProduct *)product {
    SKPayment *payment = [SKPayment paymentWithProduct:product];

    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        if (transaction.transactionState == SKPaymentTransactionStatePurchased) {
            [self onTransactionSuccess:transaction];
        } else if (transaction.transactionState == SKPaymentTransactionStateRestored) {
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
        } else if (transaction.transactionState == SKPaymentTransactionStateFailed) {
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            [self onTransactionFailed];
        }

    }
}

- (void)onTransactionSuccess:(SKPaymentTransaction *)transaction {
    NSString *productIdentifier = transaction.payment.productIdentifier;
    NSString *receipt = [[[NSString alloc] initWithData:transaction.transactionReceipt encoding:NSUTF8StringEncoding] autorelease];
    NSString *transactionIdentifier = transaction.transactionIdentifier;

    NSMutableDictionary *dict = [[[NSMutableDictionary alloc] init] autorelease];

    dict[@"receipt"] = receipt;
    dict[@"productIdentifier"] = productIdentifier;
    dict[@"transactionIdentifier"] = transactionIdentifier;
    dict[@"date"] = @((int) [transaction.transactionDate timeIntervalSince1970]);
    dict[@"quantity"] = @((int) transaction.payment.quantity);

    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:0 error:nil];
    NSString *jsonStr = [[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding] autorelease];

    string ret = [jsonStr UTF8String];
    int len = static_cast<int>(ret.length());

    MessageDispatcher::getInstance()->callLuaFunction("app/native/ApplePayHandler.lua", "handleApplePayment", 1, 0, ret.c_str(), len);
}

- (void)onTransactionFailed {
    MessageDispatcher::getInstance()->callLuaFunction("app/native/ApplePayHandler.lua", "handleApplePaymentFailed", 0, 0, "", 0);
}

- (void)finishTransaction:(NSString *)transactionIdentifier {
    for (SKPaymentTransaction *transaction in [SKPaymentQueue defaultQueue].transactions) {
        if ([transaction.transactionIdentifier caseInsensitiveCompare:transactionIdentifier] == NSOrderedSame) {
            [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
            break;
        }
    }
}


- (void)load {
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}

- (void)dealloc {
    [super dealloc];
}

@end
