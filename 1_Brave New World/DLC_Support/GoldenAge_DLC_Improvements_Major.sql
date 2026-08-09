--CIVILIZATION_AUSTRALIA
UPDATE Improvements SET TilesRequired = 1
WHERE ImprovementType = 'IMPROVEMENT_OUTBACK_STATION' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_DIGGER');

DELETE FROM Improvement_Adjacencies WHERE YieldChangeId = 'Pasture_Outback_Production' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_DIGGER');
INSERT OR REPLACE INTO Improvement_Adjacencies(ImprovementType, YieldChangeId) 	   
SELECT 'IMPROVEMENT_OUTBACK_STATION', 'Outback_Pasture_Production' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_DIGGER');

INSERT OR REPLACE INTO Improvement_ValidTerrains(ImprovementType, TerrainType) 	   
SELECT 'IMPROVEMENT_OUTBACK_STATION', 'TERRAIN_GRASS_HILLS' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_DIGGER');
INSERT OR REPLACE INTO Improvement_ValidTerrains(ImprovementType, TerrainType) 	   
SELECT 'IMPROVEMENT_OUTBACK_STATION', 'TERRAIN_PLAINS_HILLS' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_DIGGER');

INSERT OR REPLACE INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement, PrereqTech) 	   
SELECT 'Outback_Pasture_Production', 'Placeholder', 'YIELD_PRODUCTION', 1, 1, 'IMPROVEMENT_PASTURE', 'TECH_FLIGHT' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_DIGGER');
UPDATE Adjacency_YieldChanges SET TilesRequired = 1
WHERE ID = 'Outback_Outback_Production' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_DIGGER');
UPDATE Adjacency_YieldChanges SET TilesRequired = 1
WHERE ID = 'Outback_Outback_Food' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_DIGGER');

--CIVILIZATION_PERSIA
UPDATE Improvements SET Appeal = 1
WHERE ImprovementType = 'IMPROVEMENT_PAIRIDAEZA' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_PERSIAN_IMMORTAL');

UPDATE Improvement_YieldChanges SET YieldChange = 1
WHERE ImprovementType = 'IMPROVEMENT_PAIRIDAEZA' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_PERSIAN_IMMORTAL');

INSERT OR REPLACE INTO Improvement_BonusYieldChanges(ID, ImprovementType, YieldType, BonusYieldChange, PrereqCivic) 	   
SELECT '501', 'IMPROVEMENT_PAIRIDAEZA', 'YIELD_GOLD', 1, 'CIVIC_DIPLOMATIC_SERVICE' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_PERSIAN_IMMORTAL');

INSERT OR REPLACE INTO Improvement_Adjacencies(ImprovementType, YieldChangeId) 	   
SELECT 'IMPROVEMENT_PAIRIDAEZA', 'Pairidaeza_EntertainmentComplexAdjacency' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_PERSIAN_IMMORTAL');
INSERT OR REPLACE INTO Improvement_Adjacencies(ImprovementType, YieldChangeId) 	   
SELECT 'IMPROVEMENT_PAIRIDAEZA', 'Pairidaeza_EncampmentAdjacency' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_PERSIAN_IMMORTAL');

INSERT OR REPLACE INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) 	   
SELECT 'Pairidaeza_EntertainmentComplexAdjacency', 'Placeholder', 'YIELD_CULTURE', 2, 1, 'DISTRICT_ENTERTAINMENT_COMPLEX' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_PERSIAN_IMMORTAL');
INSERT OR REPLACE INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentDistrict) 	   
SELECT 'Pairidaeza_EncampmentAdjacency', 'Placeholder', 'YIELD_GOLD', 2, 1, 'DISTRICT_ENCAMPMENT' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_PERSIAN_IMMORTAL');
UPDATE Adjacency_YieldChanges SET YieldChange = 2
WHERE ID = 'Pairidaeza_CityCenterAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_PERSIAN_IMMORTAL');
UPDATE Adjacency_YieldChanges SET YieldChange = 2
WHERE ID = 'Pairidaeza_CommercialHubAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_PERSIAN_IMMORTAL');
UPDATE Adjacency_YieldChanges SET YieldChange = 2
WHERE ID = 'Pairidaeza_HolySiteAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_PERSIAN_IMMORTAL');
UPDATE Adjacency_YieldChanges SET YieldChange = 2
WHERE ID = 'Pairidaeza_TheaterAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_PERSIAN_IMMORTAL');

--CIVILIZATION_GRAN_COLOMBIA
UPDATE Improvements SET TilesRequired = 1
WHERE ImprovementType = 'IMPROVEMENT_HACIENDA' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_MAYAN_HULCHE');

DELETE FROM Improvement_Adjacencies WHERE YieldChangeId = 'Plantation_HaciendaAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
DELETE FROM Improvement_Adjacencies WHERE YieldChangeId = 'Plantation_AdvancedHaciendaAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Improvement_Adjacencies(ImprovementType, YieldChangeId) 	   
SELECT 'IMPROVEMENT_HACIENDA', 'Hacienda_PlantationAdjacencygold' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');

UPDATE Adjacency_YieldChanges SET TilesRequired = 1, ObsoleteTech = null
WHERE ID = 'Hacienda_PlantationAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_MAYAN_HULCHE');
UPDATE Adjacency_YieldChanges SET YieldType = 'YIELD_PRODUCTION'
WHERE ID = 'Hacienda_MechanizedPlantationAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_MAYAN_HULCHE');
INSERT OR REPLACE INTO Adjacency_YieldChanges(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentImprovement, PrereqTech) 	   
SELECT 'Hacienda_PlantationAdjacencygold', 'Placeholder', 'YIELD_GOLD', 1, 1, 'IMPROVEMENT_PLANTATION', 'TECH_ECONOMICS' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');
UPDATE Adjacency_YieldChanges SET TilesRequired = 1, YieldType = 'YIELD_GOLD', ObsoleteCivic = null
WHERE ID = 'Hacienda_HaciendaAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_MAYAN_HULCHE');

UPDATE Improvement_YieldChanges SET YieldChange = 1
WHERE ImprovementType = 'IMPROVEMENT_HACIENDA' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_MAYAN_HULCHE');

--CIVILIZATION_NUBIA
UPDATE Improvement_YieldChanges SET YieldChange = 0
WHERE ImprovementType = 'IMPROVEMENT_PYRAMID' AND YieldType = 'YIELD_FAITH' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');
UPDATE Improvement_YieldChanges SET YieldChange = 0
WHERE ImprovementType = 'IMPROVEMENT_PYRAMID' AND YieldType = 'YIELD_FOOD' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');

UPDATE Adjacency_YieldChanges SET YieldChange = 3
WHERE ID = 'Pyramid_CityCenterAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');
UPDATE Adjacency_YieldChanges SET YieldChange = 3
WHERE ID = 'Pyramid_CampusAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');
UPDATE Adjacency_YieldChanges SET YieldChange = 3
WHERE ID = 'Pyramid_CommercialHubAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');
UPDATE Adjacency_YieldChanges SET YieldChange = 3
WHERE ID = 'Pyramid_HarborAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');
UPDATE Adjacency_YieldChanges SET YieldChange = 3
WHERE ID = 'Pyramid_HolySiteAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');
UPDATE Adjacency_YieldChanges SET YieldChange = 3
WHERE ID = 'Pyramid_IndustrialZoneAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');
UPDATE Adjacency_YieldChanges SET YieldChange = 3
WHERE ID = 'Pyramid_TheaterAdjacency' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');

--CIVILIZATION_INDONESIA
UPDATE Improvement_YieldChanges SET YieldChange = 1
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG' AND YieldType = 'YIELD_FOOD' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_INDONESIAN_JONG');

UPDATE Adjacency_YieldChanges SET YieldType = 'YIELD_PRODUCTION'
WHERE ID = 'Kampung_FoodFishingBoats' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_INDONESIAN_JONG');

UPDATE Improvement_Tourism SET TourismSource = 'TOURISMSOURCE_PRODUCTION'
WHERE ImprovementType = 'IMPROVEMENT_KAMPUNG' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_INDONESIAN_JONG');