-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) VALUES	
('TRAIT_LEADER_RAMSES',	'GA_RAMSES_FAITH_POSITIVE_BUILDINGS'),
('TRAIT_LEADER_RAMSES',	'GA_RAMSES_FAITH_NEGATIVE_BUILDINGS'),
('TRAIT_LEADER_RAMSES',	'GA_RAMSES_IGORE_RIVER');
-- ('TRAIT_LEADER_RAMSES',	'GA_RAMSES_WONDER_BUILDER');

INSERT OR REPLACE INTO TraitModifiers
(TraitType, ModifierId) SELECT 
'TRAIT_LEADER_RAMSES', 'GA_RAMSES_WONDER_BUILDER_' || BuildingType 
FROM Buildings WHERE IsWonder=1;

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES 
('GA_RAMSES_FAITH_POSITIVE_BUILDINGS' , 	'MODIFIER_PLAYER_CITIES_GRANT_YIELD_PER_BUILDING_COST' , 	0 , 0 , NULL),
('GA_RAMSES_FAITH_NEGATIVE_BUILDINGS' , 	'MODIFIER_PLAYER_CITIES_GRANT_YIELD_PER_BUILDING_COST' ,	0 , 0 , NULL ),
('GA_RAMSES_IGORE_RIVER' , 					'MODIFIER_PLAYER_UNITS_GRANT_ABILITY' ,	0 , 0 , NULL );

-- INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementsetId) VALUES 
-- ('GA_RAMSES_WONDER_BUILDER' , 	'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL' , 	0 , 1 , 'GOLDEN_RAMSES_HAS_WONDER_REQUIREMENT');

INSERT OR REPLACE INTO Modifiers
(ModifierId, ModifierType, RunOnce, Permanent, OwnerRequirementsetId) SELECT 
'GA_RAMSES_WONDER_BUILDER_' || BuildingType, 'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',	1 , 1 , 'GOLDEN_RAMSES_HAS_WONDER_REQUIREMENT_' || BuildingType   
FROM Buildings WHERE IsWonder=1;

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('GA_RAMSES_FAITH_POSITIVE_BUILDINGS', 			'YieldType', 					'YIELD_FAITH'),
('GA_RAMSES_FAITH_POSITIVE_BUILDINGS', 			'BuildingProductionPercent', 	30), 
('GA_RAMSES_FAITH_POSITIVE_BUILDINGS', 			'IncludeWonder', 				1), 
('GA_RAMSES_FAITH_NEGATIVE_BUILDINGS', 			'YieldType', 					'YIELD_FAITH'),
('GA_RAMSES_FAITH_NEGATIVE_BUILDINGS', 			'BuildingProductionPercent', 	-15), 
('GA_RAMSES_FAITH_NEGATIVE_BUILDINGS', 			'IncludeWonder', 				0),
('GA_RAMSES_IGORE_RIVER', 						'AbilityType', 					'ABILITY_RAMSES_IGORE_RIVER');
-- ('GA_RAMSES_WONDER_BUILDER', 					'UnitType', 					'UNIT_BUILDER'),
-- ('GA_RAMSES_WONDER_BUILDER', 					'Amount', 						2), 
-- ('GA_RAMSES_WONDER_BUILDER', 					'AllowUniqueOverride', 			0);

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, Name, Value) SELECT 
'GA_RAMSES_WONDER_BUILDER_' || BuildingType, 'UnitType', 'UNIT_BUILDER' 
FROM Buildings WHERE IsWonder=1;
INSERT OR REPLACE INTO ModifierArguments
(ModifierId, Name, Value) SELECT 
'GA_RAMSES_WONDER_BUILDER_' || BuildingType, 'Amount', 2 
FROM Buildings WHERE IsWonder=1;
INSERT OR REPLACE INTO ModifierArguments
(ModifierId, Name, Value) SELECT 
'GA_RAMSES_WONDER_BUILDER_' || BuildingType, 'AllowUniqueOverride', 0 
FROM Buildings WHERE IsWonder=1;

---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets 				(RequirementSetId ,     RequirementSetType)  		
SELECT	 'GOLDEN_RAMSES_HAS_WONDER_REQUIREMENT_' || BuildingType, 		    'REQUIREMENTSET_TEST_ALL'
FROM Buildings WHERE IsWonder = 1;
---------------------------------------------------------------------------------------------------------------					
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,		RequirementId)
SELECT	 'GOLDEN_RAMSES_HAS_WONDER_REQUIREMENT_' || BuildingType,		'GOLDEN_REQUIRES_RAMSES_HAS_WONDER_' || BuildingType 
FROM Buildings WHERE IsWonder = 1;
---------------------------------------------------------------------------------------------------------------					
-- Requirements
---------------------------------------------------------------------------------------------------------------					
INSERT OR REPLACE INTO Requirements (RequirementId,			RequirementType)
SELECT	 'GOLDEN_REQUIRES_RAMSES_HAS_WONDER_' || BuildingType,	   		'REQUIREMENT_PLAYER_HAS_BUILDING' 
FROM Buildings WHERE IsWonder = 1;
---------------------------------------------------------------------------------------------------------------					
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------					
INSERT OR REPLACE INTO RequirementArguments (RequirementId,				Name,				Value)
SELECT	 'GOLDEN_REQUIRES_RAMSES_HAS_WONDER_' || BuildingType,			'BuildingType',	    BuildingType 
FROM Buildings WHERE IsWonder = 1;	

-----------------------------------------------
-- Types
-----------------------------------------------
INSERT OR REPLACE INTO Types (Type,						Kind) VALUES
('ABILITY_RAMSES_IGORE_RIVER',					'KIND_ABILITY');
-----------------------------------------------
-- TypeTags
-----------------------------------------------		
INSERT OR REPLACE INTO TypeTags (Type,									Tag) VALUES	
('ABILITY_RAMSES_IGORE_RIVER',				'CLASS_LIGHT_CAVALRY'),
('ABILITY_RAMSES_IGORE_RIVER',			    'CLASS_HEAVY_CAVALRY'),
('ABILITY_RAMSES_IGORE_RIVER',			    'CLASS_MELEE'),
('ABILITY_RAMSES_IGORE_RIVER',			    'CLASS_TRUE_RANGED'),
('ABILITY_RAMSES_IGORE_RIVER',			    'CLASS_SIEGE'),
('ABILITY_RAMSES_IGORE_RIVER',			    'CLASS_RECON'),
('ABILITY_RAMSES_IGORE_RIVER',			    'CLASS_ANTI_CAVALRY');
INSERT OR REPLACE INTO TypeTags (Type, Tag) SELECT 'ABILITY_RAMSES_IGORE_RIVER', 'CLASS_AUTOMATIC_GUN' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN');
-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilities (UnitAbilityType,						Name,									Description, Inactive) VALUES	
('ABILITY_RAMSES_IGORE_RIVER',			'LOC_ABILITY_RAMSES_IGORE_RIVER_NAME',	'LOC_ABILITY_RAMSES_IGORE_RIVER_DESCRIPTION', 1);
-----------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilityModifiers (UnitAbilityType,						ModifierId) VALUES	
('ABILITY_RAMSES_IGORE_RIVER',			            'AMPHIBIOUS_BONUS_IGNORE_RIVERS');