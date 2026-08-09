----------------
-- Unit Types --
----------------
INSERT OR REPLACE INTO Types 
(Type,						Kind) VALUES
--海军近战
('UNIT_LEMBOS',				'KIND_UNIT'),
('UNIT_COG',				'KIND_UNIT'),
('UNIT_TORPEDO_GUNBOAT',	'KIND_UNIT'),
('UNIT_MISSILE_FRIGATE',	'KIND_UNIT'),
--海军远程
('UNIT_GALLEASS',			'KIND_UNIT'),
('UNIT_ARMORED_CRUISER',	'KIND_UNIT'),
('UNIT_BATTLECRUISER',		'KIND_UNIT');

-------------------
-- Unit AI Infos --
-------------------
INSERT OR REPLACE INTO UnitAIInfos
(UnitType,						AiType) VALUES
--海军近战
('UNIT_LEMBOS',	 		  		'UNITAI_COMBAT'),
('UNIT_LEMBOS',	   				'UNITAI_EXPLORE'),
('UNIT_LEMBOS', 	   			'UNITTYPE_MELEE'),
('UNIT_LEMBOS',	   				'UNITTYPE_NAVAL'),
('UNIT_COG',	 		  		'UNITAI_COMBAT'),
('UNIT_COG',	   				'UNITAI_EXPLORE'),
('UNIT_COG', 	   				'UNITTYPE_MELEE'),
('UNIT_COG',	   				'UNITTYPE_NAVAL'),
('UNIT_TORPEDO_GUNBOAT',	 	'UNITAI_COMBAT'),
('UNIT_TORPEDO_GUNBOAT',	   	'UNITAI_EXPLORE'),
('UNIT_TORPEDO_GUNBOAT', 	   	'UNITTYPE_MELEE'),
('UNIT_TORPEDO_GUNBOAT',	   	'UNITTYPE_NAVAL'),
('UNIT_MISSILE_FRIGATE',	 	'UNITAI_COMBAT'),
('UNIT_MISSILE_FRIGATE',	   	'UNITAI_EXPLORE'),
('UNIT_MISSILE_FRIGATE', 	   	'UNITTYPE_MELEE'),
('UNIT_MISSILE_FRIGATE',	   	'UNITTYPE_NAVAL'),
--海军远程
('UNIT_GALLEASS',				'UNITAI_COMBAT'),
('UNIT_GALLEASS',				'UNITTYPE_RANGED'),
('UNIT_GALLEASS',				'UNITTYPE_NAVAL'),
('UNIT_ARMORED_CRUISER',		'UNITAI_COMBAT'),
('UNIT_ARMORED_CRUISER',		'UNITTYPE_RANGED'),
('UNIT_ARMORED_CRUISER',		'UNITTYPE_NAVAL'),
('UNIT_BATTLECRUISER',			'UNITAI_COMBAT'),
('UNIT_BATTLECRUISER',			'UNITTYPE_RANGED'),
('UNIT_BATTLECRUISER',			'UNITTYPE_NAVAL');
---------------------
-- Class Type Tags --
---------------------
INSERT OR REPLACE INTO TypeTags
(Type,							Tag) VALUES
--海军近战
('UNIT_LEMBOS',					'CLASS_NAVAL_MELEE'),
('UNIT_COG',					'CLASS_NAVAL_MELEE'),
('UNIT_TORPEDO_GUNBOAT',		'CLASS_NAVAL_MELEE'),
('UNIT_MISSILE_FRIGATE',		'CLASS_NAVAL_MELEE'),
--海军远程
('UNIT_GALLEASS',				'CLASS_NAVAL_RANGED'),
('UNIT_ARMORED_CRUISER',		'CLASS_NAVAL_RANGED'),
('UNIT_BATTLECRUISER',			'CLASS_NAVAL_RANGED');
---------------
-- New Units --
---------------
INSERT OR REPLACE INTO Units
(UnitType, 					BaseMoves, 	Cost,	AdvisorType,		BaseSightRange,	ZoneOfControl,	Domain,			FormationClass,					Name,									Description,								PurchaseYield,	PromotionClass,						Maintenance,	Combat,	RangedCombat,	Range,	Bombard,	StrategicResource,	PrereqTech,						MandatoryObsoleteTech,		CanTargetAir,	AntiAirCombat,	CanCapture) VALUES
--海军近战
('UNIT_LEMBOS',				3,			80,		'ADVISOR_CONQUEST',	2,				1,				'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_LEMBOS_NAME',					'LOC_UNIT_LEMBOS_DESCRIPTION',				'YIELD_GOLD',	'PROMOTION_CLASS_NAVAL_MELEE',		2,				40,		0,				0,		0,			null,				'TECH_CELESTIAL_NAVIGATION',	'TECH_APPRENTICESHIP',		0,				0,				1),
('UNIT_COG',				4,			160,	'ADVISOR_CONQUEST',	3,				1,				'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_COG_NAME',					'LOC_UNIT_COG_DESCRIPTION',					'YIELD_GOLD',	'PROMOTION_CLASS_NAVAL_MELEE',		3,				50,		0,				0,		0,			null,				'TECH_APPRENTICESHIP',			'TECH_CARTOGRAPHY',			0,				0,				1),
('UNIT_TORPEDO_GUNBOAT',	5,			600,	'ADVISOR_CONQUEST',	4,				1,				'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_TORPEDO_GUNBOAT_NAME',		'LOC_UNIT_TORPEDO_GUNBOAT_DESCRIPTION',		'YIELD_GOLD',	'PROMOTION_CLASS_NAVAL_MELEE',		6,				80,		0,				0,		0,			'RESOURCE_OIL',		'TECH_REFINING',				'TECH_ADVANCED_FLIGHT',		0,				0,				1),
('UNIT_MISSILE_FRIGATE',	6,			1000,	'ADVISOR_CONQUEST',	5,				1,				'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_MISSILE_FRIGATE_NAME',		'LOC_UNIT_MISSILE_FRIGATE_DESCRIPTION',		'YIELD_GOLD',	'PROMOTION_CLASS_NAVAL_MELEE',		8,				100,	0,				0,		0,			'RESOURCE_URANIUM',	'TECH_SATELLITES',				null,						1,				100,			1),
--海军远程
('UNIT_GALLEASS',			3,			280,	'ADVISOR_CONQUEST',	2,				1,				'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_GALLEASS_NAME',				'LOC_UNIT_GALLEASS_DESCRIPTION',			'YIELD_GOLD',	'PROMOTION_CLASS_NAVAL_RANGED',		3,				25,		45,				2,		0,			'RESOURCE_IRON',	'TECH_BUTTRESS',				'TECH_SQUARE_RIGGING',		0,				0,				1),
('UNIT_ARMORED_CRUISER',	4,			600,	'ADVISOR_CONQUEST',	3,				1,				'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_ARMORED_CRUISER_NAME',		'LOC_UNIT_ARMORED_CRUISER_DESCRIPTION',		'YIELD_GOLD',	'PROMOTION_CLASS_NAVAL_RANGED',		5,				45,		65,				3,		0,			'RESOURCE_COAL',	'TECH_STEAM_POWER',				'TECH_CHEMISTRY',			0,				0,				1),
('UNIT_BATTLECRUISER',		5,			1000,	'ADVISOR_CONQUEST',	4,				1,				'DOMAIN_SEA',	'FORMATION_CLASS_NAVAL',		'LOC_UNIT_BATTLECRUISER_NAME',			'LOC_UNIT_BATTLECRUISER_DESCRIPTION',		'YIELD_GOLD',	'PROMOTION_CLASS_NAVAL_RANGED',		7,				65,		85,				3,		0,			'RESOURCE_OIL',		'TECH_COMPUTERS',				'TECH_STEALTH_TECHNOLOGY',	1,				110,			1);

--海军近战
UPDATE Units SET Cost = 40, Combat = 30, BaseMoves = 2, BaseSightRange = 2, Maintenance = 1, MandatoryObsoleteTech = 'TECH_CELESTIAL_NAVIGATION'
WHERE UnitType = 'UNIT_GALLEY';
-- UPDATE Units SET Cost = 80, Combat = 40, BaseMoves = 3, BaseSightRange = 2, Maintenance = 2, PrereqTech = 'TECH_CELESTIAL_NAVIGATION', MandatoryObsoleteTech = 'TECH_APPRENTICESHIP'
-- WHERE UnitType = 'UNIT_LEMBOS';
-- UPDATE Units SET Cost = 160, Combat = 50, BaseMoves = 3, BaseSightRange = 3, Maintenance = 3, PrereqTech = 'TECH_APPRENTICESHIP', MandatoryObsoleteTech = 'TECH_CARTOGRAPHY'
-- WHERE UnitType = 'UNIT_COG';
UPDATE Units SET Cost = 280, Combat = 60, BaseMoves = 4, BaseSightRange = 3, Maintenance = 4, PrereqTech = 'TECH_CARTOGRAPHY', MandatoryObsoleteTech = 'TECH_INDUSTRIALIZATION'
WHERE UnitType = 'UNIT_CARAVEL';
UPDATE Units SET Cost = 400, Combat = 70, BaseMoves = 4, BaseSightRange = 4, Maintenance = 5, PrereqTech = 'TECH_INDUSTRIALIZATION', MandatoryObsoleteTech = 'TECH_REFINING', StrategicResource='RESOURCE_COAL'
WHERE UnitType = 'UNIT_IRONCLAD';
-- UPDATE Units SET Cost = 600, Combat = 80, BaseMoves = 5, BaseSightRange = 4, Maintenance = 6, PrereqTech = 'TECH_REFINING', MandatoryObsoleteTech = 'TECH_ADVANCED_FLIGHT'
-- WHERE UnitType = 'UNIT_TORPEDO_GUNBOAT';
UPDATE Units SET Cost = 800, Combat = 90, BaseMoves = 5, BaseSightRange = 5, Maintenance = 7, PrereqTech = 'TECH_ADVANCED_FLIGHT', MandatoryObsoleteTech = 'TECH_SATELLITES', StrategicResource='RESOURCE_ALUMINUM', AntiAirCombat = 90
WHERE UnitType = 'UNIT_DESTROYER';
-- UPDATE Units SET Cost = 1000, Combat = 100, BaseMoves = 6, BaseSightRange = 5, Maintenance = 8, PrereqTech = 'TECH_SATELLITES', StrategicResource='RESOURCE_URANIUM', AntiAirCombat = 100
-- WHERE UnitType = 'UNIT_MISSILE_FRIGATE';

--海军远程
UPDATE Units SET Cost = 160, BaseMoves = 2, Range = 2, BaseSightRange = 2, Combat = 15, RangedCombat = 35, Maintenance = 2, PrereqTech = 'TECH_SHIPBUILDING', MandatoryObsoleteTech = 'TECH_BUTTRESS'
WHERE UnitType = 'UNIT_QUADRIREME';
-- UPDATE Units SET Cost = 280, BaseMoves = 3, Range = 2, BaseSightRange = 2, Combat = 25, RangedCombat = 45, Maintenance = 3, PrereqTech = 'TECH_BUTTRESS', MandatoryObsoleteTech = 'TECH_SQUARE_RIGGING'
-- WHERE UnitType = 'UNIT_GALLEASS';
UPDATE Units SET Cost = 400, BaseMoves = 3, Range = 2, BaseSightRange = 3, Combat = 35, RangedCombat = 55, Maintenance = 4, PrereqTech = 'TECH_SQUARE_RIGGING', MandatoryObsoleteTech = 'TECH_STEAM_POWER', StrategicResource='RESOURCE_NITER'
WHERE UnitType = 'UNIT_FRIGATE';
-- UPDATE Units SET Cost = 600, BaseMoves = 3, Range = 3, BaseSightRange = 3, Combat = 45, RangedCombat = 65, Maintenance = 5, PrereqTech = 'TECH_STEAM_POWER', MandatoryObsoleteTech = 'TECH_CHEMISTRY'
-- WHERE UnitType = 'UNIT_ARMORED_CRUISER';
UPDATE Units SET Cost = 800, BaseMoves = 4, Range = 3, BaseSightRange = 3, Combat = 55, RangedCombat = 75, Maintenance = 6, PrereqTech = 'TECH_CHEMISTRY', MandatoryObsoleteTech = 'TECH_COMPUTERS', StrategicResource='RESOURCE_OIL'
WHERE UnitType = 'UNIT_BATTLESHIP';
-- UPDATE Units SET Cost = 1000, BaseMoves = 4, Range = 3, BaseSightRange = 4, Combat = 65, RangedCombat = 85, Maintenance = 7, PrereqTech = 'TECH_COMPUTERS', MandatoryObsoleteTech = 'TECH_STEALTH_TECHNOLOGY', StrategicResource='RESOURCE_ALUMINUM', AntiAirCombat = 110
-- WHERE UnitType = 'UNIT_BATTLECRUISER';
UPDATE Units SET Cost = 1200, BaseMoves = 4, Range = 4, BaseSightRange = 4, Combat = 75, RangedCombat = 95, Maintenance = 8, PrereqTech = 'TECH_STEALTH_TECHNOLOGY', StrategicResource='RESOURCE_URANIUM', AntiAirCombat = 120
WHERE UnitType = 'UNIT_MISSILE_CRUISER';

--海军突袭
UPDATE Units SET Cost = 340, Combat= 50, RangedCombat = 50, BaseMoves = 4, Range = 1, PrereqTech = 'TECH_CARTOGRAPHY', PrereqCivic = NULL
WHERE UnitType = 'UNIT_PRIVATEER';
UPDATE Units SET Cost = 700, Combat= 70, RangedCombat = 70, BaseMoves = 5, Range = 1, StrategicResource='RESOURCE_OIL'
WHERE UnitType = 'UNIT_SUBMARINE';
UPDATE Units SET Cost = 1100, Combat= 90, RangedCombat = 90, BaseMoves = 6, Range = 1, StrategicResource='RESOURCE_URANIUM'
WHERE UnitType = 'UNIT_NUCLEAR_SUBMARINE';

--航母
UPDATE Units SET Cost=800, Combat=70, StrategicResource='RESOURCE_OIL'
WHERE UnitType = 'UNIT_AIRCRAFT_CARRIER';

--飞机
UPDATE Units SET Cost=600, BaseMoves=6, Range=6, RangedCombat=85, Combat=85
WHERE UnitType = 'UNIT_BIPLANE';
UPDATE Units SET Cost=800, BaseMoves=9, Range=9, RangedCombat=95, Combat=95
WHERE UnitType = 'UNIT_FIGHTER';
UPDATE Units SET Cost = 1000, BaseMoves=12, Range=12, RangedCombat=105, Combat=105
WHERE UnitType = 'UNIT_JET_FIGHTER';
UPDATE Units SET Cost = 900, BaseMoves=9, Range=9, Bombard=105, Combat=85
WHERE UnitType = 'UNIT_BOMBER';
UPDATE Units SET Cost = 1200, BaseMoves=12, Range=12, Bombard=115, Combat=95
WHERE UnitType = 'UNIT_JET_BOMBER';

---------------
-- Units_XP2 --
---------------
INSERT OR REPLACE INTO Units_XP2
(UnitType, ResourceCost, ResourceMaintenanceType, ResourceMaintenanceAmount) VALUES
('UNIT_TORPEDO_GUNBOAT', 		10, 'RESOURCE_OIL', 	1),
('UNIT_MISSILE_FRIGATE', 		10, 'RESOURCE_URANIUM', 1),
('UNIT_AIRCRAFT_CARRIER', 		10, 'RESOURCE_OIL', 	1),
('UNIT_GALLEASS', 				10, 'RESOURCE_IRON', 	1),
('UNIT_ARMORED_CRUISER', 		10, 'RESOURCE_COAL', 	1),
('UNIT_BATTLECRUISER', 			10, 'RESOURCE_ALUMINUM', 	1);
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_COAL', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_IRONCLAD';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_ALUMINUM', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_DESTROYER';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_FRIGATE';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_OIL', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_BATTLESHIP';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_URANIUM', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MISSILE_CRUISER';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_OIL', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_SUBMARINE';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_URANIUM', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_NUCLEAR_SUBMARINE';

UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_OIL', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_BIPLANE';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_ALUMINUM', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_FIGHTER';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_ALUMINUM', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_BOMBER';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_ALUMINUM', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_JET_FIGHTER';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_ALUMINUM', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_JET_BOMBER';

-------------------
-- Unit Upgrades --
-------------------
--海军
INSERT OR REPLACE INTO UnitUpgrades
(Unit,						UpgradeUnit) VALUES
('UNIT_LEMBOS',				'UNIT_COG'),
('UNIT_COG',				'UNIT_CARAVEL'),
('UNIT_TORPEDO_GUNBOAT',	'UNIT_DESTROYER'),
('UNIT_DESTROYER',			'UNIT_MISSILE_FRIGATE');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LEMBOS'
WHERE Unit = 'UNIT_GALLEY';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_TORPEDO_GUNBOAT'
WHERE Unit = 'UNIT_IRONCLAD';

INSERT OR REPLACE INTO UnitUpgrades
(Unit,						UpgradeUnit) VALUES
('UNIT_GALLEASS',			'UNIT_FRIGATE'),
('UNIT_ARMORED_CRUISER',	'UNIT_BATTLESHIP'),
('UNIT_BATTLECRUISER',		'UNIT_MISSILE_CRUISER');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_GALLEASS'
WHERE Unit = 'UNIT_QUADRIREME';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ARMORED_CRUISER'
WHERE Unit = 'UNIT_FRIGATE';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_BATTLECRUISER'
WHERE Unit = 'UNIT_BATTLESHIP';