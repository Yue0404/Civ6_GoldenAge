-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY',	    'GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_TECH_ANIMAL_HUSBANDRY'),
('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY',	    'GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_TECH_HORSEBACK_RIDING'),
('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY',	    'GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_PASTURE_PRODUCTION'),
('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY',	    'GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_DISABLE_SETTLER'),
('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY',	    'GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_HORSES'),
('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY',	    'GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_CAPTURE_CITY_SETTLER');
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_LEADER_KILLER_OF_CYRUS',	    'GOLDEN_TRAIT_KILLER_OF_CYRUS_CAPTURE_PRODUCTION_BONUS');
-- INSERT OR REPLACE INTO BuildingModifiers (BuildingType, 			ModifierID) VALUES	
-- ('BUILDING_PALACE',	    'GOLDEN_TRAIT_SCYTHIA_FREE_HORSEMAN');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId,						                ModifierType,								            SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_TECH_ANIMAL_HUSBANDRY',			            'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',		    NULL),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_TECH_HORSEBACK_RIDING',			            'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',		    NULL),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_PASTURE_PRODUCTION',			                    'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		            'PLOT_HAS_PASTURE_REQUIREMENTS'),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_DISABLE_SETTLER',			                    'MODIFIER_PLAYER_UNIT_BUILD_DISABLED',		            'PLAYER_IS_HUMAN'),--AI is too stupid for this
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_HORSES',			                        'GOLDEN_MODIFIER_PLAYER_GRANT_FREE_RESOURCE_EXTRACTED',	'GOLDEN_CAPITAL_CITY_REQUIREMENTS'),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_CAPTURE_CITY_SETTLER',			                'GOLDEN_MODIFIER_PLAYER_CITIES_GRANT_UNIT',	            'CITY_NOT_FOUNDED'),
('GOLDEN_TRAIT_KILLER_OF_CYRUS_CAPTURE_PRODUCTION_BONUS',			                'MODIFIER_PLAYER_ADD_DIPLOMATIC_YIELD_MODIFIER',	    NULL);
-- INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
-- ('GOLDEN_TRAIT_SCYTHIA_FREE_HORSEMAN',                     'GOLDEN_MODIFIER_PLAYER_GRANT_UNIT',                   1,          1,          'GOLDEN_SCYTHIA_PLAYER_REQUIREMENTS');

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			        Name,		                        Value) VALUES
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_TECH_ANIMAL_HUSBANDRY',			'TechType',	                        'TECH_ANIMAL_HUSBANDRY'),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_TECH_HORSEBACK_RIDING',			'TechType',	                        'TECH_HORSEBACK_RIDING'),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_PASTURE_PRODUCTION',					'YieldType',	                    'YIELD_PRODUCTION'),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_PASTURE_PRODUCTION',					'Amount',	                        2),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_DISABLE_SETTLER',					'UnitType',	                        'UNIT_SETTLER'),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_HORSES',                        'ResourceType',                     'RESOURCE_HORSES'),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_FREE_HORSES',                        'Amount',                           4),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_CAPTURE_CITY_SETTLER',				'Amount',	                        1),
('GOLDEN_TRAIT_EXTRA_LIGHT_CAVALRY_CAPTURE_CITY_SETTLER',				'UnitType',	                        'UNIT_SETTLER'),
('GOLDEN_TRAIT_KILLER_OF_CYRUS_CAPTURE_PRODUCTION_BONUS',				'DiplomaticYieldSource',	        'CITY_CAPTURED'),
('GOLDEN_TRAIT_KILLER_OF_CYRUS_CAPTURE_PRODUCTION_BONUS',				'TurnsActive',	                    5),
('GOLDEN_TRAIT_KILLER_OF_CYRUS_CAPTURE_PRODUCTION_BONUS',				'YieldType',	                    'YIELD_PRODUCTION'),
('GOLDEN_TRAIT_KILLER_OF_CYRUS_CAPTURE_PRODUCTION_BONUS',				'Amount',	                        50),
('GOLDEN_TRAIT_KILLER_OF_CYRUS_CAPTURE_PRODUCTION_BONUS',				'StackWithOtherDiploYieldModifiers',1);
-- ('GOLDEN_TRAIT_SCYTHIA_FREE_HORSEMAN',					                'Amount',	                        4),
-- ('GOLDEN_TRAIT_SCYTHIA_FREE_HORSEMAN',					                'UnitType',	                        'UNIT_HORSEMAN');

---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets(RequirementSetId,								RequirementSetType)VALUES	
('GOLDEN_SCYTHIA_PLAYER_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements(RequirementSetId,								RequirementId)VALUES	
('GOLDEN_SCYTHIA_PLAYER_REQUIREMENTS',				'GOLDEN_SCYTHIA_REQUIRES_LEADER_TOMYRIS');
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Requirements(RequirementId,							RequirementType) VALUES	
('GOLDEN_SCYTHIA_REQUIRES_LEADER_TOMYRIS',	'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES');
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementArguments(RequirementId,							Name,			Value) VALUES	
('GOLDEN_SCYTHIA_REQUIRES_LEADER_TOMYRIS',	'LeaderType',	'LEADER_TOMYRIS');