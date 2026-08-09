-- ToolTipLoader
-- Author: Flactine
-- DateCreated: 9/16/2022 4:58:06 PM
--------------------------------------------------------------
AddBuildingYieldTooltip = function(buildingHash, city, tooltipLines)	
	local iBuildingNum = 0;
	local buildingReference:table = GameInfo.Buildings[buildingHash];
	if (buildingReference ~= nil) then
		if not (buildingReference.IsWonder) then
			--新加入内容（已经建造了多少建筑）
			local pPlayer = Players[Game.GetLocalPlayer()];
			local tCitys = pPlayer:GetCities(); --获取全部城市
			for _, city in tCitys:Members() do
				if city:GetBuildings():HasBuilding(buildingHash) then
					iBuildingNum = iBuildingNum + 1;
				end
			end
			table.insert(tooltipLines, Locale.Lookup("LOC_GABE_NUM_NAME", iBuildingNum));
		end
		--新加入内容结束
		local buildingType:string = buildingReference.BuildingType;
		if (city == nil) then
			for row in GameInfo.Building_YieldChanges() do
				if(row.BuildingType == buildingType) then
					local yield = GameInfo.Yields[row.YieldType];
					if (yield) then
						local yieldChange = row.YieldChange;
						table.insert(tooltipLines, Locale.Lookup("LOC_TYPE_TRAIT_YIELD", yieldChange, yield.IconString, yield.Name)); 
						for rowPowered in GameInfo.Building_YieldChangesBonusWithPower() do
							if (rowPowered.BuildingType == buildingType and rowPowered.YieldType == row.YieldType and rowPowered.YieldChange > 0) then
								table.insert(tooltipLines, Locale.Lookup("LOC_TYPE_TRAIT_YIELD_POWER_ENHANCEMENT", rowPowered.YieldChange, yield.IconString, yield.Name)); 
							end
						end
					end
				end
			end
		else
			for yield in GameInfo.Yields() do
				local yieldChangeWithoutPower = city:GetBuildingPotentialYield(buildingHash, yield.YieldType, false);
				local yieldChangeWithPower = city:GetBuildingPotentialYield(buildingHash, yield.YieldType, true);
				if (yieldChangeWithoutPower > 0) then
					table.insert(tooltipLines, Locale.Lookup("LOC_TYPE_TRAIT_YIELD", yieldChangeWithoutPower, yield.IconString, yield.Name)); 
				end
				isChangedWithPower = (yieldChangeWithoutPower ~= yieldChangeWithPower);
				if (isChangedWithPower) then
					local yieldChangeDifference = yieldChangeWithPower - yieldChangeWithoutPower;
					table.insert(tooltipLines, Locale.Lookup("LOC_TYPE_TRAIT_YIELD_POWER_ENHANCEMENT", yieldChangeDifference, yield.IconString, yield.Name));
				end
			end
		end
		--新加入内容（竞争造成的产出减少）
		if (iBuildingNum ~= 0) then
			for row in GameInfo.GA_BE_Involution() do
				if (row.BuildingType == buildingType) then
					local yield = GameInfo.Yields[row.YieldType];
					if (yield) then
						local iInvNum = iBuildingNum * row.YieldChange;
						local sInvName = Locale.Lookup("LOC_GABE_INVTYPE_"..row.DebuffName.."_NAME");
						table.insert(tooltipLines, Locale.Lookup("LOC_GABE_INV_DEBUFF_YIELD", iInvNum, yield.IconString, yield.Name, sInvName)); 
					end
				end
			end
		end
		--新加入内容结束
	end
end