-- MoveUnitPanel
-- Author: Alexandre Torres
-- DateCreated: 9/15/2020 6:50:42 PM
--------------------------------------------------------------


LuaEvents = ExposedMembers.LuaEvents;

--print("MoveUnit Panel ui");
local function OnUnitMoveComplete2(playerID,unitID,x,y)
	--print("entrou no unitmove 2.0");
	--print("id "..unitID.." x:"..x.." y"..y);
	local pUnit :object = Players[playerID]:GetUnits():FindID(unitID);
	--print(" unit type:"..UnitManager.GetTypeName(pUnit));

	local cityinf = pUnit:GetProperty("city");	
	
	if (UnitManager.GetTypeName(pUnit)=='UNIT_FLY_CITY') then
		if (UnitManager.CanStartOperation(pUnit,UnitOperationTypes.FOUND_CITY )) then
			UnitManager.RequestOperation( pUnit, UnitOperationTypes.FOUND_CITY );
		else
			--UnitManager.PlaceUnit(pUnit, cityinf.x,cityinf.y);
			--print("moving BACK");
			--local tParameters = {};
			--tParameters[UnitOperationTypes.PARAM_X] = cityinf.x;
			--tParameters[UnitOperationTypes.PARAM_Y] = cityinf.Y;
			--tParameters[UnitOperationTypes.PARAM_MODIFIERS] = UnitOperationMoveModifiers.NONE;
			--UnitManager.RequestOperation(pUnit, UnitOperationTypes.MOVE_TO, tParameters);
			
			--UnitManager.RequestOperation( pUnit, UnitOperationTypes.FOUND_CITY );
		end		
	end
	--UNITOPERATION_FOUND_CITY
	--UnitManager.RequestOperation(kUnit, UnitOperationTypes.AIR_ATTACK, tParameters);
	--UnitManager.RequestOperation( pSelectedUnit, UnitOperationTypes.FOUND_CITY );
	--UnitManager.CanStartOperation(Players[0]:GetUnits():FindID(262144),UnitOperationTypes.FOUND_CITY );
end

Events.UnitMoveComplete.Add(OnUnitMoveComplete2);

-- Method exposed to script context 
local function GetNextPlot(playerID,cityID)
	local pCity = CityManager.GetCity(playerID, cityID);
	local plot = -1;
	if (pCity and pCity:GetCulture()) then 
		plot = pCity:GetCulture():GetNextPlot();
		--print(" GetNextPlot id "..plot);
	end
	return plot;
end
ExposedMembers.MoveUI.GetNextPlot = GetNextPlot;


local function OnCityProjectUICompleted( playerID,cityID,projectID,buildingIndex,iX,iY,bCancelled )
	print("client side cityproject");
	if (projectID==GameInfo.Projects["PROJECT_MOVE_CITY"].Index) then
		--print("client side cityproject is move city");
		local data = {playerID = playerID,cityID = cityID};
		data.religions={};
		local pCity = CityManager.GetCity(playerID, cityID);
		if (pCity) then
			print("pcity existe");
			local tab = pCity:GetReligion():GetReligionsInCity();
			if (tab) then
				for _, cityReligionData in ipairs(tab) do 	
					data.religions[cityReligionData.Religion] = cityReligionData.Pressure;
					--print("   religion "..cityReligionData.Religion);
					--print("     followers "..cityReligionData.Followers);	
					--print("     pressure "..cityReligionData.Pressure);		
				end
			end		
			local holyCityId = Players[playerID]:GetReligion():GetHolyCityID().id;
			data.holyCity=0;
			if (holyCityId>=0 and cityID==holyCityId) then
				data.holyCity=1;
			end
			

		end
		LuaEvents.SetUICityInfo(data);
		--print("called luaevent setuidata");
	end
end


local function addPlotsToCities(playerID)
	local pPlayer = Players[playerID];
	if (pPlayer:GetCities()) then
		for i, pCity in pPlayer:GetCities():Members() do
			local cityinfo = nil;
			cityinfo = pCity:GetProperty("cityinfo");
			if (cityinfo and cityinfo.curPlots<cityinfo.numPlots) then
				local cityID = pCity:GetID();
				--print("UI add plot for city "..cityID);
				local difplots = cityinfo.numPlots -  cityinfo.curPlots;
				--print("difplots "..difplots);
				local plotID = GetNextPlot(playerID,cityID);
				if (plotID>=0) then
					--print("next plot index "..plotID);
					local plot = Map.GetPlotByIndex(plotID);
					-- Call exposed script method 
					LuaEvents.GrowCity(plot:GetX(),plot:GetY(),playerID,cityID);
				end
			
			end
		end
	end
end
	

local function OnPlayerTurnActivated(playerID) 
	addPlotsToCities(playerID);
end

local function OnTurnEnd()	
	for playerID, pPlayer in ipairs(Players) do
		if (pPlayer:IsMajor()) then
			addPlotsToCities(playerID);
		end
	end
end


Events.TurnEnd.Add(OnTurnEnd);

Events.PlayerTurnActivated.Add(OnPlayerTurnActivated);
Events.CityProjectCompleted.Add(OnCityProjectUICompleted);


print("MoveUnitPanel added to UI side");

--[[
GetReligion() client methods
MoveUnitPanel: "GetPressureFromCity"=function: 000000002BD159E0
 MoveUnitPanel: "GetReligiousPressureSources"=function: 000000002BD14DA0
 MoveUnitPanel: "GetTurnsToNextReligion"=function: 000000002BD157E0
 MoveUnitPanel: "GetNextReligion"=function: 000000002BD14F60
 MoveUnitPanel: "GetReligionsInCity"=function: 000000002BD15020
 MoveUnitPanel: "GetTotalPressureOnCity"=function: 000000002BD15A20
 MoveUnitPanel: "GetCity"=function: 000000002BD14E60
 MoveUnitPanel: "GetMajorityReligion"=function: 000000002BD15160
 MoveUnitPanel: "TypeName"=CacheCityReligion
 MoveUnitPanel: "GetActivePantheon"=function: 000000002BD152A0
]]--
