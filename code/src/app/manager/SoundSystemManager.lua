local M = {}

local AUDIO_SAVE_NUMBER = 32
local AUDIO_SAVE_TIME = 10

local downPersent = 0.3 --背景音乐与音效降低30%
local mBackMusicVolume = 1 * (1 - downPersent)
local mEffectVolume = 1 * (1 - downPersent)
local mVoiceVolume = 1
local mVolumeCoefficient = 1

local mBackMusicId = cc.AUDIO_INVAILD_ID

local AudioType = {
    bg = "bg",
    effect = "effect",
    cv = "cv",
}

-- path:string => count:int
local mAudioFileCount = {}

-- audioID:int => path:string
local mAudioIDMap = {bg={},effect={},cv={}}
local className = "bridge/AppController" -- java类名

function M:getRandomDefaultBGMPath()
    local defaultBGMPath = "music/01bgm/Bgm001.mp3"
    local defaultBGMArray = {}
    defaultBGMArray = Utils.splitString(GSystem.DefaultBGM, ";")       --以 ; 分割字符串，放入表a里面
    if not Utils.isEmptyTable(defaultBGMArray) then 
        local len = #defaultBGMArray
        local randomNum = math.random(0, len - 1) + 1
        local defaultBGM = defaultBGMArray[randomNum] or "Bgm001"
        defaultBGMPath = string.format("music/01bgm/%s.mp3", defaultBGM)
    end
    return defaultBGMPath
end

function M:playEffect(filePath, loop, volume)
    if not g_GameSettingData:getIsSoundSelected() then 
        return
    end
    if not volume or mEffectVolume == 0 then
        volume = mEffectVolume
    else
        volume = mEffectVolume * volume
    end

    local count = 0
    for audiotype,v in pairs(mAudioIDMap) do
        if audiotype == AudioType.effect then 
            count = count + Utils.getTableLength(v)
        end
    end
    if count >= GSystem.SoundAtOncePlayMax then 
        return
    end

    return self:playSound(AudioType.effect,filePath, loop, volume)
end

function M:stopAllEffect()
    for audioID, filePath in pairs(mAudioIDMap[AudioType.effect]) do
        if filePath then
            self:stopSound(AudioType.effect,audioID)
        end
    end
end

function M:pauseAllEffect()
    for audioID, filePath in pairs(mAudioIDMap[AudioType.effect]) do
        if filePath then
            self:pauseSound(audioID)
        end
    end
end

function M:resumeAllEffect()
    for audioID, filePath in pairs(mAudioIDMap[AudioType.effect]) do
        if filePath then
            self:resumeSound(audioID)
        end
    end
end

function M:setAllEffectVolume(volume)
    for audioID, filePath in pairs(mAudioIDMap[AudioType.effect]) do
        if filePath then
            self:setSoundVolume(audioID, volume)
        end
    end
    mEffectVolume = volume * (1 - downPersent)
end

function M:playBackMusic(filePath)
    self:stopBackMusic()

    mBackMusicId = self:playSound(AudioType.bg, filePath, false, mBackMusicVolume)
end

function M:stopBackMusic()
    if mBackMusicId ~= cc.AUDIO_INVAILD_ID then
        self:stopSound(AudioType.bg, mBackMusicId)
    end

    mBackMusicId = cc.AUDIO_INVAILD_ID
end

function M:pauseBackMusic()
    if mBackMusicId ~= cc.AUDIO_INVAILD_ID then
        self:pauseSound(mBackMusicId)
    end
end

function M:resumeBackMusic()
    if mBackMusicId ~= cc.AUDIO_INVAILD_ID then
        self:resumeSound(mBackMusicId)
    end
end

function M:setBackMusicVolume(volume)
    if mBackMusicId ~= cc.AUDIO_INVAILD_ID then
        self:setSoundVolume(mBackMusicId, volume)
    end
    mBackMusicVolume = volume * (1 - downPersent)
end

function M:setBackMusicVolumeByPercent(persent)
    if mBackMusicId ~= cc.AUDIO_INVAILD_ID then
        self:setSoundVolume(mBackMusicId, mBackMusicVolume * persent)
    end
end

function M:stopAllVoice()
    for audioID, filePath in pairs(mAudioIDMap[AudioType.cv]) do
        if filePath then
            self:stopSound(AudioType.cv,audioID)
        end
    end
end

function M:setAllVoiceVolume(volume)
    for audioID, filePath in pairs(mAudioIDMap[AudioType.cv]) do
        if filePath then
            self:setSoundVolume(audioID, volume)
        end
    end
    mVoiceVolume = volume
end

--音量系数
function M:getVolumeCoefficient()
    return mVolumeCoefficient
end

function M:setVolumeCoefficient(Coefficient)
    mVolumeCoefficient = Coefficient
    if g_GameSettingData:getIsMusicSelected() then
        self:setBackMusicVolume(mBackMusicVolume)
    end

    if g_GameSettingData:getIsSoundSelected() then
        self:setAllEffectVolume(mEffectVolume)
    end

    if g_GameSettingData:getIsVoiceSelected() then
        self:setAllVoiceVolume(mVoiceVolume)
    end
end

function M:playSound(audiotype,filePath, loop, volume)
    if not loop then loop = false end
    if not volume then volume = mEffectVolume end
    volume = volume*mVolumeCoefficient
    local ret = ccexp.AudioEngine:play2d(filePath, loop, volume)
    if ret ~= cc.AUDIO_INVAILD_ID then
        if not loop then
            if audiotype == AudioType.bg then 
                ccexp.AudioEngine:setFinishCallback(ret, handler(self, self.onFinishBGMCallback))
            else
                ccexp.AudioEngine:setFinishCallback(ret, handler(self, self.onFinishCallback))
            end
        end
        mAudioIDMap[audiotype][ret] = filePath
        if not mAudioFileCount[filePath] then
            mAudioFileCount[filePath] = { count = 0, time = AUDIO_SAVE_TIME }
        end
        mAudioFileCount[filePath].count = mAudioFileCount[filePath].count + 1
    end

    return ret
end

function M:playCv(filePath, loop, volume)
    if not g_GameSettingData:getIsVoiceSelected() then 
        return
    end
    if not loop then loop = false end
    if not volume then volume = mVoiceVolume end
    volume = volume*mVolumeCoefficient
    local ret = ccexp.AudioEngine:play2d(filePath, loop, volume)
    if ret ~= cc.AUDIO_INVAILD_ID then
        if not loop then
            ccexp.AudioEngine:setFinishCallback(ret, handler(self, self.onFinishCallback))
        end
        mAudioIDMap[AudioType.cv][ret] = filePath
        if not mAudioFileCount[filePath] then
            mAudioFileCount[filePath] = { count = 0, time = AUDIO_SAVE_TIME }
        end
        mAudioFileCount[filePath].count = mAudioFileCount[filePath].count + 1
    end

    return ret
end

function M:stopSound(audiotype,audioID)
    if audioID == nil then
        return
    end

    ccexp.AudioEngine:stop(audioID)

    self:releaseAudio(mAudioIDMap[audiotype][audioID])

    mAudioIDMap[audiotype][audioID] = nil
end

function M:pauseSound(audioID)
    if audioID == nil then
        return
    end
    ccexp.AudioEngine:pause(audioID)
end

function M:resumeSound(audioID)
    if audioID == nil then
        return
    end
    ccexp.AudioEngine:resume(audioID)
end

function M:setSoundVolume(audioID, volume)
    if audioID == nil then
        return
    end
    ccexp.AudioEngine:setVolume(audioID, volume*mVolumeCoefficient)
end

function M:releaseAudio(name)
    if mAudioFileCount[name] then
        mAudioFileCount[name].count = mAudioFileCount[name].count - 1
        if mAudioFileCount[name].count >= 0 then
            mAudioFileCount[name].time = AUDIO_SAVE_TIME
        else
            mAudioFileCount[name].time = 0
        end
    end
end

function M:onFinishCallback(audioID, filePath)
    for audiotype,v in pairs(mAudioIDMap) do
        if v[audioID] then
            v[audioID] = nil
        end
    end

    self:releaseAudio(filePath)
end

function M:onFinishBGMCallback(audioID, filePath)
    for audiotype,v in pairs(mAudioIDMap) do
        if audiotype == AudioType.bg then 
            local randomPath = self:getRandomDefaultBGMPath()
            while(filePath == randomPath) 
            do
                randomPath = self:getRandomDefaultBGMPath()
            end
            self:playBackMusic(randomPath)
        end
        if v[audioID] then
            v[audioID] = nil
        end
    end

    self:releaseAudio(filePath)
end

function M:onUpdate(dt)
    for name, data in pairs(mAudioFileCount) do
        if data.count <= 0 then
            if data.time <= 0 then
                ccexp.AudioEngine:uncache(name)
                mAudioFileCount[name] = nil
            else
                data.time = data.time - dt
            end
        end
    end
end

function M:getCVSoundStrById(id,sex)
    sex= sex or 0
    local cvPath={}
    if 1==sex then
        cvPath[Enum.LanguageType.zh_tw]="music/03cv/02zhTW/"
        cvPath[Enum.LanguageType.en]="music/03cv/03en/"
        cvPath[Enum.LanguageType.zh_cn]="music/03cv/01zhCN/"
    else
        cvPath[Enum.LanguageType.zh_tw]="music/03cv/05GirlzhTW/"
        cvPath[Enum.LanguageType.en]="music/03cv/06Girlen/"
        cvPath[Enum.LanguageType.zh_cn]="music/03cv/04GirlzhCN/"
    end
    
    local sounddata = DataManager:getTbxData("CV",id)
    local soundStr=""
    if g_UserData:getSystemLanguage() == Enum.LanguageType.zh_tw then
        local   _arr=string.split(sounddata.CVRes_zh_TW,",")
        local   ran=math.ceil(math.random()*#_arr)
        
        soundStr = cvPath[g_UserData:getSystemLanguage()].._arr[ran]..".mp3"
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.en  then
        local   _arr=string.split(sounddata.CVRes_en,",")
        local   ran=math.ceil(math.random()*#_arr)
        
        soundStr = cvPath[g_UserData:getSystemLanguage()].._arr[ran]..".mp3"
    elseif g_UserData:getSystemLanguage() == Enum.LanguageType.zh_cn  then
        local   _arr=string.split(sounddata.CVRes_zh_CN,",")
        local   ran=math.ceil(math.random()*#_arr)
        
        soundStr = cvPath[g_UserData:getSystemLanguage()].._arr[ran]..".mp3"
    end

    return soundStr
end

function M:playSound004(volume)
    return SoundSystemManager:playEffect("music/02sound/Sound004.mp3",false,volume)
end

function M:playSound006()
    return SoundSystemManager:playEffect("music/02sound/Sound006.mp3",false)
end

function M:playSound0013()
    return SoundSystemManager:playEffect("music/02sound/Sound013.mp3",false)
end

function M:playSound009()
    return SoundSystemManager:playEffect("music/02sound/Sound009.mp3",false)
end

function M:playSound0010()
    return SoundSystemManager:playEffect("music/02sound/Sound010.mp3",false)
end

function M:playSound002(volume)
    return SoundSystemManager:playEffect("music/02sound/Sound002.mp3",false,volume)
end

function M:playSound0011()
    return SoundSystemManager:playEffect("music/02sound/Sound011.mp3",false)
end

function M:playSound0012()
    return SoundSystemManager:playEffect("music/02sound/Sound012.mp3",false)
end

function M:playSound003()
    return SoundSystemManager:playEffect("music/02sound/Sound003.mp3",false)
end

function M:playSound008(volume)
    return SoundSystemManager:playEffect("music/02sound/Sound008.mp3",false,volume)
end

function M:playSound007()
    return SoundSystemManager:playEffect("music/02sound/Sound007.mp3",false)
end

function M:playSound022()
    return SoundSystemManager:playEffect("music/02sound/Sound022.mp3",false)
end

function M:playSound023()
    return SoundSystemManager:playEffect("music/02sound/Sound023.mp3",false)
end

function M:playSound024()
    return SoundSystemManager:playEffect("music/02sound/Sound024.mp3",false)
end

function M:playSound025()
    return SoundSystemManager:playEffect("music/02sound/Sound025.mp3",false)
end

function M:playSound026()
    return SoundSystemManager:playEffect("music/02sound/Sound026.mp3",false)
end

function M:playSound005()
    if GSystem.GoldSound then
        local idx = math.random(1,#GSystem.GoldSound)
        return SoundSystemManager:playEffect("music/02sound/"..GSystem.GoldSound[idx]..".mp3",false)
    else
        return SoundSystemManager:playEffect("music/02sound/Sound005.mp3",false)
    end
end

function M:vibrate()
    if not g_GameSettingData:getIsShaked() then
        return
    end
    
    if DeviceUtils.isAndroid() then
        local javaMethodName = "vibrate"
        local javaParams = { }
        local javaMethodSig = "()V"
        local ok, ret = Launcher.callStaticMethod(className, javaMethodName, javaParams, javaMethodSig)

    elseif DeviceUtils.isIOS() then
        local ok, ret = Launcher.callStaticMethod("AppController", "vibrate")

    end
end

return M