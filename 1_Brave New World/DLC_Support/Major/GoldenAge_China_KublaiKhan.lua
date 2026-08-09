-- Author: Muyyi and Flactine

local sDefaultThings = "Nothing";
local sUniqueThings = {sDefaultThings, sDefaultThings, sDefaultThings, sDefaultThings, sDefaultThings};
local iUniqueThingCount = {0,0,0,0,0};
local sPrevName = sDefaultThings;

function CollectUniqueThings(sTypeName, iTypeIndex)
	if (sTypeName == nil or iTypeIndex == nil) then
		return sUniqueThings;
	end
	local sRealName = Locale.Lookup(sTypeName);
	--避免重复
	if sPrevName == sRealName then
		return sUniqueThings;
	end

	if (sUniqueThings[iTypeIndex] == sDefaultThings) then
		sUniqueThings[iTypeIndex] = Locale.Lookup(sRealName);
	else
		sUniqueThings[iTypeIndex] = sUniqueThings[iTypeIndex]..", "..sRealName;
	end
	print("加入了新东西，编号为：", iTypeIndex);
	print("内容为：", sRealName);
	iUniqueThingCount[iTypeIndex] = iUniqueThingCount[iTypeIndex] + 1;
	sPrevName = sRealName;
	return sUniqueThings;
end

function CapitalBandCivUa(playerID:number, cityID:number, cityX:number, cityY:number)
    print("CapitalBandCivUa - " .. tostring(playerID) .. ":" .. tostring(cityID) .. " " .. tostring(cityX) .. "x" .. tostring(cityY));
    local pPlayer = Players[playerID];
	--判断是不是忽必烈？
	local playerConfig = PlayerConfigurations[playerID];
	print("playerConfig is:", playerConfig);
	if (playerConfig) then
		local leaderTypeName:string = playerConfig:GetLeaderTypeName();
		if (leaderTypeName ~= "LEADER_KUBLAI_KHAN_CHINA" and leaderTypeName ~= "LEADER_KUBLAI_KHAN_MONGOLIA") then 
			return;
		end
	end
	
    local pCity = CityManager.GetCity(playerID,cityID)
    local originalOwnerID = pCity:GetOriginalOwner()
    if originalOwnerID ~= playerID and originalOwnerID ~= nil then
        local oPlayer = Players[originalOwnerID]
        local oPlayerConfig = PlayerConfigurations[originalOwnerID]
        local oCiv = oPlayerConfig:GetCivilizationTypeName()
        local oLD = oPlayerConfig:GetLeaderTypeName()
        local have_captured = pPlayer:GetProperty('CC_CAPITAL_HAVE_CAPTURED_'..originalOwnerID)
        print('has capture:', have_captured)
        print('Civilization: ',oCiv)
        print('Leader: ',oLD)
		if not (oPlayer:IsMajor()) then
			return;
		end
        if have_captured == nil then -- avoid repeating
            print("capture skill")
            pPlayer:SetProperty('CC_CAPITAL_HAVE_CAPTURED_'..originalOwnerID, true)
            -- 要执行的捕获代码
            -- 城市捕获有个致命的问题，就是原来的文明会获得2倍加成。建筑也一样。
            -- print("CanCaptureUA: ",Game:GetProperty('CanCaptureUA'));
			-- 判断玩家是否想获得文明及领袖的能力
            local oCivName = "LOC_"..oCiv.."_NAME";
			local oLDName = "LOC_"..oLD.."_NAME"
			--初始化
			sUniqueThings = {sDefaultThings, sDefaultThings, sDefaultThings, sDefaultThings, sDefaultThings};
			iUniqueThingCount = {0,0,0,0,0};
			-- 获得Trait部分
			sPrevName = sDefaultThings; --初始化
			for cc_row in GameInfo.GA_KubCap_CIV_UA() do
				if cc_row.CivilizationType == oCiv then
					pPlayer:AttachModifierByID(cc_row.ModifierId);
					print("you get "..cc_row.CivilizationType.." ability modifier "..cc_row.ModifierId) 
					local sTypeName = cc_row.TraitName;
					CollectUniqueThings(sTypeName, 1);
				end
			end
            local cc_capture_msg = Locale.Lookup("LOC_KUBCAP_CAPTURE_CAPITAL_MSG");
            local cc_capture_sum = Locale.Lookup("LOC_KUBCAP_CAPTURE_CAPITAL_SUM");
            print(cc_capture_msg);
            print(cc_capture_sum);
            -- local cc_capture_msg = "[ICON_Capital]占领"..Locale.Lookup(oCivName).."的首都"
            -- local cc_capture_sum = "你现在可以获得该文明的UU,UI和UB!"
            NotificationManager.SendNotification(playerID, "NOTIFICATION_CAPITAL_RECLAIMED", cc_capture_msg, cc_capture_sum)
			if (pPlayer == Players[Game.GetLocalPlayer()]) then
				ExposedMembers.KubCap.CCSendPopup(oCivName, oLDName, sUniqueThings, iUniqueThingCount);
			end
		end
    end
	return;
end

-- config
function InitializeKubCap()
    GameEvents.CapitalBandCiv.Add(CapitalBandCivUa);
	print("KubCap Loaded!");
end

InitializeKubCap();

ExposedMembers.KubCap = ExposedMembers.KubCap or {}
ExposedMembers.KubCap.CapitalBandCivUa = CapitalBandCivUa;









