--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)VALUES
('TRAIT_LEADER_WU_ZETIAN', 'GOLDEN_WU_ZETIAN_OFFENSIVE_SPY_GOLD'),
('TRAIT_LEADER_WU_ZETIAN', 'GOLDEN_WU_ZETIAN_OFFENSIVE_SPY_FAITH');

--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)VALUES
('GOLDEN_WU_ZETIAN_OFFENSIVE_SPY_GOLD', 	'MODIFIER_PLAYER_ADJUST_TARGET_CITY_SPY_YIELD_PERCENT', NULL),
('GOLDEN_WU_ZETIAN_OFFENSIVE_SPY_FAITH', 	'MODIFIER_PLAYER_ADJUST_TARGET_CITY_SPY_YIELD_PERCENT', NULL);

--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)VALUES
('GOLDEN_WU_ZETIAN_OFFENSIVE_SPY_GOLD', 'YieldType', 'YIELD_GOLD'),
('GOLDEN_WU_ZETIAN_OFFENSIVE_SPY_GOLD', 'Percent', 100),
('GOLDEN_WU_ZETIAN_OFFENSIVE_SPY_FAITH', 'YieldType', 'YIELD_FAITH'),
('GOLDEN_WU_ZETIAN_OFFENSIVE_SPY_FAITH', 'Percent', 100);
UPDATE ModifierArguments SET Value = 100
WHERE ModifierId = 'WU_ZETIAN_OFFENSIVE_SPY_SCIENCE' AND Name = 'Percent';
UPDATE ModifierArguments SET Value = 100
WHERE ModifierId = 'WU_ZETIAN_OFFENSIVE_SPY_CULTURE' AND Name = 'Percent';