function GARetirementButtonClicked()
    local pUnit = UI.GetHeadSelectedUnit()
    if (pUnit ~= nil) then
        ExposedMembers.DEMO.SacrificeUnitInCity(Game.GetLocalPlayer(), pUnit:GetID())
    end
end


function GARetirementSelectionChanged(iPlayerID, iUnitID, iPlotX, iPlotY, iPlotZ, bSelected, bEditable)
    if bSelected then
        local pUnit = UnitManager.GetUnit(iPlayerID, iUnitID)
        if (pUnit:GetCombat() == 0) or (GameInfo.Units["UNIT_MODE_ZOMBIE"] ~= nil and pUnit:GetType() == GameInfo.Units["UNIT_MODE_ZOMBIE"].Index) then
            Controls.TestButtonGrid:SetHide(true)
        else
            Controls.TestButtonGrid:SetHide(false)
        end
    end
end


function GARetirementSetup()
    local path = '/InGame/UnitPanel/StandardActionsStack'
    local ctrl = ContextPtr:LookUpControl(path)
    if ctrl ~= nil then
        Controls.TestButtonGrid:ChangeParent(ctrl)
    end
    Controls.TestButton:RegisterCallback(Mouse.eLClick, GARetirementButtonClicked)
end

Events.LoadGameViewStateDone.Add(GARetirementSetup)
Events.UnitSelectionChanged.Add(GARetirementSelectionChanged)




