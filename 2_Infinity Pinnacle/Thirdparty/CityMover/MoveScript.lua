-- MoveScript
-- Author: Alexandre Torres
-- DateCreated: 9/15/2020 5:54:36 PM
--------------------------------------------------------------


ExposedMembers.LuaEvents = LuaEvents;

ExposedMembers.MoveUI = {};

ldistricts = {
"DISTRICT_CITY_CENTER",
"DISTRICT_CAMPUS",
"DISTRICT_HOLY_SITE",
"DISTRICT_ENCAMPMENT",
"DISTRICT_COMMERCIAL_HUB",
"DISTRICT_ENTERTAINMENT_COMPLEX",
"DISTRICT_THEATER",
"DISTRICT_HARBOR",
"DISTRICT_AERODROME",
"DISTRICT_INDUSTRIAL_ZONE",
"DISTRICT_AQUEDUCT",
"DISTRICT_NEIGHBORHOOD",
"DISTRICT_SPACEPORT",
--"DISTRICT_WONDER
"DISTRICT_ACROPOLIS",
"DISTRICT_BATH",
"DISTRICT_HANSA",
"DISTRICT_LAVRA",
"DISTRICT_MBANZA",
"DISTRICT_STREET_CARNIVAL",
"DISTRICT_ROYAL_NAVY_DOCKYARD",
"DISTRICT_GOVERNMENT",
"DISTRICT_WATER_ENTERTAINMENT_COMPLEX",
"DISTRICT_WATER_STREET_CARNIVAL",
"DISTRICT_CANAL",
"DISTRICT_DAM",
"DISTRICT_COTHON",
"DISTRICT_SUGUBA",
};

data = nil;



function isEmptyTable(tab)
	for k,v in pairs(tab) do 		
		return false;
	end
	return true;

end

function countPlots(pCity)
	local curPlots = 0;
	for k,v in pairs(pCity:GetOwnedPlots()) do
		curPlots = curPlots+1;
	end
	return curPlots;
end

local function OnUnitMoveComplete(playerID,unitID,x,y)
	--print("entrou no unitmove");
	--print("id "..unitID.." x:"..x.." y"..y);
	local pUnit :object = Players[playerID]:GetUnits():FindID(unitID);
	--print(" unit type"..UnitManager.GetTypeName(pUnit));
	if (pUnit) then
		local utype = GameInfo.Units[pUnit:GetType()].UnitType;

		if (utype=='UNIT_FLY_CITY') then
			UnitManager.RestoreMovement(pUnit);
			local cityinf = pUnit:GetProperty("city");
			if (cityinf~=nil) then
				Players[playerID]:SetProperty("cityinfo",cityinf);
			end
		end
	end
	--UnitManager.RestoreMovement(Players[0]:GetUnits():FindID(131073));
	--UNITOPERATION_FOUND_CITY
	--UnitManager.RequestOperation(kUnit, UnitOperationTypes.AIR_ATTACK, tParameters);
	--UnitManager.RequestOperation( pSelectedUnit, UnitOperationTypes.FOUND_CITY );
	--UnitManager.CanStartOperation(Players[0]:GetUnits():FindID(262144),UnitOperationTypes.FOUND_CITY );

end

local function OnCityProjectCompleted( playerID,cityID,projectID,buildingIndex,iX,iY,bCancelled )
	print("script side OnCityProjectCompleted");
	if (projectID==GameInfo.Projects["PROJECT_MOVE_CITY"].Index) then
		local pCity = CityManager.GetCity(playerID, cityID);
		local pPlayer = Players[playerID];
		local found = nil;
		for i, unit in pPlayer:GetUnits():Members() do
			local unitInfo = GameInfo.Units[unit:GetType()];
			if (unitInfo.UnitType=="UNIT_FLY_CITY") then
				local cityinf = unit:GetProperty("city");
				if (cityinf~=nil and cityinf.x == pUnit:GetX() and cityinf.y == pUnit:GetY()) then
					found = unit;
					break;
				end 
			end
		end
		if (found==nil) then
			UnitManager.InitUnit(playerID, "UNIT_FLY_CITY", pCity:GetX(),pCity:GetY());
		end
	end
end

Events.CityProjectCompleted.Add(OnCityProjectCompleted);
	
local function OnUnitAddedToMap(playerID,unitID)
	--print("OnUnitAddedToMap");
	local pUnit :object = Players[playerID]:GetUnits():FindID(unitID);
	--print(" unit type"..UnitManager.GetTypeName(pUnit).." ID:"..unitID);
	local utype = GameInfo.Units[pUnit:GetType()].UnitType;
	if (utype=='UNIT_FLY_CITY') then
		--print("peon "..pUnit:GetX()..","..pUnit:GetY());
		local pPlayer = Players[playerID];
		-- check for other units
		for i, unit in pPlayer:GetUnits():Members() do
			local unitInfo = GameInfo.Units[unit:GetType()];
			if (unitInfo.UnitType=="UNIT_FLY_CITY") then
				local cityinf = unit:GetProperty("city");
				if (cityinf~=nil and cityinf.x == pUnit:GetX() and cityinf.y == pUnit:GetY()) then
					pPlayer:GetUnits():Destroy(unit);
				end 
			end
		end
		--
		
		local pCity = CityManager.GetCityAt(pUnit:GetX(),pUnit:GetY());	
		local uidata = pCity:GetProperty("uidata");
		
		--city:GetReligion():AddReligiousPressure(0,GameInfo.Religions[v.Religion].Index,v.Pression);
		local cityinfo = {x=pCity:GetX(),y=pCity:GetY(),name=pCity:GetName(),pop=pCity:GetPopulation()};
		if (uidata) then
			print("city has UI DATA");
			print("cityid "..uidata.cityID);
			cityinfo.uidata = uidata;
		end

		local numPlots = 0;

		for k,v in pairs(pCity:GetOwnedPlots()) do
			numPlots = numPlots+1;
		end
		cityinfo.numPlots = numPlots;
		print("num plots "..numPlots);
		if (Players[playerID]:GetCities():GetCapitalCity()) then
			cityinfo.capital =  Players[playerID]:GetCities():GetCapitalCity():GetID() == pCity:GetID();
			--print("set as capital=> "..tostring(cityinfo.capital));
		else 
			cityinfo.capital = 0;
		end
		local dist:table = {};

		for k,row in pairs(ldistricts) do 		
			--print("for "..row);
			local d = pCity:GetDistricts():GetDistrictLocation(GameInfo.Districts[row].Index);
			if (d) then
				--print("found "..row);
				local district = {type=row};
				district.buildings = {};
				table.insert(dist,district);
				-- buildings
				for BuildingRow in GameInfo.Buildings() do
					local iBuildingIndex = BuildingRow.Index;
					if (BuildingRow.PrereqDistrict==row and pCity:GetBuildings():HasBuilding(iBuildingIndex)) then
						--print("achou um building! "..BuildingRow.BuildingType);
						local building = {index=iBuildingIndex};
						table.insert(district.buildings,building);
						--if pCity:GetBuildings():IsPillaged(iBuildingIndex) then
						--	pCity:GetBuildings():SetPillaged(iBuildingIndex, false)
						--end
					end
				end

			end
	
		end
		cityinfo.districts = dist;
		pUnit:SetProperty("city",cityinfo);
		--ldistricts
		-- or could create a setler
		if (Players[0]:GetCities():GetCount()>1) then
			Players[playerID]:GetCities():Destroy(pCity);
		end
		--UnitManager.InitUnit(0, "UNIT_SETTLER", 32,34);
		--for k,v in pairs(Players[0]:GetUnits():FindID(262146):GetProperty("city").districts) do print(v.type) end
	end
end


local function OnCityBuilt(playerID,cityID,iX,iY) 
	--print("city built event");
	local pCity = CityManager.GetCity(playerID, cityID);

	local cityinf = Players[playerID]:GetProperty("cityinfo");
	Players[playerID]:SetProperty("cityinfo",nil);

	
	
	if (cityinf) then	
		local curPlots = 0;
		for k,v in pairs(pCity:GetOwnedPlots()) do
			curPlots = curPlots+1;
		end
		cityinf.curPlots = curPlots;
		--print("curplot "..curPlots);

		pCity:SetProperty("cityinfo",cityinf);

		local uidata = cityinf.uidata;
		--print("copiando dados");
		local oldCity = CityManager.GetCityAt(cityinf.x,cityinf.y);
		print("ix "..pCity:GetX().." cityinf.x "..cityinf.x.." iY "..pCity:GetY().." cityinf.y "..cityinf.y);
		if (oldCity and (pCity:GetX()~=cityinf.x or pCity:GetY()~=cityinf.y)) then
			Players[playerID]:GetCities():Destroy(oldCity);
			print("old city destr");
		end
		
		pCity:SetName(cityinf.name);
		local curPop = pCity:GetPopulation();
		pCity:ChangePopulation(cityinf.pop - curPop);

		if (cityinf.capital) then
			--print("set as capital");
			CityManager.SetAsOriginalCapital(pCity);
		end

		if (uidata) then
			
			for key, pressure in pairs(uidata.religions) do
				--print("key "..key.." value "..pressure);
				local religion = GameInfo.Religions[key];
				if (religion) then
					--GameInfo.Religions[key].PrimaryKey

					pCity:GetReligion():AddReligiousPressure(0,religion.Index,pressure);
				end
			end
			if (uidata.holyCity==1) then
				print("set holy CITY");
				Players[playerID]:GetReligion():SetHolyCity(cityID);
			end
			-- Plot.SetOwner(cityid);
			-- CityManager.GetCityAt(16,36):GetCulture():GetNextPlot()
			-- CityManager.GetCityAt(16,36):GetCulture():GetNextPlotCultureCost()
			--WorldBuilder.CityManager():SetPlotOwner( pPickPlot:GetX(), pPickPlot:GetY(), pPlayer, pCity )
			-- WorldBuilder.CityManager():SetPlotOwner(17,38,0,524288)  -funciona
			-- Problem: the next plot cost will be smaller(?) and culture will be zero
		end
		--print("listing distritos");
		--for k,v in pairs(cityinf.districts) do 
		--	print("  " ..v.type) 
		--end
		
		--print("terminou");
	end
end
-- function exposed to UI context
local function GrowCity(x,y,playerID,cityID) 		
	local plot = Map.GetPlot(x,y);
	if (plot and plot:GetOwner()<0) then
		WorldBuilder.CityManager():SetPlotOwner(x,y,playerID,cityID);
		local pCity = CityManager.GetCity(playerID, cityID);
		local cityinfo = pCity:GetProperty("cityinfo");
		if (cityinfo and cityinfo.curPlots~=nil) then
			cityinfo.curPlots = cityinfo.curPlots+1;
			pCity:SetProperty("cityinfo",cityinfo);
		end
	end
end
-- Expose GrowCity function to UI context
LuaEvents.GrowCity.Add(GrowCity);
-- function exposed to UI context
function SetUICityInfo(val)	
	--print("lua event SetUICityInfo city id "..val.cityID);
	local pCity = CityManager.GetCity(val.playerID, val.cityID);
	if (pCity) then		
		pCity:SetProperty("uidata",val);
	end
end
-- Expose SetUICityInfo function to UI context
LuaEvents.SetUICityInfo.Add(SetUICityInfo);

local function AddPlots(playerID,cityID)
	local pCity = CityManager.GetCity(playerID, cityID);
	local cityinfo = pCity:GetProperty("cityinfo");
	if (cityinfo and cityinfo.curPlots) then
		local difplots = cityinfo.numPlots -  cityinfo.curPlots
		--print("difplots "..difplots);
		-- Calling method exposed by UI script
		local plotID = ExposedMembers.MoveUI.GetNextPlot(playerID,cityID);
		if (difplots>0 and plotID>=0) then
			print("next plot index "..plotID);
			local plot = Map.GetPlotByIndex(plotID);
			GrowCity(plot:GetX(),plot:GetY(),playerID,cityID);
			--cityinfo.curPlots = cityinfo.curPlots+1;
			--pCity:SetProperty("cityinfo",cityinfo);
			print("plot "..plotID.." set to owner "..cityID);
		end
	end
end


local function OnDistrictAddedToMap(playerID,districtID,cityID,iX,iY,districtType,percentComplete)
	--print("district added");
	--print("district info:"..playerID..","..districtID..","..cityID..","..iX..","..iY..","..districtType..","..percentComplete);
	local pCity = CityManager.GetCity(playerID,cityID);
	local cityinf = pCity:GetProperty("cityinfo");
	local disrow=nil;
	if (cityinf) then
		for k,v in pairs(cityinf.districts) do 
			--print("  district added " ..v.type) 
			if (GameInfo.Districts[v.type].Index==districtType) then
				disrow = k;
				--print("distrito ja construido, finalizando");
				local pDist = pCity:GetDistricts():GetDistrict(districtType);
				if (v.type~="DISTRICT_CITY_CENTER") then
					pCity:GetBuildQueue():FinishProgress();
				end

				for k1,v1 in pairs(v.buildings) do
					--print("building exists "..v1.index);
					WorldBuilder.CityManager():CreateBuilding(pCity,v1.index,100,Map.GetPlotIndex(iX,iY));
					--print("building created ");
				end
			end	
		
		end
		table.remove(cityinf.districts,disrow);
		pCity:SetProperty("cityinfo",cityinf);
		
	end
	--CityManager.GetCity(playerID,cityID):GetDistricts():GetDistrictAtLocation(iX,iY);
	--CityManager.GetCity(playerID,cityID):GetBuildQueue():FinishProgress();
	--pCityDistricts:GetDistrictLocation(GameInfo.Districts["DISTRICT_HARBOR"].Index);
	--CityManager.GetCity(playerID,cityID):GetDistricts():GetDistrict(GameInfo.Districts["DISTRICT_HOLY_SITE"].Index)
end
--Players[0]:GetTechs():SetResearchProgress(GameInfo.Technologies["TECH_ASTROLOGY"].Index, 50)
--CityManager.GetCity(0,65536):GetBuildQueue():FinishProgress();
--CityManager.GetCityAt(9,10):GetBuildings():GetBuildingsAtLocation(Map.GetPlotXY(9,11):GetIndex())


local function OnTurnEnd()
	--print("***turn end");
	for loop, pPlayer in ipairs(Players) do		
		if (pPlayer and  pPlayer:GetUnits()) then 
			for i, unit in pPlayer:GetUnits():Members() do
				local unitInfo = GameInfo.Units[unit:GetType()];
				if (unitInfo.UnitType=="UNIT_FLY_CITY") then
					local cityinf = unit:GetProperty("city");
					if (cityinf) then
						pPlayer:SetProperty("cityinfo",nil);
						UnitManager.PlaceUnit(unit, cityinf.x,cityinf.y);
						print("unit placed back");
					--else
						-- kill unit
					end
				end
			end 
		end
	end
end

local function cleanInfo(pCity) 
	local cityinfo = pCity:GetProperty("cityinfo");		
	if (cityinfo) then
		--print("cleanInfo has cityinfo");
		local curPlots = countPlots(pCity);
		local emptyDistricts = isEmptyTable(cityinfo.districts);
		--print("curplots = "..curPlots.." num plots "..cityinfo.numPlots);		
		if (curPlots>=cityinfo.numPlots and emptyDistricts) then
			--print("removing city info from city "..pCity:GetID());
			pCity:SetProperty("cityinfo",nil);
		end
	end
end
local function AddPlotsToCities(playerID)
	local pPlayer = Players[playerID];
	for i, pCity in pPlayer:GetCities():Members() do
		local cityinfo = pCity:GetProperty("cityinfo");		
		if (cityinfo and cityinfo.curPlots<cityinfo.numPlots) then
			--print("calling addplot");
			AddPlots(playerID,pCity:GetID());
		end
		cleanInfo(pCity);
	end
end
local function OnPlayerTurnActivated( playerID )
	AddPlotsToCities(playerID);
	
end

GameEvents.PlayerTurnStartComplete.Add(OnPlayerTurnActivated);

print("City Move:main script loaded");

Events.TurnEnd.Add(OnTurnEnd);
Events.DistrictAddedToMap.Add(OnDistrictAddedToMap);
Events.UnitMoveComplete.Add(OnUnitMoveComplete);

--Events.CityProductionCompleted.Add(OnCityProductionCompleted);
Events.UnitAddedToMap.Add(OnUnitAddedToMap);
--UnitAddedToMap
GameEvents.CityBuilt.Add(OnCityBuilt);
--CityBuilt
--CityProductionCompleted



