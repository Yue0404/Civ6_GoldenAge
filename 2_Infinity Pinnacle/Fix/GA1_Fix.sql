-- GA1_Fix
-- Author: Flactine
-- DateCreated: 8/31/2022 9:33:44 AM
--------------------------------------------------------------
-------
--修复建筑拓展特色建筑冲突bug
-------
INSERT OR IGNORE INTO MutuallyExclusiveBuildings
(Building,						MutuallyExclusiveBuilding)
SELECT
a.CivUniqueBuildingType,		b.MutuallyExclusiveBuilding
FROM BuildingReplaces AS a, MutuallyExclusiveBuildings AS b WHERE a.ReplacesBuildingType = b.Building;

INSERT OR IGNORE INTO BuildingPrereqs
(Building,						PrereqBuilding)
SELECT
a.CivUniqueBuildingType,		b.PrereqBuilding
FROM BuildingReplaces AS a, BuildingPrereqs AS b WHERE a.ReplacesBuildingType = b.Building;
-------
--人造灾害的名字
-------
UPDATE RandomEvents
SET Name = 'LOC_RANDOM_EVENT_FLOOD_TRIGGERED_NAME'
WHERE RandomEventType = 'RANDOM_EVENT_FLOOD_TRIGGERED';

UPDATE RandomEvents
SET Name = 'LOC_RANDOM_EVENT_VOLCANO_TRIGGERED_NAME'
WHERE RandomEventType = 'RANDOM_EVENT_VOLCANO_TRIGGERED';

UPDATE RandomEvents
SET Name = 'LOC_RANDOM_EVENT_VOLCANO_TRIGGERED_NAME'
WHERE RandomEventType = 'RANDOM_EVENT_KILIMANJARO_TRIGGERED';

UPDATE RandomEvents
SET Name = 'LOC_RANDOM_EVENT_VOLCANO_TRIGGERED_NAME'
WHERE RandomEventType = 'RANDOM_EVENT_VESUVIUS_TRIGGERED';

UPDATE RandomEvents
SET Name = 'LOC_RANDOM_EVENT_VOLCANO_TRIGGERED_NAME'
WHERE RandomEventType = 'RANDOM_EVENT_EYJAFJALLAJOKULL_TRIGGERED';

UPDATE RandomEvents
SET Name = 'LOC_RANDOM_EVENT_BLIZZARD_TRIGGERED_NAME'
WHERE RandomEventType = 'RANDOM_EVENT_BLIZZARD_TRIGGERED';

UPDATE RandomEvents
SET Name = 'LOC_RANDOM_EVENT_DUST_STORM_TRIGGERED_NAME'
WHERE RandomEventType = 'RANDOM_EVENT_DUST_STORM_TRIGGERED';

UPDATE RandomEvents
SET Name = 'LOC_RANDOM_EVENT_JUNGLE_FIRE_TRIGGERED_NAME'
WHERE RandomEventType = 'RANDOM_EVENT_JUNGLE_FIRE_TRIGGERED';

UPDATE RandomEvents
SET Name = 'LOC_RANDOM_EVENT_FOREST_FIRE_TRIGGERED_NAME'
WHERE RandomEventType = 'RANDOM_EVENT_FOREST_FIRE_TRIGGERED';
