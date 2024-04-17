local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UISignOutAgreementLayer", UIPanel)

M.GUI_FILE_NAME = "csd.01_07_Sitting.01_07_SittingSignOutAgreementLayer.lua"

M.BINDGUIDATANODE = {
    ["AgreementListView"] = {varname = "AgreementListView"},
    ["AgreeTipText_TT"] = {varname = "AgreeTipText_TT"},
    ["CancelButton"] = { varname = "CancelButton", onClick = "onCancelButtonClick"},

    ["ConfirmButton"] = { varname = "ConfirmButton",onClick = "onConfirmButtonClick"},
}

function M:onCreate()
    M.super.onCreate(self)
    self.AgreementListView:onScroll(handler(self,self.onListViewScrollEvent))
    self:setShadeShowModel(true)
end

function M:onInit()
    M.super.onInit(self)
end

function M:onEnter()
    M.super.onEnter(self)
    self.ConfirmButton:setTouchEnabled(false)
    self.ConfirmButton:setBright(false)
    self:showDesc()
end

function M:showDesc()
    self.AgreementListView:removeAllItems()
    local size = self.AgreementListView:getContentSize()

    local languageType = g_UserData:getSystemLanguage()
    local testtext = "单行高度测试文本"
    if languageType == Enum.LanguageType.en then
        testtext = "AaBbCdEfG"
    end

    local contentText_1 = ccui.Text:create()
    contentText_1:setFontSize(32)
    contentText_1:setFontName("font/Default.TTF")

    local text_1 = Utils.getTextByTextId(Enum.Text.DeleteAgreementText_1)
    local desc_1 = string.gsub(text_1,"\\n","\n")
    contentText_1:setString(desc_1)

    contentText_1:setTextAreaSize(cc.size(size.width,0))
    contentText_1:ignoreContentAdaptWithSize(false)

    local contentText_2 = ccui.Text:create()
    contentText_2:setFontSize(32)
    contentText_2:setFontName("font/Default.TTF")
    local text_2 = Utils.getTextByTextId(Enum.Text.DeleteAgreementText_2)
    local desc_2 = string.gsub(text_2,"\\n","\n")
    contentText_2:setString(desc_2)
    contentText_2:setTextAreaSize(cc.size(size.width,0))
    contentText_2:ignoreContentAdaptWithSize(false)

    local contentText_3 = ccui.Text:create()
    contentText_3:setFontSize(32)
    contentText_3:setFontName("font/Default.TTF")
    local text_3 = Utils.getTextByTextId(Enum.Text.DeleteAgreementText_3)
    local desc_3 = string.gsub(text_3,"\\n","\n")
    contentText_3:setString(desc_3)
    contentText_3:setTextAreaSize(cc.size(size.width,0))
    contentText_3:ignoreContentAdaptWithSize(false)

    self.AgreementListView:pushBackCustomItem(contentText_1)
    self.AgreementListView:pushBackCustomItem(contentText_2)
    self.AgreementListView:pushBackCustomItem(contentText_3)
end

function M:getLineNum(text,width,font)
    local values = string.split(text, "\n")
    local linenum = 0
    for k,v in ipairs(values) do
        local len1 = string.len(v)
        local len2= string.utf8len(v)
        local len3 = (len1+len2)/4
        
        linenum = linenum + math.ceil(len3*font/width)
    end

    return linenum
end

function M:onListViewScrollEvent(event)
    if event.name== "CONTAINER_MOVED" then 
         local eInnerPos = self.AgreementListView:getInnerContainerPosition()
        if eInnerPos.y>=0 then
            if not self.ConfirmButton:isBright() then
                self.ConfirmButton:setTouchEnabled(true)
                self.ConfirmButton:setBright(true)
            end
        end
    end
end

function M:onConfirmButtonClick(ref)
    local panel = UIManager:getOrCreatePanel("UICommonMediumTipPopUp")
    if panel then 
        local TipTitleText = Utils.getTextByTextId(Enum.Text.netTile)
        local ContentText = Utils.getTextByTextId(Enum.Text.ReChkDeleteText)
        local ConfirmText = Utils.getTextByTextId(Enum.Text.ButtonText)
        local CancelText = Utils.getTextByTextId(Enum.Text.BlackCancle)
        panel:setText(TipTitleText, ContentText, ConfirmText, CancelText)
        panel:showToScene()
        panel:setConfirmCb(
            function ()
                g_LoginData:removeAccount()
            end
        )
    end

    self:closePanel()
end

function M:onCancelButtonClick(ref)
    self:closePanel()
end

return M