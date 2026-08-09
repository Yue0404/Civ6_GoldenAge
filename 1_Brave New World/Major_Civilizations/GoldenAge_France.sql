-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_CIVILIZATION_WONDER_TOURISM',	        'GOLDEN_TRAIT_WONDER_CULTURE'),
('TRAIT_CIVILIZATION_WONDER_TOURISM',	        'GOLDEN_TRAIT_WONDER_GOLD'),

('FLYING_SQUADRON_TRAIT',	                    'GOLDEN_FLYING_SQUADRON_TRAIT_OFFENSIVESPYTIME'),

('TRAIT_LEADER_ELEANOR_LOYALTY',	            'GOLDEN_TRAIT_ELEANOR_GREATWRITER'),
('TRAIT_LEADER_ELEANOR_LOYALTY',	            'GOLDEN_TRAIT_ELEANOR_GREATARTIST'),
('TRAIT_LEADER_ELEANOR_LOYALTY',	            'GOLDEN_TRAIT_ELEANOR_GREATMUSICIAN');
INSERT OR REPLACE INTO TraitModifiers (TraitType,				ModifierId)
SELECT	'TRAIT_CIVILIZATION_WONDER_TOURISM',		'GOLDEN_TRAIT_WONDER_FREE_MELEE_UNIT' ||BuildingType FROM Buildings WHERE IsWonder=1;
-- INSERT OR REPLACE INTO TraitModifiers (TraitType,				ModifierId)
-- SELECT	'TRAIT_CIVILIZATION_WONDER_TOURISM',		'GOLDEN_TRAIT_WONDER_FREE_ANTI_CAVALRY_UNIT' ||BuildingType FROM Buildings WHERE IsWonder=1;
INSERT OR REPLACE INTO TraitModifiers (TraitType,				ModifierId)
SELECT	'TRAIT_CIVILIZATION_WONDER_TOURISM',		'GOLDEN_TRAIT_WONDER_AMENITY' ||BuildingType FROM Buildings WHERE IsWonder=1;
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_WONDER_CULTURE',             'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',                    0, 0, NULL),
('GOLDEN_TRAIT_WONDER_CULTURE_MODIFIER',    'MODIFIER_SINGLE_CITY_ADJUST_WONDER_YIELD_CHANGE',           0, 0, NULL),
('GOLDEN_TRAIT_WONDER_GOLD',                'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',                    0, 0, NULL),
('GOLDEN_TRAIT_WONDER_GOLD_MODIFIER',       'MODIFIER_SINGLE_CITY_ADJUST_WONDER_YIELD_CHANGE',           0, 0, NULL),

('GOLDEN_FLYING_SQUADRON_TRAIT_OFFENSIVESPYTIME',        'MODIFIER_PLAYER_UNITS_ADJUST_SPY_OFFENSIVE_OPERATION_TIME',          0, 0, 'UNIT_IS_SPY'),

('GOLDEN_TRAIT_ELEANOR_GREATWRITER',        'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',          0, 0, 'GOLDEN_THEATER_HAS_FOUR_ADJACENCY_REQUIREMENTS'),
('GOLDEN_TRAIT_ELEANOR_GREATARTIST',        'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',          0, 0, 'GOLDEN_THEATER_HAS_FOUR_ADJACENCY_REQUIREMENTS'),
('GOLDEN_TRAIT_ELEANOR_GREATMUSICIAN',      'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',          0, 0, 'GOLDEN_THEATER_HAS_FOUR_ADJACENCY_REQUIREMENTS');
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_WONDER_FREE_MELEE_UNIT' ||BuildingType,	        'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS',				'GOLDEN_FRANCE_CITY_FINISHES' ||BuildingType FROM Buildings WHERE IsWonder=1;
-- INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
-- SELECT	'GOLDEN_TRAIT_WONDER_FREE_ANTI_CAVALRY_UNIT' ||BuildingType,	'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS',				'GOLDEN_FRANCE_CITY_FINISHES' ||BuildingType FROM Buildings WHERE IsWonder=1;
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_WONDER_AMENITY' ||BuildingType,	                'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',				'GOLDEN_FRANCE_CITY_FINISHES' ||BuildingType FROM Buildings WHERE IsWonder=1;
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		            Value) VALUES
('GOLDEN_TRAIT_WONDER_CULTURE',				        'ModifierId',	        'GOLDEN_TRAIT_WONDER_CULTURE_MODIFIER'),
('GOLDEN_TRAIT_WONDER_CULTURE_MODIFIER',		    'Amount',	            5),
('GOLDEN_TRAIT_WONDER_CULTURE_MODIFIER',			'YieldType',	        'YIELD_CULTURE'),
('GOLDEN_TRAIT_WONDER_GOLD',		                'ModifierId',	        'GOLDEN_TRAIT_WONDER_GOLD_MODIFIER'),
('GOLDEN_TRAIT_WONDER_GOLD_MODIFIER',				'Amount',	            5),
('GOLDEN_TRAIT_WONDER_GOLD_MODIFIER',				'YieldType',	        'YIELD_GOLD'),

('GOLDEN_FLYING_SQUADRON_TRAIT_OFFENSIVESPYTIME',	'ReductionPercent',		25),

('GOLDEN_TRAIT_ELEANOR_GREATWRITER',	            'GreatPersonClassType',	'GREAT_PERSON_CLASS_WRITER'),
('GOLDEN_TRAIT_ELEANOR_GREATWRITER',	            'Amount',				2),
('GOLDEN_TRAIT_ELEANOR_GREATARTIST',	            'GreatPersonClassType',	'GREAT_PERSON_CLASS_ARTIST'),
('GOLDEN_TRAIT_ELEANOR_GREATARTIST',	            'Amount',				2),
('GOLDEN_TRAIT_ELEANOR_GREATMUSICIAN',	            'GreatPersonClassType',	'GREAT_PERSON_CLASS_MUSICIAN'),
('GOLDEN_TRAIT_ELEANOR_GREATMUSICIAN',	            'Amount',				2);
INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
SELECT	'GOLDEN_TRAIT_WONDER_FREE_MELEE_UNIT' ||BuildingType,	'UnitPromotionClassType',	'PROMOTION_CLASS_MELEE' FROM Buildings WHERE IsWonder=1;
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
-- SELECT	'GOLDEN_TRAIT_WONDER_FREE_ANTI_CAVALRY_UNIT' ||BuildingType,	'UnitPromotionClassType',	'PROMOTION_CLASS_ANTI_CAVALRY' FROM Buildings WHERE IsWonder=1;
INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
SELECT	'GOLDEN_TRAIT_WONDER_AMENITY' ||BuildingType,	        'Amount',	2 FROM Buildings WHERE IsWonder=1;
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'TRAIT_WONDER_MEDIAVALINDUSTRIAL_PRODUCTION' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 'ERA_INFORMATION'
WHERE ModifierId = 'TRAIT_WONDER_MEDIAVALINDUSTRIAL_PRODUCTION' AND Name = 'EndEra';
UPDATE ModifierArguments SET  Value = 2
WHERE ModifierId = 'UNIQUE_LEADER_ADD_VISIBILITY' AND Name = 'Amount';--FLYING_SQUADRON_TRAIT
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							RequirementSetType)
SELECT	'GOLDEN_FRANCE_CITY_FINISHES' ||BuildingType,	                'REQUIREMENTSET_TEST_ALL' FROM Buildings WHERE IsWonder=1;
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,		 RequirementId)
SELECT	'GOLDEN_FRANCE_CITY_FINISHES' ||BuildingType,	         'GOLDEN_FRANCE_REQUIRES_CITY_FINISHES_' || BuildingType FROM Buildings WHERE IsWonder=1;
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Requirements (RequirementId,					RequirementType)
SELECT	'GOLDEN_FRANCE_REQUIRES_CITY_FINISHES_' || BuildingType,	'REQUIREMENT_CITY_HAS_BUILDING' FROM Buildings WHERE IsWonder=1;
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementArguments (RequirementId,			Name,			Value)
SELECT	'GOLDEN_FRANCE_REQUIRES_CITY_FINISHES_' || BuildingType,	'BuildingType',	BuildingType FROM Buildings WHERE IsWonder=1;