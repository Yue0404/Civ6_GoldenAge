-- GASC_Wonders
-- Author: Flactine
-- DateCreated: 2/11/2024 10:54:14 AM
--------------------------------------------------------------
INSERT OR REPLACE INTO BuildingPrereqs
(Building,		PrereqBuilding)		
SELECT
Building,		'BUILDING_MILITARY_CORP'
FROM BuildingPrereqs WHERE Building = 'BUILDING_PHANTA_WORLD_TRADE_CENTER';

INSERT OR REPLACE INTO BuildingPrereqs
(Building,		PrereqBuilding)		
SELECT
Building,		'BUILDING_URBAN_CONSTRUCTION'
FROM BuildingPrereqs WHERE Building = 'BUILDING_PHANTA_WORLD_TRADE_CENTER';

INSERT OR REPLACE INTO BuildingPrereqs
(Building,		PrereqBuilding)		
SELECT
Building,		'BUILDING_OPERA_HOUSE'
FROM BuildingPrereqs WHERE Building = 'BUILDING_ORIENTAL_PEARL_TOWER';

INSERT OR REPLACE INTO BuildingPrereqs
(Building,		PrereqBuilding)		
SELECT
Building,		'BUILDING_ART_ASSOCIATION'
FROM BuildingPrereqs WHERE Building = 'BUILDING_ORIENTAL_PEARL_TOWER';

INSERT OR REPLACE INTO BuildingPrereqs
(Building,		PrereqBuilding)		
SELECT
Building,		'BUILDING_PHOTOSTUDIO'
FROM BuildingPrereqs WHERE Building = 'BUILDING_ORIENTAL_PEARL_TOWER';