local M = class("GameSettingData")
local className = "bridge/AppController" -- java类名
function M:ctor()
    self.mFringeScreenTop = 0
    self.mResourceVersion="1.0.0.0"
    self:init()
end

function M:setResourceVersion(resourceVersion)
    self.mResourceVersion=resourceVersion
end

function M:getResourceVersion()
    return self.mResourceVersion
end

function M:getFringeScreenTop()
    return self.mFringeScreenTop
end
function M:initFringeScreenTop()
    
    if DeviceUtils.isIOS() then
        local ok, ret = Launcher.callStaticMethod("AppController", "getFringeScreenTop", nil)
        if ok then
            self.mFringeScreenTop=ret
            Log.info("获取的刘海屏的高度："..self.mFringeScreenTop)
        end
    elseif DeviceUtils.isAndroid() then
        local ok, ret = Launcher.callStaticMethod(Launcher.javaClassName, "getFringeScreenTop", {}, "()I")
        if ok then
            -- self.mFringeScreenTop=ret-36
            -- if self.mFringeScreenTop<0 then
            --     self.mFringeScreenTop=0
            -- end
            self.mFringeScreenTop=0
            Log.info("获取的刘海屏的高度："..self.mFringeScreenTop)
        end
    end
end
function M:init()
    -- 音乐
    if not self.mMusicVolume then 
        self:setMusicVolume(Preference:getInt("music_volume", GSystem.InitMusicVolume))
    end

    -- 音效
    if not self.mSoundVolume then 
        self:setSoundEffectVolume(Preference:getInt("sound_volume", GSystem.InitSoundVolume))
    end

    -- cv
    if not self.mVoiceVolume then 
        self:setVoiceVolume(Preference:getInt("voice_volume", GSystem.InitCVVolume))
    end

    -- 震动
    if not self.isShakeOpened then 
        self:setShaked(Preference:getBool("shake_switch", GSystem.InitVibrationSwitch))
    end

    -- 音乐开
    if not self.isMusicCheckBoxSelected then 
        self:setIsMusicSelected(Preference:getBool("music_switch", true))
    end

    -- 音效开
    if not self.isSoundEffectCheckBoxSelected then 
        self:setIsSoundSelected(Preference:getBool("sound_switch", true))
    end

    -- cv开
    if not self.isVoiceCheckBoxSelected then 
        self:setIsVoiceSelected(Preference:getBool("voice_switch", true))
    end

    if not self.bIsMicOpened then 
        self:setIsMicOpened(Preference:getBool("mic_switch", false))
    end

    self:initFringeScreenTop()
end

--音乐
function M:getMusicVolume()
    return self.mMusicVolume
end

function M:setMusicVolume(value)
    self.mMusicVolume = value
    --volume取值为0~1
    if self.isMusicCheckBoxSelected then 
        SoundSystemManager:setBackMusicVolume(value / 100)
    else
        SoundSystemManager:setBackMusicVolume(0)
    end
end

--音效
function M:getSoundEffectVolume()
    return self.mSoundVolume
end

function M:setSoundEffectVolume(value)
    self.mSoundVolume = value
    SoundSystemManager:setAllEffectVolume(value / 100)
    --音效音量
end

--cv
function M:getVoiceVolume()
    return self.mVoiceVolume
end

function M:setVoiceVolume(value)
    self.mVoiceVolume = value
    SoundSystemManager:setAllVoiceVolume(value / 100)
    --cv音量
end

--震动
function M:getIsShaked()
    return self.isShakeOpened
end

function M:setShaked(isShaked)
    self.isShakeOpened = isShaked
    --震动api
end
function M:reCheckVersion(version)
    local packageVersion = g_GameSettingData:getVersion()
    print("reCheckVersion:"..version.."  "..packageVersion)
    local packageversions = string.split(packageVersion,".")
    local versions = string.split(version,".")
    Log.print_table(packageversions)
    Log.print_table(versions)
    if not DeviceUtils.isWindows() then
        if tonumber(packageversions[1])~= tonumber(versions[1]) or tonumber(packageversions[2])~= tonumber(versions[2]) or (tonumber(packageversions[1])==1 and tonumber(packageversions[2])==6)  then
            display.getRunningScene():runAction(cc.Sequence:create(cc.DelayTime:create(0.2),cc.CallFunc:create(function ()
                local panel = UIManager:getOrCreatePanel("UILoadingTipPopUp_2")
                if panel then 
                    panel:showToScene()             
                end
            end)))
            return false
        end
    end
    return true
end
function M:getVersion()
    --getVersion
    local version ="1.1.0"
    if DeviceUtils.isIOS() then
        local ok, ret = Launcher.callStaticMethod("AppController", "getVersion")
        version = ret
    elseif DeviceUtils.isAndroid() then
        local ok, ret = Launcher.callStaticMethod(className, "getVersion", {}, "()Ljava/lang/String;")
        version = ret
    end
    Log.info("version:"..version)
    return  version
end

--
function M:getIsMusicSelected()
    return self.isMusicCheckBoxSelected
end

function M:setIsMusicSelected(isSelected)
    self.isMusicCheckBoxSelected = isSelected
    --开关音乐
    if self.isMusicCheckBoxSelected then 
        SoundSystemManager:setBackMusicVolume(self:getMusicVolume() / 100)
    else
        SoundSystemManager:setBackMusicVolume(0)
    end
end

-- 
function M:getIsSoundSelected()
    return self.isSoundEffectCheckBoxSelected
end

function M:setIsSoundSelected(isSelected)
    self.isSoundEffectCheckBoxSelected = isSelected
    if not self.isSoundEffectCheckBoxSelected then 
        SoundSystemManager:stopAllEffect()
    end
end

function M:getIsVoiceSelected()
    return self.isVoiceCheckBoxSelected
end

function M:setIsVoiceSelected(isSelected)
    self.isVoiceCheckBoxSelected = isSelected
    if not self.isVoiceCheckBoxSelected then 
        SoundSystemManager:stopAllVoice()
    end
end

function M:getIsMicOpened()
    return self.bIsMicOpened
end

function M:setIsMicOpened(isMicOpened)
    self.bIsMicOpened = isMicOpened
end

function M:saveSettingDataToLocal()
    -- self:setMusicVolume(self.mMusicVolume)
    -- self:setSoundEffectVolume(self.mSoundVolume)
    -- self:setVoiceVolume(self.mVoiceVolume)
    -- self:setShaked(self.isShakeOpened)
    -- self:setIsMusicSelected(self.isMusicCheckBoxSelected)
    -- self:setIsSoundSelected(self.isSoundEffectCheckBoxSelected)
    -- self:setIsVoiceSelected(self.isVoiceCheckBoxSelected)

    Preference:setInt(Constant.PreferenceKey.MUSIC_VOLUME, self.mMusicVolume)
    Preference:setInt(Constant.PreferenceKey.SOUND_VOLUME, self.mSoundVolume)
    Preference:setInt(Constant.PreferenceKey.VOICE_VOLUME, self.mVoiceVolume)
    Preference:setBool(Constant.PreferenceKey.SHAKE_SWITCH, self.isShakeOpened)
    Preference:setBool(Constant.PreferenceKey.MUSIC_SWITCH, self.isMusicCheckBoxSelected)
    Preference:setBool(Constant.PreferenceKey.SOUND_SWITCH, self.isSoundEffectCheckBoxSelected)
    Preference:setBool(Constant.PreferenceKey.VOICE_SWITCH, self.isVoiceCheckBoxSelected)
    Preference:setBool(Constant.PreferenceKey.MIC_SWITCH, self.bIsMicOpened)
end

function M:panamathInit(muid)
    Log.info("========================================")
    local _uid = ""
    if muid then
        _uid=muid
    end
    local tfAppKey = "F885KB3HD89K24HK0B35"
    Log.info("------------------------------------Net.NetworkEnvironment："..Net.NetworkEnvironment.."  Enum.requestServerHodType.outLine:"..Enum.requestServerHodType.outLine)
    if tonumber(Net.NetworkEnvironment) ~= tonumber(Enum.requestServerHodType.outLine) then
        Log.info("------------------------------------转成非线上环境")
        tfAppKey = "HGEM3H251BI2D3B0NMIF"
    end
    if DeviceUtils.isIOS() then
        Launcher.callStaticMethod("AppController", "initTFDataManager", { appKey = tfAppKey ,user_id=_uid})
    elseif DeviceUtils.isAndroid() then
        Launcher.callStaticMethod(Launcher.javaClassName, "initTFDataManager", {  json.encode({sppkey=tfAppKey,user_id=_uid })},nil)
        Log.info("初始化panamath")
    end
end

return M