--CIVILIZATION_POLAND
--------------------------------------------------------------
-- ExcludedAdjacencies
--------------------------------------------------------------
INSERT OR REPLACE INTO ExcludedAdjacencies (YieldChangeId, TraitType)
VALUES ('CITY_CENTER_FAITH' , 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY' );
INSERT OR REPLACE INTO ExcludedAdjacencies (YieldChangeId, TraitType)
VALUES ('Government_Faith' , 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY' );
--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_LITHUANIAN_UNION' , 'GOLDEN_TRAIT_RELIGIOUS_QUEST' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_CIVILIZATION_GOLDEN_LIBERTY', 'GOLDEN_TRAIT_FREE_RELIC' ||EraType FROM Eras WHERE EraType <> 'ERA_ANCIENT';
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_LITHUANIAN_UNION' , 'GOLDEN_TRAIT_LITHUANIANUNION_FOOD_RELIC' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_LITHUANIAN_UNION' , 'GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_RELIC' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_LITHUANIAN_UNION' , 'GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_RELIC' );
DELETE FROM TraitModifiers WHERE ModifierId = 'TRAIT_CULTURE_BOMB_TRIGGER_FORT';
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_LITHUANIAN_UNION' AND ModifierId = 'TRAIT_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH';
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY' , 'GOLDEN_TRAIT_LITHUANIAN_UNION_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH' );
--------------------------------------------------------------
-- Modifiers
------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_RELIGIOUS_QUEST' , 'MODIFIER_PLAYER_ADJUST_PLAYER_ERA_SCORE_PER_CITY_RELIGION_CONVERSION' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_FREE_RELIC' ||EraType, 'MODIFIER_PLAYER_GRANT_RELIC', 1, 1, 'GOLDEN_POLAND_HAS_GOLDEN_AGE_' ||EraType FROM Eras WHERE EraType <> 'ERA_ANCIENT';
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_FOOD_RELIC' , 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_RELIC' , 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_RELIC' , 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_LITHUANIAN_UNION_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH' , 'MODIFIER_PLAYER_CITIES_DISTRICT_ADJACENCY' , 0 , 0 , NULL );
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_RELIGIOUS_QUEST' , 'Amount' , 1  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD' , 'ReplacesAll' , 1  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_FREE_RELIC' ||EraType, 'Amount', 2 FROM Eras WHERE EraType <> 'ERA_ANCIENT';
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_FOOD_RELIC' , 'YieldChange' , 2  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_FOOD_RELIC' , 'GreatWorkObjectType' , 'GREATWORKOBJECT_RELIC'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_FOOD_RELIC' , 'YieldType' , 'YIELD_FOOD'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_RELIC' , 'YieldChange' , 2  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_RELIC' , 'GreatWorkObjectType' , 'GREATWORKOBJECT_RELIC'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_RELIC' , 'YieldType' , 'YIELD_PRODUCTION'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_RELIC' , 'YieldChange' , 2  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_RELIC' , 'GreatWorkObjectType' , 'GREATWORKOBJECT_RELIC'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_RELIC' , 'YieldType' , 'YIELD_SCIENCE'  );
UPDATE ModifierArguments SET Value = 2
WHERE ModifierId = 'TRAIT_LITHUANIANUNION_GOLD_RELIC' AND Name = 'YieldChange';
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIAN_UNION_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH' , 'DistrictType' , 'DISTRICT_HOLY_SITE'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIAN_UNION_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH' , 'YieldType' , 'YIELD_FAITH'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIAN_UNION_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH' , 'Amount' , 2  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_LITHUANIAN_UNION_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH' , 'Description' , 'LOC_POLAND_DISTRICT_DISTRICT_FAITH'  );
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets(RequirementSetId,								RequirementSetType)
SELECT	'GOLDEN_POLAND_HAS_GOLDEN_AGE_' ||EraType,	'REQUIREMENTSET_TEST_ALL'				FROM Eras WHERE EraType <> 'ERA_ANCIENT';
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements(RequirementSetId,								RequirementId)
SELECT	'GOLDEN_POLAND_HAS_GOLDEN_AGE_' ||EraType,	'GOLDEN_POLAND_REQUIRES_ERA_IS_' ||EraType	FROM Eras WHERE EraType <> 'ERA_ANCIENT';
INSERT OR REPLACE INTO RequirementSetRequirements(RequirementSetId,								RequirementId)
SELECT	'GOLDEN_POLAND_HAS_GOLDEN_AGE_' ||EraType,	'REQUIRES_PLAYER_HAS_GOLDEN_AGE' FROM Eras WHERE EraType <> 'ERA_ANCIENT';
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Requirements (RequirementId,								RequirementType)
SELECT	'GOLDEN_POLAND_REQUIRES_ERA_IS_' ||EraType,	'REQUIREMENT_GAME_ERA_IS'		FROM Eras WHERE EraType <> 'ERA_ANCIENT';
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementArguments (RequirementId,								Name,		Value)
SELECT	'GOLDEN_POLAND_REQUIRES_ERA_IS_' ||EraType,	'EraType',	EraType				FROM Eras WHERE EraType <> 'ERA_ANCIENT';