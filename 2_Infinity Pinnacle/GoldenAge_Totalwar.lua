
function DeclareWar(iPlayer1, iPlayer2)
    local localPlayer = Game.GetLocalPlayer();
	if (Players[localPlayer] ~= iPlayer1) then
		Players[iPlayer1]:GetDiplomacy():DeclareWarOn(iPlayer2, WarTypes.FORMAL_WAR, true);
	else
		Players[iPlayer2]:GetDiplomacy():DeclareWarOn(iPlayer1, WarTypes.FORMAL_WAR, true);
	end
end
ExposedMembers.TEST = ExposedMembers.TEST or {}
ExposedMembers.TEST.DeclareWar = DeclareWar





