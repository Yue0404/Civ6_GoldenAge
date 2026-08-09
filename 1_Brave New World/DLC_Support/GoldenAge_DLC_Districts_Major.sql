--CIVILIZATION_MAYA
--DISTRICT_OBSERVATORY
DELETE FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_OBSERVATORY' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
SELECT	'DISTRICT_OBSERVATORY', 'YIELD_SCIENCE', 0, 1, 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
SELECT	'DISTRICT_OBSERVATORY', 'YIELD_GOLD', 0, 0, 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');

INSERT OR REPLACE INTO District_CitizenGreatPersonPoints (DistrictType, GreatPersonClassType, PointsPerTurn)
SELECT	'DISTRICT_OBSERVATORY', 'GREAT_PERSON_CLASS_SCIENTIST', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');

DELETE FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_OBSERVATORY' AND YieldChangeId = 'Plantation_Science' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
DELETE FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_OBSERVATORY' AND YieldChangeId = 'Farm_Science' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
DELETE FROM District_Adjacencies WHERE DistrictType = 'DISTRICT_OBSERVATORY' AND YieldChangeId = 'Pamukkale_Science' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'CITY_CENTER_SCIENCE' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_Mountains_Science1' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_Mountains_Science2' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_Mountains_Science3' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_Mountains_Science4' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_Mountains_Science5' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_plus_Mountains_Science1' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_plus_Mountains_Science2' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_plus_Mountains_Science3' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_plus_Mountains_Science4' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'OBSERVATORY_plus_Mountains_Science5' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OBSERVATORY', 'SPACE_SCIENCE' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain)
SELECT	'OBSERVATORY_Mountains_Science1', 'LOC_DISTRICT_MOUNTAINS_SCIENCE1', 'YIELD_SCIENCE', 2, 1, 'TERRAIN_GRASS_MOUNTAIN' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain)
SELECT	'OBSERVATORY_Mountains_Science2', 'LOC_DISTRICT_MOUNTAINS_SCIENCE2', 'YIELD_SCIENCE', 2, 1, 'TERRAIN_PLAINS_MOUNTAIN' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain)
SELECT	'OBSERVATORY_Mountains_Science3', 'LOC_DISTRICT_MOUNTAINS_SCIENCE3', 'YIELD_SCIENCE', 2, 1, 'TERRAIN_DESERT_MOUNTAIN' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain)
SELECT	'OBSERVATORY_Mountains_Science4', 'LOC_DISTRICT_MOUNTAINS_SCIENCE4', 'YIELD_SCIENCE', 2, 1, 'TERRAIN_TUNDRA_MOUNTAIN' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain)
SELECT	'OBSERVATORY_Mountains_Science5', 'LOC_DISTRICT_MOUNTAINS_SCIENCE5', 'YIELD_SCIENCE', 2, 1, 'TERRAIN_SNOW_MOUNTAIN' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain, PrereqTech)
SELECT	'OBSERVATORY_plus_Mountains_Science1', 'LOC_DISTRICT_MOUNTAINS_SCIENCE1', 'YIELD_SCIENCE', 1, 1, 'TERRAIN_GRASS_MOUNTAIN', 'TECH_ASTRONOMY' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain, PrereqTech)
SELECT	'OBSERVATORY_plus_Mountains_Science2', 'LOC_DISTRICT_MOUNTAINS_SCIENCE2', 'YIELD_SCIENCE', 1, 1, 'TERRAIN_PLAINS_MOUNTAIN', 'TECH_ASTRONOMY' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain, PrereqTech)
SELECT	'OBSERVATORY_plus_Mountains_Science3', 'LOC_DISTRICT_MOUNTAINS_SCIENCE3', 'YIELD_SCIENCE', 1, 1, 'TERRAIN_DESERT_MOUNTAIN', 'TECH_ASTRONOMY' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain, PrereqTech)
SELECT	'OBSERVATORY_plus_Mountains_Science4', 'LOC_DISTRICT_MOUNTAINS_SCIENCE4', 'YIELD_SCIENCE', 1, 1, 'TERRAIN_TUNDRA_MOUNTAIN', 'TECH_ASTRONOMY' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges (ID, Description, YieldType, YieldChange, TilesRequired, AdjacentTerrain, PrereqTech)
SELECT	'OBSERVATORY_plus_Mountains_Science5', 'LOC_DISTRICT_MOUNTAINS_SCIENCE5', 'YIELD_SCIENCE', 1, 1, 'TERRAIN_SNOW_MOUNTAIN', 'TECH_ASTRONOMY' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');

INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_OBSERVATORY', 'YIELD_SCIENCE', 4 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_OBSERVATORY', 'YIELD_FOOD', -1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
--CIVILIZATION_GAUL
--DISTRICT_OPPIDUM
UPDATE Districts SET Appeal = 0, PrereqTech = 'TECH_ENGINEERING'
WHERE DistrictType = 'DISTRICT_OPPIDUM' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_BYZANTINE_DROMON');

DELETE FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_OPPIDUM' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
SELECT	'DISTRICT_OPPIDUM', 'YIELD_PRODUCTION', 0, 1, 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
SELECT	'DISTRICT_OPPIDUM', 'YIELD_GOLD', 0, 0, 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');

INSERT OR REPLACE INTO District_CitizenGreatPersonPoints (DistrictType, GreatPersonClassType, PointsPerTurn)
SELECT	'DISTRICT_OPPIDUM', 'GREAT_PERSON_CLASS_ENGINEER', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');

INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OPPIDUM', 'LUMBER_PRODUCTION' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OPPIDUM', 'OFFSHORE_OIL_RIG_PRODUCTION' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OPPIDUM', 'OIL_WELL_PRODUCTION' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_Adjacencies (DistrictType, YieldChangeId)
SELECT	'DISTRICT_OPPIDUM', 'Minel_HalfProduction' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');

INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_OPPIDUM', 'YIELD_PRODUCTION', 4 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_OPPIDUM', 'YIELD_FOOD', -1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
--CIVILIZATION_BYZANTIUM
--DISTRICT_HIPPODROME
UPDATE Districts SET Entertainment = 1
WHERE DistrictType = 'DISTRICT_HIPPODROME' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_BYZANTINE_DROMON');

DELETE FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_HIPPODROME' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
SELECT	'DISTRICT_HIPPODROME', 'YIELD_CULTURE', 0, 1, 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
SELECT	'DISTRICT_HIPPODROME', 'YIELD_GOLD', 0, 0, 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');

INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_HIPPODROME', 'YIELD_CULTURE', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_HIPPODROME', 'YIELD_GOLD', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_HIPPODROME', 'YIELD_FAITH', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_HIPPODROME', 'YIELD_SCIENCE', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_HIPPODROME', 'YIELD_FOOD', -1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');

--CIVILIZATION_VIETNAM
--DISTRICT_THANH
DELETE FROM District_TradeRouteYields WHERE DistrictType = 'DISTRICT_THANH' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
SELECT	'DISTRICT_THANH', 'YIELD_PRODUCTION', 0, 1, 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN');
INSERT OR REPLACE INTO District_TradeRouteYields (DistrictType, YieldType, YieldChangeAsOrigin, YieldChangeAsDomesticDestination, YieldChangeAsInternationalDestination)
SELECT	'DISTRICT_THANH', 'YIELD_GOLD', 0, 0, 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN');

DELETE FROM District_CitizenYieldChanges WHERE DistrictType = 'DISTRICT_THANH' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN');
INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_THANH', 'YIELD_PRODUCTION', 2 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN');
INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_THANH', 'YIELD_SCIENCE', 2 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN');
INSERT OR REPLACE INTO District_CitizenYieldChanges (DistrictType, YieldType, YieldChange)
SELECT	'DISTRICT_THANH', 'YIELD_FOOD', -1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN');

INSERT OR REPLACE INTO District_CitizenGreatPersonPoints (DistrictType, GreatPersonClassType, PointsPerTurn)
SELECT	'DISTRICT_THANH', 'GREAT_PERSON_CLASS_GENERAL', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN');
