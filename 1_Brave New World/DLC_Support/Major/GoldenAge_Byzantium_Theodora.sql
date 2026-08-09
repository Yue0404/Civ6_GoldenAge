--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_THEODORA' AND ModifierId = 'THEODORA_HOLY_SITE_ADJACENCY_FARM';
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_THEODORA' AND ModifierId = 'THEODORA_HIPPODROME_ADJACENCY_FARM';

INSERT OR REPLACE INTO TraitModifiers 
(TraitType,	ModifierId)
SELECT
TraitType,	'GOLDEN_TRAIT_THEODORA_APOSTLE_PROMOTION_BONUS'
FROM Traits WHERE TraitType = 'TRAIT_LEADER_THEODORA';

INSERT OR REPLACE INTO TraitModifiers 
(TraitType,	ModifierId)
SELECT
TraitType,	'GOLDEN_TRAIT_THEODORA_HOLY_SITE_TILES_CULTURE'
FROM Traits WHERE TraitType = 'TRAIT_LEADER_THEODORA';

INSERT OR REPLACE INTO TraitModifiers 
(TraitType,	ModifierId)
SELECT
TraitType,	'GOLDEN_TRAIT_THEODORA_HOLY_SITE_TILES_FAITH'
FROM Traits WHERE TraitType = 'TRAIT_LEADER_THEODORA';
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)VALUES
('GOLDEN_TRAIT_THEODORA_APOSTLE_PROMOTION_BONUS', 'MODIFIER_PLAYER_UNIT_GRANT_UNLIMITED_PROMOTION_CHOICES', 0, 0, NULL),
('GOLDEN_TRAIT_THEODORA_HOLY_SITE_TILES_CULTURE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 'GOLDEN_PLOT_IS_TWO_TILES_AWAY_DISTRICT_HOLY_SITE_REQUIREMENTS'),
('GOLDEN_TRAIT_THEODORA_HOLY_SITE_TILES_FAITH', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 0, 'GOLDEN_PLOT_IS_TWO_TILES_AWAY_DISTRICT_HOLY_SITE_REQUIREMENTS');
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)VALUES
('GOLDEN_TRAIT_THEODORA_APOSTLE_PROMOTION_BONUS', 'UnitType', 'UNIT_APOSTLE'),
('GOLDEN_TRAIT_THEODORA_HOLY_SITE_TILES_CULTURE' , 	'YieldType' , 	'YIELD_CULTURE'  ),
('GOLDEN_TRAIT_THEODORA_HOLY_SITE_TILES_CULTURE' , 	'Amount' , 		1  ),
('GOLDEN_TRAIT_THEODORA_HOLY_SITE_TILES_FAITH' , 	'YieldType' , 	'YIELD_FAITH'  ),
('GOLDEN_TRAIT_THEODORA_HOLY_SITE_TILES_FAITH' , 	'Amount' , 		1  );
