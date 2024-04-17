
local Config={}

-- In app event names constants
Config.AFEventCompleteRegistration = "af_complete_registration"
Config.AFEventPurchase             = "af_purchase"

-- In app event parameter names
Config.AFEventParamRegistrationMethod      =   "af_registration_method"
Config.AFEventParamRevenue                 =   "af_revenue"
Config.AFEventParamCurrency                =   "af_currency"

-- Firebase event names constants
Config.Firebase_SIGN_UP = "sign_up"
Config.Firebase_PURCHASE = "purchase"

-- Firebase event parameter names
Config.Firebase_SIGN_UP_METHOD = "sign_up_method"
Config.Firebase_CURRENCY = "currency"



Config.Panel_Add_AnimationTag = 20001       --给加入动画加入的 tag


return Config