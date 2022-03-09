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
                        local bioSummary = C_PlayerInfo.GetPlayerMythicPlusRatingSummary("player")
                        local rating = bioSummary.currentSeasonScore
                        local _, itemLink = GameTooltip:GetItem()
                        local itemEquipLocation = C_Item.GetItemInventoryTypeByID(itemLink)
                        local price = ValorToolTips.ValorData.ItemEquipLocation[itemEquipLocation]
                        local priceTo272 = (max - cur) * price
                        local priceTo268 = (11 - cur) * price
                        local priceTo265 = (10 - cur) * price
                        local priceTo262 = (9 - cur) * price
                        local priceTo259 = (8 - cur) * price
                        local priceTo255 = (7 - cur) * price
                        local priceTo252 = (6 - cur) * price

                        frame:AddLine(" ")
                        frame:AddLine("|cFF00FFFFValor Upgrade Info|r")

                        if priceTo252 > 0 then
                            frame:AddLine(string.format("|cFF00FFFFItem Level 252: %d|r", priceTo252))
                        end

                        local ratingNote = ""

                        if priceTo252 > 0 then
                            local color = "|cFF00FFFF"
                            if rating < 600 then
                                color = "|cffffcf40"
                                ratingNote = "(Need 600 M+ Rating)"
                            end
                            frame:AddLine(string.format("%sItem Level 255: %d %s|r", color, priceTo255, ratingNote))
                        end

                        if priceTo259 > 0 then
                            local color = "|cFF00FFFF"
                            if rating < 1000 then
                                color = "|cffffcf40"
                                ratingNote = "(Need 1000 M+ Rating)"
                            end
                            frame:AddLine(string.format("%sItem Level 259: %d %s|r", color, priceTo259, ratingNote))
                        end
                        
                        if priceTo262 > 0 then
                            local color = "|cFF00FFFF"
                            if rating < 1200 then
                                color = "|cffffcf40"
                                ratingNote = "(Need 1200 M+ Rating)"
                            end
                            frame:AddLine(string.format("%sItem Level 262: %d %s|r", color, priceTo262, ratingNote))
                        end   

                        if priceTo265 > 0 then
                            local color = "|cFF00FFFF"
                            if rating < 1400 then
                                color = "|cffffcf40"
                                ratingNote = "(Need 1400 M+ Rating)"
                            end
                            frame:AddLine(string.format("%sItem Level 265: %d %s|r", color, priceTo265, ratingNote))
                        end   

                        if priceTo268 > 0 then
                            local color = "|cFF00FFFF"
                            if rating < 1700 then
                                color = "|cffffcf40"
                                ratingNote = "(Need 1700 M+ Rating)"
                            end
                            frame:AddLine(string.format("%sItem Level 268: %d %s|r", color, priceTo268, ratingNote))
                        end

                        if priceTo272 > 0 then
                            local color = "|cFF00FFFF"
                            if rating < 2000 then
                                color = "|cffffcf40"
                                ratingNote = "(Need 2000 M+ Rating)"
                            end
                            frame:AddLine(string.format("%sItem Level 272: %d %s|r", color, priceTo272, ratingNote))
                        end 
                    end
                end
            end
        end
    end)
end

ValorToolTips:OnLoad()