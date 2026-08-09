-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'GOLDEN_TRAIT_DYNASTIC_CYCLE_GOLDENAGE_COMBAT'),
('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'GOLDEN_TRAIT_DYNASTIC_CYCLE_DARKAGE_COMBAT'),
('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'GOLDEN_TRAIT_DYNASTIC_CYCLE_GOLDENAGE_APPEAL'),
-- ('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'GOLDEN_TRAIT_DYNASTIC_CYCLE_DARKAGE_APPEAL'),
('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'GOLDEN_TRAIT_DYNASTIC_CYCLE_FREE_TECH_BOOST'),
('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'GOLDEN_TRAIT_DYNASTIC_CYCLE_FREE_CIVIC_BOOST');
-- ('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'GOLDEN_TRAIT_DYNASTIC_CYCLE_RANGE_UNIT_EXTRA_ATTACK');

DELETE FROM TraitModifiers WHERE TraitType = 'FIRST_EMPEROR_TRAIT' AND ModifierId = 'TRAIT_CANAL_UNLOCK_MASONRY';
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_DYNASTIC_CYCLE' AND ModifierId = 'TRAIT_CIVIC_BOOST_WONDER_ERA';
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_DYNASTIC_CYCLE' AND ModifierId = 'TRAIT_TECHNOLOGY_BOOST_WONDER_ERA';
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('FIRST_EMPEROR_TRAIT',	'TRAIT_CIVIC_BOOST_WONDER_ERA'),
('FIRST_EMPEROR_TRAIT',	'TRAIT_TECHNOLOGY_BOOST_WONDER_ERA');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType,								                                    SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_DYNASTIC_CYCLE_GOLDENAGE_COMBAT',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		                            'PLAYER_HAS_GOLDEN_AGE'),
('GOLDEN_TRAIT_DYNASTIC_CYCLE_DARKAGE_COMBAT',		    'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		                            'PLAYER_HAS_DARK_AGE'),
('GOLDEN_TRAIT_DYNASTIC_CYCLE_GOLDENAGE_APPEAL',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',		                            'PLAYER_HAS_GOLDEN_AGE');
-- ('GOLDEN_TRAIT_DYNASTIC_CYCLE_DARKAGE_APPEAL',		    'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',		                            'PLAYER_HAS_DARK_AGE');
-- ('GOLDEN_TRAIT_DYNASTIC_CYCLE_RANGE_UNIT_EXTRA_ATTACK',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		                                    NULL);

INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES
('GOLDEN_TRAIT_DYNASTIC_CYCLE_FREE_TECH_BOOST',		                                    'MODIFIER_PLAYER_GRANT_RANDOM_TECHNOLOGY_BOOST_ON_NEW_ERA',					1,			1,			NULL),
('GOLDEN_TRAIT_DYNASTIC_CYCLE_FREE_CIVIC_BOOST',		                                'MODIFIER_PLAYER_GRANT_RANDOM_CIVIC_BOOST_ON_NEW_ERA',						1,			1,			NULL);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_TRAIT_DYNASTIC_CYCLE_GOLDENAGE_COMBAT',	'AbilityType',	    'ABILITY_CHINA_GOLDENAGE_COMBAT'),
('GOLDEN_TRAIT_DYNASTIC_CYCLE_DARKAGE_COMBAT',	    'AbilityType',	    'ABILITY_CHINA_DARKAGE_COMBAT'),
('GOLDEN_TRAIT_DYNASTIC_CYCLE_GOLDENAGE_APPEAL',	'Amount',	    1),
-- ('GOLDEN_TRAIT_DYNASTIC_CYCLE_DARKAGE_APPEAL',	    'Amount',	    -1),
('GOLDEN_TRAIT_DYNASTIC_CYCLE_FREE_TECH_BOOST',	    'Amount',	    1),
('GOLDEN_TRAIT_DYNASTIC_CYCLE_FREE_CIVIC_BOOST',	'Amount',	    1);
-- ('GOLDEN_TRAIT_DYNASTIC_CYCLE_RANGE_UNIT_EXTRA_ATTACK',		        'AbilityType',	    'ABILITY_RANGE_EXTRA_ATTACK');

UPDATE ModifierArguments SET  Value = 20
WHERE ModifierId = 'TRAIT_BUILDER_WONDER_PERCENT' AND Name = 'Amount';

-----------------------------------------------
-- UnitCommands
-----------------------------------------------
UPDATE UnitCommands SET  MaxEra = 4
WHERE CommandType = 'UNITCOMMAND_WONDER_PRODUCTION';

-------------------------------------------
-- Types
-------------------------------------------
INSERT OR REPLACE INTO Types (Type,						Kind) VALUES
('ABILITY_CHINA_GOLDENAGE_COMBAT',					'KIND_ABILITY'),
('ABILITY_CHINA_DARKAGE_COMBAT',					'KIND_ABILITY');
-- ('ABILITY_RANGE_EXTRA_ATTACK',					'KIND_ABILITY');
-------------------------------------------
-- TypeTags
-------------------------------------------		
INSERT OR REPLACE INTO TypeTags (Type,									Tag) VALUES	
('ABILITY_CHINA_GOLDENAGE_COMBAT',				'CLASS_LIGHT_CAVALRY'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_HEAVY_CAVALRY'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_MELEE'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_TRUE_RANGED'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_SIEGE'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_RECON'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_ANTI_CAVALRY'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_NAVAL_MELEE'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_NAVAL_RANGED'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_NAVAL_RAIDER'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_NAVAL_CARRIER'),
('ABILITY_CHINA_GOLDENAGE_COMBAT',			    'CLASS_AIRCRAFT');
INSERT OR REPLACE INTO TypeTags (Type, Tag) SELECT 'ABILITY_CHINA_GOLDENAGE_COMBAT', 'CLASS_AUTOMATIC_GUN' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN');

INSERT OR REPLACE INTO TypeTags (Type,									Tag) VALUES	
('ABILITY_CHINA_DARKAGE_COMBAT',				'CLASS_LIGHT_CAVALRY'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_HEAVY_CAVALRY'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_MELEE'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_TRUE_RANGED'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_SIEGE'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_RECON'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_ANTI_CAVALRY'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_NAVAL_MELEE'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_NAVAL_RANGED'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_NAVAL_RAIDER'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_NAVAL_CARRIER'),
('ABILITY_CHINA_DARKAGE_COMBAT',			    'CLASS_AIRCRAFT');
INSERT OR REPLACE INTO TypeTags (Type, Tag) SELECT 'ABILITY_CHINA_DARKAGE_COMBAT', 'CLASS_AUTOMATIC_GUN' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_COMPOSITE_BOWMAN');

-- ('ABILITY_RANGE_EXTRA_ATTACK',			    'CLASS_TRUE_RANGED');

-------------------------------------------
-- UnitAbilities
-----------------------------------------
INSERT OR REPLACE INTO UnitAbilities (UnitAbilityType,						Name,									Description, Inactive) VALUES	
('ABILITY_CHINA_GOLDENAGE_COMBAT',			'LOC_ABILITY_CHINA_GOLDENAGE_COMBAT_NAME',	'LOC_ABILITY_CHINA_GOLDENAGE_COMBAT_DESCRIPTION', 1),
('ABILITY_CHINA_DARKAGE_COMBAT',			'LOC_ABILITY_CHINA_DARKAGE_COMBAT_NAME',	'LOC_ABILITY_CHINA_DARKAGE_COMBAT_DESCRIPTION', 1);
-- ('ABILITY_RANGE_EXTRA_ATTACK',			'LOC_ABILITY_RANGE_EXTRA_ATTACK_NAME',	'LOC_ABILITY_RANGE_EXTRA_ATTACK_DESCRIPTION', 1);
-----------------------------------------
-- UnitAbilityModifiers
-------------------------------------------
INSERT OR REPLACE INTO UnitAbilityModifiers (UnitAbilityType,						ModifierId) VALUES	
('ABILITY_CHINA_GOLDENAGE_COMBAT',			            'GOLDEN_CHINA_GOLDENAGE_COMBAT'),
('ABILITY_CHINA_DARKAGE_COMBAT',			            'GOLDEN_CHINA_DARKAGE_COMBAT');
-- ('ABILITY_RANGE_EXTRA_ATTACK',			            'EXPERT_MARKSMAN_ADDITIONAL_ATTACK');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType) VALUES	
('GOLDEN_CHINA_GOLDENAGE_COMBAT',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH'),
('GOLDEN_CHINA_DARKAGE_COMBAT',		    'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_CHINA_GOLDENAGE_COMBAT',	'Amount',	    6),
('GOLDEN_CHINA_DARKAGE_COMBAT',	    'Amount',	    -3);
-----------------------------------------------
-- ModifierStrings
-----------------------------------------------
INSERT OR REPLACE INTO ModifierStrings (ModifierId,			Context,		        Text) VALUES
('GOLDEN_CHINA_GOLDENAGE_COMBAT',	'Preview',	    'LOC_ABILITY_CHINA_GOLDENAGE_COMBAT_DESCRIPTION'),
('GOLDEN_CHINA_DARKAGE_COMBAT',	    'Preview',	    'LOC_ABILITY_CHINA_DARKAGE_COMBAT_DESCRIPTION');





-- INSERT OR REPLACE INTO TraitModifiers (TraitType,				ModifierId)
-- SELECT	'FIRST_EMPEROR_TRAIT',		'GOLDEN_TRAIT_WONDER_RANDOM_TECHNOLOGY_BOOST' ||BuildingType FROM Buildings WHERE IsWonder=1;
-- INSERT OR REPLACE INTO TraitModifiers (TraitType,				ModifierId)
-- SELECT	'FIRST_EMPEROR_TRAIT',		'GOLDEN_TRAIT_WONDER_RANDOM_CIVIC_BOOST' ||BuildingType FROM Buildings WHERE IsWonder=1;

-- INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
-- SELECT	'GOLDEN_TRAIT_WONDER_RANDOM_TECHNOLOGY_BOOST' ||BuildingType,	    'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',			'GOLDEN_CHINA_CITY_FINISHES' ||BuildingType FROM Buildings WHERE IsWonder=1;
-- INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,									RunOnce,	Permanent,												SubjectRequirementSetId)
-- SELECT	'GOLDEN_TRAIT_WONDER_RANDOM_TECHNOLOGY_BOOST_MODIFIER',	    'MODIFIER_PLAYER_GRANT_RANDOM_TECHNOLOGY_BOOST_GOODY_HUT',		1,			1,			NULL;
-- INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
-- SELECT	'GOLDEN_TRAIT_WONDER_RANDOM_CIVIC_BOOST' ||BuildingType,	        'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				'GOLDEN_CHINA_CITY_FINISHES' ||BuildingType FROM Buildings WHERE IsWonder=1;
-- INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,									RunOnce,	Permanent,												SubjectRequirementSetId)
-- SELECT	'GOLDEN_TRAIT_WONDER_RANDOM_CIVIC_BOOST_MODIFIER',	        'MODIFIER_PLAYER_GRANT_RANDOM_CIVIC_BOOST_GOODY_HUT',		    1,			1,			NULL;

-- INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
-- SELECT	'GOLDEN_TRAIT_WONDER_RANDOM_TECHNOLOGY_BOOST' ||BuildingType,	'ModifierId',	'GOLDEN_TRAIT_WONDER_RANDOM_TECHNOLOGY_BOOST_MODIFIER' FROM Buildings WHERE IsWonder=1;
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
-- SELECT	'GOLDEN_TRAIT_WONDER_RANDOM_TECHNOLOGY_BOOST_MODIFIER',	'Amount',	    1 ;
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
-- SELECT	'GOLDEN_TRAIT_WONDER_RANDOM_CIVIC_BOOST' ||BuildingType,	'ModifierId',	'GOLDEN_TRAIT_WONDER_RANDOM_CIVIC_BOOST_MODIFIER'  FROM Buildings WHERE IsWonder=1;
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
-- SELECT	'GOLDEN_TRAIT_WONDER_RANDOM_CIVIC_BOOST_MODIFIER',	    'Amount',	    1 ;

---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
-- INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							RequirementSetType)
-- SELECT	'GOLDEN_CHINA_CITY_FINISHES' ||BuildingType,	                'REQUIREMENTSET_TEST_ALL' FROM Buildings WHERE IsWonder=1;
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
-- INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,		 RequirementId)
-- SELECT	'GOLDEN_CHINA_CITY_FINISHES' ||BuildingType,	         'GOLDEN_CHINA_REQUIRES_CITY_FINISHES_' || BuildingType FROM Buildings WHERE IsWonder=1;
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
-- INSERT OR REPLACE INTO Requirements (RequirementId,					RequirementType)
-- SELECT	'GOLDEN_CHINA_REQUIRES_CITY_FINISHES_' || BuildingType,	'REQUIREMENT_CITY_HAS_BUILDING' FROM Buildings WHERE IsWonder=1;
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
-- INSERT OR REPLACE INTO RequirementArguments (RequirementId,			Name,			Value)
-- SELECT	'GOLDEN_CHINA_REQUIRES_CITY_FINISHES_' || BuildingType,	'BuildingType',	BuildingType FROM Buildings WHERE IsWonder=1;
