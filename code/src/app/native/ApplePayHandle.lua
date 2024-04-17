function handleQueryProducts(a, b, c, d)
    Log.info("查询消费点Lua回调",a, b, c, d)

    local json = cjson.decode(c)

    for k, v in pairs(json) do
        Log.info("Lua消费点log", k, v)
    end

    -- todo: 处理查询后一些展示
--     [LUA-print] 查询消费点Lua回调	1	0	{"com.yippeekiyay.letsroll.tier_2":"$70.00","com.yippeekiyay.letsroll.tier_50":"$1,690.00","com.yippeekiyay.letsroll.tier_10":"$330.00","com.yippeekiyay.letsroll.tier_5":"$170.00","com.yippeekiyay.letsroll.tier_60":"$3,290.00","com.yippeekiyay.letsroll.tier_20":"$670.00"}	272
-- [LUA-print] Lua消费点log	com.yippeekiyay.letsroll.tier_5	$   170.00
-- [LUA-print] Lua消费点log	com.yippeekiyay.letsroll.tier_50	$1,690.00
-- [LUA-print] Lua消费点log	com.yippeekiyay.letsroll.tier_2	    $70.00
-- [LUA-print] Lua消费点log	com.yippeekiyay.letsroll.tier_20	$670.00
-- [LUA-print] Lua消费点log	com.yippeekiyay.letsroll.tier_60	$3,290.00
-- [LUA-print] Lua消费点log	com.yippeekiyay.letsroll.tier_10	$330.00

    g_StoreData:setPayInfo(json)
end

function handleApplePayment(a, b, c, d)
    Log.info("唤起支付后的回调=", c)
    -- log:[LUA-print] 唤起支付后的回调=	{"receipt":"{\n\t\"signature\" = \"AwaXYlBR2EhaR6CO5GwdZasCM8WPA2MlgQb4tnv\/SBgWKOhe802CM40vi8yD9G+Ccrb7TGY6UCXwZfPmzVEn3MKhSdFhHXUP\/XFjfsbJZ7Wq4rvPxZeDuELYZrlCe+UViSqNVhgB4Ox+MGsrWrM\/UI3TNt+Q7hoEnG5aq6Q1DHurddM9V\/tRfLEa8hz0Cs39prQG9hJap\/HbNHiMF7Dhas1XJ4IzAFg05kh5hTIbNzC9Zfk5odugkTVqn\/knjwd6wMJOb0c\/UgfAcizKqSgjX6YM122v5O\/FqQYPJ\/9UzPytiW+Ye6\/EkwWfJC+P\/k2D6QySbAPdgNGneETrhYMW0i0AAAWAMIIFfDCCBGSgAwIBAgIIDutXh+eeCY0wDQYJKoZIhvcNAQEFBQAwgZYxCzAJBgNVBAYTAlVTMRMwEQYDVQQKDApBcHBsZSBJbmMuMSwwKgYDVQQLDCNBcHBsZSBXb3JsZHdpZGUgRGV2ZWxvcGVyIFJlbGF0aW9uczFEMEIGA1UEAww7QXBwbGUgV29ybGR3aWRlIERldmVsb3BlciBSZWxhdGlvbnMgQ2VydGlmaWNhdGlvbiBBdXRob3JpdHkwHhcNMTUxMTEzMDIxNTA5WhcNMjMwMjA3MjE0ODQ3WjCBiTE3MDUGA1UEAwwuTWFjIEFwcCBTdG9yZSBhbmQgaVR1bmVzIFN0b3JlIFJlY2VpcHQgU2lnbmluZzEsMCoGA1UECwwjQXBwbGUgV29ybGR3aWRlIERldmVsb3BlciBSZWxhdGlvbnMxEzARBgNVBAoMCkFwcGxlIEluYy4xCzAJBgNVBAYTAlVTMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEApc+B\/SWigVvWh+0j2jMcjuIjwKXEJss9xp\/sSg1Vhv+kAteXyjlUbX1\/slQYncQsUnGOZHuCzom6SdYI5bSIcc8\/W0YuxsQduAOpWKIEPiF41du30I4SjYNMWypoN5PC8r0exNKhDEpYUqsS4+3dH5gVkDUtwswSyo1IgfdYeFRr6IwxNh9KBgxHVPM3kLiykol9X6SFSuHAnOC6pLuCl2P0K5PB\/T5vysH1PKmPUhrAJQp2Dt7+mf7\/wmv1W16sc1FJCFaJzEOQzI6BAtCgl7ZcsaFpaYeQEGgmJjm4HRBzsApdxXPQ33Y72C3ZiB7j7AfP4o7Q0\/omVYHv4gNJIwIDAQABo4IB1zCCAdMwPwYIKwYBBQUHAQEEMzAxMC8GCCsGAQUFBzABhiNodHRwOi8vb2NzcC5hcHBsZS5jb20vb2NzcDAzLXd3ZHIwNDAdBgNVHQ4EFgQUkaSc\/MR2t5+givRN9Y82Xe0rBIUwDAYDVR0TAQH\/BAIwADAfBgNVHSMEGDAWgBSIJxcJqbYYYIvs67r2R1nFUlSjtzCCAR4GA1UdIASCARUwggERMIIBDQYKKoZIhvdjZAUGATCB\/jCBwwYIKwYBBQUHAgIwgbYMgbNSZWxpYW5jZSBvbiB0aGlzIGNlcnRpZmljYXRlIGJ5IGFueSBwYXJ0eSBhc3N1bWVzIGFjY2VwdGFuY2Ugb2YgdGhlIHRoZW4gYXBwbGljYWJsZSBzdGFuZGFyZCB0ZXJtcyBhbmQgY29uZGl0aW9ucyBvZiB1c2UsIGNlcnRpZmljYXRlIHBvbGljeSBhbmQgY2VydGlmaWNhdGlvbiBwcmFjdGljZSBzdGF0ZW1lbnRzLjA2BggrBgEFBQcCARYqaHR0cDovL3d3dy5hcHBsZS5jb20vY2VydGlmaWNhdGVhdXRob3JpdHkvMA4GA1UdDwEB\/wQEAwIHgDAQBgoqhkiG92NkBgsBBAIFADANBgkqhkiG9w0BAQUFAAOCAQEADaYb0y4941srB25ClmzT6IxDMIJf4FzRjb69D70a\/CWS24yFw4BZ3+Pi1y4FFKwN27a4\/vw1LnzLrRdrjn8f5He5sWeVtBNephmGdvhaIJXnY4wPc\/zo7cYfrpn4ZUhcoOAoOsAQNy25oAQ5H3O5yAX98t5\/GioqbisB\/KAgXNnrfSemM\/j1mOC+RNuxTGf8bgpPyeIGqNKX86eOa1GiWoR1ZdEWBGLjwV\/1CKnPaNmSAMnBjLP4jQBkulhgwHyvj3XKablbKtYdaG6YQvVMpzcZm8w7HHoZQ\/Ojbb9IYAYMNpIr7N4YtRHaLSPQjvygaZwXG56AezlHRTBhL8cTqA==\";\n\t\"purchase-info\" = \"ewoJIm9yaWdpbmFsLXB1cmNoYXNlLWRhdGUtcHN0IiA9ICIyMDIyLTAxLTA2IDIwOjU4OjEyIEFtZXJpY2EvTG9zX0FuZ2VsZXMiOwoJInVuaXF1ZS1pZGVudGlmaWVyIiA9ICIwMDAwODAzMC0wMDE1Mzk0MjE0REI4MDJFIjsKCSJvcmlnaW5hbC10cmFuc2FjdGlvbi1pZCIgPSAiMTAwMDAwMDk0NDM3NjA3NiI7CgkiYnZycyIgPSAiMSI7CgkidHJhbnNhY3Rpb24taWQiID0gIjEwMDAwMDA5NDQzNzYwNzYiOwoJInF1YW50aXR5IiA9ICIxIjsKCSJpbi1hcHAtb3duZXJzaGlwLXR5cGUiID0gIlBVUkNIQVNFRCI7Cgkib3JpZ2luYWwtcHVyY2hhc2UtZGF0ZS1tcyIgPSAiMTY0MTUzMTQ5MjgwMCI7CgkidW5pcXVlLXZlbmRvci1pZGVudGlmaWVyIiA9ICIwODU1NEZBQi1DOEY0LTRBRDEtODVFOS1DMkU3MDA4NTRCN0IiOwoJInByb2R1Y3QtaWQiID0gImNvbS55aXBwZWVraXlheS5sZXRzcm9sbC50aWVyXzIiOwoJIml0ZW0taWQiID0gIjE2MDM0MDYzNTYiOwoJImJpZCIgPSAiY29tLnlpcHBlZWtpeWF5LmxldHNyb2xsIjsKCSJpcy1pbi1pbnRyby1vZmZlci1wZXJpb2QiID0gImZhbHNlIjsKCSJwdXJjaGFzZS1kYXRlLW1zIiA9ICIxNjQxNTMxNDkyODAwIjsKCSJwdXJjaGFzZS1kYXRlIiA9ICIyMDIyLTAxLTA3IDA0OjU4OjEyIEV0Yy9HTVQiOwoJImlzLXRyaWFsLXBlcmlvZCIgPSAiZmFsc2UiOwoJInB1cmNoYXNlLWRhdGUtcHN0IiA9ICIyMDIyLTAxLTA2IDIwOjU4OjEyIEFtZXJpY2EvTG9zX0FuZ2VsZXMiOwoJIm9yaWdpbmFsLXB1cmNoYXNlLWRhdGUiID0gIjIwMjItMDEtMDcgMDQ6NTg6MTIgRXRjL0dNVCI7Cn0=\";\n\t\"environment\" = \"Sandbox\";\n\t\"pod\" = \"100\";\n\t\"signing-status\" = \"0\";\n}","quantity":1,"productIdentifier":"com.yippeekiyay.letsroll.tier_2","transactionIdentifier":"1000000944376076","date":1641531492}
    local payInfo = cjson.decode(c)
    -- todo: 支付订单信息
    g_UserData:requestRecharge(payInfo)
end

function handleApplePaymentFailed(a, b, c, d)
    Log.info("支付失败=", a, b, c, d)
    -- log:支付失败=	0	0		0
end

