-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_LEADER_SUNDIATA_KEITA',	'TRAIT_MALI_MINES_PRODUCTION'),
('TRAIT_LEADER_SUNDIATA_KEITA',	'TRAIT_MALI_MINES_GOLD'),
('TRAIT_LEADER_SUNDIATA_KEITA',	'GA_TRAIT_MALI_MINES_FAITH'),
('TRAIT_LEADER_SUNDIATA_KEITA',	'GA_TRAIT_MALI_GREATPEOPLE_FAITH_DISCOUNT');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GA_TRAIT_MALI_MINES_FAITH',      'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 'PLOT_HAS_MINE_REQUIREMENTS'),
('GA_TRAIT_MALI_GREATPEOPLE_FAITH_DISCOUNT',      'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_PATRONAGE_DISCOUNT_PERCENT', 0, 0, NULL);

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GA_TRAIT_MALI_MINES_FAITH',					            'YieldType',	    'YIELD_FAITH'),
('GA_TRAIT_MALI_MINES_FAITH',					            'Amount',	        3),
('GA_TRAIT_MALI_GREATPEOPLE_FAITH_DISCOUNT',				'YieldType',	    'YIELD_FAITH'),
('GA_TRAIT_MALI_GREATPEOPLE_FAITH_DISCOUNT',				'Amount',	        25);

UPDATE ModifierArguments SET  Value = 3
WHERE ModifierId = 'TRAIT_MALI_MINES_GOLD' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 25
WHERE ModifierId = 'SUNDIATA_KEITA_PURCHASE_GREAT_PEOPLE' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 5
WHERE ModifierId = 'SUNDIATA_KEITA_GREAT_WORK_GOLD_WRITING' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 5
WHERE ModifierId = 'SUNDIATA_KEITA_GREAT_WORK_PRODUCTION_WRITING' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 'YIELD_FAITH'
WHERE ModifierId = 'SUNDIATA_KEITA_GREAT_WORK_PRODUCTION_WRITING' AND Name = 'YieldType';