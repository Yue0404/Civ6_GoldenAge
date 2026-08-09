--单位克制
-----------------------------------------------
-- GlobalParameters<!--攻城与远程单位克制（17）-->	
-----------------------------------------------
UPDATE GlobalParameters SET  Value = 20
WHERE Name = 'COMBAT_RANGED_VS_DISTRICT_STRENGTH_MODIFIER';
UPDATE GlobalParameters SET  Value = 20
WHERE Name = 'COMBAT_BOMBARD_VS_UNIT_STRENGTH_MODIFIER';
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT OR REPLACE INTO Types (Type,						Kind)
VALUES
('ABILITY_CAVALRY_SIEGE',						'KIND_ABILITY'),
('ABILITY_RANGE_MELEE',							'KIND_ABILITY'),
('ABILITY_HEAVYCAVALRY_RANGE',					'KIND_ABILITY');
-----------------------------------------------
-- TypeTags
-----------------------------------------------		
INSERT OR REPLACE INTO TypeTags (Type,									Tag)
VALUES	
('ABILITY_CAVALRY_SIEGE',				'CLASS_LIGHT_CAVALRY'),
('ABILITY_RANGE_MELEE',					'CLASS_TRUE_RANGED'),
('ABILITY_HEAVYCAVALRY_RANGE',			'CLASS_HEAVY_CAVALRY');

-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilities (UnitAbilityType,						Name,									Description) VALUES	
('ABILITY_CAVALRY_SIEGE',				'LOC_ABILITY_CAVALRY_SIEGE_NAME',		'LOC_ABILITY_CAVALRY_SIEGE_DESCRIPTION'),
('ABILITY_RANGE_MELEE',					'LOC_ABILITY_RANGE_MELEE_NAME',			'LOC_ABILITY_RANGE_MELEE_DESCRIPTION'),
('ABILITY_HEAVYCAVALRY_RANGE',			'LOC_ABILITY_HEAVYCAVALRY_RANGE_NAME',	'LOC_ABILITY_HEAVYCAVALRY_RANGE_DESCRIPTION');
-----------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilityModifiers (UnitAbilityType,						ModifierId) VALUES	
('ABILITY_CAVALRY_SIEGE',				'GOLDEN_ADJUST_CAVALRY_SIEGE'),
('ABILITY_RANGE_MELEE',					'GOLDEN_ADJUST_RANGE_MELEE'),
('ABILITY_HEAVYCAVALRY_RANGE',			'GOLDEN_ADJUST_HEAVYCAVALRY_RANGE');


-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType,								SubjectRequirementSetId)
VALUES	
('GOLDEN_ADJUST_CAVALRY_SIEGE',							'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		'GOLDEN_OPPONENT_SIEGE_REQUIREMENTS'),
('GOLDEN_ADJUST_RANGE_MELEE',							'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		'GOLDEN_OPPONENT_FIRESUPPORT_REQUIREMENTS'),
('GOLDEN_ADJUST_HEAVYCAVALRY_RANGE',					'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		'GOLDEN_OPPONENT_RANGE_REQUIREMENTS');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				Name,		Value)
VALUES
('GOLDEN_ADJUST_CAVALRY_SIEGE',							'Amount',	15),
('GOLDEN_ADJUST_RANGE_MELEE',							'Amount',	15),
('GOLDEN_ADJUST_HEAVYCAVALRY_RANGE',					'Amount',	15);
UPDATE ModifierArguments SET  Value = 15
WHERE ModifierId = 'ANTI_SPEAR' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 15
WHERE ModifierId = 'ANTI_CAVALRY_COMBAT_BONUS' AND Name = 'Amount';

-----------------------------------------------
-- ModifierStrings
-----------------------------------------------
INSERT OR REPLACE INTO ModifierStrings (ModifierId,				Context,	Text)
VALUES	
('GOLDEN_ADJUST_CAVALRY_SIEGE',							'Preview',	'LOC_ABILITY_CAVALRY_SIEGE_MODIFIER_DESCRIPTION'),
('GOLDEN_ADJUST_RANGE_MELEE',							'Preview',	'LOC_ABILITY_RANGE_MELEE_MODIFIER_DESCRIPTION'),
('GOLDEN_ADJUST_HEAVYCAVALRY_RANGE',					'Preview',	'LOC_ABILITY_HEAVYCAVALRY_RANGE_MODIFIER_DESCRIPTION');
-----------------------------------------------
--RequirementSets
-----------------------------------------------
INSERT OR REPLACE INTO RequirementSets 				(RequirementSetId ,     RequirementSetType) 	
VALUES 		('GOLDEN_OPPONENT_SIEGE_REQUIREMENTS' , 		'REQUIREMENTSET_TEST_ALL'),
			('GOLDEN_OPPONENT_MELEE_REQUIREMENTS' , 		'REQUIREMENTSET_TEST_ALL'),
            ('GOLDEN_OPPONENT_RANGE_REQUIREMENTS' , 		'REQUIREMENTSET_TEST_ALL');	
	
INSERT OR REPLACE INTO RequirementSetRequirements 	(RequirementSetId ,     RequirementId) 			
VALUES 		('GOLDEN_OPPONENT_SIEGE_REQUIREMENTS' , 		'OPPONENT_SIEGE_REQUIREMENT'), 
			('GOLDEN_OPPONENT_MELEE_REQUIREMENTS' , 		'GOLDEN_REQUIRES_OPPONENT_MELEE'),  
            ('GOLDEN_OPPONENT_RANGE_REQUIREMENTS' , 		'OPPONENT_RANGED_REQUIREMENT');	

INSERT OR REPLACE INTO Requirements		(RequirementId, RequirementType)
VALUES 		('GOLDEN_REQUIRES_OPPONENT_MELEE', 'REQUIREMENT_OPPONENT_UNIT_PROMOTION_CLASS_MATCHES');

INSERT OR REPLACE INTO RequirementArguments		(RequirementId, Name, Value)
VALUES 		('GOLDEN_REQUIRES_OPPONENT_MELEE', 'UnitPromotionClass', 'PROMOTION_CLASS_MELEE');

-------------------------------------------------
--单位克制
--远程改为克制火力支援
INSERT OR REPLACE INTO RequirementSets 				(RequirementSetId ,     RequirementSetType) 	
VALUES 		('GOLDEN_OPPONENT_FIRESUPPORT_REQUIREMENTS' , 		'REQUIREMENTSET_TEST_ALL');	
	
INSERT OR REPLACE INTO RequirementSetRequirements 	(RequirementSetId ,     RequirementId) 			
VALUES 		('GOLDEN_OPPONENT_FIRESUPPORT_REQUIREMENTS' , 		'OPPONENT_FIRESUPPORT_REQUIREMENT');	

INSERT OR REPLACE INTO Requirements		(RequirementId, RequirementType)
VALUES 		('OPPONENT_FIRESUPPORT_REQUIREMENT', 'REQUIREMENT_OPPONENT_UNIT_PROMOTION_CLASS_MATCHES');

INSERT OR REPLACE INTO RequirementArguments		(RequirementId, Name, Value)
VALUES 		('OPPONENT_FIRESUPPORT_REQUIREMENT', 'UnitPromotionClass', 'PROMOTION_CLASS_FIRESUPPORT');

--火力支援克制近战
-- Types
INSERT OR REPLACE INTO Types (Type,						Kind)
VALUES
('ABILITY_FIRESUPPORT_MELEE',					'KIND_ABILITY');
-- TypeTags
INSERT OR REPLACE INTO TypeTags (Type,									Tag)
VALUES	
('ABILITY_FIRESUPPORT_MELEE',					'CLASS_FIRESUPPORT');
-- UnitAbilities
INSERT OR REPLACE INTO UnitAbilities (UnitAbilityType,						Name,									Description) VALUES	
('ABILITY_FIRESUPPORT_MELEE',					'LOC_ABILITY_FIRESUPPORT_MELEE_NAME',			'LOC_ABILITY_FIRESUPPORT_MELEE_DESCRIPTION');
-- UnitAbilityModifiers
INSERT OR REPLACE INTO UnitAbilityModifiers (UnitAbilityType,						ModifierId) VALUES	
('ABILITY_FIRESUPPORT_MELEE',					'GOLDEN_ADJUST_FIRESUPPORT_MELEE');
-- Modifiers
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType,								SubjectRequirementSetId)
VALUES	
('GOLDEN_ADJUST_FIRESUPPORT_MELEE',							'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		'GOLDEN_OPPONENT_MELEE_REQUIREMENTS');
-- ModifierArguments
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				Name,		Value)
VALUES
('GOLDEN_ADJUST_FIRESUPPORT_MELEE',							'Amount',	15);
-- ModifierStrings
INSERT OR REPLACE INTO ModifierStrings (ModifierId,				Context,	Text)
VALUES	
('GOLDEN_ADJUST_FIRESUPPORT_MELEE',							'Preview',	'LOC_ABILITY_FIRESUPPORT_MELEE_MODIFIER_DESCRIPTION');