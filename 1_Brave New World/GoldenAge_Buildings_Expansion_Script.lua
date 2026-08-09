-- GoldenAge_Buildings_Expansion_Script
-- Author: Flactine
-- DateCreated: 1/31/2024 9:59:17 PM
--------------------------------------------------------------
function FireStationStart(eEventType:number, eSeverity:number, iPlotX:number, iPlotY:number)
	for _, pPlayer in ipairs(PlayerManager.GetAliveMajors()) do	
		if (not pPlayer:IsHuman()) then
			local iAIFireStationCD = pPlayer:GetProperty("PROP_AI_FIRESTATION_CD") or 0;
			if iAIFireStationCD == 0 then
				local iPlayerID = pPlayer:GetID();
				local pCities :table = pPlayer:GetCities();
				for _, pCity in pCities:Members() do
					FireStationRepair(pPlayer, pCity);
					print('Repaired Building.');
				end
				pPlayer:SetProperty("PROP_AI_FIRESTATION_CD", 10);
			else
				iAIFireStationCD = iAIFireStationCD - 1;
				pPlayer:SetProperty("PROP_AI_FIRESTATION_CD", iAIFireStationCD);
			end
		else
			local iPlayerID = pPlayer:GetID();
			local pCities :table = pPlayer:GetCities();
			for _, pCity in pCities:Members() do
				FireStationRepair(pPlayer, pCity);
				print('Repaired Building.');
			end
		end
	end
end

function FireStationRepair(pPlayer, pCity)
	local iCount = 0;
	if (pCity ~= nil) then
		--有消防局吗？
		local iHasFireStation = pCity:GetProperty('PROP_GA_FIREST_AUTOREPAIR_BUILDING') or 0;
		print('iHasFireStation is');
		print(iHasFireStation);
		if not (iHasFireStation == 1) then return; end
		--修复建筑
		print('Start Prase 1');
		for building in GameInfo.Buildings() do
			local sBuildingShortName = string.gsub(building.BuildingType, "BUILDING_", "");
			local sBuildingType = "BUILDING_" .. tostring(sBuildingShortName);
			local pBuilding = GameInfo.Buildings[sBuildingType];
			if (pBuilding ~= nil) then							
				--上面有敌人或核辐射吗？
				local bCanRepair = true;
				local iPlotIndex = pCity:GetBuildings():GetBuildingLocation(pBuilding.Index);
				local pFalloutManager = Game.GetFalloutManager();
				if (pFalloutManager:HasFallout(iPlotIndex)) then
					bCanRepair = false;
				else
					for loop, pUnit in ipairs(Units.GetUnitsInPlot(Map.GetPlotByIndex(iPlotIndex))) do
						if(pUnit ~= nil) then
							if pUnit then
								local iUnitOwner = pUnit:GetOwner();
								print('iUnitOwner is:');
								print(iUnitOwner);
								local pUnitOwner = Players[iUnitOwner];
								print('pUnitOwner is:');
								print(pUnitOwner);
								local iPlayer = pPlayer:GetID();
								if iPlayer ~= iUnitOwner then
									if pUnitOwner:IsBarbarian() or (iUnitOwner == 62) then
										bCanRepair = false;
									end
									if Players[iPlayer]:GetDiplomacy():IsAtWarWith(iUnitOwner) then
										bCanRepair = false;
									end
								end
							end
						end
					end
				end
				if bCanRepair then
					pCity:GetBuildings():SetPillaged(pBuilding.Index, false);
				end
			end
		end
		--修复区域
		--目前暂时无可用方案
		local bHasSolved = false;
		if bHasSolved then
			print('Start Prase 2');
			local tVaildPlots = Map.GetNeighborPlots(pCity:GetX(), pCity:GetY(), 3);
			for _, plot in ipairs(tVaildPlots) do
				local pCityDistrict = pCity:GetDistricts():GetDistrictAtLocation(plot:GetX(), plot:GetY());
				if pCityDistrict then
					if pCityDistrict:IsPillaged() then
						pCityDistrict:SetPillaged(false);
						--if district.isPillaged then
						--	district:SetPillaged(false);
						--end
					end
				end
			end
		end
	end
	return;
end

function RepairBuildingsInitialize()
	Events.TurnBegin.Add(FireStationStart);
	--Events.RandomEventOccurred.Add(FireStationStart);
end

RepairBuildingsInitialize();