--Civilization
----------------------------------------------
-- TraitModifiers
-----------------------------------------------
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_GREAT_TURKISH_BOMBARD' AND ModifierId = 'TRAIT_SIEGE_PRODUCTION';

INSERT OR REPLACE INTO TraitModifiers 
(TraitType, 			ModifierID) 
VALUES	
('TRAIT_CIVILIZATION_GREAT_TURKISH_BOMBARD',	'GOLDEN_TRAIT_FREE_SIEGE_UNITS');
-----------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------
DELETE FROM UnitAbilityModifiers WHERE UnitAbilityType = 'ABILITY_GREAT_TURKISH_BOMBARD' AND ModifierId = 'GREAT_TURKISH_BOMBARD_STRENGTH';

INSERT OR REPLACE INTO UnitAbilityModifiers 
(UnitAbilityType, 					ModifierId) 
VALUES	
('ABILITY_GREAT_TURKISH_BOMBARD',	'EXPERT_MARKSMAN_ADDITIONAL_ATTACK');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_FREE_SIEGE_UNITS',         'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS',        0, 0, 'CITY_NOT_FOUNDED');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_TRAIT_FREE_SIEGE_UNITS',					'UnitPromotionClassType',	    'PROMOTION_CLASS_SIEGE');


--Leader
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT OR REPLACE INTO Types 
(Type, 										Kind) 
VALUES	
('TRAIT_LEADER_SULEIMAN_GOVERNOR_DISABLED',	'KIND_TRAIT'),
('ABILITY_SULEIMAN_ANTI_DISTRICT',			'KIND_ABILITY');

-----------------------------------------------
-- TypeTags
-----------------------------------------------
INSERT OR REPLACE INTO TypeTags 
(Type, 										Tag) 
VALUES	
('ABILITY_SULEIMAN_ANTI_DISTRICT',			'CLASS_ALL_COMBAT_UNITS');

-----------------------------------------------
-- Traits
-----------------------------------------------
INSERT OR REPLACE INTO Traits 
(TraitType, 								InternalOnly) 
VALUES	
('TRAIT_LEADER_SULEIMAN_GOVERNOR_DISABLED',	1);

-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilities 
(UnitAbilityType, 					Name,										Description,										Inactive) 
VALUES	
('ABILITY_SULEIMAN_ANTI_DISTRICT',	'LOC_ABILITY_SULEIMAN_ANTI_DISTRICT_NAME',	'LOC_ABILITY_SULEIMAN_ANTI_DISTRICT_DESCRIPTION',	1);

-----------------------------------------------
-- Governors
-----------------------------------------------
UPDATE Governors SET TraitType = 'TRAIT_LEADER_SULEIMAN_GOVERNOR_DISABLED'
WHERE GovernorType = 'GOVERNOR_IBRAHIM' AND TraitType = 'TRAIT_LEADER_SULEIMAN_GOVERNOR';

-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers 
(TraitType, 			ModifierId) 
VALUES	
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_ANTI_DISTRICT_ABILITY'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_PRODUCTION'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_GOLD'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_FAITH'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_SCIENCE'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_CULTURE'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_PRODUCTION'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_GOLD'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_FAITH'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_SCIENCE'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_CULTURE');
-----------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilityModifiers 
(UnitAbilityType, 					ModifierId) 
VALUES	
('ABILITY_SULEIMAN_ANTI_DISTRICT',	'GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers 
(ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) 
VALUES	
('GOLDEN_TRAIT_ANTI_DISTRICT_ABILITY',				'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 				0, 0, Null),
('GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT',	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 			0, 0, 'SHELLS_REQUIREMENTS'),
('GOLDEN_TRAIT_CAPTURED_CITY_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_CAPTURED_CITY_GOLD',      	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_CAPTURED_CITY_FAITH',     	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_CAPTURED_CITY_SCIENCE',   	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_CAPTURED_CITY_CULTURE',   	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_PRODUCTION', 		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_GOLD',       		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_FAITH',      		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_SCIENCE',    		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_CULTURE',    		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED');

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,									Name,		        Value) 
VALUES
('GOLDEN_TRAIT_ANTI_DISTRICT_ABILITY',			'AbilityType',	        'ABILITY_SULEIMAN_ANTI_DISTRICT'),
('GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT',			'Amount',	        10),

('GOLDEN_TRAIT_CAPTURED_CITY_PRODUCTION',			'YieldType',	    'YIELD_PRODUCTION'),
('GOLDEN_TRAIT_CAPTURED_CITY_PRODUCTION',			'Amount',	        20),
('GOLDEN_TRAIT_CAPTURED_CITY_GOLD',					'YieldType',	    'YIELD_GOLD'),
('GOLDEN_TRAIT_CAPTURED_CITY_GOLD',					'Amount',	        20),
('GOLDEN_TRAIT_CAPTURED_CITY_FAITH',				'YieldType',	    'YIELD_FAITH'),
('GOLDEN_TRAIT_CAPTURED_CITY_FAITH',				'Amount',	        20),
('GOLDEN_TRAIT_CAPTURED_CITY_SCIENCE',				'YieldType',	    'YIELD_SCIENCE'),
('GOLDEN_TRAIT_CAPTURED_CITY_SCIENCE',				'Amount',	        20),
('GOLDEN_TRAIT_CAPTURED_CITY_CULTURE',				'YieldType',	    'YIELD_CULTURE'),
('GOLDEN_TRAIT_CAPTURED_CITY_CULTURE',				'Amount',	        20),
('GOLDEN_TRAIT_OWN_CITY_PRODUCTION',			'YieldType',	    'YIELD_PRODUCTION'),
('GOLDEN_TRAIT_OWN_CITY_PRODUCTION',			'Amount',	        -5),
('GOLDEN_TRAIT_OWN_CITY_GOLD',					'YieldType',	    'YIELD_GOLD'),
('GOLDEN_TRAIT_OWN_CITY_GOLD',					'Amount',	        -5),
('GOLDEN_TRAIT_OWN_CITY_FAITH',					'YieldType',	    'YIELD_FAITH'),
('GOLDEN_TRAIT_OWN_CITY_FAITH',					'Amount',	        -5),
('GOLDEN_TRAIT_OWN_CITY_SCIENCE',				'YieldType',	    'YIELD_SCIENCE'),
('GOLDEN_TRAIT_OWN_CITY_SCIENCE',				'Amount',	        -5),
('GOLDEN_TRAIT_OWN_CITY_CULTURE',				'YieldType',	    'YIELD_CULTURE'),
('GOLDEN_TRAIT_OWN_CITY_CULTURE',				'Amount',	        -5);

UPDATE ModifierArguments SET Value = 3
WHERE ModifierId = 'SULEIMAN_GOVERNOR_POINTS' AND Name = 'Delta';

-----------------------------------------------
-- ModifierStrings
-----------------------------------------------
INSERT OR REPLACE INTO ModifierStrings 
(ModifierId,									Context,		        Text) 
VALUES
('GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT',			'Preview',	        'LOC_GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT_TEXT');
-----------------------------------------------
-- RequirementSets
-----------------------------------------------
INSERT OR REPLACE INTO RequirementSets 
(RequirementSetId, 					RequirementSetType) 
VALUES	
('GA_NOT_CAPITAL_CITY_FOUNDED',		'REQUIREMENTSET_TEST_ALL');

-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements 
(RequirementSetId ,     RequirementId) 			
VALUES	
('GA_NOT_CAPITAL_CITY_FOUNDED',		'GOLDEN_REQUIRES_CITY_DONT_HAVE_BUILDING_PALACE'),
('GA_NOT_CAPITAL_CITY_FOUNDED',		'GOLDEN_REQUIRES_CITY_IS_ORIGINAL_OWNER');

-----------------------------------------------
-- Types
-----------------------------------------------
INSERT OR REPLACE INTO Types 
(Type, 										Kind) 
VALUES	
('TRAIT_LEADER_SULEIMAN_GOVERNOR_DISABLED',	'KIND_TRAIT'),
('ABILITY_SULEIMAN_ANTI_DISTRICT',			'KIND_ABILITY');

-----------------------------------------------
-- TypeTags
-----------------------------------------------
INSERT OR REPLACE INTO TypeTags 
(Type, 										Tag) 
VALUES	
('ABILITY_SULEIMAN_ANTI_DISTRICT',			'CLASS_ALL_COMBAT_UNITS');

-----------------------------------------------
-- Traits
-----------------------------------------------
INSERT OR REPLACE INTO Traits 
(TraitType, 								InternalOnly) 
VALUES	
('TRAIT_LEADER_SULEIMAN_GOVERNOR_DISABLED',	1);

-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilities 
(UnitAbilityType, 					Name,										Description,										Inactive) 
VALUES	
('ABILITY_SULEIMAN_ANTI_DISTRICT',	'LOC_ABILITY_SULEIMAN_ANTI_DISTRICT_NAME',	'LOC_ABILITY_SULEIMAN_ANTI_DISTRICT_DESCRIPTION',	1);

-----------------------------------------------
-- Governors
-----------------------------------------------
UPDATE Governors SET TraitType = 'TRAIT_LEADER_SULEIMAN_GOVERNOR_DISABLED'
WHERE GovernorType = 'GOVERNOR_IBRAHIM' AND TraitType = 'TRAIT_LEADER_SULEIMAN_GOVERNOR';

-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers 
(TraitType, 			ModifierId) 
VALUES	
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_ANTI_DISTRICT_ABILITY'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_PRODUCTION'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_GOLD'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_FAITH'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_SCIENCE'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_CAPTURED_CITY_CULTURE'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_PRODUCTION'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_GOLD'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_FAITH'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_SCIENCE'),
('TRAIT_LEADER_SULEIMAN_GOVERNOR',	'GOLDEN_TRAIT_OWN_CITY_CULTURE');
-----------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilityModifiers 
(UnitAbilityType, 					ModifierId) 
VALUES	
('ABILITY_SULEIMAN_ANTI_DISTRICT',	'GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers 
(ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) 
VALUES	
('GOLDEN_TRAIT_ANTI_DISTRICT_ABILITY',				'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 				0, 0, Null),
('GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT',	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 			0, 0, 'SHELLS_REQUIREMENTS'),
('GOLDEN_TRAIT_CAPTURED_CITY_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_CAPTURED_CITY_GOLD',      	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_CAPTURED_CITY_FAITH',     	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_CAPTURED_CITY_SCIENCE',   	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_CAPTURED_CITY_CULTURE',   	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_PRODUCTION', 		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_GOLD',       		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_FAITH',      		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_SCIENCE',    		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED'),
('GOLDEN_TRAIT_OWN_CITY_CULTURE',    		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 0, 0, 'GA_NOT_CAPITAL_CITY_FOUNDED');

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,									Name,		        Value) 
VALUES
('GOLDEN_TRAIT_ANTI_DISTRICT_ABILITY',			'AbilityType',	        'ABILITY_SULEIMAN_ANTI_DISTRICT'),
('GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT',			'Amount',	        10),

('GOLDEN_TRAIT_CAPTURED_CITY_PRODUCTION',			'YieldType',	    'YIELD_PRODUCTION'),
('GOLDEN_TRAIT_CAPTURED_CITY_PRODUCTION',			'Amount',	        20),
('GOLDEN_TRAIT_CAPTURED_CITY_GOLD',					'YieldType',	    'YIELD_GOLD'),
('GOLDEN_TRAIT_CAPTURED_CITY_GOLD',					'Amount',	        20),
('GOLDEN_TRAIT_CAPTURED_CITY_FAITH',				'YieldType',	    'YIELD_FAITH'),
('GOLDEN_TRAIT_CAPTURED_CITY_FAITH',				'Amount',	        20),
('GOLDEN_TRAIT_CAPTURED_CITY_SCIENCE',				'YieldType',	    'YIELD_SCIENCE'),
('GOLDEN_TRAIT_CAPTURED_CITY_SCIENCE',				'Amount',	        20),
('GOLDEN_TRAIT_CAPTURED_CITY_CULTURE',				'YieldType',	    'YIELD_CULTURE'),
('GOLDEN_TRAIT_CAPTURED_CITY_CULTURE',				'Amount',	        20),
('GOLDEN_TRAIT_OWN_CITY_PRODUCTION',			'YieldType',	    'YIELD_PRODUCTION'),
('GOLDEN_TRAIT_OWN_CITY_PRODUCTION',			'Amount',	        -5),
('GOLDEN_TRAIT_OWN_CITY_GOLD',					'YieldType',	    'YIELD_GOLD'),
('GOLDEN_TRAIT_OWN_CITY_GOLD',					'Amount',	        -5),
('GOLDEN_TRAIT_OWN_CITY_FAITH',					'YieldType',	    'YIELD_FAITH'),
('GOLDEN_TRAIT_OWN_CITY_FAITH',					'Amount',	        -5),
('GOLDEN_TRAIT_OWN_CITY_SCIENCE',				'YieldType',	    'YIELD_SCIENCE'),
('GOLDEN_TRAIT_OWN_CITY_SCIENCE',				'Amount',	        -5),
('GOLDEN_TRAIT_OWN_CITY_CULTURE',				'YieldType',	    'YIELD_CULTURE'),
('GOLDEN_TRAIT_OWN_CITY_CULTURE',				'Amount',	        -5);

UPDATE ModifierArguments SET Value = 3
WHERE ModifierId = 'SULEIMAN_GOVERNOR_POINTS' AND Name = 'Delta';

-----------------------------------------------
-- ModifierStrings
-----------------------------------------------
INSERT OR REPLACE INTO ModifierStrings 
(ModifierId,									Context,		        Text) 
VALUES
('GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT',			'Preview',	        'LOC_GOLDEN_ABILITY_SULEIMAN_ANTI_DISTRICT_TEXT');
-----------------------------------------------
-- RequirementSets
-----------------------------------------------
INSERT OR REPLACE INTO RequirementSets 
(RequirementSetId, 					RequirementSetType) 
VALUES	
('GA_NOT_CAPITAL_CITY_FOUNDED',		'REQUIREMENTSET_TEST_ALL');

-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements 
(RequirementSetId ,     RequirementId) 			
VALUES	
('GA_NOT_CAPITAL_CITY_FOUNDED',		'GOLDEN_REQUIRES_CITY_DONT_HAVE_BUILDING_PALACE'),
('GA_NOT_CAPITAL_CITY_FOUNDED',		'GOLDEN_REQUIRES_CITY_IS_ORIGINAL_OWNER');