-- Author: Muyyi and Flactine

include( "PopupDialog" );

function PlayGainMusic(iAllThingsCount)
	if iAllThingsCount > 2 then
		--UI.PlaySound("CC_GainAbility_Many");
	else
		--UI.PlaySound("CC_GainAbility_Few");
	end
	return;
end

function CCSendPopup(sCivName, sLeaderName, sUniqueThings, iUniqueThingCount)
	print("sCivName is: ", sCivName);
	print("sLeaderName is: ", sLeaderName);
	local pPopupDialog	:table = PopupDialogInGame:new("GetAbility"); 
	pPopupDialog:AddTitle(Locale.Lookup("LOC_KUBCAP_CAPTURE_CAPITAL_POPUP_TITLE"));

	local sPopupTextGain = Locale.Lookup("LOC_KUBCAP_CAPTURE_CAPITAL_POPUP_GAINS_1", sCivName);
	
	if (iUniqueThingCount[1] ~= 0) then
		sPopupTextGain = sPopupTextGain..Locale.Lookup("LOC_KUBCAP_CAPTURE_CAPITAL_POPUP_GAINS_2", sCivName, sUniqueThings[1]);
	end
	
	pPopupDialog:AddText(sPopupTextGain);
	--AddButton
	pPopupDialog:AddConfirmButton(Locale.Lookup("LOC_KUBCAP_CAPTURE_CAPITAL_POPUP_OK"), PlayGainMusic(1));
	pPopupDialog:Open();
	return;
end

function OnCapitalBuilding(playerID:number, cityID:number, cityX:number, cityY:number)
    print("OnCapitalBuilding - " .. tostring(playerID) .. ":" .. tostring(cityID) .. " " .. tostring(cityX) .. "x" .. tostring(cityY));
    local pPlayer = Players[playerID];
    if pPlayer == nil or pPlayer:IsBarbarian() or not (pPlayer:IsMajor()) then
        return;
    end
    local pCity = CityManager.GetCity(playerID,cityID);
    -- 不需要判断是否原始首都，因为无法建造非原始首都
    if not pCity:IsOriginalCapital() then
        return;
    end
    print("capital has building");
    ExposedMembers.KubCap.CapitalBandCivUa(playerID, cityID, cityX, cityY);
end

Events.CityAddedToMap.Add(OnCapitalBuilding);

ExposedMembers.KubCap = ExposedMembers.KubCap or {}
ExposedMembers.KubCap.CCSendPopup = CCSendPopup;