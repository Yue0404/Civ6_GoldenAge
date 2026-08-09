--------------------------------------------------------------
-- Buildings
--------------------------------------------------------------
UPDATE Buildings SET  Maintenance = 6, Cost = 600
WHERE BuildingType = 'BUILDING_JNR_RENEWABLE_COLLECTION' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
UPDATE Buildings SET  CitizenSlots = 1, Maintenance = 8, Cost = 1100
WHERE BuildingType = 'BUILDING_JNR_RENEWABLE_DISTRIBUTION' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
--------------------------------------------------------------
-- Building_YieldChanges
--------------------------------------------------------------
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_HYDROELECTRIC_DAM' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
UPDATE Building_YieldChanges SET YieldChange = 5
WHERE BuildingType = 'BUILDING_HYDROELECTRIC_DAM' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_JNR_RENEWABLE_COLLECTION' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_JNR_RENEWABLE_DISTRIBUTION' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM Building_YieldChanges WHERE BuildingType = 'BUILDING_JNR_RENEWABLE_DISTRIBUTION' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
UPDATE Building_YieldChanges SET YieldChange = 9
WHERE BuildingType = 'BUILDING_JNR_RENEWABLE_DISTRIBUTION' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
--------------------------------------------------------------
-- Building_CitizenYieldChanges
--------------------------------------------------------------
INSERT OR REPLACE INTO Building_CitizenYieldChanges (BuildingType, YieldType, YieldChange)
SELECT	'BUILDING_JNR_RENEWABLE_DISTRIBUTION', 'YIELD_PRODUCTION', 2 WHERE EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
--------------------------------------------------------------
-- BuildingPrereqs
--------------------------------------------------------------
INSERT OR REPLACE INTO BuildingPrereqs (Building, PrereqBuilding)
SELECT	'BUILDING_SUPER_FACTORY', 'BUILDING_JNR_RENEWABLE_DISTRIBUTION' WHERE EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION') AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_SUPER_FACTORY');
--------------------------------------------------------------
-- Improvements
--------------------------------------------------------------
UPDATE Improvements SET  Description='LOC_IMPROVEMENT_SEASTEAD_DESCRIPTION'
WHERE ImprovementType = 'IMPROVEMENT_SEASTEAD' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
--------------------------------------------------------------
-- Improvement_Adjacencies
--------------------------------------------------------------
DELETE FROM Improvement_Adjacencies WHERE YieldChangeId = 'JNR_Seasteads_OffshoreWind_Gold' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
--------------------------------------------------------------
-- Improvement_ValidFeatures
--------------------------------------------------------------

--------------------------------------------------------------
-- Improvement_ValidTerrains
--------------------------------------------------------------
UPDATE Improvement_ValidTerrains SET  PrereqTech = NULL
WHERE ImprovementType = 'IMPROVEMENT_SOLAR_FARM' AND TerrainType = 'TERRAIN_TUNDRA' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
--------------------------------------------------------------
-- Improvement_YieldChanges
--------------------------------------------------------------
DELETE FROM Improvement_YieldChanges WHERE ImprovementType = 'IMPROVEMENT_WIND_FARM' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM Improvement_YieldChanges WHERE ImprovementType = 'IMPROVEMENT_OFFSHORE_WIND_FARM' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM Improvement_YieldChanges WHERE ImprovementType = 'IMPROVEMENT_SOLAR_FARM' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
--------------------------------------------------------------
-- ImprovementModifiers
--------------------------------------------------------------
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_GEOTHERMAL_PLANT_FISSURE_PRODUCTION' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_GEOTHERMAL_PLANT_FISSURE_GOLD' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_WIND_FARM_COASTAL_GOLD' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_OFFSHORE_WIND_FARM_OCEAN_GOLD' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_SOLAR_FARM_GRASS_GOLD' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_SOLAR_FARM_PLAINS_GOLD' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_SOLAR_FARM_DESERT_GOLD' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');

DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_RENEWABLE_ENERGY_BONUS_POWER_SOLAR_FARM_GRASS_DEFAULT' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_RENEWABLE_ENERGY_BONUS_POWER_SOLAR_FARM_PLAINS_DEFAULT' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_RENEWABLE_ENERGY_BONUS_POWER_SOLAR_FARM_DESERT_DEFAULT' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');

DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_RENEWABLE_ENERGY_BONUS_POWER_GEOTHERMAL_FISSURE' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_RENEWABLE_ENERGY_BONUS_POWER_WIND_FARM_COASTAL' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_RENEWABLE_ENERGY_BONUS_POWER_OFFSHORE_WIND_FARM_OCEAN' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
DELETE FROM ImprovementModifiers WHERE  ModifierId = 'JNR_RENEWABLE_ENERGY_BONUS_POWER_SOLAR_FARM_DESERT' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType='BUILDING_JNR_RENEWABLE_COLLECTION');
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------



