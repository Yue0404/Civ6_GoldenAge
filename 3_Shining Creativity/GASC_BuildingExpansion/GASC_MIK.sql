-- GASC_MIK
-- Author: Flactine
-- DateCreated: 4/24/2024 10:29:01 PM
--------------------------------------------------------------
--=====
--BuildingReplaces
--=====
UPDATE BuildingReplaces SET ReplacesBuildingType = 'BUILDING_SMELTERY' 
WHERE CivUniqueBuildingType = 'MIK_BLDG_MAPU_HUT';

UPDATE BuildingReplaces SET ReplacesBuildingType = 'BUILDING_PHOTOSTUDIO' 
WHERE CivUniqueBuildingType = 'MIK_BLDG_AUS_SCHOOL';

UPDATE BuildingReplaces SET ReplacesBuildingType = 'BUILDING_EPIC_THEATRE' 
WHERE CivUniqueBuildingType = 'MIK_BLDG_COL_CHICHERIA';

UPDATE BuildingReplaces SET ReplacesBuildingType = 'BUILDING_TAMPLE_STAGE' 
WHERE CivUniqueBuildingType = 'MIK_BLDG_IND_WAYANG';

UPDATE BuildingReplaces SET ReplacesBuildingType = 'BUILDING_POST_STATION' 
WHERE CivUniqueBuildingType = 'MIK_BLDG_CREE_SABTUAN';

--=====
--MutuallyExclusiveBuildings
--=====
DELETE FROM MutuallyExclusiveBuildings 
WHERE Building = 'MIK_BLDG_MAPU_HUT';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
(Building,			MutuallyExclusiveBuilding)
SELECT
a.BuildingType,		b.MutuallyExclusiveBuilding
FROM Buildings AS a, MutuallyExclusiveBuildings AS b
WHERE a.BuildingType = 'MIK_BLDG_MAPU_HUT' AND b.Building = 'BUILDING_SMELTERY';


DELETE FROM MutuallyExclusiveBuildings 
WHERE Building = 'MIK_BLDG_AUS_SCHOOL';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
(Building,			MutuallyExclusiveBuilding)
SELECT
a.BuildingType,		b.MutuallyExclusiveBuilding
FROM Buildings AS a, MutuallyExclusiveBuildings AS b
WHERE a.BuildingType = 'MIK_BLDG_AUS_SCHOOL' AND b.Building = 'BUILDING_PHOTOSTUDIO';

DELETE FROM MutuallyExclusiveBuildings 
WHERE Building = 'MIK_BLDG_COL_CHICHERIA';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
(Building,			MutuallyExclusiveBuilding)
SELECT
a.BuildingType,		b.MutuallyExclusiveBuilding
FROM Buildings AS a, MutuallyExclusiveBuildings AS b
WHERE a.BuildingType = 'MIK_BLDG_COL_CHICHERIA' AND b.Building = 'BUILDING_EPIC_THEATRE';

DELETE FROM MutuallyExclusiveBuildings 
WHERE Building = 'MIK_BLDG_IND_WAYANG';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
(Building,			MutuallyExclusiveBuilding)
SELECT
a.BuildingType,		b.MutuallyExclusiveBuilding
FROM Buildings AS a, MutuallyExclusiveBuildings AS b
WHERE a.BuildingType = 'MIK_BLDG_IND_WAYANG' AND b.Building = 'BUILDING_TAMPLE_STAGE';

DELETE FROM MutuallyExclusiveBuildings 
WHERE Building = 'MIK_BLDG_CREE_SABTUAN';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings
(Building,			MutuallyExclusiveBuilding)
SELECT
a.BuildingType,		b.MutuallyExclusiveBuilding
FROM Buildings AS a, MutuallyExclusiveBuildings AS b
WHERE a.BuildingType = 'MIK_BLDG_CREE_SABTUAN' AND b.Building = 'BUILDING_POST_STATION';