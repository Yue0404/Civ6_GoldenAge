-- GASC_LoveLive
-- Author: Flactine
-- DateCreated: 2/1/2024 9:01:00 PM
--------------------------------------------------------------
--=====
--BuildingReplaces
--=====
UPDATE BuildingReplaces SET ReplacesBuildingType = 'BUILDING_ART_ASSOCIATION' 
WHERE CivUniqueBuildingType = 'BUILDING_FLAC_IRCLUB';

--=====
--MutuallyExclusiveBuildings
--=====
DELETE FROM MutuallyExclusiveBuildings 
WHERE Building = 'BUILDING_FLAC_IRCLUB';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
(Building,			MutuallyExclusiveBuilding)
SELECT
a.BuildingType,		b.MutuallyExclusiveBuilding
FROM Buildings AS a, MutuallyExclusiveBuildings AS b
WHERE a.BuildingType = 'BUILDING_FLAC_IRCLUB' AND b.Building = 'BUILDING_ART_ASSOCIATION';

--=====
--BuildingModifiers
--=====
DELETE FROM BuildingModifiers WHERE BuildingType = 'BUILDING_FLAC_IRCLUB';

INSERT INTO BuildingModifiers			
(BuildingType,		ModifierId)
SELECT 
a.BuildingType, 	b.ModifierId
FROM Buildings AS a, BuildingModifiers AS b
WHERE a.BuildingType = 'BUILDING_FLAC_IRCLUB' AND b.BuildingType = 'BUILDING_ART_ASSOCIATION';