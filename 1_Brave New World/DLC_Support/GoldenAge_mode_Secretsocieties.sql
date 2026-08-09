--解锁
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_CLASSICAL' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_OWLS_OF_MINERVA_2';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_CLASSICAL' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_HERMETIC_ORDER_2';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_CLASSICAL' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_VOIDSINGERS_2';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_CLASSICAL' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_SANGUINE_PACT_2';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_RENAISSANCE' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_OWLS_OF_MINERVA_3';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_RENAISSANCE' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_HERMETIC_ORDER_3';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_RENAISSANCE' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_VOIDSINGERS_3';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_RENAISSANCE' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_SANGUINE_PACT_3';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_MODERN' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_OWLS_OF_MINERVA_4';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_MODERN' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_HERMETIC_ORDER_4';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_MODERN' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_VOIDSINGERS_4';
UPDATE GovernorPromotionConditions SET EarliestGameEra = 'ERA_MODERN' WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_SANGUINE_PACT_4';
--吸血鬼
UPDATE Units SET BaseMoves = 3, Combat = 27 WHERE UnitType = 'UNIT_VAMPIRE';
--黄金
UPDATE Adjacency_YieldChanges SET YieldChange = 2 WHERE AdjacentResourceClass = 'RESOURCECLASS_LEY_LINE';
INSERT OR REPLACE INTO ModifierArguments
(ModifierId, Name,    Value) SELECT 
ModifierId,  'Amount', 2 FROM Modifiers WHERE ModifierType='MODIFIER_PLAYER_ADJUST_GREAT_PERSON_RESOURCE_YIELD_CHANGE';

--建筑
UPDATE Buildings SET Maintenance = 1 WHERE BuildingType = 'BUILDING_OLD_GOD_OBELISK';
UPDATE Buildings SET Maintenance = 3, Housing = 0, RegionalRange = 4, Cost = 320, PrereqTech = Null WHERE BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY';
UPDATE Buildings SET RegionalRange = 4, Cost = 480, PrereqTech = Null WHERE BuildingType = 'BUILDING_GILDED_VAULT';
UPDATE Building_YieldChanges SET YieldChange = 3 WHERE BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY' AND YieldType = 'YIELD_PRODUCTION';
UPDATE Building_YieldChanges SET YieldChange = 3 WHERE BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY' AND YieldType = 'YIELD_SCIENCE';
UPDATE Building_YieldChanges SET YieldChange = 4 WHERE BuildingType = 'BUILDING_GILDED_VAULT' AND YieldType = 'YIELD_GOLD';
INSERT OR REPLACE INTO Buildings_XP2
(BuildingType, RequiredPower) VALUES 
('BUILDING_ALCHEMICAL_SOCIETY',  2),
('BUILDING_GILDED_VAULT',  2);
INSERT OR REPLACE INTO Building_YieldChangesBonusWithPower
(BuildingType, YieldType, YieldChange) VALUES 
('BUILDING_ALCHEMICAL_SOCIETY', 'YIELD_SCIENCE',  4),
('BUILDING_GILDED_VAULT', 'YIELD_GOLD',  4);
INSERT OR REPLACE INTO Building_CitizenYieldChanges
(BuildingType, YieldType, YieldChange) VALUES 
('BUILDING_ALCHEMICAL_SOCIETY', 'YIELD_SCIENCE',  2),
('BUILDING_GILDED_VAULT', 'YIELD_GOLD',  2);
INSERT OR REPLACE INTO BuildingModifiers
(BuildingType, ModifierId) VALUES 
('BUILDING_GILDED_VAULT',  'GOLDEN_BANK_TRADE_ROUTE_CAPACITY_MODIFIER');--贸易路线
DELETE FROM BuildingModifiers WHERE ModifierId = 'BUILDING_GILDED_VAULT_TRADE_ROUTE_CAPACITY';

--v226 地脉山脉
DELETE FROM Resource_ValidTerrains WHERE ResourceType = 'RESOURCE_LEY_LINE';
INSERT OR REPLACE INTO Resource_ValidTerrains
(ResourceType, TerrainType) VALUES 
('RESOURCE_LEY_LINE',  'TERRAIN_GRASS_MOUNTAIN'),
('RESOURCE_LEY_LINE',  'TERRAIN_PLAINS_MOUNTAIN'),
('RESOURCE_LEY_LINE',  'TERRAIN_DESERT_MOUNTAIN'),
('RESOURCE_LEY_LINE',  'TERRAIN_TUNDRA_MOUNTAIN');
UPDATE Resources SET Frequency = 50 WHERE ResourceType = 'RESOURCE_LEY_LINE';

--v226 邪教徒
UPDATE ModifierArguments SET Value = 30 WHERE ModifierId = 'SPREAD_DISSENT_LOYALTY_DAMAGE' AND NAME = 'Amount';
UPDATE Units_MODE SET ActionCharges = 1 WHERE UnitType = 'UNIT_CULTIST';

--100%解锁
UPDATE SecretSocieties SET DiscoverAtCityStateBaseChance = 100 WHERE SecretSocietyType = 'SECRETSOCIETY_OWLS_OF_MINERVA';
UPDATE SecretSocieties SET DiscoverAtNaturalWonderBaseChance = 100 WHERE SecretSocietyType = 'SECRETSOCIETY_HERMETIC_ORDER';
UPDATE SecretSocieties SET DiscoverAtGoodyHutBaseChance = 100 WHERE SecretSocietyType = 'SECRETSOCIETY_VOIDSINGERS';
UPDATE SecretSocieties SET DiscoverAtBarbarianCampBaseChance = 100 WHERE SecretSocietyType = 'SECRETSOCIETY_SANGUINE_PACT';
