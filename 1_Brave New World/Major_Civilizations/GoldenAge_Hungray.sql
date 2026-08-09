-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_CIVILIZATION_PEARL_DANUBE',	'GOLDEN_TRAIT_RIVER_CITY_FREE_POPULATION');
---------------------------------------------------------------------------------------------------------------
-- BeliefModifiers
---------------------------------------------------------------------------------------------------------------	
INSERT OR REPLACE INTO BeliefModifiers (BeliefType,	ModifierID) 
SELECT	BeliefType,		'GOLDEN_TRAIT_PANTHEON_INFLUENCE_TOKEN' FROM Beliefs WHERE BeliefClassType = 'BELIEF_CLASS_PANTHEON';
INSERT OR REPLACE INTO BeliefModifiers (BeliefType,	ModifierID)
SELECT	BeliefType,		'GOLDEN_TRAIT_RELIGION_INFLUENCE_TOKEN' FROM Beliefs WHERE BeliefClassType <> 'BELIEF_CLASS_PANTHEON';
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_RIVER_CITY_FREE_POPULATION',                     'MODIFIER_PLAYER_BUILT_CITIES_GRANT_FREE_POPULATION',                   0,          1,          'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS'),
('GOLDEN_TRAIT_PANTHEON_INFLUENCE_TOKEN',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',									0,			0,			'GOLDEN_HUNGRAY_PLAYER_HAS_PANTHEON'),
('GOLDEN_TRAIT_PANTHEON_INFLUENCE_TOKEN_MODIFIER',				'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',								1,			1,			NULL),
('GOLDEN_TRAIT_RELIGION_INFLUENCE_TOKEN',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',									0,			0,			'GOLDEN_HUNGRAY_PLAYER_FOUNDED_RELIGION'),
('GOLDEN_TRAIT_RELIGION_INFLUENCE_TOKEN_MODIFIER',				'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',								1,			1,			NULL);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_TRAIT_RIVER_CITY_FREE_POPULATION',					    'Amount',	    1),
('GOLDEN_TRAIT_PANTHEON_INFLUENCE_TOKEN',						'ModifierId',	'GOLDEN_TRAIT_PANTHEON_INFLUENCE_TOKEN_MODIFIER'),
('GOLDEN_TRAIT_PANTHEON_INFLUENCE_TOKEN_MODIFIER',				'Amount',		2),
('GOLDEN_TRAIT_RELIGION_INFLUENCE_TOKEN',						'ModifierId',	'GOLDEN_TRAIT_RELIGION_INFLUENCE_TOKEN_MODIFIER'),
('GOLDEN_TRAIT_RELIGION_INFLUENCE_TOKEN_MODIFIER',				'Amount',		2);
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'TRAIT_CITY_ADJACENT_RIVER_BUILDING_PRODUCTION' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 100
WHERE ModifierId = 'TRAIT_CITY_ADJACENT_RIVER_DISTRICT_PRODUCTION' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 1
WHERE ModifierId = 'LEVY_MILITARY_TWO_FREE_ENVOYS' AND Name = 'Amount';
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets(RequirementSetId,								RequirementSetType)VALUES	
('GOLDEN_HUNGRAY_PLAYER_HAS_PANTHEON',				'REQUIREMENTSET_TEST_ALL'),
('GOLDEN_HUNGRAY_PLAYER_FOUNDED_RELIGION',			'REQUIREMENTSET_TEST_ALL');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements(RequirementSetId,								RequirementId)VALUES	
('GOLDEN_HUNGRAY_PLAYER_HAS_PANTHEON',				'GOLDEN_HUNGRAY_REQUIRES_LEADER_MATTHIAS_CORVINUS'),
('GOLDEN_HUNGRAY_PLAYER_HAS_PANTHEON',				'REQUIRES_PLAYER_HAS_PANTHEON'),
('GOLDEN_HUNGRAY_PLAYER_FOUNDED_RELIGION',			'GOLDEN_HUNGRAY_REQUIRES_LEADER_MATTHIAS_CORVINUS'),
('GOLDEN_HUNGRAY_PLAYER_FOUNDED_RELIGION',			'REQUIRES_PLAYER_FOUNDED_RELIGION');
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Requirements(RequirementId,							RequirementType) VALUES	
('GOLDEN_HUNGRAY_REQUIRES_LEADER_MATTHIAS_CORVINUS',	'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES');
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementArguments(RequirementId,							Name,			Value) VALUES	
('GOLDEN_HUNGRAY_REQUIRES_LEADER_MATTHIAS_CORVINUS',	'LeaderType',	'LEADER_MATTHIAS_CORVINUS');
