-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_CIVILIZATION_FOUNDING_FATHERS',	'GOLDEN_TRAIT_HOMELAND_NEW_CITY_POPULATION'),--在首都所在大陆新建城市时获得1个额外人口。
('TRAIT_CIVILIZATION_FOUNDING_FATHERS',	'GOLDEN_TRAIT_LESS_PLOT_PURCHASE_COST'),--购买单元格的价格-25%。
('TRAIT_LEADER_ROOSEVELT_COROLLARY',	'GOLDEN_TRAIT_CITY_STATE_OPEN_BORDERS'),--所有城邦均对您开放边境。
('TRAIT_LEADER_ROOSEVELT_COROLLARY',	'GOLDEN_TRAIT_ROOSEVELT_COROLLARY_ENVOY_SCIENCE'),--每个使者+1科技值。
('TRAIT_LEADER_ROOSEVELT_COROLLARY',	'GOLDEN_TRAIT_ROOSEVELT_COROLLARY_ENVOY_CULTURE');--每个使者+1文化值。
------------------------------------------------
-- PolicyModifiers
------------------------------------------------
INSERT OR REPLACE INTO PolicyModifiers		(PolicyType,	ModifierId)
SELECT	PolicyType,		'GOLDEN_TRAIT_INFLUENCE_POINT_PER_MILITARY_POLICY' FROM Policies WHERE GovernmentSlotType = 'SLOT_MILITARY';
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_HOMELAND_NEW_CITY_POPULATION',           'MODIFIER_PLAYER_BUILT_CITIES_GRANT_FREE_POPULATION',   0, 1,  'GOLDEN_CITY_IS_OWNER_CAPITAL_CONTINENT_REQUIREMENTS'),
('GOLDEN_TRAIT_LESS_PLOT_PURCHASE_COST',                'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST',     0, 0,  NULL),
('GOLDEN_TRAIT_CITY_STATE_OPEN_BORDERS',	            'MODIFIER_ADJUST_OPEN_BORDERS_FROM_INFLUENCE',		    0, 0,  'PLAYER_IS_MINOR'),
('GOLDEN_TRAIT_INFLUENCE_POINT_PER_MILITARY_POLICY',	'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',		0, 0,  'GOLDEN_AMERICA_LEADER_IS_T_ROOSEVELT'),
('GOLDEN_TRAIT_ROOSEVELT_COROLLARY_ENVOY_SCIENCE',         'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE_PER_USED_INFLUENCE_TOKEN',         0, 0,  NULL),
('GOLDEN_TRAIT_ROOSEVELT_COROLLARY_ENVOY_CULTURE',         'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE_PER_USED_INFLUENCE_TOKEN',         0, 0,  NULL);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_TRAIT_HOMELAND_NEW_CITY_POPULATION',				'Amount',	   1),
('GOLDEN_TRAIT_LESS_PLOT_PURCHASE_COST',					'Amount',	   -25),
('GOLDEN_TRAIT_INFLUENCE_POINT_PER_MILITARY_POLICY',	    'Amount',	   2),
('GOLDEN_TRAIT_ROOSEVELT_COROLLARY_ENVOY_SCIENCE',	        'YieldType',   'YIELD_SCIENCE'),
('GOLDEN_TRAIT_ROOSEVELT_COROLLARY_ENVOY_SCIENCE',	        'Amount',	   1),
('GOLDEN_TRAIT_ROOSEVELT_COROLLARY_ENVOY_CULTURE',	        'YieldType',   'YIELD_CULTURE'),
('GOLDEN_TRAIT_ROOSEVELT_COROLLARY_ENVOY_CULTURE',	        'Amount',	   1);
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets		(RequirementSetId,							RequirementSetType)
VALUES	('GOLDEN_AMERICA_LEADER_IS_T_ROOSEVELT',		'REQUIREMENTSET_TEST_ALL');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements		(RequirementSetId,							RequirementId)
VALUES	('GOLDEN_AMERICA_LEADER_IS_T_ROOSEVELT',		'GOLDEN_AMERICA_REQUIRES_LEADER_IS_T_ROOSEVELT');
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Requirements	(RequirementId,												RequirementType)
VALUES	('GOLDEN_AMERICA_REQUIRES_LEADER_IS_T_ROOSEVELT',				'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES');
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementArguments		(RequirementId,												Name,			Value)
VALUES	('GOLDEN_AMERICA_REQUIRES_LEADER_IS_T_ROOSEVELT',				'LeaderType',	'LEADER_T_ROOSEVELT');
