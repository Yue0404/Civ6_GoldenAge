-- GoldenAge_Capital_Loyal
-- Author: Flactine
-- DateCreated: 9/8/2022 11:17:32 AM
--------------------------------------------------------------
-- GoldenAge_Capital_Loyal
-- Author: Flactine
-- DateCreated: 9/8/2022 11:17:32 AM
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers
(TraitType,						ModifierId) 
VALUES 
('TRAIT_LEADER_MAJOR_CIV', 		'GOLDEN_CAPITAL_CITY_ALWAYS_LOYAL'),
('MINOR_CIV_DEFAULT_TRAIT', 	'GOLDEN_CAPITAL_CITY_ALWAYS_LOYAL');

INSERT OR REPLACE INTO Modifiers 
(ModifierId,							ModifierType,									SubjectRequirementSetId) 
VALUES 
('GOLDEN_CAPITAL_CITY_ALWAYS_LOYAL',	'MODIFIER_PLAYER_CITIES_ADJUST_ALWAYS_LOYAL',	'BUILDING_IS_PALACE');

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,							Name,			Value) 
VALUES 
('GOLDEN_CAPITAL_CITY_ALWAYS_LOYAL',	'AlwaysLoyal',	1);

