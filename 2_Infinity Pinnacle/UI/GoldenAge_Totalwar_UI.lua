
function OnDiplomacyRelationshipChanged(p1, p2)
    -- credit: HemmelFort
    -- 如果两人已经打起来了，那就算了
    if Players[p1]:GetDiplomacy():IsAtWarWith(p2) then
        return
    end
    
    -- 获取双方目前的关系
    local iState = Players[p1]:GetDiplomaticAI():GetDiplomaticStateIndex(p2)
    local sStateType = GameInfo.DiplomaticStates[iState].StateType
    
    -- 如果是谴责状态，且可以一战，那就打起来
    if (sStateType == 'DIPLO_STATE_DENOUNCED')
    and Players[p1]:GetDiplomacy():CanDeclareWarOn(p2) then
        ExposedMembers.TEST.DeclareWar(p1, p2)
    end
end

Events.DiplomacyRelationshipChanged.Add(OnDiplomacyRelationshipChanged)




