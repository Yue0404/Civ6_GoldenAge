-- CB_REC_Icons
-- Author: JNR
--------------------------------------------------------------

-- IconTextureAtlases
--------------------------------------------------------------
INSERT OR IGNORE INTO IconTextureAtlases
(Name,									IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	
('ICON_ATLAS_JNR_RENEWABLE_RESOURCES',	38,			1,				1,				'JNRRenewableEnergyResource38'),
('ICON_ATLAS_JNR_RENEWABLE_RESOURCES',	50,			1,				1,				'JNRRenewableEnergyResource50'),
('ICON_ATLAS_JNR_RENEWABLE_RESOURCES',	64,			1,				1,				'JNRRenewableEnergyResource64'),
('ICON_ATLAS_JNR_RENEWABLE_RESOURCES',	256,		1,				1,				'JNRRenewableEnergyResource256'),

('ICON_ATLAS_JNR_CB_REC_BUILDINGS',		32,			2,				2,				'CB_REC_Buildings32'),
('ICON_ATLAS_JNR_CB_REC_BUILDINGS',		38,			2,				2,				'CB_REC_Buildings38'),
('ICON_ATLAS_JNR_CB_REC_BUILDINGS',		50,			2,				2,				'CB_REC_Buildings50'),
('ICON_ATLAS_JNR_CB_REC_BUILDINGS',		80,			2,				2,				'CB_REC_Buildings80'),
('ICON_ATLAS_JNR_CB_REC_BUILDINGS',		128,		2,				2,				'CB_REC_Buildings128'),
('ICON_ATLAS_JNR_CB_REC_BUILDINGS',		256,		2,				2,				'CB_REC_Buildings256'),

('ICON_ATLAS_JNR_UC_REC_UNITACTIONS',	38,	 		1,				1,				'UC_REC_UnitActions38.dds'),
('ICON_ATLAS_JNR_UC_REC_UNITACTIONS',	50,	 		1,				1,				'UC_REC_UnitActions50.dds'),
('ICON_ATLAS_JNR_UC_REC_UNITACTIONS',	80,	 		1,				1,				'UC_REC_UnitActions80.dds'),
('ICON_ATLAS_JNR_UC_REC_UNITACTIONS',	256,	 	1,				1,				'UC_REC_UnitActions256.dds');

INSERT OR IGNORE INTO IconTextureAtlases
(Name,										Baseline,	IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	
('ICON_ATLAS_JNR_RENEWABLE_RESOURCES_FONT',	6,			22,			1,				1,				'JNRRenewableEnergyResourceFontIcon');
--------------------------------------------------------------

-- IconDefinitions
--------------------------------------------------------------
INSERT OR IGNORE INTO IconDefinitions
(Name,												Atlas,										'Index')
VALUES	
('ICON_RESOURCE_JNR_BATTERY_CHARGE',				'ICON_ATLAS_JNR_RENEWABLE_RESOURCES',		0),
('RESOURCE_JNR_BATTERY_CHARGE',						'ICON_ATLAS_JNR_RENEWABLE_RESOURCES_FONT',	0),
('ICON_BUILDING_JNR_RENEWABLE_DISTRIBUTION',		'ICON_ATLAS_JNR_CB_REC_BUILDINGS',			0),
('ICON_BUILDING_JNR_RENEWABLE_DISTRIBUTION_FOW',	'ICON_ATLAS_BUILDINGS_FOW',					27),
('ICON_BUILDING_JNR_RENEWABLE_COLLECTION',			'ICON_ATLAS_JNR_CB_REC_BUILDINGS',			1),
('ICON_BUILDING_JNR_RENEWABLE_COLLECTION_FOW',		'ICON_ATLAS_BUILDINGS_FOW',					27),
('ICON_PROJECT_JNR_CONVERT_REACTOR_TO_BATTERY',		'ICON_ATLAS_JNR_CB_REC_BUILDINGS',			2),
('ICON_IMPROVEMENT_JNR_RENEWABLE_COLLECTION',		'ICON_ATLAS_JNR_UC_REC_UNITACTIONS',		0);
--------------------------------------------------------------