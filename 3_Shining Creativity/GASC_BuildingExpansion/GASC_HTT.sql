-- GASC_HTT
-- Author: Flactine
-- DateCreated: 2/1/2024 9:06:25 PM
--------------------------------------------------------------
--=====
--BuildingReplaces
--=====
UPDATE BuildingReplaces SET ReplacesBuildingType = 'BUILDING_OPERA_HOUSE' 
WHERE CivUniqueBuildingType = 'BUILDING_FLAC_LMCLUB';

--=====
--MutuallyExclusiveBuildings
--=====
DELETE FROM MutuallyExclusiveBuildings 
WHERE Building = 'BUILDING_FLAC_LMCLUB';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
(Building,			MutuallyExclusiveBuilding)
SELECT
a.BuildingType,		b.MutuallyExclusiveBuilding
FROM Buildings AS a, MutuallyExclusiveBuildings AS b
WHERE a.BuildingType = 'BUILDING_FLAC_LMCLUB' AND b.Building = 'BUILDING_OPERA_HOUSE';

--=====
--BuildingModifiers
--=====
DELETE FROM BuildingModifiers WHERE BuildingType = 'BUILDING_FLAC_LMCLUB';

INSERT INTO BuildingModifiers			
(BuildingType,		ModifierId)
SELECT 
a.BuildingType, 	b.ModifierId
FROM Buildings AS a, BuildingModifiers AS b
WHERE a.BuildingType = 'BUILDING_FLAC_LMCLUB' AND b.BuildingType = 'BUILDING_OPERA_HOUSE';
