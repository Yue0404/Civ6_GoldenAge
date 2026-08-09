include("Civ6Common");

function WriteMyCustomData(TableStringKey, TableValue)
	WriteCustomData(TableStringKey, TableValue);
end

function ReadMyCustomData(TableStringKey)
	local MyDatatable = ReadCustomData(TableStringKey);
	return MyDatatable;
end

function GA_CultivationBuyPlot(iCityID, iPlotIndex, iPlayerID)
	--模拟购买地块行为
	local pPlot = Map.GetPlotByIndex(iPlotIndex);
	local pPlayer = Players[iPlayerID];
	local pCity = CityManager.GetCity(iPlayerID, iCityID)
	local tParameters = {};
	tParameters[CityCommandTypes.PARAM_PLOT_PURCHASE] = UI.GetInterfaceModeParameter(CityCommandTypes.PARAM_PLOT_PURCHASE);
	tParameters[CityCommandTypes.PARAM_X] = pPlot:GetX();
	tParameters[CityCommandTypes.PARAM_Y] = pPlot:GetY();
	print('Prase 1');
	if CityManager.CanStartCommand(pCity, CityCommandTypes.PURCHASE, tParameters) then
		print('Prase 1.1');
		local pCityGold = pCity:GetGold();
		local iCost = pCityGold:GetPlotPurchaseCost(pPlot:GetIndex());
		ExposedMembers.GameEvents.RequestChangeGoldBalance.Call(pPlayer, iCost);
		CityManager.RequestCommand(pCity, CityCommandTypes.PURCHASE, tParameters);
		return true;
	else
		print('Prase 1.2');
		return false;
	end
	return false;
end

ExposedMembers.ResourceCultivation.WriteMyCustomData = WriteMyCustomData;
ExposedMembers.ResourceCultivation.ReadMyCustomData = ReadMyCustomData;
ExposedMembers.ResourceCultivation.GA_CultivationBuyPlot = GA_CultivationBuyPlot;

print('Farmer & Gardener Custom Data UI Script loaded');