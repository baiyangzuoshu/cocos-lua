local UIStoreGodLineCell = require("app.gui.store.UIStoreGodLineCell")

local UIPanel = require("app.gui.basegui.UIPanel")
local M = class("UIStoreLayer", UIPanel)

local CELL_WIDTH = UIStoreGodLineCell.CELL_WIDTH
local CELL_HEIGHT = UIStoreGodLineCell.CELL_HEIGHT

local MIN_ROW = 3

M.GUI_FILE_NAME = "csd.03_01_Shop.03_01_StoreLayer.lua"

M.BINDGUIDATANODE = {
    ["DiamondNum"] = { varname = "DiamondNumText" },
    ["GoldNum"] = { varname = "GoldNumText" },

    ["GoldStoreButton"] = { varname = "GoldButton", onClick = "onTabBtnClick" },
    --["GoldDot"] = { varname = "GoldNewNode" },

    ["DiamondStoreButton"] = { varname = "DiamondButton", onClick = "onTabBtnClick" },

    ["DiceBoxStoreButton"] = { varname = "DiceBoxStoreButton", onClick = "onTabBtnClick" },

    --返回
    ["Return"] = { varname = "Return", onEvent = "onReturnTouch" },
    ["ReternButton"] = { varname = "ReternButton"},

    ["DiamondRechargePanel"] = { varname = "DiamondRechargePanel"},

    ["DiamondStoreText_TT"] = { varname = "DiamondBtnText"},
    ["DiamondStoreIcon"] = { varname = "DiamondBtnIcon"},

    ["GoldStoreText_TT"] = { varname = "GoldBtnText"},
    ["GoldStoreIcon"] = { varname = "GoldBtnIcon"},

    ["DiceBoxStoreText_TT"] = { varname = "DiceBoxStoreText"},
    ["DiceBoxStoreIcon"] = { varname = "DiceBoxStoreIcon"},

    --vip
    ["VipIcon"] = { varname = "VipIcon" },
    ["VipLevelText_TT"] = { varname = "VipLevelText" },
    ["VipLevelText_1_TT"] = { varname = "VipLevelText_1" },
    ["VipLoadingBar"] = { varname = "VipLoadingBar" },
    ["VipLoadingNum"] = { varname = "VipLoadingNum" },

    ["RewardShow"] = { varname = "RewardShow" },
    ["RewardNode"] = { varname = "RewardNode" },
    ["RewadNode_1"] = { varname = "RewadNode_1" },
    ["RewadNode_2"] = { varname = "RewadNode_2" },
    ["RewadNode_3"] = { varname = "RewadNode_3" },
    ["RewadNode_4"] = { varname = "RewadNode_4" },
    ["RewardPanel"] = { varname = "RewardPanel", onEvent = "onVipRewardTouchEvent" },
}

function M:onCreate()
    M.super.onCreate(self)
    self:setShadeShowModel(true)
    self:adaptationPanelSize()

    self:addPlistResourceMap(Utils.generateIconPlistData(PlistConfig.Icon.VipIcon))

    self.mGodData = {}
    self.mTabIndex = Enum.ShopShowType.Null

    self:initStoreTab()

    self.mRow = 0

    local size = self.DiamondRechargePanel:getContentSize()

    self.mTableView = cc.TableView:create(size)

    self.mTableView:setDirection(cc.SCROLLVIEW_DIRECTION_VERTICAL)
    self.mTableView:setVerticalFillOrder(cc.TABLEVIEW_FILL_TOPDOWN)

    self.mTableView:setBounceable(true)

    self.mTableView:setIgnoreAnchorPointForPosition(false)
    self.mTableView:setAnchorPoint(0, 0)
    self.mTableView:setPosition(0, 0)
    self.DiamondRechargePanel:addChild(self.mTableView)

    self.mTableView:registerScriptHandler(handler(self, self.getNumberOfCellsInTableView), cc.NUMBER_OF_CELLS_IN_TABLEVIEW)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeForIndex), cc.TABLECELL_SIZE_FOR_INDEX)
    self.mTableView:registerScriptHandler(handler(self, self.getTableCellSizeAtIndex), cc.TABLECELL_SIZE_AT_INDEX)
end

function M:onInit()
    M.super.onInit(self)
    self.ReternButton:setTouchEnabled(false)

    self:refreshVipUI()
end

function M:regAllEventMsg()
    M.super.regAllEventMsg(self)

    self:doRegEvent(Constant.CustomEvent.UpdateUserResource, "onUpdateUserResource")
    self:doRegEvent(Constant.CustomEvent.RefreshChargeData, "refreshData")
    self:doRegEvent(Constant.CustomEvent.refreshVipUI, "refreshVipUI")
    self:doRegEvent(Constant.CustomEvent.OnShopInfoUpdate, "OnShopInfoUpdate")
end

function M:adaptationPanelSize()
    local size = cc.Director:getInstance():getWinSize()
    local friangeTop = g_GameSettingData:getFringeScreenTop()
    local dyw = (size.height - 1280) / 2
    
    if dyw > 0 then
        local addHeight = dyw - friangeTop + dyw
        local panelSize = self.DiamondRechargePanel:getContentSize()
        local y = self.DiamondRechargePanel:getPositionY()
        self.DiamondRechargePanel:setContentSize(cc.size(panelSize.width, panelSize.height + addHeight))
        self.DiamondRechargePanel:setPositionY(y - addHeight)
    end
end

function M:sortAllDiamondGods(a,b)
    if a.RechargeId < b.RechargeId then 
        return true 
    end
end

function M:sortAllDiceCup(a,b)
    if a.isCanPurchase and (not b.isCanPurchase) then 
        return true
    elseif a.isCanPurchase and b.isCanPurchase then 
        if a.ShopGoodsId < b.ShopGoodsId then
            return true 
        else
            return false
        end
    elseif (not a.isCanPurchase) and b.isCanPurchase then 
        return false
    else
        if a.ShopGoodsId < b.ShopGoodsId then
            return true 
        else
            return false
        end
    end
end

function M:initData(data)
    local DiamondGods = DataManager:getTbxData("Recharge")
    if DiamondGods then
        local diamondItems = {}
        for _, v in pairs(DiamondGods) do 
            if v.RechargeType == Enum.RechargeType.Diamond then 
                table.insert(diamondItems, v)
            end
        end
        table.sort(diamondItems, handler(self,self.sortAllDiamondGods))
        local reChargeInfo = g_StoreData:getUserReChargeInfo()
        local myItemInfo = require("app.bean.ShopInfo").new(reChargeInfo, diamondItems, Enum.ShopShowType.Diamond)
        self.mGodData[Enum.ShopShowType.Diamond] = myItemInfo
    end
    for k, v in ipairs(data) do 
        self.mGodData[v.shopId] = {}
        local goldItems = {}
        local shop = DataManager:getTbxData("Shop", tonumber(v.shopId))
        if shop then 
            local itemId = shop.ShopGoodsIdArray
            for index, value in ipairs(itemId) do 
                local shopGoods = DataManager:getTbxData("ShopGoods", value)
                if shopGoods then 
                    table.insert(goldItems, shopGoods)
                    --goldItems[tostring(index)] = shopGoods
                end
            end
        else
            Log.info("shop data is not fount: %s", tostring(v.shopId))
        end
        local confirmInfo = g_StoreData:getPurchaseInfo()

        if v.shopId == Enum.ShopShowType.DiceCup then
            if not Utils.isEmptyTable(confirmInfo) then 
                for _,v in pairs(goldItems) do 
                    local isCanPurchase = confirmInfo[v.ShopGoodsId]
                    if isCanPurchase == nil then 
                        v.isCanPurchase = true
                    else
                        v.isCanPurchase = isCanPurchase
                    end
                end
            else
                for _,v in pairs(goldItems) do 
                    v.isCanPurchase = true
                end
            end
            table.sort(goldItems, handler(self,self.sortAllDiceCup))
        end

        local itemInfo = require("app.bean.ShopInfo").new(confirmInfo, goldItems, v.shopId)
        self.mGodData[v.shopId] = itemInfo
    end
    self.mTabIndex = Enum.ShopShowType.Null
end

function M:initStoreTab()
    self.mTabs = {}
    self.mTabs[Enum.ShopShowType.Gold] = self:createTab(
        Enum.ShopShowType.Gold, 
        self.GoldButton, 
        self.GoldBtnText, 
        self.GoldBtnIcon,
        {
            Disabled = "03_01_Shop/icon_016.png",
            Normal = "03_01_Shop/icon_028.png"
        }
    )
    self.mTabs[Enum.ShopShowType.Diamond] = self:createTab(
        Enum.ShopShowType.Diamond,
        self.DiamondButton,
        self.DiamondBtnText, 
        self.DiamondBtnIcon,
        {
            Disabled = "03_01_Shop/icon_015.png",
            Normal = "03_01_Shop/icon_027.png"
        }
    )
    self.mTabs[Enum.ShopShowType.DiceCup] = self:createTab(
        Enum.ShopShowType.DiceCup,
        self.DiceBoxStoreButton,
        self.DiceBoxStoreText, 
        self.DiceBoxStoreIcon,
        {
            Disabled = "03_01_Shop/icon_072.png",
            Normal = "03_01_Shop/icon_071.png"
        }
    )
end

function M:createTab(tag, button, Text, Icon, Path, redDot)
    button:setTag(tag)
    return { redDot = redDot, button = button, text = Text, icon = Icon, path = Path }
end

function M:onTabBtnClick(sender)
    self:setTabIndex(sender:getTag())
end

function M:setTabIndex(tabIndex)
    --Log.info("newIndex: ", tabIndex, "old: ",  self.mTabIndex)
    if self.mTabIndex == tabIndex then
        return
    end

    self.mTabIndex = tabIndex

    for k, v in pairs(self.mTabs) do
        if tabIndex == k then
            v.button:setTouchEnabled(false)
            v.button:setBright(true)
            v.text:setTextColor(cc.c3b(255, 255, 255))
            v.icon:loadTexture(v.path.Disabled, ccui.TextureResType.plistType)
        else
            v.button:setTouchEnabled(true)
            v.button:setBright(false)
            v.text:setTextColor(cc.c3b(179, 168, 207))
            v.icon:loadTexture(v.path.Normal, ccui.TextureResType.plistType)
        end
    end

    if Enum.ShopShowType.Diamond == tabIndex then 
        --钻石
    else
        g_StoreData:requestEntryShop(tabIndex)
    end

    self:refreshUI()
end

function M:onEnter()
    M.super.onEnter(self)

    --self:refreshUI()
end

--刷新首充
function M:refreshData(data)
    local netData = self.mGodData[self.mTabIndex]:getNetData()
    
    if not Utils.isEmptyTable(netData) then 
        local isExist = false
        for _,v in pairs(netData) do 
            if v.id == data.id then 
                v.isPurchased = data.isPurchased
                isExist = true
            end
        end
        if not isExist then
            table.insert(netData, data) 
        end
    else
        netData = {}
        table.insert(netData, data)
    end
    
    self.mGodData[self.mTabIndex]:setNetData(netData)
    self:refreshUI()
end

function M:OnShopInfoUpdate()
    local netData = g_StoreData:getPurchaseInfo()

    self.mGodData[self.mTabIndex]:setNetData(netData)
    self:refreshUI()
end

function M:refreshUI()
    local data = self.mGodData[self.mTabIndex]:getCfgData()
    if not data then return end

    if self.mTabIndex == Enum.ShopShowType.DiceCup then
        local netData = self.mGodData[self.mTabIndex]:getNetData()
        if not Utils.isEmptyTable(netData) then 
            for _,v in pairs(data) do 
                local isCanPurchase = netData[v.ShopGoodsId]
                if isCanPurchase == nil then 
                    v.isCanPurchase = true
                else
                    v.isCanPurchase = isCanPurchase
                end
            end
        else
            for _,v in pairs(data) do 
                v.isCanPurchase = true
            end
        end
        table.sort(data, handler(self,self.sortAllDiceCup))
    end

    self.mRow = math.ceil(table.getn(data) / UIStoreGodLineCell.ITEM_COLUMN)
    if self.mRow < MIN_ROW then
        self.mRow = MIN_ROW 
    end

    self.mTableView:reloadData()

    self:onUpdateUserResource()
end

function M:onVipRewardTouchEvent(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local isCanReceiveVipReward = g_UserData:getCanReveiveVipReward()
        if isCanReceiveVipReward then 
            g_UserData:requestReceiveVipReward()
        else
            if self.RewardShow:isVisible() then 
                self.RewardShow:setVisible(false)
                return
            end
            self.RewardShow:setVisible(true)
            local vipLevel = g_UserData:getVipLevel()
            if vipLevel == GSystem.MaxVipLv then
                self.RewardShow:setVisible(false)
                return
            end
            local nextLevelData = DataManager:getTbxData("Vip", vipLevel + 1)
            if nextLevelData then 
                self:showReward(nextLevelData)
            end
        end
    end
end

function M:refreshVipUI()
    self.RewardShow:setVisible(false)
    local vipLevel = g_UserData:getVipLevel()
    local vipExp = g_UserData:getVipExp()
    local curLevelData = DataManager:getTbxData("Vip", vipLevel)
    if curLevelData then 
        self.VipIcon:loadTexture(Utils.getIconStr(PlistConfig.Icon.VipIcon, curLevelData.VipIcon), ccui.TextureResType.plistType)
        if vipLevel == GSystem.MaxVipLv then
            self.VipLevelText:setVisible(false)
            self.VipLevelText_1:setVisible(true)
        else
            local nextLevelData = DataManager:getTbxData("Vip", (vipLevel + 1))
            if nextLevelData then 
                local nextLevelExp = nextLevelData.VipExp
                local expDiff = nextLevelExp - vipExp

                self.VipLevelText:setVisible(true)
                self.VipLevelText:setString(Utils.showFormatText(Enum.Text.VipLevelShow, tostring(vipExp)..";"..tostring(expDiff)))
                self.VipLevelText_1:setVisible(false)

                local percent = (vipExp / nextLevelExp) * 100
                self.VipLoadingNum:setString(tostring(vipExp).."/"..tostring(nextLevelExp))
                self.VipLoadingBar:setPercent(percent)
            end
        end
    end
end

function M:showReward(curLevelData)
    local rewardData = curLevelData.GiftRes
    if not Utils.isEmptyTable(rewardData) then 
        self.RewardNode:setVisible(true)
        local len = table.getn(rewardData)
        for i = 1, len do 
            local str = string.format("RewadNode_%d", i)
            self[str]:removeAllChildren(true)
            local item = UIManager:createPanelOnly("UIVipRewardItem")
            local size = item:getContentSize()
            item:setPosition(-size.width / 2 , -size.height / 2)
            item:setItemInfo(rewardData[i])
            self[str]:addChild(item)
        end
    else
        self.RewardNode:setVisible(false)
    end
end

function M:onUpdateUserResource(data)
    
    self.GoldNumText:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getGold()))
    
    self.DiamondNumText:setString(Utils.getFormatNumber_MuitiLanguage(g_UserData:getDiamond()))
end

function M:getNumberOfCellsInTableView(tableview)
    return self.mRow
end

function M:getTableCellSizeForIndex(tableview, idx)
    return CELL_WIDTH, CELL_HEIGHT
end

function M:getTableCellSizeAtIndex(tableview, idx)
    local cell = tableview:dequeueCell()
    if nil == cell then
        cell = cc.TableViewCell:new()
    end

    local panel = cell:getChildByName("UIStoreGodLineCell")
    if not panel then
        panel = UIStoreGodLineCell.new()
        panel:setName("UIStoreGodLineCell")

        local size = panel:getContentSize()
        panel:setPosition((CELL_WIDTH - size.width) * 0.5, (CELL_HEIGHT - size.height) * 0.5)
        cell:addChild(panel)
    end

    panel:refreshData(self.mGodData[self.mTabIndex], idx, self.mTabIndex)

    return cell
end

function M:onReturnTouch(data)
    if data.event == "end" then 
        SoundSystemManager:playSound004()
        local scaleToStart = cc.ScaleTo:create(0.05, 0.9)
        local scaleToEnd = cc.ScaleTo:create(0.05, 1.0)
        self.ReternButton:runAction(cc.Sequence:create(scaleToStart, scaleToEnd, cc.CallFunc:create(
            function ()
                self:closePanel()
                DataManager:dispatchMessage("mainlayerEnterAnimation", {})
            end
        )))
    end
end

return M