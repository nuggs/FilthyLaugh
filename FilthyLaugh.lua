local f = CreateFrame("Frame")
local player = UnitGUID("player")

function f:PLAYER_ENTERING_WORLD()
    f:UnregisterEvent("PLAYER_ENTERING_WORLD")
end

function f:COMBAT_LOG_EVENT_UNFILTERED(_, event, _, sourceGUID, _, _, _, _, _, destFlags, _, _, _, ...)
    if event == "PARTY_KILL" and sourceGUID == player and bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) > 0 then
        DoEmote("laugh")
    end
end

f:SetScript("OnEvent", function(self, event, ...) self[event](self, ...) end)
f:RegisterEvent("PLAYER_ENTERING_WORLD")
f:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
