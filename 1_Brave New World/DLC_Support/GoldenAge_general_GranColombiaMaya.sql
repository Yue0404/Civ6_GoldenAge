--------------------------------------------------------------
-- Buildings
--------------------------------------------------------------
UPDATE Buildings SET Description = 'DLC_LOC_BUILDING_WATER_MILL_DESCRIPTION'
WHERE BuildingType = 'BUILDING_WATER_MILL';
--------------------------------------------------------------
-- Resource_YieldChanges
--------------------------------------------------------------
UPDATE Resource_YieldChanges SET YieldType = 'YIELD_FOOD', YieldChange = 1
WHERE ResourceType = 'RESOURCE_MAIZE';
--------------------------------------------------------------
-- Resource_Harvests
--------------------------------------------------------------
UPDATE Resource_Harvests SET YieldType = 'YIELD_FOOD', Amount = 20
WHERE ResourceType = 'RESOURCE_MAIZE';
--------------------------------------------------------------
-- BuildingModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO BuildingModifiers(BuildingType, ModifierId)
SELECT	'BUILDING_FOOD_MARKET', 'WATERMILL_ADDMAIZEYIELD';

