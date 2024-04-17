local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIMagicEmojiCell", UIPanel)

M.ITEM_COLUMN = 1

M.CELL_WIDTH = 119
M.CELL_HEIGHT = 204

M.GUI_FILE_NAME = "csd.02_01_Boast.02_01_BoastMagicEmojiCell.lua"

M.BINDGUIDATANODE = {
   ["MagicEmojiFrame"] = { varname = "MagicEmojiFrame" },
   ["MagicEmojiIcon"] = { varname = "MagicEmojiIcon"},
   ["SuperIcon_IVT"] = { varname = "SuperIcon" },
   ["CostNum"] = { varname = "CostNum" },
   ["CostIcon"] = { varname = "CostIcon" },
   ["MagicEmojiPanel_1"] = { varname = "MagicEmojiPanel" ,onEvent="onEventTouch"},
}

function M:onCreate()
    M.super.onCreate(self)

    self.MagicEmojiPanel:setSwallowTouches(false)
    self:resetRootNodePosition(cc.p(0, 0))
    self:resetRootNodeAnchorPoint(cc.p(0, 0))

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.MagicEmoji))
end

function M:onEnter()
    M.super.onEnter(self)
end

function M:refreshData(uid,data,isShaibao)
    if nil==data then return end
    self.m_Uid = uid
    self.m_data = data
    self.isShaibao = false
    self.MagicEmojiIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.MagicEmoji, self.m_data.ItemIcon), ccui.TextureResType.plistType)
    self.SuperIcon:setVisible(self.m_data.IsSuperMagicEmoji)
    local costMoney = self.m_data.MagicEmojiGoldRatio*g_GameData:getBetBase()/10000
    if isShaibao then
        self.isShaibao = isShaibao
        costMoney = self.m_data.MagicEmojiGoldRatio*GSystem.DiceBabyEmojiPrice/10000
    end
    self.costMoney = costMoney
    if costMoney >= 1 then
        costMoney = math.floor(costMoney)
    elseif costMoney < 1 then
        costMoney = 1
    end
    self.CostNum:setString(Utils.getFormatNumber_MuitiLanguage(costMoney))
    local numWidth = self.CostNum:getContentSize().width
    local goldIconWidth = self.CostIcon:getContentSize().width
    self.CostNum:setPositionX(M.CELL_WIDTH/2-goldIconWidth/2)
    self.CostIcon:setPositionX(goldIconWidth/2+numWidth)
end

function M:getItemId()
    if self.m_data then 
        return self.m_data.ItemId 
    end
    return nil
end

--获取魔法表情世界坐标
function M:getMagicIconWorldPosition()
    return Utils.getNodeWordPosition(self.MagicEmojiIcon)
end

function M:onEventTouch(data)
    if data.event=="end" then
        if g_UserData:getGold() < self.costMoney then
            UIUtils.popToadtByMessageId(Constant.Define.ErrorGoldNotEnoughSendMagic)
            return
        end
        if self.isShaibao then
            g_GameData:C2S_ShaibaoSendMagicEmoji(self.m_Uid,self.m_data.ItemId)
        else
            g_GameData:C2S_SendMagicEmoji(self.m_Uid,self.m_data.ItemId)
        end
    end
end

return M