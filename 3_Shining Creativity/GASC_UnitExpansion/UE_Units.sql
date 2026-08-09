-- UE_Units
-- Author: Flactine
-- DateCreated: 4/29/2024 10:04:40 PM
--------------------------------------------------------------
--=====
--Units
--=====
UPDATE	Units
SET		PromotionClass = 'PROMOTION_CLASS_FIRESUPPORT'
WHERE	UnitType = 'UNIT_FLAC_ALPACA'
AND EXISTS (SELECT * FROM Units WHERE PromotionClass = 'PROMOTION_CLASS_FIRESUPPORT');
--=====
--UnitReplaces
--=====
INSERT OR REPLACE INTO UnitReplaces
(CivUniqueUnitType,		ReplacesUnitType)
SELECT
UnitType,				'UNIT_FIRESUPPORT2'
FROM Units WHERE UnitType = 'UNIT_FLAC_ALPACA';
--=====
--UnitUpgrades
--=====
INSERT OR REPLACE INTO UnitUpgrades
(Unit,			UpgradeUnit)
SELECT
UnitType,		'UNIT_FIRESUPPORT3'
FROM Units WHERE UnitType = 'UNIT_FLAC_ALPACA';