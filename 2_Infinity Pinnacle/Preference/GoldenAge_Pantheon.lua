-- GoldenAge_Pantheon
-- Author: Flactine
-- DateCreated: 10/2/2021 8:20:55 AM
--------------------------------------------------------------
function GA_GainPantheon(iTurn)
	local iPlayerID = Game.GetLocalPlayer();
	local pPlayer = Players[iPlayerID];
	local pReligion = pPlayer:GetReligion();
	local iPantheon = pReligion:GetPantheon();
	if (iPantheon < 0) then
		LuaEvents.LaunchBar_OpenPantheonChooser();
	else
		Events.TurnBegin.Remove(GA_GainPantheon);
	end
	return;
end

function GA_PantheonInitialize()
	Events.TurnBegin.Add(GA_GainPantheon);
end

GA_PantheonInitialize();