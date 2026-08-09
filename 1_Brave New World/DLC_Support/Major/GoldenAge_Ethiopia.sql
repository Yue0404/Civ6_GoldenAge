--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_ETHIOPIA' , 'TRAIT_DOUBLE_ARCHAEOLOGY_SLOTS' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_ETHIOPIA' , 'TRAIT_SUPPORT_TWO_ARCHAEOLOGISTS' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_ETHIOPIA' , 'TRAIT_AUTO_THEME_ARCHAEOLOGY_MUSEUM' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_MENELIK' , 'GOLDEN_TRAIT_MENELIK_FAITH_BUILDING_COST' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_MENELIK' , 'GOLDEN_TRAIT_MENELIK_GOLD_DEBUFF' );
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_MENELIK_FAITH_BUILDING_COST' , 'GOLDEN_MODIFIER_PLAYER_CITIES_GRANT_YIELD_PER_BUILDING_COST' , 0 , 0 , 'CITY_HAS_GOVERNOR_REQUIREMENTS' );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_MENELIK_GOLD_DEBUFF' , 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER' , 0 , 0 , NULL );
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MENELIK_FAITH_BUILDING_COST' , 'YieldType' , 'YIELD_FAITH'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MENELIK_FAITH_BUILDING_COST' , 'BuildingProductionPercent' , 20  );
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
-- VALUES ('GOLDEN_TRAIT_MENELIK_FAITH_BUILDING_COST' , 'IncludeWonder' , 'false'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MENELIK_GOLD_DEBUFF' , 'YieldType' , 'YIELD_GOLD'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MENELIK_GOLD_DEBUFF' , 'Amount' , -20  );

