--=====
--MutuallyExclusiveBuildings
--=====
DELETE FROM MutuallyExclusiveBuildings 
WHERE Building = 'BUILDING_FLAC_IZUMITO';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
(Building,			MutuallyExclusiveBuilding)
SELECT
a.BuildingType,		b.MutuallyExclusiveBuilding
FROM Buildings AS a, MutuallyExclusiveBuildings AS b
WHERE a.BuildingType = 'BUILDING_FLAC_IZUMITO' AND b.Building = 'BUILDING_AQUARIUM';

--=====
--BuildingModifiers
--=====
DELETE FROM BuildingModifiers WHERE BuildingType = 'BUILDING_FLAC_IZUMITO';

INSERT OR REPLACE INTO BuildingModifiers			
(BuildingType,		ModifierId)
SELECT 
a.BuildingType, 	b.ModifierId
FROM Buildings AS a, BuildingModifiers AS b
WHERE a.BuildingType = 'BUILDING_FLAC_IZUMITO' AND b.BuildingType = 'BUILDING_AQUARIUM';

INSERT OR REPLACE INTO BuildingModifiers			
(BuildingType,				ModifierId)
SELECT 
a.BuildingType, 			b.ModifierId
FROM Buildings AS a, Modifiers AS b
WHERE a.BuildingType = 'BUILDING_FLAC_IZUMITO' AND b.ModifierId = 'MODIFIER_IZUMITO_MODERN_TOURISM';