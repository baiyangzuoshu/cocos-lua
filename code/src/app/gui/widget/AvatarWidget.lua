local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("AvatarWidget", UIPanel)

M.GUI_FILE_NAME = ""
M.Max_Fail=3
M.BINDGUIDATANODE = {}

function M:onCreate()
    M.super.onCreate(self)

    local maskSprite = cc.Sprite:createWithSpriteFrameName("00_01_Common/frame_142.png")
    local holesStencil = cc.Node:create()
    holesStencil:setName("holesStencil")
    holesStencil:addChild(maskSprite)
    self.mClippingNode = cc.ClippingNode:create()
    self.mClippingNode:setStencil(holesStencil)
    self.mClippingNode:setInverted(false)
    self.mClippingNode:setAlphaThreshold(0.6)

    self:addChild(self.mClippingNode)

    self.mHandSprite = ccui.ImageView:create()
    self.mClippingNode:addChild(self.mHandSprite)
    self.mHandSprite:loadTexture(Utils.getIconStr(PlistConfig.Icon.Head, tonumber(g_UserHeadIconData:getDefultHead())),ccui.TextureResType.plistType)
    self.mHandSprite:ignoreContentAdaptWithSize(false)
    local layout = ccui.LayoutComponent:bindLayoutComponent(self.mHandSprite)
    self.mHandSprite:setContentSize(cc.size(100, 100))

    self.failCount=1
    self.mRegisterDownloadEventName=""

    for key, value in pairs(self:getChildren()) do
        value:setCascadeOpacityEnabled(true)
    end
end
--userId,url,callback
function M:InitTexture(isSystemIcon,iconPath,userId)
    self.mIsSystemIcon=isSystemIcon
    self.mIconPath=iconPath
    self.mUserId=userId

    local loadType = ccui.TextureResType.localType
    if isSystemIcon then
        loadType = ccui.TextureResType.plistType
        local headPath=Utils.getIconStr(PlistConfig.Icon.Head, tonumber(iconPath))
        self:loadTexture(headPath,loadType)
    else
        --getHeadData
        loadType = ccui.TextureResType.localType
        local headPath=g_UserHeadIconData:getHeadData(iconPath,userId)
        if headPath == "" then
            self.mRegisterDownloadEventName = g_AvatarRomoteData:downloadIcon(userId,iconPath,handler(self,self.downloadCallbackHandle))
        else
            self:loadTexture(headPath,loadType)
        end
    end
end

function M:downloadCallbackHandle(state,path,loadType)
    if state then
        self:loadTexture(path,loadType)
    else
        self:loadFailCb()
    end
end

function M:loadTexture(path,loadType)
    if loadType == ccui.TextureResType.localType then
        self.mHandSprite:loadTexture(path,ccui.TextureResType.localType)
    else
        self.mHandSprite:loadTexture(path,ccui.TextureResType.plistType)
    end
end

function M:loadFailCb()
    print("loadFailCb=",self.failCount)
    self.failCount=self.failCount+1
    if self.failCount<=self.Max_Fail then
        self:InitTexture(self.mIsSystemIcon,self.mIconPath,self.mUserId)
    end
end

function M:onCleanup()
    M.super.onCleanup(self)

    if self.mRegisterDownloadEventName~=nil and string.len(self.mRegisterDownloadEventName) >0 then
        g_AvatarRomoteData:unRegisterMessage(self.mRegisterDownloadEventName)
    end

end

return M