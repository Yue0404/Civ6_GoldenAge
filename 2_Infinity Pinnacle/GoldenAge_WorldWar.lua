include("PopupManager");
include("AnimSidePanelSupport");
include("InstanceManager");
include("SupportFunctions");
include("GameCapabilities");
include("TeamSupport");
local iLastShownEraIndex = Game.GetEras():GetCurrentEra()
function OnCheckGameEraChanged()
    local localPlayer	:number = Game.GetLocalPlayer();
    print(localPlayer);
    local currentEra	:number = Game.GetEras():GetCurrentEra();
    print(currentEra);
    local currentTurn	:number = Game.GetCurrentGameTurn();
    print(currentTurn);
    local gameStartTurn	:number = GameConfiguration.GetStartTurn();
    print(gameStartTurn);
	--if (currentEra == 5 or currentEra == 6) and iLastShownEraIndex ~= currentEra and localPlayer ~= PlayerTypes.NONE then
    if currentEra == 5 and iLastShownEraIndex ~= currentEra and localPlayer ~= PlayerTypes.NONE then
        local pAllPlayerIDs : table = PlayerManager.GetAliveMajors();
        for k1, pPlayer1 in ipairs(pAllPlayerIDs) do
            for k2, pPlayer2 in ipairs(pAllPlayerIDs) do
                if pPlayer1:GetDiplomacy():CanDeclareWarOn(pPlayer2:GetID(), WarTypes.SURPRISE_WAR, true) then
					if (Players[localPlayer] ~= pPlayer1) then
                        pPlayer1:GetDiplomacy():DeclareWarOn(pPlayer2:GetID(), WarTypes.SURPRISE_WAR, true); 
					else
						pPlayer2:GetDiplomacy():DeclareWarOn(pPlayer1:GetID(), WarTypes.SURPRISE_WAR, true); 
					end
                end
            end
        end
    end
end

function Initialize()
    Events.LocalPlayerTurnBegin.Add(OnCheckGameEraChanged);
end
print("WorldWar script Started =====");
Initialize();
