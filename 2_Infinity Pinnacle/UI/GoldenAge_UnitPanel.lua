include("UnitPanel");
pcall(function () include("UnitPanel_Expansion1"); end);
pcall(function () include("UnitPanel_Expansion2"); end);
pcall(function () include("LagFixHotkey"); end);


-- ===========================================================================
--  Requests an operation based on the type of unit and parameters
-- ===========================================================================
function RequestMoveOperation( kUnit:table, tParameters:table, plotX:number, plotY:number )
	-- Air units move and attack slightly differently than land and naval units
	if ( GameInfo.Units[kUnit:GetUnitType()].Domain == "DOMAIN_AIR" ) then
		tParameters[UnitOperationTypes.PARAM_MODIFIERS] = UnitOperationMoveModifiers.ATTACK;
		if (UnitManager.CanStartOperation( kUnit, UnitOperationTypes.AIR_ATTACK, nil, tParameters) ) then
			UnitManager.RequestOperation(kUnit, UnitOperationTypes.AIR_ATTACK, tParameters);
		elseif (UnitManager.CanStartOperation( kUnit, UnitOperationTypes.DEPLOY, nil, tParameters) ) then
			UnitManager.RequestOperation(kUnit, UnitOperationTypes.DEPLOY, tParameters);
		end
	else
		tParameters[UnitOperationTypes.PARAM_MODIFIERS] = UnitOperationMoveModifiers.NONE;
		if UnitManager.CanStartOperation( kUnit, UnitOperationTypes.RANGE_ATTACK, nil, tParameters) and ( kUnit:GetRangedCombat() > kUnit:GetCombat() or kUnit:GetBombardCombat() > kUnit:GetCombat() ) then
			TryRequestRangedAttack(kUnit, tParameters, plotX, plotY);
		else
			TryRequestMeleeAttack(kUnit, tParameters, plotX, plotY);
		end
	end
end

function TryRequestRangedAttack( kUnit:table, tParameters:table, plotX:number, plotY:number )

	local attackerUnitInfo = GameInfo.Units[kUnit:GetUnitType()];
	local attackerFormationClass = attackerUnitInfo.FormationClass;
	
	-- if requesting ranged attack against one tile （远程单位占领0血城）
	-- check combat at least 1, because some mods have military support units with a ranged attack
	if (kUnit:GetCombat() >= 1 and Map.GetPlotDistance(kUnit:GetX(), kUnit:GetY(), plotX, plotY) == 1) then

		-- if attacking city with zero HP, engage in melee, even if this unit might be a ranged unit
		local pCity = Cities.GetCityInPlot(plotX, plotY);
		if pCity then
			local owner = pCity:GetOwner();
			local pPlayer = Players[owner];
			local pMainDistrict = pPlayer:GetDistricts():FindID( pCity:GetDistrictID() );
			local districtHitpoints = pMainDistrict:GetMaxDamage(DefenseTypes.DISTRICT_GARRISON);

			if districtHitpoints <= 0 then
				return TryRequestMeleeAttack(kUnit, tParameters, plotX, plotY);
			end
		end
	end

	UnitManager.RequestOperation(kUnit, UnitOperationTypes.RANGE_ATTACK, tParameters);
end

function TryRequestMeleeAttack( kUnit:table, tParameters:table, plotX:number, plotY:number )
	-- Allow for attacking and don't early out if the destination is blocked, etc., but is in the fog.
	tParameters[UnitOperationTypes.PARAM_MODIFIERS] = UnitOperationMoveModifiers.ATTACK + UnitOperationMoveModifiers.MOVE_IGNORE_UNEXPLORED_DESTINATION;
	if (UnitManager.CanStartOperation( kUnit, UnitOperationTypes.COASTAL_RAID, nil, tParameters) ) then
		UnitManager.RequestOperation( kUnit, UnitOperationTypes.COASTAL_RAID, tParameters);
	else
		UnitManager.RequestOperation(kUnit, UnitOperationTypes.MOVE_TO, tParameters);
	end
end