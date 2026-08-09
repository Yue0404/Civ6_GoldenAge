-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_CIVILIZATION_TREASURE_FLEET',	'GOLDEN_TRAIT_MISSION_CITY_GROWTH'),
-- ('TRAIT_LEADER_EL_ESCORIAL',	        'GOLDEN_TRAIT_HOLY_SITE_DOUBLE_ADJACENT'),
('TRAIT_LEADER_EL_ESCORIAL',	        'MONASTIC_ISOLATION_REDUCE_COMBAT_LOSS'),
('TRAIT_LEADER_EL_ESCORIAL',	        'GOLDEN_TRAIT_IGNORE_TERRAIN_MODIFIER');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_MISSION_CITY_GROWTH',       'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH',       0, 0, 'REQUIREMENTS_PLOT_ADJACENT_MISSION_FOREIGN_CONTINENT'),
-- ('GOLDEN_TRAIT_HOLY_SITE_DOUBLE_ADJACENT', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER', 0, 0, 'DISTRICT_IS_HOLY_SITE'),
('GOLDEN_TRAIT_IGNORE_TERRAIN_MODIFIER',   'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',             0, 0, NULL);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_TRAIT_MISSION_CITY_GROWTH',					'Amount',	        20),
-- ('GOLDEN_TRAIT_HOLY_SITE_DOUBLE_ADJACENT',			    'YieldType',	    'YIELD_FAITH'),
-- ('GOLDEN_TRAIT_HOLY_SITE_DOUBLE_ADJACENT',				'Amount',	        100),
('GOLDEN_TRAIT_IGNORE_TERRAIN_MODIFIER',			    'AbilityType',	    'ABILITY_RELIGIOUS_IGNORE_TERRAIN_COST');
UPDATE ModifierArguments SET  Value = 5
WHERE ModifierId = 'TRAIT_MISSION_IDENTITY_PER_TURN_MODIFIER' AND Name = 'Amount';