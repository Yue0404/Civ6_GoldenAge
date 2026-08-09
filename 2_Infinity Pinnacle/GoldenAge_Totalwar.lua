
function DeclareWar(player1, player2)
    local localPlayer = Game.GetLocalPlayer();
	if (Players[localPlayer] ~= player1) then
		Players[player1]:GetDiplomacy():DeclareWarOn(player2, WarTypes.FORMAL_WAR, true);
	else
		Players[player2]:GetDiplomacy():DeclareWarOn(player1, WarTypes.FORMAL_WAR, true);
	end
end
ExposedMembers.TEST = ExposedMembers.TEST or {}
ExposedMembers.TEST.DeclareWar = DeclareWar





