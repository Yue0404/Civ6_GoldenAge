-- Icons
-- Author: Flactine
-- DateCreated: 10/2/2021 9:22:22 PM
--------------------------------------------------------------
--=====
--IconTextureAtlases
--=====
INSERT INTO IconTextureAtlases 
(Name,										IconSize,	IconsPerRow,	IconsPerColumn, Filename)
VALUES
('ICON_ATLAS_UNIT_GA_INVISIBLE',			22,			2,				1,				'Invisible_22'),
('ICON_ATLAS_UNIT_GA_INVISIBLE',			32,			2,				1,				'Invisible_32'),
('ICON_ATLAS_UNIT_GA_INVISIBLE',			38,			2,				1,				'Invisible_38'),
('ICON_ATLAS_UNIT_GA_INVISIBLE',			50,			2,				1,				'Invisible_50'),
('ICON_ATLAS_UNIT_GA_INVISIBLE',			80,			2,				1,				'Invisible_80'),
('ICON_ATLAS_UNIT_GA_INVISIBLE',			256,		2,				1,				'Invisible_256'),
('PORTRAIT_ATLAS_UNIT_GA_INVISIBLE',		38,			2,				1,				'InvisiblePortrait_38'),
('PORTRAIT_ATLAS_UNIT_GA_INVISIBLE',		50,			2,				1,				'InvisiblePortrait_50'),
('PORTRAIT_ATLAS_UNIT_GA_INVISIBLE',		70,			2,				1,				'InvisiblePortrait_70'),
('PORTRAIT_ATLAS_UNIT_GA_INVISIBLE',		95,			2,				1,				'InvisiblePortrait_95'),
('PORTRAIT_ATLAS_UNIT_GA_INVISIBLE',		200,		2,				1,				'InvisiblePortrait_200'),
('PORTRAIT_ATLAS_UNIT_GA_INVISIBLE',		256,		2,				1,				'InvisiblePortrait_256');
--=====
--IconDefinitions
--=====
INSERT OR REPLACE INTO IconDefinitions
(Name,								Atlas,									'Index')
VALUES
('ICON_UNIT_GA_STEALTH_1',			'ICON_ATLAS_UNIT_GA_INVISIBLE',			0),
('ICON_UNIT_GA_STEALTH_1_WHITE',	'ICON_ATLAS_UNIT_GA_INVISIBLE',			0),
('ICON_UNIT_GA_STEALTH_1_BLACK',	'ICON_ATLAS_UNIT_GA_INVISIBLE',			0),
('ICON_UNIT_GA_STEALTH_1_PORTRAIT',	'PORTRAIT_ATLAS_UNIT_GA_INVISIBLE',		0),
('ICON_UNIT_GA_STEALTH_2',			'ICON_ATLAS_UNIT_GA_INVISIBLE',			1),
('ICON_UNIT_GA_STEALTH_2_WHITE',	'ICON_ATLAS_UNIT_GA_INVISIBLE',			1),
('ICON_UNIT_GA_STEALTH_2_BLACK',	'ICON_ATLAS_UNIT_GA_INVISIBLE',			1),
('ICON_UNIT_GA_STEALTH_2_PORTRAIT',	'PORTRAIT_ATLAS_UNIT_GA_INVISIBLE',		1);