--TRAIT_LEADER_SULEIMAN_ALT
--单个文明/领袖根据单位晋升获得额外时代得分
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT OR REPLACE INTO Types 
(Type, 																Kind) 
VALUES	
('MODIFIER_GA_PLAYER_ADJUST_ERA_SCORE_PER_UNIT_PROMOTION_EARNED',	'KIND_MODIFIER');
-----------------------------------------------
-- DynamicModifiers
-----------------------------------------------
INSERT OR REPLACE INTO DynamicModifiers 
(ModifierType, 														CollectionType,		EffectType) 
VALUES	
('MODIFIER_GA_PLAYER_ADJUST_ERA_SCORE_PER_UNIT_PROMOTION_EARNED',	'COLLECTION_OWNER',	'EFFECT_ADJUST_PLAYER_ERA_SCORE_PER_UNIT_PROMOTION_EARNED');

-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers 
(TraitType, 					ModifierId) 
VALUES	
('TRAIT_LEADER_SULEIMAN_ALT',	'TRAIT_SULEIMAN_ALT_DEBUFF_DARK_AGE'),
('TRAIT_LEADER_SULEIMAN_ALT',	'TRAIT_SULEIMAN_ALT_ERA_SCORE_FROM_UNIT_PROMOTION');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers 
(ModifierId, ModifierType, SubjectRequirementSetId) 
VALUES	
('TRAIT_SULEIMAN_ALT_DEBUFF_DARK_AGE',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',				'PLAYER_HAS_DARK_AGE'),
('TRAIT_SULEIMAN_ALT_ERA_SCORE_FROM_UNIT_PROMOTION',	'MODIFIER_GA_PLAYER_ADJUST_ERA_SCORE_PER_UNIT_PROMOTION_EARNED',	Null);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,											Name,			Value) 
VALUES
('TRAIT_SULEIMAN_ALT_DEBUFF_DARK_AGE',					'YieldType',	'YIELD_PRODUCTION, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'),
('TRAIT_SULEIMAN_ALT_DEBUFF_DARK_AGE',					'Amount',		'-5, -5, -5, -5, -5'),
('TRAIT_SULEIMAN_ALT_ERA_SCORE_FROM_UNIT_PROMOTION',	'Amount',		1);

UPDATE ModifierArguments SET Value = 'YIELD_PRODUCTION, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'
WHERE ModifierId = 'TRAIT_SULEIMAN_ALT_SCIENCE_CULTURE_GOLDEN_AGE' AND Name = 'YieldType';

UPDATE ModifierArguments SET Value = '15, 15, 15, 15, 15'
WHERE ModifierId = 'TRAIT_SULEIMAN_ALT_SCIENCE_CULTURE_GOLDEN_AGE' AND Name = 'Amount';

UPDATE ModifierArguments SET Value = 10
WHERE ModifierId = 'SULEIMAN_COMBAT_BUFF' AND Name = 'Amount';