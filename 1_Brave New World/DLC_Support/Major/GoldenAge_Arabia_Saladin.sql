--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers 
(TraitType, 					ModifierId)
VALUES 
('TRAIT_LEADER_SALADIN_ALT' ,		'GOLDEN_TRAIT_SALADIN_ALT_DESERT_MOVEMENT'),
('TRAIT_LEADER_SALADIN_ALT' ,		'GOLDEN_TRAIT_SALADIN_ALT_FREE_UNIT_APOSTLE'),
('TRAIT_LEADER_SALADIN_ALT' ,		'GOLDEN_TRAIT_SALADIN_ALT_FREE_UNIT_ARABIAN_MAMLUK');
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers 
(ModifierId, 												ModifierType, 										RunOnce, 	Permanent, 		SubjectRequirementSetId)
VALUES 
('GOLDEN_TRAIT_SALADIN_ALT_DESERT_MOVEMENT' ,				'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 				0, 			1 ,				NULL),
('GOLDEN_TRAIT_SALADIN_ALT_FREE_UNIT_APOSTLE' ,				'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL', 			0, 			0 ,				'GOLDEN_PLAYER_HAS_CIVIC_CIVIL_SERVICE_REQUIREMENTS'),
('GOLDEN_TRAIT_SALADIN_ALT_FREE_UNIT_ARABIAN_MAMLUK' ,		'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL', 			0, 			0 ,				'GOLDEN_PLAYER_HAS_TECH_STIRRUPS_REQUIREMENTS');
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId, Name, Value)
VALUES 
('GOLDEN_TRAIT_SALADIN_ALT_DESERT_MOVEMENT',				'AbilityType',	'ABILITY_SALADIN_ALT_DESERT_MOVEMENT'),
('GOLDEN_TRAIT_SALADIN_ALT_FREE_UNIT_APOSTLE',				'UnitType',		'UNIT_APOSTLE'),
('GOLDEN_TRAIT_SALADIN_ALT_FREE_UNIT_APOSTLE',				'Amount',		3),
('GOLDEN_TRAIT_SALADIN_ALT_FREE_UNIT_ARABIAN_MAMLUK',		'UnitType',		'UNIT_ARABIAN_MAMLUK'),
('GOLDEN_TRAIT_SALADIN_ALT_FREE_UNIT_ARABIAN_MAMLUK',		'Amount',		3);
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT OR REPLACE INTO Types (Type,						Kind) VALUES
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',					'KIND_ABILITY');
-----------------------------------------------
-- TypeTags
-----------------------------------------------		
INSERT OR REPLACE INTO TypeTags (Type,									Tag) VALUES	
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',				'CLASS_LIGHT_CAVALRY'),
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',			    'CLASS_HEAVY_CAVALRY'),
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',			    'CLASS_MELEE'),
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',			    'CLASS_TRUE_RANGED'),
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',			    'CLASS_SIEGE'),
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',			    'CLASS_RECON'),
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',			    'CLASS_ANTI_CAVALRY');
INSERT OR REPLACE INTO TypeTags (Type, Tag) SELECT 'ABILITY_SALADIN_ALT_DESERT_MOVEMENT', 'CLASS_AUTOMATIC_GUN' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN');
-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilities (UnitAbilityType,						Name,									Description, Inactive) VALUES	
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',			'LOC_ABILITY_SALADIN_ALT_DESERT_MOVEMENT_NAME',	'LOC_ABILITY_SALADIN_ALT_DESERT_MOVEMENT_DESCRIPTION', 1);
-----------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilityModifiers (UnitAbilityType,						ModifierId) VALUES	
('ABILITY_SALADIN_ALT_DESERT_MOVEMENT',			            'GOLDEN_SALADIN_ALT_DESERT_MOVEMENT');
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers 
(ModifierId, ModifierType, SubjectRequirementSetId)
VALUES 
('GOLDEN_SALADIN_ALT_DESERT_MOVEMENT' ,				'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT' ,				'GOLDEN_PLOT_HAS_ANY_DESERT_REQUIREMENTS');
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId, Name, Value)
VALUES 
('GOLDEN_SALADIN_ALT_DESERT_MOVEMENT',				'Amount',	2);
