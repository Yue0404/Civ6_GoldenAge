local function CityPopOverflow(pCity)
    if (pCity == nil) then
        return false
    end
    
    local iHousing = pCity:GetGrowth():GetHousing()
    local iPopulation = pCity:GetPopulation()
    return (iHousing > iPopulation)
end

function SacrificeUnitInCity(iPlayerID, iUnitID)
    local pUnit = UnitManager.GetUnit(iPlayerID, iUnitID)
    if (pUnit ~= nil) then
        local x = pUnit:GetX()
        local y = pUnit:GetY()
        local pCity = CityManager.GetCityAt(x, y);
        if (pCity ~= nil) and CityPopOverflow(pCity) then
            pCity:ChangePopulation(1)
            UnitManager.Kill(pUnit)
            Game.AddWorldViewText(0, 'LOC_MODE_UNIT_RETIREMENT_SUCCESS', x, y)
        elseif (pCity == nil) then
			Game.AddWorldViewText(0, 'LOC_MODE_UNIT_RETIREMENT_CITY_WARNING', x, y)
		else
            Game.AddWorldViewText(0, 'LOC_MODE_UNIT_RETIREMENT_HOUSING_WARNING', x, y)
        end
    end
end


if ExposedMembers.DEMO == nil then
    ExposedMembers.DEMO = {}
end

ExposedMembers.DEMO.SacrificeUnitInCity = SacrificeUnitInCity
