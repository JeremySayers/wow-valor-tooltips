local GlobalAddonName, ValorToolTips = ...

function ValorToolTips:OnLoad()
    local clipAfter = string.find(ITEM_UPGRADE_TOOLTIP_FORMAT, "%%d") -1
    local searchValue = string.sub(ITEM_UPGRADE_TOOLTIP_FORMAT, 1, clipAfter)

    GameTooltip:HookScript("OnTooltipSetItem", function (frame, ...) 
        local ttname = GameTooltip:GetName()
        for i = 1, GameTooltip:NumLines() do
            local left = _G[ttname .. "TextLeft" .. i]
            local text = left:GetText()
            local cur, max = text:match(searchValue .. "(%d+)/(%d+)")
            if cur ~= nil then
                if cur ~= max then
                    if max == "12" then
                        local _, itemLink = GameTooltip:GetItem()
                        local itemEquipLocation = C_Item.GetItemInventoryTypeByID(itemLink)
                        local price = ValorToolTips.ValorData.ItemEquipLocation[itemEquipLocation]
                        local priceTo220 = (max - cur) * price
                        local priceTo213 = (10 - cur) * price
                        local priceTo207 = (8 - cur) * price

                        frame:AddLine(" ")
                        frame:AddLine("|cFF00FFFFValor Upgrade Info|r")

                        if priceTo207 > 0 then
                            frame:AddLine(string.format("|cFF00FFFFItem Level 207: %d|r", priceTo207))
                        end

                        if priceTo213 > 0 then
                            frame:AddLine(string.format("|cFF00FFFFItem Level 213: %d|r", priceTo213))
                        end

                        if priceTo220 > 0 then
                            frame:AddLine(string.format("|cFF00FFFFItem Level 220: %d|r", priceTo220))
                        end                        
                    end
                end
            end
        end
    end)
end

ValorToolTips:OnLoad()