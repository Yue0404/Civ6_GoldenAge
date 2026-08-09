--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,	ModifierId)
SELECT
TraitType,	'GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_NO_GOLD'
FROM Traits WHERE TraitType = 'TRAIT_LEADER_LUDWIG';

INSERT OR REPLACE INTO TraitModifiers 
(TraitType,	ModifierId)
SELECT
TraitType,	'GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_NO_FAITH'
FROM Traits WHERE TraitType = 'TRAIT_LEADER_LUDWIG';

INSERT OR REPLACE INTO TraitModifiers 
(TraitType,	ModifierId)
SELECT
TraitType,	'GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_PRODUCTION'
FROM Traits WHERE TraitType = 'TRAIT_LEADER_LUDWIG';

INSERT OR REPLACE INTO TraitModifiers 
(TraitType,	ModifierId)
SELECT
TraitType,	'GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_CULTURE'
FROM Traits WHERE TraitType = 'TRAIT_LEADER_LUDWIG';

INSERT OR REPLACE INTO TraitModifiers 	
(TraitType,			ModifierId)
SELECT
a.TraitType,		'GOLDEN_TRAIT_WONDER_FREE_HEAVY_CAVALRY_UNIT' || b.BuildingType 
FROM Traits AS a, Buildings AS b
WHERE a.TraitType = 'TRAIT_LEADER_LUDWIG' AND b.IsWonder = 1;
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)VALUES
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_NO_GOLD', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 'GOLDEN_PLOT_HAS_ANY_MOUNTAINS_REQUIREMENTS'),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_NO_FAITH', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 'GOLDEN_PLOT_HAS_ANY_MOUNTAINS_REQUIREMENTS'),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_PRODUCTION', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 'GOLDEN_PLOT_HAS_ANY_MOUNTAINS_REQUIREMENTS'),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_CULTURE', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 'GOLDEN_PLOT_HAS_ANY_MOUNTAINS_REQUIREMENTS');
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_WONDER_FREE_HEAVY_CAVALRY_UNIT' ||BuildingType,	        'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS',				'GOLDEN_LUDWIG_CITY_FINISHES' ||BuildingType FROM Buildings WHERE IsWonder=1;

--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)VALUES
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_NO_GOLD' , 		'YieldType' , 	'YIELD_GOLD'  ),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_NO_GOLD' , 		'Amount' , 		-1  ),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_NO_FAITH' , 		'YieldType' , 	'YIELD_FAITH'  ),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_NO_FAITH' , 		'Amount' , 		-1  ),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_PRODUCTION' , 	'YieldType' , 	'YIELD_PRODUCTION'  ),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_PRODUCTION' , 	'Amount' , 		3  ),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_CULTURE' , 		'YieldType' , 	'YIELD_CULTURE'  ),
('GOLDEN_TRAIT_LUDWIG_MOUNTAINS_TILES_CULTURE' , 		'Amount' , 		3  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
SELECT	'GOLDEN_TRAIT_WONDER_FREE_HEAVY_CAVALRY_UNIT' ||BuildingType,	'UnitPromotionClassType',	'PROMOTION_CLASS_HEAVY_CAVALRY' FROM Buildings WHERE IsWonder=1;

---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							RequirementSetType)
SELECT	'GOLDEN_LUDWIG_CITY_FINISHES' ||BuildingType,	                'REQUIREMENTSET_TEST_ALL' FROM Buildings WHERE IsWonder=1;
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,		 RequirementId)
SELECT	'GOLDEN_LUDWIG_CITY_FINISHES' ||BuildingType,	         'GOLDEN_LUDWIG_REQUIRES_CITY_FINISHES_' || BuildingType FROM Buildings WHERE IsWonder=1;
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Requirements (RequirementId,					RequirementType)
SELECT	'GOLDEN_LUDWIG_REQUIRES_CITY_FINISHES_' || BuildingType,	'REQUIREMENT_CITY_HAS_BUILDING' FROM Buildings WHERE IsWonder=1;
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementArguments (RequirementId,			Name,			Value)
SELECT	'GOLDEN_LUDWIG_REQUIRES_CITY_FINISHES_' || BuildingType,	'BuildingType',	BuildingType FROM Buildings WHERE IsWonder=1;