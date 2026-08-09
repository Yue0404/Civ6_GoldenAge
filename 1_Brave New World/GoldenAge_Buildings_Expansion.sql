-- GoldenAge_BE_Main
-- Author: Flactine
-- DateCreated: 9/16/2022 5:00:29 PM
--------------------------------------------------------------
CREATE TABLE IF NOT EXISTS GA_BE_Involution (
	BuildingType    	TEXT	NOT NULL,
    PrereqDistrict    	TEXT	NOT NULL,
	Tier				INT		DEFAULT 0,
	DebuffName   		TEXT	DEFAULT NULL,
    YieldType   		TEXT	DEFAULT NULL,
	YieldChange   		INT		DEFAULT 0,
	
    PRIMARY KEY (BuildingType)
);

--Not Include Unique or Society Buildings
INSERT OR REPLACE INTO GA_BE_Involution
(BuildingType,					PrereqDistrict,		Tier,		DebuffName,	YieldType,				YieldChange)	
VALUES
--Campus
('BUILDING_RESEARCH_LAB',   	'DISTRICT_CAMPUS',	3,			'INV',		'YIELD_GOLD',			-1),
('BUILDING_BIOLOGY_LAB',   		'DISTRICT_CAMPUS',	3,			'INV',		'YIELD_GOLD',			-1),
('BUILDING_ANIMAL_LAB',   		'DISTRICT_CAMPUS',	3,			'INV',		'YIELD_GOLD',			-1),
('BUILDING_CHEMISTRY_LAB',      'DISTRICT_CAMPUS',	3,			'INV',		'YIELD_GOLD',			-1),
--Commercial                                                                
('BUILDING_STOCK_EXCHANGE',		'DISTRICT_COMMERCIAL_HUB',	3,	'CCOM',		'YIELD_PRODUCTION',		-1),
('BUILDING_URBAN_CONSTRUCTION',	'DISTRICT_COMMERCIAL_HUB',	3,	'CCOM',		'YIELD_PRODUCTION',		-1),
('BUILDING_MILITARY_CORP',     	'DISTRICT_COMMERCIAL_HUB',	3,	'CCOM',		'YIELD_PRODUCTION',		-1),
('BUILDING_LUXURY_GOODS',		'DISTRICT_COMMERCIAL_HUB',	4,	'ALAW',		'YIELD_PRODUCTION',		-3),
('BUILDING_DIGITAL_CURRENCY',	'DISTRICT_COMMERCIAL_HUB',	4,	'ALAW',		'YIELD_PRODUCTION',		-3),
('BUILDING_FINANCIAL_TOWER',	'DISTRICT_COMMERCIAL_HUB',	4,	'ALAW',		'YIELD_PRODUCTION',		-3),
('BUILDING_MINING_GROUP',		'DISTRICT_COMMERCIAL_HUB',	4,	'ALAW',		'YIELD_PRODUCTION',		-3),
--Industrial                                                                
('BUILDING_FACTORY',			'DISTRICT_INDUSTRIAL_ZONE',	2,	'ICOM',		'YIELD_GOLD',			-1),
('BUILDING_RAWMATERIAL',		'DISTRICT_INDUSTRIAL_ZONE',	2,	'ICOM',		'YIELD_GOLD',			-1),
('BUILDING_FABRICATION',		'DISTRICT_INDUSTRIAL_ZONE',	2,	'ICOM',		'YIELD_GOLD',			-1);

