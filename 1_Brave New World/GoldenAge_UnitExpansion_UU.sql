---------------
--Units --
---------------
--远程UU
UPDATE Units SET Cost = 60, Combat= 15, RangedCombat = 25
WHERE UnitType = 'UNIT_NUBIAN_PITATI' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_NUBIAN_PITATI');
UPDATE Units SET Cost = 60, Combat= 10, RangedCombat = 30
WHERE UnitType = 'UNIT_MAYAN_HULCHE' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_MAYAN_HULCHE');
UPDATE Units SET Cost = 220, Combat=35, RangedCombat=45, Range=2, PrereqTech='TECH_APPRENTICESHIP'
WHERE UnitType = 'UNIT_CHINESE_CROUCHING_TIGER';
UPDATE Units SET Cost = 220, Combat= 40, RangedCombat = 40
WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_VIETNAMESE_VOI_CHIEN');
UPDATE Units SET Cost = 340, Combat= 40
WHERE UnitType = 'UNIT_KOREAN_HWACHA';

--近战UU
UPDATE Units SET Cost = 40, Maintenance = 1, Combat = 30, BaseMoves = 3
WHERE UnitType = 'UNIT_AZTEC_EAGLE_WARRIOR' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_AZTEC_EAGLE_WARRIOR');
UPDATE Units SET Cost = 40, Combat = 30, BaseMoves = 2, BaseSightRange = 3
WHERE UnitType = 'UNIT_BABYLONIAN_SABUM_KIBITTUM' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_BABYLONIAN_SABUM_KIBITTUM');
UPDATE Units SET Cost = 40, Combat = 27
WHERE UnitType = 'UNIT_GAUL_GAESATAE' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_GAUL_GAESATAE');
UPDATE Units SET Cost = 80, Combat = 42
WHERE UnitType = 'UNIT_ROMAN_LEGION';
UPDATE Units SET Cost = 80, Combat = 40
WHERE UnitType = 'UNIT_KONGO_SHIELD_BEARER';
UPDATE Units SET Cost = 80, Combat = 40, StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_MAORI_TOA';
UPDATE Units SET Cost = 80, Combat = 40
WHERE UnitType = 'UNIT_MACEDONIAN_HYPASPIST' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_MACEDONIAN_HYPASPIST');
UPDATE Units SET Cost = 80, Combat= 37, RangedCombat = 30
WHERE UnitType = 'UNIT_PERSIAN_IMMORTAL' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_PERSIAN_IMMORTAL');
UPDATE Units SET Cost = 160, Combat = 52
WHERE UnitType = 'UNIT_NORWEGIAN_BERSERKER';
UPDATE Units SET Cost = 160, Combat = 52, StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_GEORGIAN_KHEVSURETI';
UPDATE Units SET Cost = 160, Combat = 52
WHERE UnitType = 'UNIT_JAPANESE_SAMURAI';
UPDATE Units SET Cost = 280, Combat=57
WHERE UnitType = 'UNIT_SPANISH_CONQUISTADOR';
UPDATE Units SET Cost = 1, Combat = 60
WHERE UnitType = 'UNIT_SULEIMAN_JANISSARY';
UPDATE Units SET Cost = 400, Combat=67, PrereqTech='TECH_RIFLING'
WHERE UnitType = 'UNIT_ENGLISH_REDCOAT';
UPDATE Units SET Cost = 400, Combat=70, PrereqTech='TECH_RIFLING'
WHERE UnitType = 'UNIT_FRENCH_GARDE_IMPERIALE';
UPDATE Units SET Cost = 600, Combat = 80, StrategicResource = 'RESOURCE_NITER'
WHERE UnitType = 'UNIT_DIGGER' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_DIGGER');

--抗骑兵UU
UPDATE Units SET Cost = 40, Combat = 25
WHERE UnitType = 'UNIT_GREEK_HOPLITE';
UPDATE Units SET Cost = 80, Combat = 48
WHERE UnitType = 'UNIT_ZULU_IMPI';
UPDATE Units SET Cost = 400, Combat = 65
WHERE UnitType = 'UNIT_SWEDEN_CAROLEAN';

--攻城UU
UPDATE Units SET Cost = 280, Combat = 50, Bombard = 50, Range = 3, BaseMoves = 1, StrategicResource='RESOURCE_IRON'
WHERE UnitType = 'UNIT_KHMER_DOMREY' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_KHMER_DOMREY');

--重骑兵UU
UPDATE Units SET Cost = 80, Combat = 32, BaseMoves=4, Maintenance=1
WHERE UnitType = 'UNIT_SUMERIAN_WAR_CART';
UPDATE Units SET Cost = 160, Combat = 45
WHERE UnitType = 'UNIT_INDIAN_VARU';
UPDATE Units SET Cost = 160, Combat = 42
WHERE UnitType = 'UNIT_MACEDONIAN_HETAIROI' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_MACEDONIAN_HETAIROI');
UPDATE Units SET Cost = 280, Combat = 52, Maintenance=3, StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_ARABIAN_MAMLUK';
UPDATE Units SET Cost = 280, Combat = 55, Maintenance=3, StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_MALI_MANDEKALU_CAVALRY';
UPDATE Units SET Cost = 280, Combat = 52, StrategicResource='RESOURCE_HORSES', PrereqCivic='CIVIC_FEUDALISM'
WHERE UnitType = 'UNIT_BYZANTINE_TAGMA' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_BYZANTINE_TAGMA');
UPDATE Units SET Cost = 400, StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_POLISH_HUSSAR' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_POLISH_HUSSAR');
UPDATE Units SET Cost = 600, Combat = 70, StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_AMERICAN_ROUGH_RIDER';

--轻骑兵UU
UPDATE Units SET Cost = 220
WHERE UnitType = 'UNIT_HUNGARY_BLACK_ARMY';
UPDATE Units SET Cost = 220, Combat= 50
WHERE UnitType = 'UNIT_ETHIOPIAN_OROMO_CAVALRY' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_ETHIOPIAN_OROMO_CAVALRY');
UPDATE Units SET Cost = 340, Combat = 57, BaseMoves = 5, StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_MAPUCHE_MALON_RAIDER';
UPDATE Units SET Cost = 500, Combat = 66
WHERE UnitType = 'UNIT_COLOMBIAN_LLANERO' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_COLOMBIAN_LLANERO');
UPDATE Units SET Cost = 500, Combat = 67
WHERE UnitType = 'UNIT_HUNGARY_HUSZAR';
UPDATE Units SET Cost = 500, Combat = 70
WHERE UnitType = 'UNIT_RUSSIAN_COSSACK';
UPDATE Units SET Cost = 700, Combat = 77, StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_CANADA_MOUNTIE';

--火力支援UU
UPDATE Units SET Cost = 60, Combat = 20, RangedCombat=30
WHERE UnitType = 'UNIT_EGYPTIAN_CHARIOT_ARCHER';
UPDATE Units SET Cost = 180, Combat = 45, RangedCombat=45, BaseSightRange=2, StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_MONGOLIAN_KESHIG';
UPDATE Units SET Cost = 120, Combat = 25, RangedCombat=35, Maintenance=2, StrategicResource='RESOURCE_HORSES'
WHERE UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

--侦察UU
UPDATE Units SET Cost = 40, Combat= 27, RangedCombat = 0, BaseMoves = 3, BaseSightRange = 3, Range = 0
WHERE UnitType = 'UNIT_CREE_OKIHTCITAW';
UPDATE Units SET Cost = 160, Combat= 47, RangedCombat = 0, BaseMoves = 4, BaseSightRange = 4, Range = 0
WHERE UnitType = 'UNIT_INCA_WARAKAQ';
UPDATE Units SET Cost = 400, Combat= 67, RangedCombat = 0, BaseMoves = 5, BaseSightRange = 5, Range = 0
WHERE UnitType = 'UNIT_SCOTTISH_HIGHLANDER';

--海军近战UU
UPDATE Units SET Cost = 40, BaseMoves = 2, BaseSightRange = 2, Maintenance = 1, MandatoryObsoleteTech = 'TECH_CELESTIAL_NAVIGATION'
WHERE UnitType = 'UNIT_NORWEGIAN_LONGSHIP';
UPDATE Units SET Cost = 40, BaseMoves = 2, BaseSightRange = 2, Maintenance = 1, MandatoryObsoleteTech = 'TECH_CELESTIAL_NAVIGATION'
WHERE UnitType = 'UNIT_PHOENICIA_BIREME';
UPDATE Units SET Cost = 280, Combat= 70
WHERE UnitType = 'UNIT_PORTUGUESE_NAU' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_PORTUGUESE_NAU');

--海军远程UU
UPDATE Units SET Cost = 160, Combat= 15, RangedCombat = 40, Range = 3, BaseMoves = 2
WHERE UnitType = 'UNIT_BYZANTINE_DROMON' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_BYZANTINE_DROMON');
UPDATE Units SET Cost = 400, Combat= 40, RangedCombat = 60, BaseMoves = 3, StrategicResource='RESOURCE_NITER'
WHERE UnitType = 'UNIT_DE_ZEVEN_PROVINCIEN';
UPDATE Units SET Cost = 400, Combat= 40, RangedCombat = 60, BaseMoves = 5, StrategicResource = 'RESOURCE_NITER'
WHERE UnitType = 'UNIT_INDONESIAN_JONG' AND EXISTS (SELECT * FROM Units WHERE UnitType='UNIT_INDONESIAN_JONG');
UPDATE Units SET Cost = 800, Combat= 55, RangedCombat = 85, BaseMoves = 4
WHERE UnitType = 'UNIT_BRAZILIAN_MINAS_GERAES';

--海军突袭UU
UPDATE Units SET Cost = 340, Combat= 50, RangedCombat = 60, BaseMoves = 4, Range = 2
WHERE UnitType = 'UNIT_ENGLISH_SEADOG';
UPDATE Units SET Cost = 340, Combat= 60, RangedCombat = 50, BaseMoves = 5
WHERE UnitType = 'UNIT_OTTOMAN_BARBARY_CORSAIR';
UPDATE Units SET Cost = 700, Combat= 75, RangedCombat = 75, BaseMoves = 5
WHERE UnitType = 'UNIT_GERMAN_UBOAT';

--飞机UU
UPDATE Units SET Cost = 800, BaseMoves = 9, Range = 9
WHERE UnitType = 'UNIT_AMERICAN_P51';

---------------
-- Units_XP2 --
---------------
--近战UU
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_ROMAN_LEGION';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_KONGO_SHIELD_BEARER';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MAORI_TOA';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_JAPANESE_SAMURAI';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_NORWEGIAN_BERSERKER';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_GEORGIAN_KHEVSURETI';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_SPANISH_CONQUISTADOR';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_ENGLISH_REDCOAT';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_FRENCH_GARDE_IMPERIALE';
UPDATE Units_XP2 SET ResourceCost= 1, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_SULEIMAN_JANISSARY';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MACEDONIAN_HYPASPIST' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MACEDONIAN_HYPASPIST');
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_IRON', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_PERSIAN_IMMORTAL' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_PERSIAN_IMMORTAL');
INSERT OR REPLACE INTO Units_XP2 (UnitType, ResourceCost, ResourceMaintenanceType, ResourceMaintenanceAmount)
SELECT	'UNIT_DIGGER', 10, 'RESOURCE_NITER', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_DIGGER');

--骑兵UU
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_ARABIAN_MAMLUK';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_HUNGARY_BLACK_ARMY';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_HUNGARY_HUSZAR';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_RUSSIAN_COSSACK';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MALI_MANDEKALU_CAVALRY';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MONGOLIAN_KESHIG';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_MACEDONIAN_HETAIROI' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_MACEDONIAN_HETAIROI');
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_COLOMBIAN_LLANERO' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_COLOMBIAN_LLANERO');
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_ETHIOPIAN_OROMO_CAVALRY' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_ETHIOPIAN_OROMO_CAVALRY');
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_HORSES', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_BYZANTINE_TAGMA' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BYZANTINE_TAGMA');
INSERT OR REPLACE INTO Units_XP2(UnitType, ResourceCost, ResourceMaintenanceType, ResourceMaintenanceAmount)
SELECT	'UNIT_POLISH_HUSSAR', 10, 'RESOURCE_HORSES', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO Units_XP2
(UnitType, 							ResourceCost, 	ResourceMaintenanceType, 	ResourceMaintenanceAmount) VALUES
('UNIT_MAPUCHE_MALON_RAIDER', 		10, 			'RESOURCE_HORSES', 			1),
('UNIT_AMERICAN_ROUGH_RIDER', 		10, 			'RESOURCE_HORSES', 			1),
('UNIT_CANADA_MOUNTIE', 			10, 			'RESOURCE_HORSES', 			1),
('UNIT_SCYTHIAN_HORSE_ARCHER', 		10, 			'RESOURCE_HORSES', 			1);

--攻城UU
INSERT OR REPLACE INTO Units_XP2 (UnitType, ResourceCost, ResourceMaintenanceType, ResourceMaintenanceAmount)
SELECT	'UNIT_KHMER_DOMREY', 10, 'RESOURCE_IRON', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_INDONESIAN_JONG');

--海军UU
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_NITER', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_DE_ZEVEN_PROVINCIEN';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_COAL', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_BRAZILIAN_MINAS_GERAES';
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_OIL', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_GERMAN_UBOAT';
INSERT OR REPLACE INTO Units_XP2		(UnitType, ResourceCost, ResourceMaintenanceType, ResourceMaintenanceAmount)
SELECT	'UNIT_INDONESIAN_JONG', 10, 'RESOURCE_NITER', 1 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_INDONESIAN_JONG');

--飞机UU
UPDATE Units_XP2 SET ResourceCost= 10, ResourceMaintenanceType='RESOURCE_ALUMINUM', ResourceMaintenanceAmount= 1
WHERE UnitType ='UNIT_AMERICAN_P51';

-------------------
-- Unit Upgrades --
-------------------
--远程
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CULVERIN'
WHERE Unit = 'UNIT_CHINESE_CROUCHING_TIGER';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CULVERIN'
WHERE Unit = 'UNIT_VIETNAMESE_VOI_CHIEN' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_FIELD_CANNON'
WHERE Unit = 'UNIT_KOREAN_HWACHA';
--近战
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ELITE_INFANTRY'
WHERE Unit = 'UNIT_DIGGER' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_DIGGER');
--抗骑兵
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_HEAVY_INFANTRY'
WHERE Unit = 'UNIT_GREEK_HOPLITE';
--重骑兵
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ARMORED_HORSEMAN'
WHERE Unit = 'UNIT_SUMERIAN_WAR_CART';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_KNIGHT'
WHERE Unit = 'UNIT_INDIAN_VARU';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_REITER'
WHERE Unit = 'UNIT_ARABIAN_MAMLUK';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_REITER'
WHERE Unit = 'UNIT_MALI_MANDEKALU_CAVALRY';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_REITER'
WHERE Unit = 'UNIT_BYZANTINE_TAGMA' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_BYZANTINE_TAGMA');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CUIRASSIER'
WHERE Unit = 'UNIT_POLISH_HUSSAR' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LANDSHIP'
WHERE Unit = 'UNIT_AMERICAN_ROUGH_RIDER';
--轻骑兵
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_DRAGOON'
WHERE Unit = 'UNIT_HUNGARY_BLACK_ARMY';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_DRAGOON'
WHERE Unit = 'UNIT_ETHIOPIAN_OROMO_CAVALRY' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_ETHIOPIAN_OROMO_CAVALRY');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CARABINIER'
WHERE Unit = 'UNIT_RUSSIAN_COSSACK';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CARABINIER'
WHERE Unit = 'UNIT_HUNGARY_HUSZAR';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CARABINIER'
WHERE Unit = 'UNIT_COLOMBIAN_LLANERO' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_COLOMBIAN_LLANERO');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_HELICOPTER'
WHERE Unit = 'UNIT_CANADA_MOUNTIE';
--火力支援
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_FIRESUPPORT3'
WHERE Unit = 'UNIT_EGYPTIAN_CHARIOT_ARCHER';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_FIRESUPPORT4'
WHERE Unit = 'UNIT_SCYTHIAN_HORSE_ARCHER';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_FIRESUPPORT5'
WHERE Unit = 'UNIT_MONGOLIAN_KESHIG';
--侦察
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_SKIRMISHER'
WHERE Unit = 'UNIT_CREE_OKIHTCITAW';
--海军
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CARAVEL'
WHERE Unit = 'UNIT_NORWEGIAN_LONGSHIP';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CARAVEL'
WHERE Unit = 'UNIT_PHEONICIA_BIREME'AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_PHEONICIA_BIREME');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_GALLEASS'
WHERE Unit = 'UNIT_BYZANTINE_DROMON' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_BYZANTINE_DROMON');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ARMORED_CRUISER'
WHERE Unit = 'UNIT_INDONESIAN_JONG' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_INDONESIAN_JONG');
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ARMORED_CRUISER'
WHERE Unit = 'UNIT_DE_ZEVEN_PROVINCIEN';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_BATTLECRUISER'
WHERE Unit = 'UNIT_BRAZILIAN_MINAS_GERAES';
-------------------
-- UnitReplaces --
-------------------
UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_CULVERIN'
WHERE CivUniqueUnitType = 'UNIT_KOREAN_HWACHA';

UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_SLINGER'
WHERE CivUniqueUnitType = 'UNIT_NUBIAN_PITATI' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_NUBIAN_PITATI');
UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_SLINGER'
WHERE CivUniqueUnitType = 'UNIT_MAYAN_HULCHE' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_MAYAN_HULCHE');

UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_ARQUEBUSIER'
WHERE CivUniqueUnitType = 'UNIT_SWEDEN_CAROLEAN';

UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_ARMORED_HORSEMAN'
WHERE CivUniqueUnitType = 'UNIT_MACEDONIAN_HETAIROI' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_MACEDONIAN_HETAIROI');

UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_REITER'
WHERE CivUniqueUnitType = 'UNIT_POLISH_HUSSAR' AND EXISTS (SELECT * FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');

INSERT OR REPLACE INTO UnitReplaces
(CivUniqueUnitType,						ReplacesUnitType) VALUES
('UNIT_MAPUCHE_MALON_RAIDER',			'UNIT_DRAGOON'),
('UNIT_CANADA_MOUNTIE',					'UNIT_CARABINIER'),
('UNIT_INDIAN_VARU',					'UNIT_ARMORED_HORSEMAN');

UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_CROSSBOWMAN'
WHERE CivUniqueUnitType = 'UNIT_CHINESE_CROUCHING_TIGER';
UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_HEAVY_CHARIOT'
WHERE CivUniqueUnitType = 'UNIT_SUMERIAN_WAR_CART';
INSERT OR REPLACE INTO UnitReplaces (CivUniqueUnitType, ReplacesUnitType)
SELECT	'UNIT_BABYLONIAN_SABUM_KIBITTUM',	'UNIT_WARRIOR' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_BABYLONIAN_SABUM_KIBITTUM');
