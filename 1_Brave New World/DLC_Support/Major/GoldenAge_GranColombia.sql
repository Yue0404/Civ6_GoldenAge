--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_EJERCITO_PATRIOTA' , 'GOLDEN_TRAIT_PATRIOTA_GOLDEN_IDENTITY' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_EJERCITO_PATRIOTA' , 'GOLDEN_TRAIT_PATRIOTA_DARK_IDENTITY' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_CIVILIZATION_EJERCITO_PATRIOTA', 'GOLDEN_TRAIT_PATRIOTA_LIBERATION'|| YieldType FROM Yields;
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_EJERCITO_PATRIOTA' , 'GOLDEN_TRAIT_PATRIOTA_KILL_GOLD' );
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_PATRIOTA_GOLDEN_IDENTITY' , 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_CITIZEN' , 0 , 0 , 'PLAYER_HAS_GOLDEN_AGE' );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_PATRIOTA_DARK_IDENTITY' , 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_CITIZEN' , 0 , 0 , 'PLAYER_HAS_DARK_AGE' );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_PATRIOTA_LIBERATION' || YieldType,	'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER', NULL FROM Yields;	
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_PATRIOTA_KILL_GOLD' , 'MODIFIER_PLAYER_UNITS_ADJUST_POST_COMBAT_YIELD' , 0 , 0 , NULL );
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_PATRIOTA_GOLDEN_IDENTITY' , 'Amount' , -0.25  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_PATRIOTA_DARK_IDENTITY' , 'Amount' , 0.25  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_PATRIOTA_LIBERATION' || YieldType,	'YieldType', YieldType FROM	Yields;			
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_PATRIOTA_LIBERATION' || YieldType,	'Amount', 50 FROM Yields;	
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_PATRIOTA_LIBERATION' || YieldType,	'DiplomaticYieldSource', 'LIBERATION' FROM	Yields;			
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_PATRIOTA_LIBERATION' || YieldType,	'TurnsActive', 10 FROM	Yields;			
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_PATRIOTA_KILL_GOLD' , 'YieldType' , 'YIELD_GOLD'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_PATRIOTA_KILL_GOLD' , 'PercentDefeatedStrength' , 50  );