
function OnDiplomacyRelationshipChanged(iPlayer1, iPlayer2)
    -- credit: HemmelFort
    -- 如果两人已经打起来了，那就算了
    if Players[iPlayer1]:GetDiplomacy():IsAtWarWith(iPlayer2) then
        return
    end
    
    -- 获取双方目前的关系
    local iState = Players[iPlayer1]:GetDiplomaticAI():GetDiplomaticStateIndex(iPlayer2)
    local sStateType = GameInfo.DiplomaticStates[iState].StateType
    
    -- 如果是谴责状态，且可以一战，那就打起来
    if (sStateType == 'DIPLO_STATE_DENOUNCED')
    and Players[iPlayer1]:GetDiplomacy():CanDeclareWarOn(iPlayer2) then
        ExposedMembers.TEST.DeclareWar(iPlayer1, iPlayer2)
    end
end

Events.DiplomacyRelationshipChanged.Add(OnDiplomacyRelationshipChanged)




