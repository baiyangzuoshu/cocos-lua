cc.exports.Utils = {}
local Payment = require("app.native.Payment")

--local PlistConfig = require("app.config.PlistConfig")
local EffectAnimation = require("app.otherNode.cocosEffect")
local FrameAnimation = require("app.otherNode.NomalEffect")
local SpineAnimation = require("app.otherNode.SpineEffect")

function Utils.splitString(szFullString, szSeparator)
    local nFindStartIndex = 1
    local nSplitIndex = 1
    local nSplitArray = {}
    while true do
        local nFindLastIndex = string.find(szFullString, szSeparator, nFindStartIndex)
        if not nFindLastIndex then
            nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
            break
        end
        nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
        nFindStartIndex = nFindLastIndex + string.len(szSeparator)
        nSplitIndex = nSplitIndex + 1
    end
    return nSplitArray
end

function Utils.parseResponse(response)
    local code = Constant.ResponseUnknowCode

    local responseData = cjson.decode(response)
    if responseData ~= nil then
        code = responseData.code
    end

    return code, responseData.data
end

function Utils.parseServerAddress(address)
    local strArray = Utils.splitString(address, ":")

    if #strArray <= 1 then
        return address, nil
    end

    return strArray[1], tonumber(strArray[2])
end

-- 表是否为空
function Utils.isEmptyTable(t)
    return t == nil or t == {} or next(t) == nil
end

function Utils.isEmptyStr(str)
    return str == nil or str == ""
end

--获取输入框文本
function Utils.getInputValue(input)
    local value = input:getString()
    if Utils.isEmptyStr(value) then
        return ""
    end
    return Utils.trim(value)
end

function Utils.transformInputStr(str)
    local value = str
    if Utils.isEmptyStr(value) then
        return ""
    end
    return Utils.trim(value)
end

-- function Utils.copyToClipboard(str)
--     return kz.DeviceManager:getInstance():copyToClipboard(str)
-- end

function Utils.pasteFromClipboard()
    return kz.DeviceManager:getInstance():pasteFromClipboard()
end

function Utils.trim(str)
    local ret, n = str:gsub("^%s*(.-)%s*$", "%1")
    return ret
end

function Utils.getNumberOnly(str)
    local ret, n = str:gsub("%D*", "")
    return ret
end

--匹配数字加字母_下划线
function Utils.isNumberAndAbc_Only(str,canOnlyOne)
    local isNumber = false
    local isAbc = false
    local isUnderLine = false

    if type(str) ~= "string" then
        return false
    end
    local len = #str
    for i = 1, len do
        local curByte = string.byte(str, i)
        local byteCount = 0
        if curByte > 0 and curByte <= 127 then
            byteCount = 1
        elseif curByte>=192 and curByte < 223 then
            byteCount = 2
        elseif curByte>=224 and curByte < 239 then
            byteCount = 3
        elseif curByte>=240 and curByte <= 247 then
            byteCount = 4
        end
        local char = string.sub(str, i, i + byteCount - 1)
        if not (string.match(char, "^[0-9]*$") == nil) then
            isNumber = true
        elseif not (string.match(char, "^[A-Za-z]+$") == nil) then
            isAbc = true
        elseif not (string.match(char, "_") == nil) then
            isUnderLine = true
        else
            return false
        end

        i = i + byteCount - 1
    end

    if canOnlyOne then
        return true
    end

    return (isNumber and isAbc) or (isNumber and isUnderLine) or (isAbc and isUnderLine)
end

--匹配数字加字母
function Utils.isNumberAndAbcOnly(str,canOnlyOne)
    local isNumber = false
    local isAbc = false

    if type(str) ~= "string" then
        return false
    end
    local len = #str
    for i = 1, len do
        local curByte = string.byte(str, i)
        local byteCount = 0
        if curByte > 0 and curByte <= 127 then
            byteCount = 1
        elseif curByte>=192 and curByte < 223 then
            byteCount = 2
        elseif curByte>=224 and curByte < 239 then
            byteCount = 3
        elseif curByte>=240 and curByte <= 247 then
            byteCount = 4
        end
        local char = string.sub(str, i, i + byteCount - 1)
        if not (string.match(char, "^[0-9]*$") == nil) then
            isNumber = true
        elseif not (string.match(char, "^[A-Za-z]+$") == nil) then
            isAbc = true
        else
            return false
        end

        i = i + byteCount - 1
    end

    if canOnlyOne then
        return true
    end

    return isNumber and isAbc
end

function Utils.formatUrlParams(data)

    local list = {}
    for k, v in pairs(data) do
        list[#list + 1] = k .. "=" .. string.urlencode(tostring(v))
    end

    local ret = ""
    for i, v in ipairs(msgList) do
        if i == 1 then
            ret = "?" .. v
        else
            ret = "&" .. v
        end
    end

    return ret
end

function Utils.generateIconPlistData(plist)
    --id = tostring(id)

    local cfg = plist
    if not cfg then
        return {}
    end

    local ret = {}
    for i = 1, cfg.Files do
        ret[#ret + 1] = string.format("art/picture/%s/%s_%d.plist", cfg.Id, cfg.Res, i)
    end
    return ret
end

function Utils.generateAnimationPlistData(id)
    id = tostring(id)

    local cfg = PlistConfig.Animation[id]
    if not cfg then
        return {}
    end

    local ret = {}
    for i = 1, cfg.Files do
        ret[#ret + 1] = string.format("art/animation/%s/%s_%d.plist", id, cfg.Res, i)
    end
    return ret
end

function Utils.getIconStr(plist,id)
    local cfg = plist
    if not cfg then
        return {}
    end
    --local id = cfg.Id
    return string.format("picture/%s/%d.png", cfg.Id,id)
end

--通用
--多语言调用
function Utils.getFormatNumber_MuitiLanguage(value)
    local valueStr = tostring(value)
    local languageType = g_UserData:getSystemLanguage()
    if languageType == Enum.LanguageType.zh_cn then
        valueStr = Utils.getFormatNumber_CN(value)
    elseif languageType == Enum.LanguageType.en then
        valueStr = Utils.getFormatNumber_EN(value)
    elseif languageType == Enum.LanguageType.zh_tw then
        valueStr = Utils.getFormatNumber_TW(value)
    end
    return valueStr
end

--简中
function Utils.getFormatNumber_CN(value)
    local valueStr = tostring(value)
    local len = #valueStr
    if len > 4 and len < 8 then
        valueStr = string.sub(valueStr, 1, len - 4 + 1)
        local top = string.sub(valueStr,1, len - 4)
        local tail = string.sub(valueStr, len - 4 + 1, len - 4 + 1)
        if tonumber(tail) == 0 then
            valueStr = top.."万"
        else
            valueStr = top.."."..tail.."万"
        end
    elseif len == 8 then
        valueStr = string.sub(valueStr, 1, 4)
        valueStr = valueStr.."万"
    elseif len > 8 and len < 12 then
        valueStr = string.sub(valueStr, 1, len - 8 + 1)
        local top = string.sub(valueStr, 1, len - 8)
        local tail = string.sub(valueStr, len - 8 + 1, len - 8 + 1)
        if tonumber(tail) == 0 then
            valueStr = top.."亿"
        else
            valueStr = top.."."..tail.."亿"
        end
    elseif len == 12 then
        valueStr = string.sub(valueStr, 1, 4)
        valueStr = valueStr.."亿"
    end

    return valueStr
end

--繁中
function Utils.getFormatNumber_TW(value)
    local valueStr = tostring(value)
    local len = #valueStr
    if len > 4 and len < 8 then
        valueStr = string.sub(valueStr, 1, len - 4 + 1)
        local top = string.sub(valueStr,1, len - 4)
        local tail = string.sub(valueStr, len - 4 + 1, len - 4 + 1)
        if tonumber(tail) == 0 then
            valueStr = top.."萬"
        else
            valueStr = top.."."..tail.."萬"
        end
    elseif len == 8 then
        valueStr = string.sub(valueStr, 1, 4)
        valueStr = valueStr.."萬"
    elseif len > 8 and len < 12 then
        valueStr = string.sub(valueStr, 1, len - 8 + 1)
        local top = string.sub(valueStr, 1, len - 8)
        local tail = string.sub(valueStr, len - 8 + 1, len - 8 + 1)
        if tonumber(tail) == 0 then
            valueStr = top.."億"
        else
            valueStr = top.."."..tail.."億"
        end
    elseif len == 12 then
        valueStr = string.sub(valueStr, 1, 4)
        valueStr = valueStr.."億"
    end

    return valueStr
end

--EN
function Utils.getFormatNumber_EN(value)
    local valueStr = tostring(value)
    local len = string.len(valueStr)
    if len > 3 and len <= 5 then
        local top = string.sub(valueStr, 1, len - 4 + 1)
        local tail = string.sub(valueStr, len - 3 + 1, len)
        valueStr = top..","..tail
    elseif len == 6 then
        local top = string.sub(valueStr, 1, 3)
        local tail = string.sub(valueStr, 4, 4)
        valueStr = top.."."..tail.."K"
    elseif len > 6 and len <= 9 then
        valueStr = string.sub(valueStr, 1, 5)
        local top = string.sub(valueStr,1, len - 6)
        local tail = string.sub(valueStr, len - 6 + 1, len - 6 + 1)
        valueStr = top.."."..tail.."M"
    elseif len > 9 and len <= 12 then
        valueStr = string.sub(valueStr, 1, 5)
        local top = string.sub(valueStr, 1, len - 9)
        local tail = string.sub(valueStr, len - 9 + 1, len - 9 + 1)
        valueStr = top.."."..tail.."B"
    end

    return valueStr
end

--特化
--多语言调用
function Utils.getFormatNumber_Special_MuitiLanguage(value)
    local valueStr = tostring(value)
    local languageType = g_UserData:getSystemLanguage()
    if languageType == Enum.LanguageType.zh_cn then
        valueStr = Utils.getFormatNumberCN_Special(value)
    elseif languageType == Enum.LanguageType.en then
        valueStr = Utils.getFormatNumberEN_Special(value)
    elseif languageType == Enum.LanguageType.zh_tw then
        valueStr = Utils.getFormatNumberTW_Special(value)
    end
    return valueStr
end

--资源特化显示
--简中
function Utils.getFormatNumberCN_Special(value)
    local valueStr = tostring(value)
    local len = #valueStr
    if len == 5 then
        valueStr = string.sub(valueStr, 1, 1)
        valueStr = valueStr.."万"
    elseif len > 5 and len <= 8 then
        valueStr = string.sub(valueStr, 1, len - 5 + 1)
        valueStr = valueStr.."万"
    elseif len > 8 and len <= 12 then
        valueStr = string.sub(valueStr, 1, len - 9 + 1)
        valueStr = valueStr.."亿"
    end
    return valueStr
end

--繁中
function Utils.getFormatNumberTW_Special(value)
    local valueStr = tostring(value)
    local len = #valueStr
    if len == 5 then
        valueStr = string.sub(valueStr, 1, 1)
        valueStr = valueStr.."萬"
    elseif len > 5 and len <= 8 then
        valueStr = string.sub(valueStr, 1, len - 5 + 1)
        valueStr = valueStr.."萬"
    elseif len > 8 and len <= 12 then
        valueStr = string.sub(valueStr, 1, len - 9 + 1)
        valueStr = valueStr.."億"
    end

    return valueStr
end

--EN
function Utils.getFormatNumberEN_Special(value)
    local valueStr = tostring(value)
    local len = #valueStr
    if len >= 5 and len <= 6 then
        local top = string.sub(valueStr, 1, len - 3)
        valueStr = top.."K"
    elseif len > 6 and len <= 9 then
        local top = string.sub(valueStr, 1, len - 6)
        valueStr = top.."M"
    elseif len > 9 and len <= 12 then
        local top = string.sub(valueStr, 1, len - 9)
        valueStr = top.."B"
    end

    return valueStr
end

function Utils.onlyCreateEffect(id, pos, loop,isremove,callback)
    local magic = Utils.createAnimationBase(id, pos, loop,isremove,callback)

    if not magic then
        return magic
    end

    return magic
end

function Utils.createAnimationBase(id, pos, loop,isremove,callback)
    local ret = nil

    local data = DataManager:getTbxData("Animation", tostring(id))
    if not data then
        return ret
    end

    pos = pos or cc.p(0, 0)
    loop = loop or false

    local resname = "AnimationRes_zh_TW"
    local languageType = g_UserData:getSystemLanguage()
    if languageType == Enum.LanguageType.zh_cn then
        resname = "AnimationRes_zh_CN"
    elseif languageType == Enum.LanguageType.en then
        resname = "AnimationRes_en"
    elseif languageType == Enum.LanguageType.zh_tw then
        resname = "AnimationRes_zh_TW"
    end

    if data.AnimationType == Enum.Animation.plist then
        local path = string.format("art/animation/%04d/%s_1", tonumber(data[resname]), tostring(data[resname]))
        ret = FrameAnimation.create()-- px.ExtMagicManager:instance():creatMagic(path, data.Frames / 1000, loop)
        if ret then
            if callback then
                ret:setLastFrameCallFunc(callback)
            end
            ret:createEffect(path,data.Frames / 1000,loop)
        end
    elseif data.AnimationType == Enum.Animation.ccs then
        ret = Utils.createCocosAnimation(tostring("Animation/" .. data[resname]),loop,isremove,callback)
    elseif data.AnimationType == Enum.Animation.spine  then
        local path = string.format("spine/%s", data[resname])
        ret = SpineAnimation:create()
        if ret then
            ret:loadCsd(path)
            ret:playActionName(data.SpineAnimationName,loop)
        end
    end
    ret:setLocalZOrder(data.Layer or 1)
    ret:setPosition(cc.p(pos.x + data.Deviation[1] or 0, pos.y + data.Deviation[2] or 0))

    return ret
end

function Utils.createCocosAnimation(id,loop,isremove,callback)
    local node = EffectAnimation.create()
    loop = loop or false
    if isremove == nil then
        isremove = true
    end

    if node then
        local isLoadSeccess = node:loadCsd(id)
        if isLoadSeccess then
            --PxLog.info("CreateCocosAnimation is seccess!")
        else
            --PxLog.error("CreateCocosAnimation is fail! id:%s",tostring(id))
        end
        node:play(loop)
        if callback then
            node:setLastFrameCallFunc(callback)
        elseif isremove then
            node:setLastFrameCallFunc(function (  )
                --PxLog.info("返回 返回")
                local par = node:getParent()
                if par then
                    par:removeChild(node)
                end

            end)
        end
        return node
    end

    return nil
end

-- 获取字符串匹配替换 a{0}b{1}，100，20=>a100b20，与数值显示规则冲突，改用 ；分割
function Utils.getFormatString(nstr,vstr)
    local values
    if type(vstr) == "string" then
        values = string.split(vstr, ";")
    else
        values = vstr
    end

    local str = string.gsub(nstr, "{(%d+)}", function(s)
         return tostring(values[tonumber(s+1)])
        end)
    return str
end

function Utils.showFormatText(id, value)
    value = tostring(value)
    local textData = DataManager:getTbxData("Text", id)
    if textData then
        value = Utils.getFormatString(textData.Desc, value)
    end
    return value
end

--获取当前时间
function Utils.getFormatNowUnixTimeToDate()
    local unixTime = g_UserData:calcServerTimestamp()
    unixTime = unixTime / 1000
    if unixTime and unixTime >= 0 then
        local tb = {}
        tb.year = tonumber(os.date("%Y",unixTime))
        tb.month =tonumber(os.date("%m",unixTime))
        tb.day = tonumber(os.date("%d", unixTime))
        tb.hour = tonumber(os.date("%H", unixTime))
        tb.minute = tonumber(os.date("%M",unixTime))
        tb.second = tonumber(os.date("%S",unixTime))
        tb.dayAtYear = tonumber(os.date("%j",unixTime))
        return tb
    end
end

-- 时间戳格式化 
function Utils.getFormatUnixTimeToDate(unixTime)
    if unixTime and unixTime >= 0 then
        unixTime = unixTime / 1000
        local tb = {}
        tb.year = tonumber(os.date("%Y",unixTime))
        tb.month =tonumber(os.date("%m",unixTime))
        tb.day = tonumber(os.date("%d", unixTime))
        tb.hour = tonumber(os.date("%H", unixTime))
        tb.minute = tonumber(os.date("%M",unixTime))
        tb.second = tonumber(os.date("%S",unixTime))
        --一年中得第几天
        tb.dayAtYear = tonumber(os.date("%j",unixTime))
        return tb
    end
end
--时间字符串格式化"2021-01-01"
function Utils.getFormatStringToDate(str,szSeparator)
    local strArray=Utils.splitString(str, szSeparator)
    local tb = {}
    tb.year = tonumber(strArray[1]) or 0
    tb.month =tonumber(strArray[2]) or 0
    tb.day = tonumber(strArray[3]) or 0
    tb.hour = tonumber(strArray[4]) or 0
    tb.minute = tonumber(strArray[5]) or 0
    tb.second = tonumber(strArray[6]) or 0
    tb.dayAtYear = tonumber(strArray[7]) or 0
    return tb
end
--获取时间
function Utils.getDateByUnixTime(unixTime)
    local str = ""
    if unixTime and unixTime >= 0 then
        unixTime = unixTime / 1000
        str = os.date("%H:%M", unixTime)
    end
    return str
end

--获取星期几
local _WEEK = { Enum.Text.Sunday, Enum.Text.Monday, Enum.Text.Tuesday, Enum.Text.Wednesday, Enum.Text.Thursday, Enum.Text.Friday, Enum.Text.Saturday }

function Utils.getWeekByUnixTime(unixTime)
    if unixTime and unixTime >= 0 then
        unixTime = unixTime / 1000
        local w = os.date("%w", unixTime)
        return _WEEK[w + 1]
    end
end

--倒计时格式化
function Utils.getFoematLeftTime(lefttime)
    local leftseconds = math.ceil(lefttime/1000)--剩余秒数，向上取整

    local seconds = tostring(leftseconds%60)
    local minute =  tostring(math.floor(leftseconds/60)%60)
    if string.len(seconds) == 1 then
        seconds="0"..seconds
    end

    if string.len(minute) == 1 then
        minute="0"..minute
    end

    return minute..":"..seconds
end

function Utils.copyToClipboard(str)
    --copyToClipboard
    if DeviceUtils.isIOS() then
        local ok, ret = Launcher.callStaticMethod("AppController", "copyToClipboard", { text = str })
    elseif DeviceUtils.isAndroid() then
        local param_str = cjson.encode({text = str })
        local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "copyToClipboard",{param_str}, nil)
    end
end

--[[
   viewHeight : TableView:getViewSize().height 
   cellHeight : 单个cell的高度
   cellCount : cell的总数
   cellCountShown : 可视区域可显示的cell的数量
   cellIndex : 需要指定的cell的索引，从0开始计数
   locationindex :  需要将cellIndex放到可视区域的第几个，从1开始
]]--
--tableview滚动到指定位置
function Utils.calculateTableCellOffsetByCellIdx(viewHeight, cellHeight, cellCount, cellCountShown, cellIndex, locationindex)
    local tableTotalHeight = cellHeight * cellCount;
    if(tableTotalHeight > viewHeight) then
        return 0.00 - (cellCount - (cellIndex + cellCountShown - locationindex + 1)) * cellHeight;
    else
        return viewHeight - tableTotalHeight;
    end
end

local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/' -- You will need this for encoding/decoding
function Utils.encodeBase64(source_str)
    return ((source_str:gsub('.', function(x)
        local r,b='',x:byte()
        for i=8,1,-1 do r=r..(b%2^i-b%2^(i-1)>0 and '1' or '0') end
        return r;
    end)..'0000'):gsub('%d%d%d?%d?%d?%d?', function(x)
        if (#x < 6) then return '' end
        local c=0
        for i=1,6 do c=c+(x:sub(i,i)=='1' and 2^(6-i) or 0) end
        return b:sub(c+1,c+1)
    end)..({ '', '==', '=' })[#source_str%3+1])
end

function Utils.decodeBase64(str64)
    str64 = string.gsub(str64, '[^'..b..'=]', '')

    return (str64:gsub('.', function(x)
        if (x == '=') then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do r=r..(f%2^i-f%2^(i-1)>0 and '1' or '0') end
        return r;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?', function(x)
        if (#x ~= 8) then return '' end
        local c=0
        for i=1,8 do c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0) end
            return string.char(c)
    end))
end

function Utils.getCreateTimeText(unixTime)
    local timeStr = ""
    local nowTime = Utils.getFormatNowUnixTimeToDate()
    local sendTime = Utils.getFormatUnixTimeToDate(unixTime)
    if tonumber(nowTime.year) == tonumber(sendTime.year) then
        local dayDiff = tonumber(nowTime.dayAtYear) - tonumber(sendTime.dayAtYear)
        if dayDiff > 7 then
            --显示几月几日
            timeStr = Utils.showFormatText(Enum.Text.Date, tostring(sendTime.month)..";"..tostring(sendTime.day))
        elseif dayDiff <=7 and dayDiff > 1 then
            --显示星期几
            local textData = DataManager:getTbxData("Text", Utils.getWeekByUnixTime(unixTime))
            if textData then
                timeStr = textData.Desc
            end
        elseif dayDiff == 1 then
            --显示昨天
            local hour = tonumber(sendTime.hour)
            if hour <=12 then
                timeStr = Utils.showFormatText(Enum.Text.YesterdayMoring, Utils.getDateByUnixTime(unixTime))
            else
                timeStr = Utils.showFormatText(Enum.Text.YesterdayAfternoon, Utils.getDateByUnixTime(unixTime))
            end
        elseif dayDiff < 1 then
            local hourDiff = tonumber(nowTime.hour) - tonumber(sendTime.hour)
            if hourDiff >= 1 then
                local hour = tonumber(sendTime.hour)
                if hour <=12 then
                    --显示今天上午
                    timeStr = Utils.showFormatText(Enum.Text.TodayMoring, Utils.getDateByUnixTime(unixTime))
                else
                    timeStr = Utils.showFormatText(Enum.Text.TodayAfternoon, Utils.getDateByUnixTime(unixTime))
                end
            else
                local minuteDiff = tonumber(nowTime.minute) - tonumber(sendTime.minute)
                if minuteDiff > 5 then
                    --几分钟前
                    timeStr = Utils.showFormatText(Enum.Text.MinuteBefore, minuteDiff)
                else
                    --显示刚刚
                    local textData = DataManager:getTbxData("Text", Enum.Text.Just)
                    if textData then
                        timeStr = textData.Desc
                    end
                end
            end
        end
    end

    return timeStr
end

function Utils.getFormatTitle(str)
    local char = ""
    local value = tostring(str)
    local strLen = #value
    if strLen >= GSystem.TitleShowLimitNumber then
        char = string.sub(value, 1, GSystem.TitleShowLimitNumber + 1)
        char = char.."..."
    else
        char = value
    end

    return char
end

local function Bytes4Character(theByte)
    local seperate = {0, 0xc0, 0xe0, 0xf0}
    for i = #seperate, 1, -1 do
        if theByte >= seperate[i] then return i end
    end
    return 1
end
function Utils.getCharacters(utf8Str, aChineseCharBytes)
    aChineseCharBytes = aChineseCharBytes or 2
    local i = 1
    local characterSum = 0
    while (i <= #utf8Str) do      -- 编码的关系
        local bytes4Character = Bytes4Character(string.byte(utf8Str, i))
        characterSum = characterSum + (bytes4Character > aChineseCharBytes and aChineseCharBytes or bytes4Character)
        i = i + bytes4Character
    end

    return characterSum
end

--统计字符个数，中文算2个字符，英文数字算一个字符
function Utils.getStringLength(str)
    local count = 0
    for uchar in string.gmatch(str, "([%z\1-\127\194-\244][\128-\191]*)") do
        if #uchar ~= 1 then
            count = count + 2
        else
            count = count + 1
        end
    end
    return count
end

function Utils.getCharacterNum(str)
    local count = 0
    for uchar in string.gmatch(str, "([%z\1-\127\194-\244][\128-\191]*)") do
        if #uchar ~= 1 then
            count = count + 2
        else
            if not (string.match(uchar, "^[0-9]*$") == nil) then
                count = count + 1
            elseif not (string.match(uchar, "^[A-Za-z]+$") == nil) then
                count = count + 1
            elseif not (string.match(uchar, "@") == nil) then
                count = count + 2
            else
                count = count + 1
            end
        end
    end
    return count
end

--##@Text 文本框
--##@userName 名字字符串
--##@maxPx 最大宽度size.width
--##设置文本内容，超长截取并添加...
function Utils.setShortName(Text, userName, maxPx)
    local sizeNow =  Text:getContentSize()
    if sizeNow.width > maxPx then
        local len = #userName
        local byteCount = 0
        for i = 1, len do
            local curByte = string.byte(userName, i)
            local preByteCount = byteCount
            if curByte > 0 and curByte <= 127 then
                byteCount = byteCount + 1
            elseif curByte>=192 and curByte < 223 then
                byteCount = byteCount + 2
            elseif curByte>=224 and curByte < 239 then
                byteCount = byteCount + 3
            elseif curByte>=240 and curByte <= 247 then
                byteCount = byteCount + 4
            end
            local char = string.sub(userName, 1, byteCount)

            Text:setString(char)
            local sizeAdpt =  Text:getContentSize()
            if sizeAdpt.width > maxPx then
                char = string.sub(userName, 1, preByteCount)
                char = char.."..."
                Text:setString(char)
                break
            end
            i = i + byteCount -1
        end
    end
end

function Utils.setShortDesc(str, maxPx)
    local value = str
    local len = #str
    local byteCount = 0
    for i = 1, len do
        local curByte = string.byte(str, i)
        local preByteCount = byteCount
        if curByte > 0 and curByte <= 127 then
            byteCount = byteCount + 1
        elseif curByte>=192 and curByte < 223 then
            byteCount = byteCount + 2
        elseif curByte>=224 and curByte < 239 then
            byteCount = byteCount + 3
        elseif curByte>=240 and curByte <= 247 then
            byteCount = byteCount + 4
        end
        local char = string.sub(str, 1, byteCount)

        if Utils.getCharacterNum(char) >= maxPx then
            char = string.sub(str, 1, preByteCount)
            char = char.."..."
            value = char
            return value
        end
        i = i + byteCount -1
    end
    return value
end

function Utils.startPay(productId)
    if DeviceUtils.isWindows() then

    elseif DeviceUtils.isIOS() then
        Payment.startAppStorePay({productId = productId})
    elseif DeviceUtils.isAndroid() then
        Payment.startGooglePlayPay({product_Id = productId})
    end
end

function Utils.parseItemData(v)
    local itemId = 0
    local itemNum = 0
    local itemType = v[1]
    if itemType == Enum.ItemShowType.Diamond then
        itemId = GSystem.DiamondItemId
        itemNum = v[2][1]
    elseif itemType == Enum.ItemShowType.Gold then
        itemId = GSystem.GoldItemId
        itemNum = v[2][1]
    elseif itemType == Enum.ItemShowType.Material then
        itemId = v[2][1]
        itemNum = v[2][2]
    elseif itemType == Enum.ItemShowType.DiceCup then
        itemId = v[2][1]
        itemNum = v[2][2] or 1
    end
    return itemId,itemNum
end

function Utils.exitGame()
    local platform = cc.Application:getInstance():getTargetPlatform()
    if platform == cc.PLATFORM_OS_IPHONE or platform == cc.PLATFORM_OS_IPAD then  -- iOS设备
        os.exit()
    else
        cc.Director:getInstance():endToLua()
    end
end

function Utils.addMaskLayer()
    local   maskLayer=UIManager:getOrCreatePanel("UINetLimitPopUp")
    if maskLayer then
        maskLayer:showToScene()
    end
end

function Utils.removeMaskLayer()
    local   maskLayer=UIManager:getPanel("UINetLimitPopUp")
    if maskLayer then
        maskLayer:closePanel()
    end
end

function Utils.getTextByTextId(textId)
    local text = ""
    local textData = DataManager:getTbxData("Text", textId)
    if textData then
        text = textData.Desc
    else
        Log.log("text tbx is not found", textId)
    end
    return text
end

function Utils.transformProhibitWord(content)
    local text=content
    local ProhibitWord=DataManager:getTbxData("ProhibitWord")
    for k,_ in pairs(ProhibitWord) do
        local _start,_end=string.find(text,k,1)
        if nil~=_start and nil~=_end and _start~=_end then
            text=string.gsub(text,k,"*")
        end
    end

    return text
end

function Utils.isProhibitWord(str)
    local isProhibitWord = false
    local ProhibitWord = DataManager:getTbxData("ProhibitWord")
    for k,_ in pairs(ProhibitWord) do
        local _start,_end = string.find(str, k, 1)
        if nil ~= _start and nil ~= _end and _start ~= _end then
            isProhibitWord = true
        end
    end
    return isProhibitWord
end

function Utils.isBtnClickNeedDelay(ref,time)
    if not ref._delayTime then
        ref._delayTime=socket.gettime()*1000
        return false
    end

    local t=socket.gettime()*1000-ref._delayTime
    if t<time then
        return true
    else
        ref._delayTime=socket.gettime()*1000
    end

    return false
end

function Utils.GetServerHeadIcon(userId, avatarUrl,SeccesCallBack)

    if Utils.isEmptyStr(avatarUrl) then
        return
    end

    local d = cc.Downloader.new()
    d:setOnFileTaskSuccess(SeccesCallBack)
    local onTaskError=function ()
        print("下载失败1")
    end

    d:setOnTaskError(onTaskError)

    if cc.FileUtils:getInstance():isFileExist(DeviceUtils.getAvatarWritablePath(userId)) then
        cc.FileUtils:getInstance():removeFile(DeviceUtils.getAvatarWritablePath(userId))
    end

    d:createDownloadFileTask(avatarUrl, DeviceUtils.getAvatarWritablePath(userId))

end

--##@NameText 基准文本框
--##@SexIcon 性别图标
--##@VipPanel VipIcon
--##性别图标和vip图标跟随基准文本自动调整位置
function Utils.showFormatVip(NameText, VipPanel, SexIcon)
    if NameText == nil or VipPanel == nil then
        return
    end
    local nameAnchorPoint = NameText:getAnchorPoint()
    local namePosX = NameText:getPositionX()
    local namePosY = NameText:getPositionY()
    local nameWidth = NameText:getContentSize()

    local nameoffset = nameWidth.width
    if nameAnchorPoint.x == 0.5 then
        nameoffset = nameWidth.width / 2
    elseif nameAnchorPoint.x == 1 then
        nameoffset = 0
    end

    local function getVipOffset()
        local vipWidth = VipPanel:getContentSize()
        local vipoffset = 0
        if nameAnchorPoint.x == 0.5 then
            vipoffset = vipWidth.width / 2
        elseif nameAnchorPoint.x == 1 then
            vipoffset = vipWidth.width
        end
        return vipoffset
    end

    if SexIcon == nil then
        VipPanel:setAnchorPoint(cc.p(nameAnchorPoint.x, nameAnchorPoint.y))
        VipPanel:setPosition(cc.p(namePosX + nameoffset + getVipOffset(), namePosY))
    else
        if SexIcon:isVisible() then
            local sexWidth = SexIcon:getContentSize()
            local sexoffset = 0
            if nameAnchorPoint.x == 0.5 then
                sexoffset = sexWidth.width / 2
            elseif nameAnchorPoint.x == 1 then
                sexoffset = sexWidth.width
            end
            SexIcon:setAnchorPoint(cc.p(nameAnchorPoint.x, nameAnchorPoint.y))
            SexIcon:setPosition(cc.p(namePosX + nameoffset + sexoffset, namePosY))

            --sex在中间重置为固定值
            sexoffset = sexWidth.width
            VipPanel:setAnchorPoint(cc.p(nameAnchorPoint.x, nameAnchorPoint.y))
            VipPanel:setPosition(cc.p(namePosX + nameoffset + sexoffset + getVipOffset(), namePosY))
        else
            VipPanel:setAnchorPoint(cc.p(nameAnchorPoint.x, nameAnchorPoint.y))
            VipPanel:setPosition(cc.p(namePosX + nameoffset + getVipOffset(), namePosY))
        end
    end
end

function Utils.getNodeWordPosition(node)
    local parent = node:getParent()
    if parent then
        return parent:convertToWorldSpace(cc.p(node:getPosition()))
    end

    return cc.p(node:getPosition())
end

--t type: table
--获取table实际长度
function Utils.getTableLength(t)
    if type(t) ~= "table" then
        print("invaild type")
        return 0
    end
    local len = 0
    for k,v in pairs(t) do
        len = len + 1
    end
    return len
end

--获取区域内(feild)一定数量的随机点位坐标(趋于中心点)
function Utils.getRandomFeildPosList(feildSize,nodeList,needOffsetByScale)
    local poslist={}
    local n = 2--指数
    for i,v in pairs(nodeList) do
        local nodeSize = v:getContentSize()
        local nodeScaleX = v:getScaleX()
        local nodeScaleY = v:getScaleY()
        local _dx = math.random()
        local _dy = math.random()
        local dx = ((2*_dx-1)^n+1)/2
        local dy = ((2*_dy-1)^n+1)/2
        if _dx<1/2 then
            dx = 1-dx
        end

        if _dy<1/2 then
            dy = 1-dy
        end

        local posx = (feildSize.width-nodeScaleX*nodeSize.width)*dx+nodeScaleX*nodeSize.width/2
        local posy = (feildSize.height-nodeScaleY*nodeSize.height)*dy+nodeScaleY*nodeSize.height/2
        if needOffsetByScale then
            posx = posx + (nodeScaleX-1)*nodeSize.width/2
            posy = posy + (nodeScaleY-1)*nodeSize.height/2
        end

        table.insert(poslist,cc.p(posx,posy))
    end

    return poslist
end
--str 显示的文字"{\"RichText\": [{\"text\": \"你好\",\"color\": {\"r\": 255,\"g\": 0,\"b\": 0},\"opacity\": 255,\"fontName\": \"Microsoft Yahei\",\"fontSize\": 20,\"outlineColor\": {\"r\": 255,\"g\": 255,\"b\": 255},\"outlineSize\": 1},{\"text\": \"来吧\",\"color\": {\"r\": 114,\"g\": 220,\"b\": 112},\"opacity\": 255,\"fontName\": \"Microsoft Yahei\",\"fontSize\": 32,\"outlineColor\": {\"r\": 255,\"g\": 255,\"b\": 255},\"outlineSize\": 1}]}"
--isAutoLine 是否自动换行
--contenSize 整个显示区域大小
--anchorPoint 锚点
--return 富文本ccui.RichText，源字符串myText
function Utils.CreateRichText(str,isAutoLine,contenSize,anchorPoint)
    if not contenSize then
        contenSize=cc.size(500, 40)
    end
    isAutoLine=true
    if isAutoLine~=nil and isAutoLine==false then
        isAutoLine = false
    end
    if not anchorPoint then
        anchorPoint=cc.p(0,0.5)
    end
    local myText = ""
    local jsonStr = json.decode(str)
    --Log.print_table(jsonStr)
    local richText = ccui.RichText:create()
    richText:ignoreContentAdaptWithSize(isAutoLine)
    richText:setAnchorPoint(anchorPoint)
    if table.getn(jsonStr.RichText) >0 then
        for i,v in ipairs(jsonStr.RichText) do
            --Log.print_table(v)
            local flags = 0
            local outlineColor = cc.c3b(255, 255, 255)
            local outlineSize = -1
            if v.outlineColor and v.outlineSize>0 then
                outlineColor=cc.c3b(v.outlineColor.r, v.outlineColor.g, v.outlineColor.b)
                outlineSize=v.outlineSize
                flags=32
            end
            myText = myText..v.text
            local text = ccui.RichElementText:create(i,cc.c3b(v.color.r,v.color.g,v.color.b),v.opacity,v.text,v.fontName,v.fontSize,flags,"",outlineColor,outlineSize)
            richText:pushBackElement(text)
        end
    end

    return richText, myText
end

function Utils.CreateRichText2(str,isAutoLine,contenSize,anchorPoint)
    if not contenSize then
        contenSize=cc.size(500, 40)
    end
    isAutoLine=true
    if isAutoLine~=nil and isAutoLine==false then
        isAutoLine = false
    end
    if not anchorPoint then
        anchorPoint=cc.p(0,0.5)
    end
    local myText = ""
    local totalRow = 0
    local jsonStr = json.decode(str)
    --Log.print_table(jsonStr)
    local richText = ccui.RichText:create()
    richText:ignoreContentAdaptWithSize(isAutoLine)
    richText:setAnchorPoint(anchorPoint)
    if table.getn(jsonStr) >0 then
        for i,_ in ipairs(jsonStr) do
            local v=_["style"]
            --Log.print_table(v)
            local flags = 0
            local outlineColor = cc.c3b(255, 255, 255)
            local outlineSize = -1
            if v.outlineColor and v.outlineSize>0 then
                outlineColor=cc.c3b(v.outlineColor.r, v.outlineColor.g, v.outlineColor.b)
                outlineSize=v.outlineSize
                flags=32
            end
            myText = myText..v.text
            if v.text=="\n" then
                local line=ccui.RichElementNewLine:create(i,cc.c3b(v.color.r,v.color.g,v.color.b),v.opacity)
                richText:pushBackElement(line)
                totalRow=totalRow+1
            else
                local len=Utils.getStringLength(v.text)
                local row=math.ceil(len/(2*23))
                totalRow=totalRow+row
                local text = ccui.RichElementText:create(i,cc.c3b(v.color.r,v.color.g,v.color.b),v.opacity,v.text,v.fontName,v.fontSize,flags,"",outlineColor,outlineSize)
                richText:pushBackElement(text)
            end
        end
    end

    return richText, myText,totalRow
end

function Utils.SetFrontPathType(languageType)
    local searchPaths = cc.FileUtils:getInstance():getSearchResolutionsOrder()
    local searchNewPaths={}

    if languageType == Enum.LanguageType.en then
        for i,v in ipairs(searchPaths) do
            if v=="en/font" then
            else
                table.insert(searchNewPaths,v)
            end
        end
        table.insert(searchNewPaths,1,"en/font")
    else
        for i,v in ipairs(searchPaths) do
            if v=="en/font" then
            else
                table.insert(searchNewPaths,v)
            end
        end
    end
    cc.FileUtils:getInstance():setSearchResolutionsOrder(searchNewPaths)
    -- table.insert(searchPaths, 1, storagePath)  
    -- table.insert(searchPaths, 2, resPath)
    -- table.insert(searchPaths, 3, srcPath)
    -- cc.FileUtils:getInstance():setSearchPaths(searchPaths)
end

--number : 需要添加,的数字,每三位加逗号
function Utils.getFormatNumber(number)
    local result = tostring(number)
    if type(number) == "number" then
        local integerPart, decimalPart = math.modf(number)

        local str = tostring(integerPart)
        local newStr = ""
        local len = string.len(str)
        local count = 0
        for i = len, 1, -1 do
            if count % 3 == 0 and count ~= 0  then
                newStr = string.format("%s,%s", string.sub(str, i, i), newStr)
            else
                newStr = string.format("%s%s", string.sub(str, i, i), newStr)
            end
            count = count + 1
        end

        result = newStr
    end
    return result
end

function Utils.getDayByCreateTime(time)
    local nowTime = Utils.getFormatNowUnixTimeToDate()
    local createTime = Utils.getFormatUnixTimeToDate(time)
    local year=tonumber(nowTime.year) - tonumber(createTime.year)
    local dayDiff = tonumber(nowTime.dayAtYear) - tonumber(createTime.dayAtYear)
    local day=year*365+dayDiff
    if day<=0 then day=1 end

    return day
end

function Utils.bubbleSort(t,cb)
    for i=1,#t,1 do
        for j=i+1,#t,1 do
            if cb(t[i],t[j]) then
                local temp=t[i]
                t[i]=t[j]
                t[j]=temp
            end
        end
    end
end

--创建一个list view  scollview 类的widget
function Utils.createWidgetByPanel(panel)
    if panel then
        local widget = ccui.Widget:create()
        widget:setContentSize(panel:getContentSize())
        widget:addChild(panel)
        return widget
    end

    return nil
end