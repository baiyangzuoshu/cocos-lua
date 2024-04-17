local M = class("UserInfo")

function M:ctor(uid)
    self.mUid = uid or ""
    self.mHead = "101001"
    self.mHeadBox = 102001
    self.mDiceBox = 0
    self.mFansNum = 0
    self.mNickName = ""
    self.mSex = 0
    self.mSlogan = ""
    self.mShareUrl = ""

    self.mVipLevel = 0
    self.mVipExp = 0
    self.mIsCanReceiveVipReward = false
    
    self.mIsChangeNickName = false
    self.mIsChangeSex = false
    self.mIsSystemHead = true
    self.mIsService = false--客服标志

    self.mGold = 0
    self.mDiamond = 0

    self.mGetHeadCallBack = nil
end

function M:initData(userData)
    self.mUid = userData.uid
    self.mHead = userData.avatar or "101001"
    self.mHeadBox = userData.avatarFrame
    self.mDiceBox = userData.diceBox
    self.mFansNum = userData.fansNum
    self.mNickName = userData.nickname
    self.mSex = userData.sex
    self.mSlogan = userData.slogan

    self.mIsChangeNickName = userData.isChangedNickname
    self.mIsChangeSex = userData.isChangedSex
    self.mIsSystemHead = userData.isSystemAvatar

    self.mGold = userData.gold
    self.mDiamond = userData.diamond
    self.mShareUrl = userData.shareUrl

    self.mVipLevel = userData.vipLevel
    self.mVipExp = userData.vipExp
    self.mIsCanReceiveVipReward = userData.canGainVipLevelReward
    self.mChargeNoviceProductTime = userData.chargeNoviceProductTime--// 新手礼包充值时间，默认为0
    self.mGotRegisterRewardTime = userData.gotRegisterRewardTime--首登赠礼领取时间，默认为0
    self.mDailyReliefCount=userData.dailyReliefCount--当日领取救助金次数
    self.mGuideTime=userData.guideStep or 0--新手引导
    self.mIsService=userData.isParam or false
    
    g_HotData:setGuideStep(self.mGuideTime)
end

function M:getShareUrl()
    return self.mShareUrl
end

function M:getUserId()
    return self.mUid
end
function M:getHeadIcon(CallBack)
    self.mGetHeadCallBack=CallBack
    local headPath = ""
    local loadType = ccui.TextureResType.localType
    if self.mIsSystemHead then

        loadType = ccui.TextureResType.plistType
        if self.mGetHeadCallBack then
            headPath=Utils.getIconStr(PlistConfig.Icon.Head, tonumber(self:getHead()))
            self.mGetHeadCallBack(headPath,loadType)
        end
        
    else
        --getHeadData
        loadType = ccui.TextureResType.localType
        headPath=g_UserHeadIconData:getHeadData(self.mHead,self.mUid)
        if headPath == "" then
            Utils.GetServerHeadIcon(self.mUid,self.mHead,handler(self,self.doewLoadPngSeccess))
        else
            if self.mGetHeadCallBack then
                self.mGetHeadCallBack(headPath,loadType)
            end
        end
    end
end

function M:doewLoadPngSeccess(task)
    local filepath = task.storagePath
    g_UserHeadIconData:addHeadData(self.mHead,filepath)
    local acts = {}
    acts[#acts + 1] = cc.DelayTime:create(0.1)
    acts[#acts + 1] = cc.CallFunc:create(function ()
        if self.mGetHeadCallBack then
            local loadType = ccui.TextureResType.localType
            self.mGetHeadCallBack(filepath,loadType)
        end
    end)

    display.getRunningScene():runAction(cc.Sequence:create(acts))
end

function M:getHead()
    return self.mHead
end


function M:getHeadBox()
    return self.mHeadBox
end

function M:setHeadBox(avatarFrame)
    self.mHeadBox = avatarFrame
end

function M:getMyDiceBox()
    return self.mDiceBox
end

function M:setMyDiceBox(diceBox)
    self.mDiceBox = diceBox
end

function M:getMyFansNum()
    return self.mFansNum
end

function M:getNickName()
    return self.mNickName
end

function M:getSex()
    return self.mSex
end

function M:getSlogan()
    return self.mSlogan
end

function M:getVipLevel()
    return self.mVipLevel
end

function M:setVipLevel(vipLevel)
    self.mVipLevel = vipLevel
end

function M:getVipExp()
    return self.mVipExp
end

function M:setVipExp(exp)
    self.mVipExp = exp
end

function M:getCanReveiveVipReward()
    return self.mIsCanReceiveVipReward
end

function M:gotRegisterRewardTime()
    return self.mGotRegisterRewardTime
end

function M:setRegisterRewardTime(time)
    self.mGotRegisterRewardTime=time
end

function M:getChargeNoviceProductTime()
    return self.mChargeNoviceProductTime
end

function M:setChargeNoviceProductTime(chargeNoviceProductTime)
    self.mChargeNoviceProductTime=chargeNoviceProductTime
end
function M:getDailyReliefCount()
    return self.mDailyReliefCount
end

function M:setDailyReliefCount(count)
    self.mDailyReliefCount=count
end

function M:setGuideTime(guideStep)
    self.mGuideTime=guideStep
end

function M:getGuideTime()
    return self.mGuideTime
end

function M:isSelfUserId(uid)
    return tostring(uid) == tostring(self.mUid)
end

function M:getIsChangeNickName()
    return self.mIsChangeNickName
end

function M:getIsChangeSex()
    return self.mIsChangeSex
end

function  M:getIsSystemHead()
    return self.mIsSystemHead
end

function M:setGold(gold)
    self.mGold = gold
end

function M:getGold()
    return self.mGold
end

function M:setDiamond(diamond)
    self.mDiamond = diamond
end

function M:getDiamond()
    return self.mDiamond
end

function M:getServiceTag()
    return self.mIsService
end

return M