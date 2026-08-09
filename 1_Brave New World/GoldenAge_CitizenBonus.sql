--===================================
-- This SQL was from mod "Production From Population" by p0kiehl.
-- PopulationReference (thanks Chrisy15!)
--===================================
-- Modified here for GoldenAge for better game preformance.
--===================================
-- PopulationReference 
-------------------------------------
CREATE TABLE IF NOT EXISTS PopulationReference
    (
    Size INT
    );
    
WITH RECURSIVE t(val) AS (SELECT 1 UNION ALL SELECT val + 1 FROM t LIMIT 100) 
INSERT OR REPLACE INTO PopulationReference (Size) SELECT val FROM t;

-------------------------------------
-- Requirements
-------------------------------------
INSERT OR REPLACE INTO Requirements
		(RequirementId,									RequirementType)
SELECT	'GOLDEN_REQUIRES_CITY_HAS_'||Size||'_POPULATION',	'REQUIREMENT_CITY_HAS_X_POPULATION' FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO Requirements
		-- (RequirementId,									RequirementType)
-- SELECT	'GOLDEN_REQUIRES_ERA_IS_AT_LEAST_'||EraType,		'REQUIREMENT_GAME_ERA_ATLEAST_EXPANSION' FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';
-------------------------------------
-- RequirementArguments
-------------------------------------
INSERT OR REPLACE INTO RequirementArguments
		(RequirementId,									Name,		Value)
SELECT	'GOLDEN_REQUIRES_CITY_HAS_'||Size||'_POPULATION',	'Amount',	Size FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO RequirementArguments
		-- (RequirementId,									Name,		Value)
-- SELECT	'GOLDEN_REQUIRES_ERA_IS_AT_LEAST_'||EraType,		'EraType',	EraType FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';
-------------------------------------
-- RequirementSets
-------------------------------------
INSERT OR REPLACE INTO RequirementSets
		(RequirementSetId,						RequirementSetType)
SELECT	'GOLDEN_CITY_HAS_'||Size||'_POPULATION',	'REQUIREMENTSET_TEST_ALL' FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO RequirementSets
		-- (RequirementSetId,						RequirementSetType)
-- SELECT	'GOLDEN_ERA_IS_AT_LEAST_'||EraType,		'REQUIREMENTSET_TEST_ALL' FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';
-------------------------------------
-- RequirementSetRequirements
-------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements
		(RequirementSetId,						RequirementId)
SELECT	'GOLDEN_CITY_HAS_'||Size||'_POPULATION',	'GOLDEN_REQUIRES_CITY_HAS_'||Size||'_POPULATION' FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO RequirementSetRequirements
		-- (RequirementSetId,						RequirementId)
-- SELECT	'GOLDEN_ERA_IS_AT_LEAST_'||EraType,		'GOLDEN_REQUIRES_ERA_IS_AT_LEAST_'||EraType FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';
-------------------------------------
-- Modifiers
-------------------------------------
INSERT OR REPLACE INTO Modifiers
		(ModifierId,									ModifierType,										SubjectRequirementSetId)
VALUES	('GOLDEN_PRODUCTION_FROM_POPULATION_BASELINE',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL);

INSERT OR REPLACE INTO Modifiers
		(ModifierId,									ModifierType,										SubjectRequirementSetId)
SELECT	'GOLDEN_PRODUCTION_FROM_'||Size||'_POPULATION',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'GOLDEN_CITY_HAS_'||Size||'_POPULATION' FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO Modifiers
		-- (ModifierId,									ModifierType,										SubjectRequirementSetId)
-- SELECT	'GOLDEN_PRODUCTION_FROM_'||EraType,				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'GOLDEN_ERA_IS_AT_LEAST_'||EraType FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';

INSERT OR REPLACE INTO Modifiers
		(ModifierId,									ModifierType,										SubjectRequirementSetId)
SELECT	'GOLDEN_SCIENCE_FROM_'||Size||'_POPULATION',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'GOLDEN_CITY_HAS_'||Size||'_POPULATION' FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO Modifiers
		-- (ModifierId,									ModifierType,										SubjectRequirementSetId)
-- SELECT	'GOLDEN_SCIENCE_FROM_'||EraType,				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'GOLDEN_ERA_IS_AT_LEAST_'||EraType FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';

INSERT OR REPLACE INTO Modifiers
		(ModifierId,									ModifierType,										SubjectRequirementSetId)
SELECT	'GOLDEN_CULTURE_FROM_'||Size||'_POPULATION',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'GOLDEN_CITY_HAS_'||Size||'_POPULATION' FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO Modifiers
		-- (ModifierId,									ModifierType,										SubjectRequirementSetId)
-- SELECT	'GOLDEN_CULTURE_FROM_'||EraType,				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'GOLDEN_ERA_IS_AT_LEAST_'||EraType FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';
-------------------------------------
-- ModifierArguments
-------------------------------------
INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,									Name,			Value)
VALUES	('GOLDEN_PRODUCTION_FROM_POPULATION_BASELINE',		'YieldType',	'YIELD_PRODUCTION'),
		('GOLDEN_PRODUCTION_FROM_POPULATION_BASELINE',		'Amount',		0.4);

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'GOLDEN_PRODUCTION_FROM_'||Size||'_POPULATION',	'YieldType',	'YIELD_PRODUCTION' FROM PopulationReference WHERE Size > 1;

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'GOLDEN_PRODUCTION_FROM_'||Size||'_POPULATION',	'Amount',		0.01 FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO ModifierArguments
		-- (ModifierId,									Name,			Value)
-- SELECT	'GOLDEN_PRODUCTION_FROM_'||EraType,				'YieldType',	'YIELD_PRODUCTION' FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';

-- INSERT OR REPLACE INTO ModifierArguments
		-- (ModifierId,									Name,			Value)
-- SELECT	'GOLDEN_PRODUCTION_FROM_'||EraType,				'Amount',		0.05 FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'GOLDEN_SCIENCE_FROM_'||Size||'_POPULATION',	'YieldType',	'YIELD_SCIENCE' FROM PopulationReference WHERE Size > 1;

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'GOLDEN_SCIENCE_FROM_'||Size||'_POPULATION',	'Amount',		0.01 FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO ModifierArguments
		-- (ModifierId,									Name,			Value)
-- SELECT	'GOLDEN_SCIENCE_FROM_'||EraType,				'YieldType',	'YIELD_SCIENCE' FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';

-- INSERT OR REPLACE INTO ModifierArguments
		-- (ModifierId,									Name,			Value)
-- SELECT	'GOLDEN_SCIENCE_FROM_'||EraType,				'Amount',		0.05 FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'GOLDEN_CULTURE_FROM_'||Size||'_POPULATION',	'YieldType',	'YIELD_CULTURE' FROM PopulationReference WHERE Size > 1;

INSERT OR REPLACE INTO ModifierArguments
		(ModifierId,									Name,			Value)
SELECT	'GOLDEN_CULTURE_FROM_'||Size||'_POPULATION',	'Amount',		0.01 FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO ModifierArguments
		-- (ModifierId,									Name,			Value)
-- SELECT	'GOLDEN_CULTURE_FROM_'||EraType,				'YieldType',	'YIELD_CULTURE' FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';

-- INSERT OR REPLACE INTO ModifierArguments
		-- (ModifierId,									Name,			Value)
-- SELECT	'GOLDEN_CULTURE_FROM_'||EraType,				'Amount',		0.05 FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';
-------------------------------------
-- DistrictModifiers
-------------------------------------
INSERT OR REPLACE INTO DistrictModifiers
		(DistrictType,				ModifierId)
VALUES	('DISTRICT_CITY_CENTER',	'GOLDEN_PRODUCTION_FROM_POPULATION_BASELINE');

INSERT OR REPLACE INTO DistrictModifiers
		(DistrictType,				ModifierId)
SELECT	'DISTRICT_CITY_CENTER',		'GOLDEN_PRODUCTION_FROM_'||Size||'_POPULATION' FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO DistrictModifiers
		-- (DistrictType,				ModifierId)
-- SELECT	'DISTRICT_CITY_CENTER',		'GOLDEN_PRODUCTION_FROM_'||EraType FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';

INSERT OR REPLACE INTO DistrictModifiers
		(DistrictType,				ModifierId)
SELECT	'DISTRICT_CITY_CENTER',		'GOLDEN_SCIENCE_FROM_'||Size||'_POPULATION' FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO DistrictModifiers
		-- (DistrictType,				ModifierId)
-- SELECT	'DISTRICT_CITY_CENTER',		'GOLDEN_SCIENCE_FROM_'||EraType FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';

INSERT OR REPLACE INTO DistrictModifiers
		(DistrictType,				ModifierId)
SELECT	'DISTRICT_CITY_CENTER',		'GOLDEN_CULTURE_FROM_'||Size||'_POPULATION' FROM PopulationReference WHERE Size > 1;

-- INSERT OR REPLACE INTO DistrictModifiers
		-- (DistrictType,				ModifierId)
-- SELECT	'DISTRICT_CITY_CENTER',		'GOLDEN_CULTURE_FROM_'||EraType FROM Eras_XP1 WHERE EraType<>'ERA_ANCIENT';
-------------------------------------
-- PopulationReference
-------------------------------------
DROP TABLE PopulationReference