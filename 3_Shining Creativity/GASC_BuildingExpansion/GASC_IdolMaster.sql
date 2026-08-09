-- GASC_IdolMaster
-- Author: Flactine
-- DateCreated: 2/1/2024 8:30:42 PM
--------------------------------------------------------------
--=====
--BuildingReplaces
--=====
UPDATE BuildingReplaces SET ReplacesBuildingType = 'BUILDING_PHOTOSTUDIO' 
WHERE CivUniqueBuildingType = 'BUILDING_FLAC_IDOLPRO';

--=====
--MutuallyExclusiveBuildings
--=====
DELETE FROM MutuallyExclusiveBuildings 
WHERE Building = 'BUILDING_FLAC_IDOLPRO';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
(Building,			MutuallyExclusiveBuilding)
SELECT
a.BuildingType,		b.MutuallyExclusiveBuilding
FROM Buildings AS a, MutuallyExclusiveBuildings AS b
WHERE a.BuildingType = 'BUILDING_FLAC_IDOLPRO' AND b.Building = 'BUILDING_PHOTOSTUDIO';

--=====
--BuildingModifiers
--=====
DELETE FROM BuildingModifiers WHERE BuildingType = 'BUILDING_FLAC_IDOLPRO';

INSERT INTO BuildingModifiers			
(BuildingType,		ModifierId)
SELECT 
a.BuildingType, 	b.ModifierId
FROM Buildings AS a, BuildingModifiers AS b
WHERE a.BuildingType = 'BUILDING_FLAC_IDOLPRO' AND b.BuildingType = 'BUILDING_PHOTOSTUDIO';


