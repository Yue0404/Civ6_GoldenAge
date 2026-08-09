---------------------------------------------------------------------------------------------------------------
-- Buildings
---------------------------------------------------------------------------------------------------------------
UPDATE Buildings SET PrereqTech='TECH_CASTLES', Cost = 125, Description='LOC_BUILDING_TSIKHE_DESCRIPTION_XP2'
WHERE BuildingType = 'BUILDING_TSIKHE';
---------------------------------------------------------------------------------------------------------------
-- Building_YieldChanges
---------------------------------------------------------------------------------------------------------------
UPDATE Building_YieldChanges SET YieldChange = 4
WHERE BuildingType = 'BUILDING_TSIKHE' AND YieldType = 'YIELD_FAITH';
---------------------------------------------------------------------------------------------------------------
-- BuildingPrereqs
---------------------------------------------------------------------------------------------------------------
UPDATE BuildingPrereqs SET PrereqBuilding = 'BUILDING_WALLS'
WHERE Building = 'BUILDING_TSIKHE';
INSERT OR REPLACE INTO BuildingPrereqs (Building, 			PrereqBuilding) VALUES	
('BUILDING_STAR_FORT',	    'BUILDING_TSIKHE');
---------------------------------------------------------------------------------------------------------------
-- BuildingReplaces
---------------------------------------------------------------------------------------------------------------
UPDATE BuildingReplaces SET ReplacesBuildingType = 'BUILDING_CASTLE'
WHERE CivUniqueBuildingType = 'BUILDING_TSIKHE';
---------------------------------------------------------------------------------------------------------------
-- Building_GreatWorks
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Building_GreatWorks (BuildingType, 			GreatWorkSlotType, NumSlots) VALUES	
('BUILDING_TSIKHE',	    'GREATWORKSLOT_RELIC', 1);
---------------------------------------------------------------------------------------------------------------
-- BuildingModifiers
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO BuildingModifiers (BuildingType, 			ModifierID) VALUES	
('BUILDING_TSIKHE',	    'GOLDEN_TSIKHE_PRESSURE');
---------------------------------------------------------------------------------------------------------------
-- TraitModifiers
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType,					ModifierId)	
SELECT DISTINCT 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS',	'GOLDEN_TRAIT_FAITH_PURCHASE_' ||PrereqDistrict|| '_BUILDINGS'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL) AND (TraitType IS NULL) AND (InternalOnly = 0) AND NOT EXISTS (SELECT TraitType FROM Traits WHERE TraitType = 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_NEW');
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS', 'GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_MASONRY' WHERE NOT EXISTS (SELECT TraitType FROM Traits WHERE TraitType = 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_NEW');
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS', 'GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_CASTLES' WHERE NOT EXISTS (SELECT TraitType FROM Traits WHERE TraitType = 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_NEW');
DELETE FROM TraitModifiers WHERE ModifierId = 'TRAIT_WALLS_PRODUCTION';
DELETE FROM TraitModifiers WHERE ModifierId = 'TRAIT_CASTLE_PRODUCTION';
DELETE FROM TraitModifiers WHERE ModifierId = 'TRAIT_TSIKHE_PRODUCTION';
DELETE FROM TraitModifiers WHERE ModifierId = 'TRAIT_STAR_FORT_PRODUCTION';
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_LEADER_RELIGION_CITY_STATES',	    'GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_RELIGIOUS_PEOPLE');
---------------------------------------------------------------------------------------------------------------
-- Modifiers
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES	
('GOLDEN_TSIKHE_PRESSURE',             'MODIFIER_SINGLE_CITY_RELIGION_PRESSURE', NULL);
INSERT OR REPLACE INTO Modifiers (ModifierId,												ModifierType)
SELECT DISTINCT 'GOLDEN_TRAIT_FAITH_PURCHASE_' ||PrereqDistrict|| '_BUILDINGS',	'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL) AND (TraitType IS NULL) AND (InternalOnly = 0) AND NOT EXISTS (SELECT TraitType FROM Traits WHERE TraitType = 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_NEW');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_MASONRY',             'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',               1, 1, NULL),
('GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_CASTLES',	            'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',               1, 1, NULL),
('GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_RELIGIOUS_PEOPLE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION', 0, 0, 'CITY_HAS_GOVERNOR');
---------------------------------------------------------------------------------------------------------------
-- ModifierArguments
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,													Name,			Value)
SELECT DISTINCT	'GOLDEN_TRAIT_FAITH_PURCHASE_' ||PrereqDistrict|| '_BUILDINGS',	'DistrictType',	PrereqDistrict
FROM Buildings WHERE (PrereqDistrict IS NOT NULL) AND (TraitType IS NULL) AND (InternalOnly = 0) AND NOT EXISTS (SELECT TraitType FROM Traits WHERE TraitType = 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_NEW');
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_TSIKHE_PRESSURE',		                                          'Amount',	        100),
('GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_MASONRY',		              'TechType',	    'TECH_MASONRY'),
('GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_CASTLES',			          'TechType',	    'TECH_CASTLES'),
('GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_RELIGIOUS_PEOPLE',		  'YieldType',	    'YIELD_FAITH'),
('GOLDEN_TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS_RELIGIOUS_PEOPLE',		  'Amount',	        1);
