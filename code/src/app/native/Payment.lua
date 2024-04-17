---
--- Created by Chris.
--- DateTime: 2021/12/29 17:26
---

PAYMENT_TYPE_GM = 0   --
PAYMENT_TYPE_APPSTORE = 1   --
PAYMENT_TYPE_GOOGLEPLAY = 2   --
PAYMENT_TYPE_MYCARD = 3   --

local Payment = {}
Launcher.javaClassName = "bridge/AppController" -- java类名
function Payment.startCheckGooglePlay()
    local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "gpCheck", nil, nil)
end

function Payment.getPaymentTypes()
    local types = {}

    if DeviceUtils.isWindows() then
        types = { PAYMENT_TYPE_GM }
    elseif DeviceUtils.isIOS() then
        types = { PAYMENT_TYPE_APPSTORE }
    elseif DeviceUtils.isAndroid() then
        types = { PAYMENT_TYPE_GOOGLEPLAY }
    end

    return types
end

function Payment.startQueryProducts()

    local types = Payment.getPaymentTypes()

    for i = 1, #types do
        if types[i] == PAYMENT_TYPE_APPSTORE then
            Payment.startQueryAppStoreProducts()
            break
        elseif types[i] == PAYMENT_TYPE_GOOGLEPLAY then
            Payment.startQueryGooglePlayProducts()
            break
        end
    end
end

function Payment.startQueryAppStoreProducts()
    local products = DataManager:getTbxData("Recharge")
    if not products then return end

    local productIds = {}
    --新手礼包
    productIds[#productIds+1]="com.yippeekiyay.letsroll.tier_1"
    
    for _,v in pairs(products) do 
        productIds[#productIds+1] = v.ProductId
    end

    dump(productIds, "Apple Lua收费点", 5)
    local jsonArrayStr = cjson.encode(productIds)
    local ok, ret = Launcher.callStaticMethod("AppController", "queryProducts", {jsonArrayStr = jsonArrayStr})
end

function Payment.startQueryGooglePlayProducts()
    local products = DataManager:getTbxData("Recharge")
    if not products then return end

    local productIds = {}
    --新手礼包
    productIds[#productIds+1]="com.yippeekiyay.letsroll.tier_1"

    for _,v in pairs(products) do 
        productIds[#productIds+1] = v.ProductId
    end

    local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "gpQueryProducts", { cjson.encode(productIds) }, nil)
end

function Payment.startPaymentRecharge()
    local types = Payment.getPaymentTypes()

    for i = 1, #types do
        if types[i] == PAYMENT_TYPE_APPSTORE then
            Payment.startAppStoreRecharge()
            break
        elseif types[i] == PAYMENT_TYPE_GOOGLEPLAY then
            Payment.startGooglePlayRecharge()
            break
        end
    end
end

function Payment.startAppStoreRecharge()
    local ok, ret = Launcher.callStaticMethod("AppController", "recharge")
end

function Payment.startGooglePlayRecharge()
    local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "gpReplenishmentOrder", nil, nil)
end

function Payment.startChargeAppleIap(receipt, productIdentifier, transactionIdentifier, quantity, date)
    --Payment.startChargeIap(receipt, { productIdentifier = productIdentifier, transactionIdentifier = transactionIdentifier })
end

function Payment.startChargeGoogleIap(data)
    local purchaseData = cjson.decode(data)
    --Payment.startChargeIap(crypto.encodeBase64(data), purchaseData)
end

function Payment.startAppStorePay(info)
    local ok, ret = Launcher.callStaticMethod("AppController", "pay", info)
end

function Payment.startGooglePlayPay(info)
    local param_str = cjson.encode(info)
    local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "googlePay", {param_str}, nil)
end

function Payment.finishIap(productData)
    if DeviceUtils.isIOS() then
        local ok, ret = Launcher.callStaticMethod("AppController", "finishTransaction", { transactionIdentifier = productData.transactionIdentifier })
    elseif DeviceUtils.isAndroid() then
        local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "gpConsumePurchase", { productData.purchaseToken }, nil)
    end
end

return Payment
