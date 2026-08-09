----------------
-- Unit Types --
----------------
INSERT OR REPLACE INTO Types 
(Type,						Kind) VALUES
--远程
('UNIT_CULVERIN',			'KIND_UNIT'),
('UNIT_HOWITZER',			'KIND_UNIT'),
('UNIT_MISSILE_VEHICLE',	'KIND_UNIT'),
--近战
('UNIT_ELITE_INFANTRY',		'KIND_UNIT'),
--抗骑兵
('UNIT_HEAVY_INFANTRY',		'KIND_UNIT'),
('UNIT_ARQUEBUSIER',		'KIND_UNIT'),
('UNIT_AT_MISSILE',			'KIND_UNIT'),
--攻城
('UNIT_RIFLED_CANNON',		'KIND_UNIT'),
('UNIT_ATOMIC_ARTILLERY',	'KIND_UNIT'),
--重骑兵
('UNIT_ARMORED_HORSEMAN',	'KIND_UNIT'),
('UNIT_REITER',				'KIND_UNIT'),
('UNIT_LANDSHIP',			'KIND_UNIT'),
--轻骑兵
('UNIT_DRAGOON',			'KIND_UNIT'),
('UNIT_CARABINIER',			'KIND_UNIT'),
('UNIT_SUPER_HELICOPTER',	'KIND_UNIT');
-----------------------------------------------
-- 区分远程单位与可以远程攻击的单位
-----------------------------------------------
INSERT OR REPLACE INTO TypeTags
(Type,							Tag) VALUES
('UNIT_CULVERIN',				'CLASS_TRUE_RANGED'),
('UNIT_HOWITZER',				'CLASS_TRUE_RANGED'),
('UNIT_MISSILE_VEHICLE',		'CLASS_TRUE_RANGED');
-------------------
-- Unit AI Infos --
-------------------
INSERT OR REPLACE INTO UnitAIInfos
(UnitType,						AiType) VALUES
--远程
('UNIT_CULVERIN',				'UNITAI_COMBAT'),
('UNIT_CULVERIN',				'UNITTYPE_RANGED'),
('UNIT_CULVERIN',				'UNITTYPE_LAND_COMBAT'),
('UNIT_HOWITZER',				'UNITAI_COMBAT'),
('UNIT_HOWITZER',				'UNITTYPE_RANGED'),
('UNIT_HOWITZER',				'UNITTYPE_LAND_COMBAT'),
('UNIT_MISSILE_VEHICLE',		'UNITAI_COMBAT'),
('UNIT_MISSILE_VEHICLE',		'UNITTYPE_RANGED'),
('UNIT_MISSILE_VEHICLE',		'UNITTYPE_LAND_COMBAT'),
--近战
('UNIT_ELITE_INFANTRY',			'UNITAI_COMBAT'),
('UNIT_ELITE_INFANTRY',			'UNITAI_EXPLORE'),
('UNIT_ELITE_INFANTRY',			'UNITTYPE_MELEE'),
('UNIT_ELITE_INFANTRY',			'UNITTYPE_LAND_COMBAT'),
--抗骑兵
('UNIT_HEAVY_INFANTRY',			'UNITAI_COMBAT'),
('UNIT_HEAVY_INFANTRY',			'UNITAI_EXPLORE'),
('UNIT_HEAVY_INFANTRY',			'UNITTYPE_MELEE'),
('UNIT_HEAVY_INFANTRY',			'UNITTYPE_LAND_COMBAT'),
('UNIT_ARQUEBUSIER',			'UNITAI_COMBAT'),
('UNIT_ARQUEBUSIER',			'UNITAI_EXPLORE'),
('UNIT_ARQUEBUSIER',			'UNITTYPE_MELEE'),
('UNIT_ARQUEBUSIER',			'UNITTYPE_LAND_COMBAT'),
('UNIT_AT_MISSILE',				'UNITAI_COMBAT'),
('UNIT_AT_MISSILE',				'UNITAI_EXPLORE'),
('UNIT_AT_MISSILE',				'UNITTYPE_MELEE'),
('UNIT_AT_MISSILE',				'UNITTYPE_LAND_COMBAT'),
--攻城
('UNIT_RIFLED_CANNON',			'UNITAI_COMBAT'),
('UNIT_RIFLED_CANNON',			'UNITTYPE_RANGED'),
('UNIT_RIFLED_CANNON',			'UNITTYPE_SIEGE'),
('UNIT_RIFLED_CANNON',			'UNITTYPE_SIEGE_ALL'),
('UNIT_RIFLED_CANNON',			'UNITTYPE_LAND_COMBAT'),
('UNIT_ATOMIC_ARTILLERY',		'UNITAI_COMBAT'),
('UNIT_ATOMIC_ARTILLERY',		'UNITTYPE_RANGED'),
('UNIT_ATOMIC_ARTILLERY',		'UNITTYPE_SIEGE'),
('UNIT_ATOMIC_ARTILLERY',		'UNITTYPE_SIEGE_ALL'),
('UNIT_ATOMIC_ARTILLERY',		'UNITTYPE_LAND_COMBAT'),
--重骑兵
('UNIT_ARMORED_HORSEMAN',		'UNITAI_COMBAT'),
('UNIT_ARMORED_HORSEMAN',		'UNITTYPE_MELEE'),
('UNIT_ARMORED_HORSEMAN',		'UNITTYPE_CAVALRY'),
('UNIT_ARMORED_HORSEMAN',		'UNITTYPE_LAND_COMBAT'),
('UNIT_REITER',					'UNITAI_COMBAT'),
('UNIT_REITER',					'UNITTYPE_MELEE'),
('UNIT_REITER',					'UNITTYPE_CAVALRY'),
('UNIT_REITER',					'UNITTYPE_LAND_COMBAT'),
('UNIT_LANDSHIP',				'UNITAI_COMBAT'),
('UNIT_LANDSHIP',				'UNITTYPE_MELEE'),
('UNIT_LANDSHIP',				'UNITTYPE_CAVALRY'),
('UNIT_LANDSHIP',				'UNITTYPE_LAND_COMBAT'),
--轻骑兵
('UNIT_DRAGOON',				'UNITAI_COMBAT'),
('UNIT_DRAGOON',				'UNITAI_EXPLORE'),
('UNIT_DRAGOON',				'UNITTYPE_CAVALRY'),
('UNIT_DRAGOON',				'UNITTYPE_MELEE'),
('UNIT_DRAGOON',				'UNITTYPE_LAND_COMBAT'),
('UNIT_CARABINIER',				'UNITAI_COMBAT'),
('UNIT_CARABINIER',				'UNITAI_EXPLORE'),
('UNIT_CARABINIER',				'UNITTYPE_CAVALRY'),
('UNIT_CARABINIER',				'UNITTYPE_MELEE'),
('UNIT_CARABINIER',				'UNITTYPE_LAND_COMBAT'),
('UNIT_SUPER_HELICOPTER',		'UNITAI_COMBAT'),
('UNIT_SUPER_HELICOPTER',		'UNITAI_EXPLORE'),
('UNIT_SUPER_HELICOPTER',		'UNITTYPE_CAVALRY'),
('UNIT_SUPER_HELICOPTER',		'UNITTYPE_MELEE'),
('UNIT_SUPER_HELICOPTER',		'UNITTYPE_LAND_COMBAT');
---------------------
-- Class Type Tags --
---------------------
INSERT OR REPLACE INTO TypeTags
(Type,							Tag) VALUES
--远程
('UNIT_CULVERIN',				'CLASS_RANGED'),
('UNIT_HOWITZER',				'CLASS_RANGED'),
('UNIT_MISSILE_VEHICLE',		'CLASS_RANGED'),
--近战
('UNIT_ELITE_INFANTRY',			'CLASS_MELEE'),
--抗骑兵
('UNIT_HEAVY_INFANTRY',			'CLASS_ANTI_CAVALRY'),
('UNIT_ARQUEBUSIER',			'CLASS_ANTI_CAVALRY'),
('UNIT_AT_MISSILE',				'CLASS_ANTI_CAVALRY'),
--攻城
('UNIT_RIFLED_CANNON',			'CLASS_SIEGE'),
('UNIT_RIFLED_CANNON',			'CLASS_SIEGE_SETUP'),
('UNIT_RIFLED_CANNON',			'CLASS_FORWARD_OBSERVER'),
('UNIT_ATOMIC_ARTILLERY',		'CLASS_SIEGE'),
('UNIT_ATOMIC_ARTILLERY',		'CLASS_SIEGE_SETUP'),
('UNIT_ATOMIC_ARTILLERY',		'CLASS_FORWARD_OBSERVER'),
--重骑兵
('UNIT_ARMORED_HORSEMAN',		'CLASS_HEAVY_CAVALRY'),
('UNIT_REITER',					'CLASS_HEAVY_CAVALRY'),
('UNIT_LANDSHIP',				'CLASS_HEAVY_CAVALRY'),
--轻骑兵
('UNIT_DRAGOON',				'CLASS_LIGHT_CAVALRY'),
('UNIT_CARABINIER',				'CLASS_LIGHT_CAVALRY'),
('UNIT_SUPER_HELICOPTER',		'CLASS_LIGHT_CAVALRY');
---------------
-- New Units --
---------------
INSERT OR REPLACE INTO Units
(UnitType, 					BaseMoves, 	Cost,	AdvisorType,		BaseSightRange,	ZoneOfControl,	Domain,			FormationClass,					Name,									Description,								PurchaseYield,	PromotionClass,						Maintenance,	Combat,	RangedCombat,	Range,	Bombard,	StrategicResource,	PrereqTech,						MandatoryObsoleteTech,		CanTargetAir,	AntiAirCombat,	CanCapture) VALUES
--远程
('UNIT_CULVERIN',			2,			340,	'ADVISOR_CONQUEST',	1,				0,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_CULVERIN_NAME',				'LOC_UNIT_CULVERIN_DESCRIPTION',			'YIELD_GOLD',	'PROMOTION_CLASS_RANGED',			4,				40,		50,				2,		0,			null,				'TECH_PRINTING',				'TECH_SCIENTIFIC_THEORY',	0,				0,				1),
('UNIT_HOWITZER',			2,			700,	'ADVISOR_CONQUEST',	1,				0,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_HOWITZER_NAME',				'LOC_UNIT_HOWITZER_DESCRIPTION',			'YIELD_GOLD',	'PROMOTION_CLASS_RANGED',			6,				60,		70,				2,		0,			null,				'TECH_REFINING',				'TECH_ADVANCED_BALLISTICS',	0,				0,				1),
('UNIT_MISSILE_VEHICLE',	2,			1100,	'ADVISOR_CONQUEST',	1,				0,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_MISSILE_VEHICLE_NAME',		'LOC_UNIT_MISSILE_VEHICLE_DESCRIPTION',		'YIELD_GOLD',	'PROMOTION_CLASS_RANGED',			8,				80,		90,				2,		0,			null,				'TECH_GUIDANCE_SYSTEMS',		null,						0,				0,				1),
--近战
('UNIT_ELITE_INFANTRY',		2,			800,	'ADVISOR_CONQUEST',	1,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_ELITE_INFANTRY_NAME',			'LOC_UNIT_ELITE_INFANTRY_DESCRIPTION',		'YIELD_GOLD',	'PROMOTION_CLASS_MELEE',			7,				87,		0,				0,		0,			'RESOURCE_NITER',	'TECH_COMBINED_ARMS',			'TECH_LASERS',				0,				0,				1),
--抗骑兵
('UNIT_HEAVY_INFANTRY',		2,			80,		'ADVISOR_CONQUEST',	1,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_HEAVY_INFANTRY_NAME',			'LOC_UNIT_HEAVY_INFANTRY_DESCRIPTION',		'YIELD_GOLD',	'PROMOTION_CLASS_ANTI_CAVALRY',		2,				33,		0,				0,		0,			null,				'TECH_IRON_WORKING',			'TECH_MILITARY_TACTICS',	0,				0,				1),
('UNIT_ARQUEBUSIER',		2,			400,	'ADVISOR_CONQUEST',	1,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_ARQUEBUSIER_NAME',			'LOC_UNIT_ARQUEBUSIER_DESCRIPTION',			'YIELD_GOLD',	'PROMOTION_CLASS_ANTI_CAVALRY',		5,				63,		0,				0,		0,			null,				'TECH_RIFLING',					'TECH_REPLACEABLE_PARTS',	0,				0,				1),
('UNIT_AT_MISSILE',			2,			1000,	'ADVISOR_CONQUEST',	1,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_UNIT_AT_MISSILE_NAME',		'LOC_UNIT_AT_MISSILE_DESCRIPTION',			'YIELD_GOLD',	'PROMOTION_CLASS_ANTI_CAVALRY',		8,				93,		0,				0,		0,			null,				'TECH_COMPOSITES',				null,						0,				0,				1),
--攻城
('UNIT_RIFLED_CANNON',		1,			600,	'ADVISOR_CONQUEST',	1,				0,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_RIFLED_CANNON_NAME',			'LOC_UNIT_RIFLED_CANNON_DESCRIPTION',		'YIELD_GOLD',	'PROMOTION_CLASS_SIEGE',			5,				50,		0,				3,		70,			'RESOURCE_IRON',	'TECH_BALLISTICS',				'TECH_STEEL',				0,				0,				1),
('UNIT_ATOMIC_ARTILLERY',	1,			1000,	'ADVISOR_CONQUEST',	1,				0,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_ATOMIC_ARTILLERY_NAME',		'LOC_UNIT_ATOMIC_ARTILLERY_DESCRIPTION',	'YIELD_GOLD',	'PROMOTION_CLASS_SIEGE',			7,				70,		0,				3,		90,			'RESOURCE_IRON',	'TECH_COMBINED_ARMS',			'TECH_GUIDANCE_SYSTEMS',	0,				0,				1),
--重骑兵
('UNIT_ARMORED_HORSEMAN',	4,			160,	'ADVISOR_CONQUEST',	2,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_ARMORED_HORSEMAN_NAME',		'LOC_UNIT_ARMORED_HORSEMAN_DESCRIPTION',	'YIELD_GOLD',	'PROMOTION_CLASS_HEAVY_CAVALRY',	2,				40,		0,				0,		0,			'RESOURCE_HORSES',	'TECH_HORSEBACK_RIDING',		'TECH_STIRRUPS',			0,				0,				1),
('UNIT_REITER',				4,			400,	'ADVISOR_CONQUEST',	2,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_REITER_NAME',					'LOC_UNIT_REITER_DESCRIPTION',				'YIELD_GOLD',	'PROMOTION_CLASS_HEAVY_CAVALRY',	4,				60,		0,				0,		0,			'RESOURCE_HORSES',	'TECH_METAL_CASTING',			'TECH_MILITARY_SCIENCE',	0,				0,				1),
('UNIT_LANDSHIP',			4,			800,	'ADVISOR_CONQUEST',	2,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_LANDSHIP_NAME',				'LOC_UNIT_LANDSHIP_DESCRIPTION',			'YIELD_GOLD',	'PROMOTION_CLASS_HEAVY_CAVALRY',	6,				80,		0,				0,		0,			'RESOURCE_OIL',		'TECH_COMBUSTION',				'TECH_SYNTHETIC_MATERIALS',	0,				0,				1),
--轻骑兵
('UNIT_DRAGOON',			5,			340,	'ADVISOR_CONQUEST',	2,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_DRAGOON_NAME',				'LOC_UNIT_DRAGOON_DESCRIPTION',				'YIELD_GOLD',	'PROMOTION_CLASS_LIGHT_CAVALRY',	4,				55,		0,				0,		0,			'RESOURCE_HORSES',	'TECH_METAL_CASTING',			'TECH_MILITARY_SCIENCE',	0,				0,				1),
('UNIT_CARABINIER',			5,			700,	'ADVISOR_CONQUEST',	2,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_CARABINIER_NAME',				'LOC_UNIT_CARABINIER_DESCRIPTION',			'YIELD_GOLD',	'PROMOTION_CLASS_LIGHT_CAVALRY',	6,				75,		0,				0,		0,			'RESOURCE_HORSES',	'TECH_COMBUSTION',				'TECH_SYNTHETIC_MATERIALS',	0,				0,				1),
('UNIT_SUPER_HELICOPTER',	5,			1100,	'ADVISOR_CONQUEST',	2,				1,				'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	'LOC_UNIT_SUPER_HELICOPTER_NAME',		'LOC_UNIT_SUPER_HELICOPTER_DESCRIPTION',	'YIELD_GOLD',	'PROMOTION_CLASS_LIGHT_CAVALRY',	8,				95,		0,				0,		0,			'RESOURCE_OIL',		'TECH_ROBOTICS',				null,						0,				0,				1);

--远程
UPDATE Units SET BaseSightRange = 1
WHERE PromotionClass = 'PROMOTION_CLASS_RANGED';
UPDATE Units SET Cost = 60, Combat = 10, RangedCombat = 20, Maintenance = 1, PrereqTech = 'TECH_ARCHERY', MandatoryObsoleteTech = 'TECH_CURRENCY', Range = 2
WHERE UnitType = 'UNIT_SLINGER';
UPDATE Units SET Cost = 120, Combat = 20, RangedCombat = 30, Maintenance = 2, PrereqTech = 'TECH_CURRENCY', MandatoryObsoleteTech = 'TECH_APPRENTICESHIP'
WHERE UnitType = 'UNIT_ARCHER';
UPDATE Units SET Cost = 220, Combat = 30, RangedCombat = 40, Maintenance = 3, PrereqTech = 'TECH_APPRENTICESHIP', MandatoryObsoleteTech = 'TECH_PRINTING'
WHERE UnitType = 'UNIT_CROSSBOWMAN';
-- UPDATE Units SET Cost = 340, Combat = 40, RangedCombat = 50, Maintenance = 4, PrereqTech = 'TECH_PRINTING', MandatoryObsoleteTech = 'TECH_SCIENTIFIC_THEORY'
-- WHERE UnitType = 'UNIT_CULVERIN';
UPDATE Units SET Cost = 500, Combat = 50, RangedCombat = 60, Maintenance = 5, PrereqTech = 'TECH_SCIENTIFIC_THEORY', MandatoryObsoleteTech = 'TECH_REFINING'
WHERE UnitType = 'UNIT_FIELD_CANNON';
-- UPDATE Units SET Cost = 700, Combat = 60, RangedCombat = 70, Maintenance = 6, PrereqTech = 'TECH_REFINING', MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS'
-- WHERE UnitType = 'UNIT_HOWITZER';
UPDATE Units SET Cost = 900, Combat = 70, RangedCombat = 80, Maintenance = 7, PrereqTech = 'TECH_ADVANCED_BALLISTICS', MandatoryObsoleteTech = 'TECH_GUIDANCE_SYSTEMS'
WHERE UnitType = 'UNIT_MACHINE_GUN';
-- UPDATE Units SET Cost = 1100, Combat = 80, RangedCombat = 90, Maintenance = 8, PrereqTech = 'TECH_GUIDANCE_SYSTEMS'
-- WHERE UnitType = 'UNIT_MISSILE_VEHICLE';

--近战
UPDATE Units SET BaseSightRange = 1
WHERE PromotionClass = 'PROMOTION_CLASS_MELEE';
UPDATE Units SET Cost = 40, Combat = 27, Maintenance = 1, MandatoryObsoleteTech = 'TECH_IRON_WORKING'
WHERE UnitType = 'UNIT_WARRIOR';
UPDATE Units SET Cost = 80, Combat = 37, Maintenance = 2, PrereqTech = 'TECH_IRON_WORKING', MandatoryObsoleteTech = 'TECH_MILITARY_TACTICS', StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_SWORDSMAN';
UPDATE Units SET Cost = 160, Combat = 47, Maintenance = 3, PrereqTech = 'TECH_MILITARY_TACTICS', MandatoryObsoleteTech = 'TECH_GUNPOWDER', StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_MAN_AT_ARMS';
UPDATE Units SET Cost = 280, Combat = 57, Maintenance = 4, PrereqTech = 'TECH_GUNPOWDER', MandatoryObsoleteTech = 'TECH_RIFLING', StrategicResource='RESOURCE_NITER'
WHERE UnitType = 'UNIT_MUSKETMAN';
UPDATE Units SET Cost = 400, Combat = 67, Maintenance = 5, PrereqTech = 'TECH_RIFLING', MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS', StrategicResource='RESOURCE_NITER'
WHERE UnitType = 'UNIT_LINE_INFANTRY';
UPDATE Units SET Cost = 600, Combat = 77, Maintenance = 6, PrereqTech = 'TECH_REPLACEABLE_PARTS', MandatoryObsoleteTech = 'TECH_COMBINED_ARMS', StrategicResource='RESOURCE_NITER'
WHERE UnitType = 'UNIT_INFANTRY';
-- UPDATE Units SET Cost = 800, Combat = 87, Maintenance = 7, PrereqTech = 'TECH_COMBINED_ARMS', MandatoryObsoleteTech = 'TECH_LASERS', StrategicResource='RESOURCE_NITER'
-- WHERE UnitType = 'UNIT_ELITE_INFANTRY';
UPDATE Units SET Cost = 1000, Combat = 97, Maintenance = 8, PrereqTech = 'TECH_LASERS', StrategicResource='RESOURCE_NITER'
WHERE UnitType = 'UNIT_MECHANIZED_INFANTRY';

--抗骑兵
UPDATE Units SET BaseSightRange = 1
WHERE PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY';
UPDATE Units SET Cost = 40, Combat = 23, Maintenance = 1, PrereqTech = 'TECH_BRONZE_WORKING', MandatoryObsoleteTech = 'TECH_IRON_WORKING'
WHERE UnitType = 'UNIT_SPEARMAN';
-- UPDATE Units SET Cost = 80, Combat = 33, Maintenance = 2, PrereqTech = 'TECH_IRON_WORKING', MandatoryObsoleteTech = 'TECH_MILITARY_TACTICS'
-- WHERE UnitType = 'UNIT_HEAVY_INFANTRY';
UPDATE Units SET Cost = 160, Combat = 43, Maintenance = 3, PrereqTech = 'TECH_MILITARY_TACTICS', MandatoryObsoleteTech = 'TECH_GUNPOWDER'
WHERE UnitType = 'UNIT_PIKEMAN';
UPDATE Units SET Cost = 280, Combat = 53, Maintenance = 4, PrereqTech = 'TECH_GUNPOWDER', MandatoryObsoleteTech = 'TECH_RIFLING'
WHERE UnitType = 'UNIT_PIKE_AND_SHOT';
-- UPDATE Units SET Cost = 400, Combat = 63, Maintenance = 5, PrereqTech = 'TECH_RIFLING', MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS'
-- WHERE UnitType = 'UNIT_ARQUEBUSIER';
UPDATE Units SET Cost = 600, Combat = 73, Maintenance = 6, PrereqTech = 'TECH_REPLACEABLE_PARTS', MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS'
WHERE UnitType = 'UNIT_AT_CREW';
UPDATE Units SET Cost = 800, Combat = 83, Maintenance = 7, PrereqTech = 'TECH_ADVANCED_BALLISTICS', MandatoryObsoleteTech = 'TECH_COMPOSITES', BaseMoves = 2
WHERE UnitType = 'UNIT_MODERN_AT';
-- UPDATE Units SET Cost = 1000, Combat = 93, Maintenance = 8, PrereqTech = 'TECH_COMPOSITES'
-- WHERE UnitType = 'UNIT_AT_MISSILE';

--攻城
UPDATE Units SET BaseSightRange = 1
WHERE PromotionClass = 'PROMOTION_CLASS_SIEGE';
UPDATE Units SET Cost = 160, Combat = 20, Bombard = 40, Range = 3, BaseMoves = 1, Maintenance = 2, PrereqTech = 'TECH_ENGINEERING', MandatoryObsoleteTech = 'TECH_CASTLES', StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_CATAPULT';
UPDATE Units SET Cost = 280, Combat = 30, Bombard = 50, Range = 3, BaseMoves = 1, Maintenance = 3, PrereqTech = 'TECH_CASTLES', MandatoryObsoleteTech = 'TECH_SIEGE_TACTICS', StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_TREBUCHET';
UPDATE Units SET Cost = 400, Combat = 40, Bombard = 60, Range = 3, BaseMoves = 1, Maintenance = 4, PrereqTech = 'TECH_SIEGE_TACTICS', MandatoryObsoleteTech = 'TECH_BALLISTICS', StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_BOMBARD';
-- UPDATE Units SET Cost = 600, Combat = 50, Bombard = 70, Range = 3, BaseMoves = 1, Maintenance = 5, PrereqTech = 'TECH_BALLISTICS', MandatoryObsoleteTech = 'TECH_STEEL', StrategicResource='RESOURCE_IRON'
-- WHERE UnitType = 'UNIT_RIFLED_CANNON';
UPDATE Units SET Cost = 800, Combat = 60, Bombard = 80, Range = 3, BaseMoves = 1, Maintenance = 6, PrereqTech = 'TECH_STEEL', MandatoryObsoleteTech = 'TECH_COMBINED_ARMS', StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_ARTILLERY';
-- UPDATE Units SET Cost = 1000, Combat = 70, Bombard = 90, Range = 3, BaseMoves = 1, Maintenance = 7, PrereqTech = 'TECH_COMBINED_ARMS', MandatoryObsoleteTech = 'TECH_GUIDANCE_SYSTEMS', StrategicResource='RESOURCE_IRON'
-- WHERE UnitType = 'UNIT_ATOMIC_ARTILLERY';
UPDATE Units SET Cost = 1200, Combat = 80, Bombard = 100, Range = 3, BaseMoves = 1, Maintenance = 8, PrereqTech = 'TECH_GUIDANCE_SYSTEMS', StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_ROCKET_ARTILLERY';

--重骑兵
UPDATE Units SET Cost = 80, Combat = 30, Maintenance = 1, PrereqTech = 'TECH_THE_WHEEL', MandatoryObsoleteTech = 'TECH_HORSEBACK_RIDING'
WHERE UnitType = 'UNIT_HEAVY_CHARIOT';
-- UPDATE Units SET Cost = 160, Combat = 40, Maintenance = 2, PrereqTech = 'TECH_HORSEBACK_RIDING', MandatoryObsoleteTech = 'TECH_STIRRUPS', StrategicResource='RESOURCE_HORSES'
-- WHERE UnitType = 'UNIT_ARMORED_HORSEMAN';
UPDATE Units SET Cost = 280, Combat = 50, Maintenance = 3, PrereqTech = 'TECH_STIRRUPS', MandatoryObsoleteTech = 'TECH_METAL_CASTING', StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_KNIGHT';
-- UPDATE Units SET Cost = 400, Combat = 60, Maintenance = 4, PrereqTech = 'TECH_METAL_CASTING', MandatoryObsoleteTech = 'TECH_MILITARY_SCIENCE', StrategicResource='RESOURCE_HORSES'
-- WHERE UnitType = 'UNIT_REITER';
UPDATE Units SET Cost = 600, Combat = 70, Maintenance = 5, PrereqTech = 'TECH_MILITARY_SCIENCE', MandatoryObsoleteTech = 'TECH_COMBUSTION', StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_CUIRASSIER';
-- UPDATE Units SET Cost = 800, Combat = 80, Maintenance = 6, PrereqTech = 'TECH_COMBUSTION', MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS', StrategicResource='RESOURCE_OIL'
-- WHERE UnitType = 'UNIT_LANDSHIP';
UPDATE Units SET Cost = 1000, Combat = 90, Maintenance = 7, PrereqTech = 'TECH_SYNTHETIC_MATERIALS', MandatoryObsoleteTech = 'TECH_ROBOTICS', StrategicResource='RESOURCE_OIL'
WHERE UnitType = 'UNIT_TANK';
UPDATE Units SET Cost = 1200, Combat = 100, Maintenance = 8, PrereqTech = 'TECH_ROBOTICS', StrategicResource='RESOURCE_OIL'
WHERE UnitType = 'UNIT_MODERN_ARMOR';

--轻骑兵
UPDATE Units SET Cost = 120, Combat = 35, BaseMoves = 5, Maintenance = 2, PrereqTech = 'TECH_HORSEBACK_RIDING', MandatoryObsoleteTech = 'TECH_STIRRUPS', StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_HORSEMAN';
UPDATE Units SET Cost = 220, Combat = 45, BaseMoves = 5, Maintenance = 3, PrereqTech = 'TECH_STIRRUPS', MandatoryObsoleteTech = 'TECH_METAL_CASTING', StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_COURSER';
-- UPDATE Units SET Cost = 340, Combat = 55, BaseMoves = 5, Maintenance = 4, PrereqTech = 'TECH_METAL_CASTING', MandatoryObsoleteTech = 'TECH_MILITARY_SCIENCE', StrategicResource='RESOURCE_HORSES'
-- WHERE UnitType = 'UNIT_DRAGOON';
UPDATE Units SET Cost = 500, Combat = 65, BaseMoves = 5, Maintenance = 5, PrereqTech = 'TECH_MILITARY_SCIENCE', MandatoryObsoleteTech = 'TECH_COMBUSTION', StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_CAVALRY';
-- UPDATE Units SET Cost = 700, Combat = 75, BaseMoves = 5, Maintenance = 6, PrereqTech = 'TECH_COMBUSTION', MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS', StrategicResource='RESOURCE_HORSES'
-- WHERE UnitType = 'UNIT_CARABINIER';
UPDATE Units SET Cost = 900, Combat = 85, BaseMoves = 5, Maintenance = 7, PrereqTech = 'TECH_SYNTHETIC_MATERIALS', MandatoryObsoleteTech = 'TECH_ROBOTICS', StrategicResource='RESOURCE_OIL'
WHERE UnitType = 'UNIT_HELICOPTER';
-- UPDATE Units SET Cost = 1100, Combat = 95, BaseMoves = 5, Maintenance = 8, PrereqTech = 'TECH_ROBOTICS', StrategicResource='RESOURCE_OIL'
-- WHERE UnitType = 'UNIT_SUPER_HELICOPTER';

--侦察
UPDATE Units SET Cost = 40, Combat= 22, RangedCombat = 0, BaseMoves = 3, BaseSightRange = 3, Range = 0
WHERE UnitType = 'UNIT_SCOUT';
UPDATE Units SET Cost = 160, Combat= 42, RangedCombat = 0, BaseMoves = 4, BaseSightRange = 4, Range = 0, MandatoryObsoleteTech='TECH_BALLISTICS'
WHERE UnitType = 'UNIT_SKIRMISHER';
UPDATE Units SET Cost = 400, Combat= 62, RangedCombat = 0, BaseMoves = 5, BaseSightRange = 5, Range = 0, PrereqTech='TECH_BALLISTICS'
WHERE UnitType = 'UNIT_RANGER';
UPDATE Units SET Cost = 800, Combat= 82, RangedCombat = 0, BaseMoves = 6, BaseSightRange = 6, Range = 0
WHERE UnitType = 'UNIT_SPEC_OPS';

---------------
-- Units_XP2 --
---------------
--近战
INSERT OR REPLACE INTO Units_XP2
(UnitType, ResourceCost, ResourceMaintenanceType, ResourceMaintenanceAmount) VALUES
('UNIT_ELITE_INFANTRY', 		10, 'RESOURCE_NITER', 	1);
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_SWORDSMAN';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MAN_AT_ARMS';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MUSKETMAN';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_LINE_INFANTRY';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_INFANTRY';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MECHANIZED_INFANTRY';
UPDATE Units_XP2 SET ResourceCost= 30, ResourceMaintenanceType='RESOURCE_URANIUM', ResourceMaintenanceAmount= 3
WHERE UnitType ='UNIT_GIANT_DEATH_ROBOT';
--攻城
INSERT OR REPLACE INTO Units_XP2
(UnitType, ResourceCost, ResourceMaintenanceType, ResourceMaintenanceAmount) VALUES
('UNIT_TREBUCHET', 			10, 'RESOURCE_IRON', 	1),
('UNIT_RIFLED_CANNON', 		10, 'RESOURCE_IRON', 	1),
('UNIT_ATOMIC_ARTILLERY', 	10, 'RESOURCE_IRON', 	1);
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_CATAPULT';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_BOMBARD';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_ARTILLERY';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_ROCKET_ARTILLERY';

--重骑兵
INSERT OR REPLACE INTO Units_XP2
(UnitType, ResourceCost, ResourceMaintenanceType, ResourceMaintenanceAmount) VALUES
('UNIT_ARMORED_HORSEMAN', 	10, 'RESOURCE_HORSES', 	1),
('UNIT_REITER', 			10, 'RESOURCE_HORSES', 	1),
('UNIT_LANDSHIP', 			10, 'RESOURCE_OIL', 	1);
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_KNIGHT';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_CUIRASSIER';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_OIL', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_TANK';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_OIL', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MODERN_ARMOR';

--轻骑兵
INSERT OR REPLACE INTO Units_XP2
(UnitType, ResourceCost, ResourceMaintenanceType, ResourceMaintenanceAmount) VALUES
('UNIT_DRAGOON', 			10, 'RESOURCE_HORSES', 	1),
('UNIT_CARABINIER', 		10, 'RESOURCE_HORSES', 	1),
('UNIT_SUPER_HELICOPTER', 	10, 'RESOURCE_OIL', 	1);
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_HORSEMAN';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_COURSER';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_CAVALRY';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_OIL', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_HELICOPTER';

-------------------
-- Unit Upgrades --
-------------------
--远程
INSERT OR REPLACE INTO UnitUpgrades
(Unit,						UpgradeUnit) VALUES
('UNIT_CULVERIN',			'UNIT_FIELD_CANNON'),
('UNIT_HOWITZER',			'UNIT_MACHINE_GUN'),
('UNIT_MACHINE_GUN',		'UNIT_MISSILE_VEHICLE');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CULVERIN'
WHERE Unit = 'UNIT_CROSSBOWMAN';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_HOWITZER'
WHERE Unit = 'UNIT_FIELD_CANNON';
--近战
INSERT OR REPLACE INTO UnitUpgrades
(Unit,						UpgradeUnit) VALUES
('UNIT_ELITE_INFANTRY',		'UNIT_MECHANIZED_INFANTRY');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ELITE_INFANTRY'
WHERE Unit = 'UNIT_INFANTRY';
--抗骑兵
INSERT OR REPLACE INTO UnitUpgrades
(Unit,						UpgradeUnit) VALUES
('UNIT_MODERN_AT',			'UNIT_AT_MISSILE'),
('UNIT_HEAVY_INFANTRY',		'UNIT_PIKEMAN'),
('UNIT_ARQUEBUSIER',		'UNIT_AT_CREW');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_HEAVY_INFANTRY'
WHERE Unit = 'UNIT_SPEARMAN';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ARQUEBUSIER'
WHERE Unit = 'UNIT_PIKE_AND_SHOT';
--攻城
INSERT OR REPLACE INTO UnitUpgrades
(Unit,						UpgradeUnit) VALUES
('UNIT_RIFLED_CANNON',			'UNIT_ARTILLERY'),
('UNIT_ATOMIC_ARTILLERY',		'UNIT_ROCKET_ARTILLERY');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_RIFLED_CANNON'
WHERE Unit = 'UNIT_BOMBARD';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ATOMIC_ARTILLERY'
WHERE Unit = 'UNIT_ARTILLERY';
--重骑兵
INSERT OR REPLACE INTO UnitUpgrades
(Unit,						UpgradeUnit) VALUES
('UNIT_ARMORED_HORSEMAN',	'UNIT_KNIGHT'),
('UNIT_REITER',				'UNIT_CUIRASSIER'),
('UNIT_LANDSHIP',			'UNIT_TANK');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ARMORED_HORSEMAN'
WHERE Unit = 'UNIT_HEAVY_CHARIOT';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_REITER'
WHERE Unit = 'UNIT_KNIGHT';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LANDSHIP'
WHERE Unit = 'UNIT_CUIRASSIER';
--轻骑兵
INSERT OR REPLACE INTO UnitUpgrades
(Unit,						UpgradeUnit) VALUES
('UNIT_DRAGOON',			'UNIT_CAVALRY'),
('UNIT_CARABINIER',			'UNIT_HELICOPTER'),
('UNIT_HELICOPTER',			'UNIT_SUPER_HELICOPTER');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_DRAGOON'
WHERE Unit = 'UNIT_COURSER';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CARABINIER'
WHERE Unit = 'UNIT_CAVALRY';
