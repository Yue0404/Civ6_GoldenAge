--神祠
UPDATE Buildings SET  Description = 'LOC_BUILDING_SHRINE_DESCRIPTION_HERO'
WHERE BuildingType = 'BUILDING_SHRINE';

--苏美尔
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_LEADER_GILGAMESH_HEROES',	'GOLDEN_TRAIT_ENKIDU_RIVER_CITY_INFLUENCE_TOKEN'),
('TRAIT_LEADER_GILGAMESH_HEROES',	'TRAIT_LEVY_DISCOUNT');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_ENKIDU_RIVER_CITY_INFLUENCE_TOKEN',								'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								    0,			0,			'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS'),
('GOLDEN_TRAIT_ENKIDU_RIVER_CITY_INFLUENCE_TOKEN_MODIFIER',		    			'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',								    1,			1,			NULL);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			    Name,		        Value) VALUES
('GOLDEN_TRAIT_ENKIDU_RIVER_CITY_INFLUENCE_TOKEN',				'ModifierId',	'GOLDEN_TRAIT_ENKIDU_RIVER_CITY_INFLUENCE_TOKEN_MODIFIER'),
('GOLDEN_TRAIT_ENKIDU_RIVER_CITY_INFLUENCE_TOKEN_MODIFIER',	    'Amount',		1);

UPDATE ModifierArguments SET  Value = 25
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_LIFESPAN' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_ANANSI' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_ARTHUR' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_BEOWULF' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_HERCULES' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_HIMIKO' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_HIPPOLYTA' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_HUNAHPU' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_OYA' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_MAUI' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_MULAN' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_SINBAD' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'MODIFIER_TRAIT_SUMERIA_HEROES_FASTER_CLAIM_WUKONG' AND Name = 'Amount';
--刚果
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_NKISI' AND ModifierId = 'MODIFIER_TRAIT_NKISI_HEROIC_RELIC_GOLD';
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_NKISI' AND ModifierId = 'MODIFIER_TRAIT_NKISI_HEROIC_RELIC_FOOD';
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_NKISI' AND ModifierId = 'MODIFIER_TRAIT_NKISI_HEROIC_RELIC_PRODUCTION';
--波兰
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_LEADER_LITHUANIAN_UNION', 'GOLDEN_TRAIT_LITHUANIANUNION_FOOD_HEROIC_RELIC' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_LEADER_LITHUANIAN_UNION', 'GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_HEROIC_RELIC' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_LEADER_LITHUANIAN_UNION', 'GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_HEROIC_RELIC' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_FOOD_HEROIC_RELIC', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD', 0, 0, NULL WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_HEROIC_RELIC', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD', 0, 0, NULL WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_HEROIC_RELIC', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD', 0, 0, NULL WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_FOOD_HEROIC_RELIC', 'YieldChange', 2 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_FOOD_HEROIC_RELIC', 'GreatWorkObjectType', 'GREATWORKOBJECT_HERO' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_FOOD_HEROIC_RELIC', 'YieldType', 'YIELD_FOOD' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_HEROIC_RELIC', 'YieldChange', 2 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_HEROIC_RELIC', 'GreatWorkObjectType', 'GREATWORKOBJECT_HERO' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_PRODUCTION_HEROIC_RELIC', 'YieldType', 'YIELD_PRODUCTION' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_HEROIC_RELIC', 'YieldChange', 2 WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_HEROIC_RELIC', 'GreatWorkObjectType', 'GREATWORKOBJECT_HERO' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_LITHUANIANUNION_SCIENCE_HEROIC_RELIC', 'YieldType', 'YIELD_SCIENCE' WHERE EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_POLISH_HUSSAR');
UPDATE ModifierArguments SET Value = 2
WHERE ModifierId = 'MODIFIER_TRAIT_LITHUANIAN_UNION_HEROIC_RELIC_GOLD' AND Name = 'YieldChange' AND EXISTS (SELECT UnitType FROM Units WHERE UnitType='UNIT_POLISH_HUSSAR');
--圣物箱（神圣象征）
INSERT OR REPLACE INTO BeliefModifiers (BeliefType, 			ModifierId) SELECT	
'BELIEF_SACRED_SYMBOL',	'MODIFIER_BELIEF_RELIQUARIES_ATTACH_HEROIC_RELIC_TOURISM' WHERE EXISTS (SELECT BeliefType FROM Beliefs WHERE BeliefType='BELIEF_SACRED_SYMBOL');
UPDATE Beliefs SET  Description = 'LOC_BELIEF_SACRED_SYMBOL_HERO_DESCRIPTION'
WHERE BeliefType = 'BELIEF_SACRED_SYMBOL' AND EXISTS (SELECT BeliefType FROM Beliefs WHERE BeliefType='BELIEF_SACRED_SYMBOL');
--空中花园
UPDATE Buildings SET  Description = 'LOC_BUILDING_HANGING_GARDENS_HERO_DESCRIPTION'
WHERE BuildingType = 'BUILDING_HANGING_GARDENS'
AND NOT EXISTS (SELECT * FROM BuildingPrereqs WHERE Building = 'BUILDING_RUHR_VALLEY');	--确定已经开了奇观修正
UPDATE ModifierArguments SET  Value = 20
WHERE ModifierId = 'MODIFIER_HANGING_GARDENS_ALL_HEROES_EXTRA_LIFESPAN' AND Name = 'Amount';
--修复视野
UPDATE Units SET BaseSightRange = 2
WHERE PromotionClass = 'PROMOTION_CLASS_MELEE' AND CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES' AND MustPurchase = 1;
UPDATE Units SET BaseSightRange = 2
WHERE PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' AND CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES' AND MustPurchase = 1;
UPDATE Units SET BaseSightRange = 3
WHERE PromotionClass = 'PROMOTION_CLASS_RANGED' AND CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES' AND MustPurchase = 1;

--英雄
--木兰
UPDATE Units SET  Combat = 30, RangedCombat = 30, BaseMoves = 4, Range = 3, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_MULAN';
UPDATE HeroClassProgressions SET  CombatStrength = 40, RangedCombatStrength = 40
WHERE HeroClassType = 'HEROCLASS_MULAN' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 50, RangedCombatStrength = 50
WHERE HeroClassType = 'HEROCLASS_MULAN' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 60, RangedCombatStrength = 60
WHERE HeroClassType = 'HEROCLASS_MULAN' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 70, RangedCombatStrength = 70
WHERE HeroClassType = 'HEROCLASS_MULAN' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 80, RangedCombatStrength = 80
WHERE HeroClassType = 'HEROCLASS_MULAN' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 90, RangedCombatStrength = 90
WHERE HeroClassType = 'HEROCLASS_MULAN' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 100, RangedCombatStrength = 100
WHERE HeroClassType = 'HEROCLASS_MULAN' AND EraType = 'ERA_INFORMATION';
--悟空
INSERT OR REPLACE INTO TypeTags 
(Type, 			        Tag) VALUES	
('UNIT_HERO_WUKONG',	'CLASS_PARADROP');
UPDATE Units SET  Combat = 38, BaseMoves = 5, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_WUKONG';
UPDATE HeroClassProgressions SET  CombatStrength = 50
WHERE HeroClassType = 'HEROCLASS_WUKONG' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 62
WHERE HeroClassType = 'HEROCLASS_WUKONG' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 74
WHERE HeroClassType = 'HEROCLASS_WUKONG' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 86
WHERE HeroClassType = 'HEROCLASS_WUKONG' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 98
WHERE HeroClassType = 'HEROCLASS_WUKONG' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 110
WHERE HeroClassType = 'HEROCLASS_WUKONG' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 122
WHERE HeroClassType = 'HEROCLASS_WUKONG' AND EraType = 'ERA_INFORMATION';
--卑弥呼
UPDATE Units SET  BaseMoves = 2, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_HIMIKO';
UPDATE Units_MODE SET  ActionCharges = 4
WHERE UnitType = 'UNIT_HERO_HIMIKO';
UPDATE TypeProperties SET  Value = 30
WHERE Type = 'UNIT_HERO_HIMIKO' AND Name = 'LIFESPAN';
--赫丘利
UPDATE Units_MODE SET  ActionCharges = 5
WHERE UnitType = 'UNIT_HERO_HERCULES';
UPDATE Units SET  Combat = 34, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_HERCULES';
UPDATE HeroClassProgressions SET  CombatStrength = 46
WHERE HeroClassType = 'HEROCLASS_HERCULES' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 58
WHERE HeroClassType = 'HEROCLASS_HERCULES' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 70
WHERE HeroClassType = 'HEROCLASS_HERCULES' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 82
WHERE HeroClassType = 'HEROCLASS_HERCULES' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 94
WHERE HeroClassType = 'HEROCLASS_HERCULES' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 106
WHERE HeroClassType = 'HEROCLASS_HERCULES' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 118
WHERE HeroClassType = 'HEROCLASS_HERCULES' AND EraType = 'ERA_INFORMATION';
--毛伊
-- UPDATE Units_MODE SET  ActionCharges = 6
-- WHERE UnitType = 'UNIT_HERO_MAUI';
UPDATE Units SET  Combat = 34, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_MAUI';
UPDATE HeroClassProgressions SET  CombatStrength = 46
WHERE HeroClassType = 'HEROCLASS_MAUI' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 58
WHERE HeroClassType = 'HEROCLASS_MAUI' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 70
WHERE HeroClassType = 'HEROCLASS_MAUI' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 82
WHERE HeroClassType = 'HEROCLASS_MAUI' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 94
WHERE HeroClassType = 'HEROCLASS_MAUI' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 106
WHERE HeroClassType = 'HEROCLASS_MAUI' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 118
WHERE HeroClassType = 'HEROCLASS_MAUI' AND EraType = 'ERA_INFORMATION';
--亚瑟
UPDATE Units SET  Combat = 34, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_ARTHUR';
UPDATE HeroClassProgressions SET  CombatStrength = 46
WHERE HeroClassType = 'HEROCLASS_ARTHUR' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 58
WHERE HeroClassType = 'HEROCLASS_ARTHUR' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 70
WHERE HeroClassType = 'HEROCLASS_ARTHUR' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 82
WHERE HeroClassType = 'HEROCLASS_ARTHUR' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 94
WHERE HeroClassType = 'HEROCLASS_ARTHUR' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 106
WHERE HeroClassType = 'HEROCLASS_ARTHUR' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 118
WHERE HeroClassType = 'HEROCLASS_ARTHUR' AND EraType = 'ERA_INFORMATION';

INSERT OR REPLACE INTO Types (Type,						Kind) VALUES
('ABILITY_ARTHUR_AOE',						'KIND_ABILITY'),
('ABILITY_ARTHUR_AOE_MOVEMENT',				'KIND_ABILITY');
INSERT OR REPLACE INTO TypeTags (Type,									Tag) VALUES	
('ABILITY_ARTHUR_AOE',				    'CLASS_HERO_ARTHUR'),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'CLASS_RECON'),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'CLASS_MELEE'),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'CLASS_TRUE_RANGED'),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'CLASS_SIEGE'),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'CLASS_HEAVY_CAVALRY'),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'CLASS_LIGHT_CAVALRY'),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'CLASS_ANTI_CAVALRY'),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'CLASS_WARRIOR_MONK');
INSERT OR REPLACE INTO UnitAbilities (UnitAbilityType,						Name,									Description, Inactive, Permanent) VALUES	
('ABILITY_ARTHUR_AOE',				    'LOC_ABILITY_ARTHUR_AOE_NAME',		    'LOC_ABILITY_ARTHUR_AOE_DESCRIPTION',          0, 1),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'LOC_ABILITY_ARTHUR_AOE_MOVEMENT_NAME',	'LOC_ABILITY_ARTHUR_AOE_MOVEMENT_DESCRIPTION', 1, 0);--Bug: The Description is not shown. But "LOC_ABILITY_GREAT_GENERAL_MOVEMENT_DESCRIPTION" is shown.
INSERT OR REPLACE INTO UnitAbilityModifiers (UnitAbilityType,						ModifierId) VALUES	
('ABILITY_ARTHUR_AOE',				    'GOLDEN_ARTHUR_AOE'),
('ABILITY_ARTHUR_AOE_MOVEMENT',			'GOLDEN_ARTHUR_AOE_MOVEMENT');
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType,								SubjectRequirementSetId) VALUES	
('GOLDEN_ARTHUR_AOE',					'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		'AOE_ANY_REQUIREMENTS'),
('GOLDEN_ARTHUR_AOE_MOVEMENT',			'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',		NULL);
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				Name,		Value) VALUES
('GOLDEN_ARTHUR_AOE',					'AbilityType',	'ABILITY_GREAT_GENERAL_MOVEMENT'),
('GOLDEN_ARTHUR_AOE_MOVEMENT',			'Amount',	    1);

--贝奥武夫
UPDATE Units SET  Combat = 34, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_BEOWULF';
UPDATE HeroClassProgressions SET  CombatStrength = 46
WHERE HeroClassType = 'HEROCLASS_BEOWULF' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 58
WHERE HeroClassType = 'HEROCLASS_BEOWULF' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 70
WHERE HeroClassType = 'HEROCLASS_BEOWULF' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 82
WHERE HeroClassType = 'HEROCLASS_BEOWULF' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 94
WHERE HeroClassType = 'HEROCLASS_BEOWULF' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 106
WHERE HeroClassType = 'HEROCLASS_BEOWULF' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 118
WHERE HeroClassType = 'HEROCLASS_BEOWULF' AND EraType = 'ERA_INFORMATION';
--希波吕忒
UPDATE Units SET  Combat = 34, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_HIPPOLYTA';
UPDATE HeroClassProgressions SET  CombatStrength = 46
WHERE HeroClassType = 'HEROCLASS_HIPPOLYTA' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 58
WHERE HeroClassType = 'HEROCLASS_HIPPOLYTA' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 70
WHERE HeroClassType = 'HEROCLASS_HIPPOLYTA' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 82
WHERE HeroClassType = 'HEROCLASS_HIPPOLYTA' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 94
WHERE HeroClassType = 'HEROCLASS_HIPPOLYTA' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 106
WHERE HeroClassType = 'HEROCLASS_HIPPOLYTA' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 118
WHERE HeroClassType = 'HEROCLASS_HIPPOLYTA' AND EraType = 'ERA_INFORMATION';
--乌纳普（双子）
UPDATE Units SET  Combat = 38, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_HUNAHPU';
UPDATE HeroClassProgressions SET  CombatStrength = 50
WHERE HeroClassType = 'HEROCLASS_HUNAHPU' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 62
WHERE HeroClassType = 'HEROCLASS_HUNAHPU' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 74
WHERE HeroClassType = 'HEROCLASS_HUNAHPU' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 86
WHERE HeroClassType = 'HEROCLASS_HUNAHPU' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 98
WHERE HeroClassType = 'HEROCLASS_HUNAHPU' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 110
WHERE HeroClassType = 'HEROCLASS_HUNAHPU' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 122
WHERE HeroClassType = 'HEROCLASS_HUNAHPU' AND EraType = 'ERA_INFORMATION';
--奥亚
UPDATE Units SET  Combat = 34, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_OYA';
UPDATE HeroClassProgressions SET  CombatStrength = 46
WHERE HeroClassType = 'HEROCLASS_OYA' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 58
WHERE HeroClassType = 'HEROCLASS_OYA' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 70
WHERE HeroClassType = 'HEROCLASS_OYA' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 82
WHERE HeroClassType = 'HEROCLASS_OYA' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 94
WHERE HeroClassType = 'HEROCLASS_OYA' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 106
WHERE HeroClassType = 'HEROCLASS_OYA' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 118
WHERE HeroClassType = 'HEROCLASS_OYA' AND EraType = 'ERA_INFORMATION';
--辛巴达
UPDATE Units SET  Combat = 38, BaseMoves = 5, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_SINBAD';
UPDATE HeroClassProgressions SET  CombatStrength = 50
WHERE HeroClassType = 'HEROCLASS_SINBAD' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 62
WHERE HeroClassType = 'HEROCLASS_SINBAD' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 74
WHERE HeroClassType = 'HEROCLASS_SINBAD' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 86
WHERE HeroClassType = 'HEROCLASS_SINBAD' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 98
WHERE HeroClassType = 'HEROCLASS_SINBAD' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 110
WHERE HeroClassType = 'HEROCLASS_SINBAD' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 122
WHERE HeroClassType = 'HEROCLASS_SINBAD' AND EraType = 'ERA_INFORMATION';
--阿南西
UPDATE Units SET  Combat = 20, RangedCombat = 30, Range = 2, PromotionClass = null, CanRetreatWhenCaptured = 1
WHERE UnitType = 'UNIT_HERO_ANANSI';
UPDATE HeroClassProgressions SET  CombatStrength = 30, RangedCombatStrength = 40
WHERE HeroClassType = 'HEROCLASS_ANANSI' AND EraType = 'ERA_CLASSICAL';
UPDATE HeroClassProgressions SET  CombatStrength = 40, RangedCombatStrength = 50
WHERE HeroClassType = 'HEROCLASS_ANANSI' AND EraType = 'ERA_MEDIEVAL';
UPDATE HeroClassProgressions SET  CombatStrength = 50, RangedCombatStrength = 60
WHERE HeroClassType = 'HEROCLASS_ANANSI' AND EraType = 'ERA_RENAISSANCE';
UPDATE HeroClassProgressions SET  CombatStrength = 60, RangedCombatStrength = 70
WHERE HeroClassType = 'HEROCLASS_ANANSI' AND EraType = 'ERA_INDUSTRIAL';
UPDATE HeroClassProgressions SET  CombatStrength = 70, RangedCombatStrength = 80
WHERE HeroClassType = 'HEROCLASS_ANANSI' AND EraType = 'ERA_MODERN';
UPDATE HeroClassProgressions SET  CombatStrength = 80, RangedCombatStrength = 90
WHERE HeroClassType = 'HEROCLASS_ANANSI' AND EraType = 'ERA_ATOMIC';
UPDATE HeroClassProgressions SET  CombatStrength = 90, RangedCombatStrength = 100
WHERE HeroClassType = 'HEROCLASS_ANANSI' AND EraType = 'ERA_INFORMATION';

