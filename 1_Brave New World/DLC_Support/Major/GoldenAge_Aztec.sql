--CIVILIZATION_AZTEC
--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_GIFTS_FOR_TLATOANI' AND ModifierId = 'TRAIT_OWNED_LUXURY_EXTRA_AMENITIES';

INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES
('TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS', 'GOLDEN_TRAIT_KILL_SCIENCE'),
('TRAIT_LEADER_GIFTS_FOR_TLATOANI', 'GOLDEN_TRAIT_GIFTS_FOR_TLATOANI_CAPTURE_WORKER'),
('TRAIT_LEADER_GIFTS_FOR_TLATOANI', 'GOLDEN_TRAIT_GIFTS_FOR_TLATOANI_BONUS_RESOURCE_EXTRA_AMENITIES'),
('TRAIT_LEADER_GIFTS_FOR_TLATOANI', 'GOLDEN_TRAIT_GIFTS_FOR_TLATOANI_DISABLE_BUILDER'),
('TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS', 'GOLDEN_TRAIT_LEGEND_FIVE_SUNS_PROJECT_SACRIFICE');

INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS', 'GOLDEN_TRAIT_LEGEND_FIVE_SUNS_LAKE_CITY_' ||YieldType FROM Yields;
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)VALUES
('GOLDEN_TRAIT_KILL_SCIENCE', 'MODIFIER_PLAYER_UNITS_ADJUST_POST_COMBAT_YIELD', NULL),
('GOLDEN_TRAIT_GIFTS_FOR_TLATOANI_CAPTURE_WORKER', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', NULL),
('GOLDEN_TRAIT_GIFTS_FOR_TLATOANI_BONUS_RESOURCE_EXTRA_AMENITIES', 'MODIFIER_PLAYER_OWNED_BONUS_RESOURCE_EXTRA_AMENITIES', NULL),
('GOLDEN_TRAIT_GIFTS_FOR_TLATOANI_DISABLE_BUILDER', 'MODIFIER_PLAYER_UNIT_BUILD_DISABLED', 'PLAYER_IS_HUMAN'),--AI is too stupid for this
('GOLDEN_TRAIT_LEGEND_FIVE_SUNS_PROJECT_SACRIFICE', 'MODIFIER_PLAYER_ALLOW_PROJECT_CATHERINE', NULL);

INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_LEGEND_FIVE_SUNS_LAKE_CITY_' ||YieldType,	                    'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'GOLDEN_AZTEC_PLOT_ADJACENT_TO_LAKE_CITYCENTER_REQUIREMENTS' FROM Yields;
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)VALUES
('GOLDEN_TRAIT_KILL_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('GOLDEN_TRAIT_KILL_SCIENCE', 'PercentDefeatedStrength', 50),
('GOLDEN_TRAIT_GIFTS_FOR_TLATOANI_CAPTURE_WORKER', 'AbilityType', 'ABILITY_CAPTIVE_WORKERS'),
('GOLDEN_TRAIT_GIFTS_FOR_TLATOANI_BONUS_RESOURCE_EXTRA_AMENITIES', 'Amount', 1),
('GOLDEN_TRAIT_GIFTS_FOR_TLATOANI_DISABLE_BUILDER', 'UnitType', 'UNIT_BUILDER'),
('GOLDEN_TRAIT_LEGEND_FIVE_SUNS_PROJECT_SACRIFICE', 'ProjectType', 'PROJECT_SACRIFICE');

INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
SELECT	'GOLDEN_TRAIT_LEGEND_FIVE_SUNS_LAKE_CITY_' ||YieldType,	        'Amount',	    1 FROM Yields;
INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
SELECT	'GOLDEN_TRAIT_LEGEND_FIVE_SUNS_LAKE_CITY_' ||YieldType,	        'YieldType',	YieldType FROM Yields;
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets 
(RequirementSetId,							RequirementSetType) VALUES	
('GOLDEN_AZTEC_PLOT_ADJACENT_TO_LAKE_CITYCENTER_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL'),
('GOLDEN_AZTEC_TILE_ADJACENT_TO_LAKE',			                'REQUIREMENTSET_TEST_ANY');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementSetRequirements
(RequirementSetId,							RequirementId) VALUES	
('GOLDEN_AZTEC_PLOT_ADJACENT_TO_LAKE_CITYCENTER_REQUIREMENTS',	'GOLDEN_AZTEC_REQUIRES_NOT_LAKE'),
('GOLDEN_AZTEC_PLOT_ADJACENT_TO_LAKE_CITYCENTER_REQUIREMENTS',	'GOLDEN_REQUIRES_PLOT_IS_ADJACENT_TO_DISTRICT_CITY_CENTER'),
('GOLDEN_AZTEC_PLOT_ADJACENT_TO_LAKE_CITYCENTER_REQUIREMENTS',	'GOLDEN_AZTEC_REQUIRES_ADJACENT_TO_LAKE_REQUIREMENTS'),
('GOLDEN_AZTEC_TILE_ADJACENT_TO_LAKE',			                'REQUIRES_PLOT_ADJACENT_TO_LAKE');
INSERT INTO RequirementSetRequirements
(RequirementSetId,						RequirementId) SELECT	
'GOLDEN_AZTEC_TILE_ADJACENT_TO_LAKE',		'GOLDEN_AZTEC_REQUIRES_PLOT_ADJACENT_' ||FeatureType FROM Features WHERE Lake = 1;
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT INTO Requirements
(RequirementId,											RequirementType,						Inverse) VALUES	
('GOLDEN_AZTEC_REQUIRES_NOT_LAKE',						'REQUIREMENT_PLOT_IS_LAKE',				1), 
('GOLDEN_AZTEC_REQUIRES_ADJACENT_TO_LAKE_REQUIREMENTS',	'REQUIREMENT_REQUIREMENTSET_IS_MET',	0);
INSERT INTO Requirements
(RequirementId,											RequirementType) SELECT	
'GOLDEN_AZTEC_REQUIRES_PLOT_ADJACENT_' ||FeatureType,		'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES' FROM Features WHERE Lake = 1;
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT INTO RequirementArguments
(RequirementId,											Name,				Value) VALUES	
('GOLDEN_AZTEC_REQUIRES_ADJACENT_TO_LAKE_REQUIREMENTS',	'RequirementSetId',	'GOLDEN_AZTEC_TILE_ADJACENT_TO_LAKE');
INSERT INTO RequirementArguments
(RequirementId,										Name,			Value) SELECT	
'GOLDEN_AZTEC_REQUIRES_PLOT_ADJACENT_' ||FeatureType,	'FeatureType',	FeatureType FROM Features WHERE Lake = 1;
---------------------------------------------------------------------------------------------------------------
-- PROJECT
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Types 
(Type,					                Kind) VALUES	
('PROJECT_SACRIFICE',	            'KIND_PROJECT');

INSERT OR REPLACE INTO Projects 
(ProjectType,					    Name,                                   ShortName,                               Description,                                   Cost,     CostProgressionModel,                      CostProgressionParam1,         PrereqDistrict,                   AdvisorType,       UnlocksFromEffect) VALUES
('PROJECT_SACRIFICE',	            'LOC_PROJECT_SACRIFICE_NAME',           'LOC_PROJECT_SACRIFICE_NAME',            'LOC_PROJECT_SACRIFICE_DESCRIPTION',           50,       'COST_PROGRESSION_GAME_PROGRESS',          1000,                          'DISTRICT_ENTERTAINMENT_COMPLEX', 'ADVISOR_GENERIC', 1);

INSERT OR REPLACE INTO Projects_XP2 (ProjectType, RequiredBuilding)VALUES
('PROJECT_SACRIFICE', 'BUILDING_TLACHTLI');

INSERT OR REPLACE INTO Project_YieldConversions 
(ProjectType,					        YieldType, PercentOfProductionRate) VALUES	
('PROJECT_SACRIFICE',	            'YIELD_FAITH',   10),
('PROJECT_SACRIFICE',	            'YIELD_SCIENCE', 10),
('PROJECT_SACRIFICE',	            'YIELD_CULTURE', 10);

INSERT OR REPLACE INTO ProjectCompletionModifiers 
(ProjectType,					        ModifierId) VALUES	
('PROJECT_SACRIFICE',	                'GOLDEN_PROJECT_SACRIFICE'),
('PROJECT_SACRIFICE',	                'GOLDEN_PROJECT_SACRIFICE_FREE_BUILDER');

INSERT OR REPLACE INTO Modifiers 
(ModifierId,								ModifierType,										SubjectRequirementSetId) VALUES
('GOLDEN_PROJECT_SACRIFICE',	           'GOLDEN_MODIFIER_SINGLE_CITY_ADJUST_POPULATION',	    NULL),
('GOLDEN_PROJECT_SACRIFICE_FREE_BUILDER',  'GOLDEN_MODIFIER_PLAYER_GRANT_UNIT',	    NULL);

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,						        Name,		    Value) VALUES
('GOLDEN_PROJECT_SACRIFICE',	            'Amount',	    -1),
('GOLDEN_PROJECT_SACRIFICE_FREE_BUILDER',	'Amount',	    2),
('GOLDEN_PROJECT_SACRIFICE_FREE_BUILDER',	'UnitType',	    'UNIT_BUILDER');
---------------------------------------------------------------------------------------------------------------
-- ABILITY
---------------------------------------------------------------------------------------------------------------
UPDATE UnitAbilities SET  Inactive = 1
WHERE UnitAbilityType = 'ABILITY_CAPTIVE_WORKERS';
INSERT OR REPLACE INTO TypeTags (Type,									Tag) VALUES	
('ABILITY_CAPTIVE_WORKERS',				'CLASS_LIGHT_CAVALRY'),
('ABILITY_CAPTIVE_WORKERS',			    'CLASS_HEAVY_CAVALRY'),
('ABILITY_CAPTIVE_WORKERS',			    'CLASS_MELEE'),
('ABILITY_CAPTIVE_WORKERS',			    'CLASS_ANTI_CAVALRY');