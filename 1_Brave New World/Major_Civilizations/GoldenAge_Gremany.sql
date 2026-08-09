---------------------------------------------------------------------------------------------------------------
-- District_CitizenYieldChanges
---------------------------------------------------------------------------------------------------------------
UPDATE District_CitizenYieldChanges SET YieldChange = 5
WHERE DistrictType = 'DISTRICT_HANSA' AND YieldType = 'YIELD_PRODUCTION';
-----------------------------------------------
-- District_GreatPersonPoints
-----------------------------------------------
INSERT OR REPLACE INTO District_GreatPersonPoints (DistrictType, 			GreatPersonClassType, PointsPerTurn) VALUES	
('DISTRICT_HANSA',	'GREAT_PERSON_CLASS_MERCHANT', 1),
('DISTRICT_HANSA',	'GREAT_PERSON_CLASS_SCIENTIST', 1);
-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	    'TRAIT_POWERED_BUILDINGS_MORE_CULTURE'),
('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	    'TRAIT_POWERED_BUILDINGS_MORE_GOLD'),
('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	    'TRAIT_POWERED_BUILDINGS_MORE_PRODUCTION'),
('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	    'TRAIT_POWERED_BUILDINGS_MORE_SCIENCE'),
('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	    'TRAIT_POWERED_BUILDINGS_MORE_FOOD'),
('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	    'GOLDEN_TRAIT_POWERED_BUILDINGS_MORE_FAITH'),
('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	    'GOLDEN_TRAIT_IMPERIAL_FREE_PEACE_MOVEMENT'),
('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',	    'GOLDEN_TRAIT_IMPERIAL_FREE_WAR_MOVEMENT');
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_LEADER_HOLY_ROMAN_EMPEROR',	        'GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_MELEE_FROM_ENCAMPMENT'),
('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 		'GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_ENCAMPMENT_TILES_GOLD'),
('TRAIT_LEADER_HOLY_ROMAN_EMPEROR', 		'GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_ENCAMPMENT_TILES_PRODUCTION');

-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_POWERED_BUILDINGS_MORE_FAITH',					'MODIFIER_PLAYER_CITIES_ADJUST_YIELD_FROM_POWERED_BUILDINGS',				0,			0,			NULL),
('GOLDEN_TRAIT_IMPERIAL_FREE_PEACE_MOVEMENT',				    'MODIFIER_PLAYER_UNITS_ADJUST_FRIENDLY_TERRITORY_START_MOVEMENT',			0,			0,			'GOLDEN_PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS_REQUIREMENTS'),
('GOLDEN_TRAIT_IMPERIAL_FREE_WAR_MOVEMENT',				        'MODIFIER_PLAYER_UNITS_ADJUST_ENEMY_TERRITORY_START_MOVEMENT',			    0,			0,			'GOLDEN_PLAYER_IS_AT_WAR_WITH_MAJOR_REQUIREMENTS');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_MELEE_FROM_ENCAMPMENT',		'MODIFIER_PLAYER_CITIES_GRANT_UNIT_BY_CLASS',	0, 0,	'GOLDEN_CITY_HAS_DISTRICT_ENCAMPMENT_REQUIREMENTS'),
('GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_ENCAMPMENT_TILES_GOLD', 		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 			0, 0, 	'GOLDEN_PLOT_IS_ADJACENT_TO_DISTRICT_ENCAMPMENT_REQUIREMENTS'),
('GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_ENCAMPMENT_TILES_PRODUCTION', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 			0, 0, 	'GOLDEN_PLOT_IS_ADJACENT_TO_DISTRICT_ENCAMPMENT_REQUIREMENTS');

-- UPDATE Modifiers SET SubjectRequirementSetId = 'GOLDEN_GERMANY_OPPONENT_IS_CITY_STATE_OR_FREE_CIV_REQUIREMENTS' 
-- WHERE ModifierId = 'BARBAROSSA_COMBAT_BONUS_VS_CITY_STATES';
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			    Name,		                    Value) VALUES
('GOLDEN_TRAIT_POWERED_BUILDINGS_MORE_FAITH',					    'YieldType',		            'YIELD_FAITH'),
('GOLDEN_TRAIT_POWERED_BUILDINGS_MORE_FAITH',					    'Amount',		                3),
('GOLDEN_TRAIT_IMPERIAL_FREE_PEACE_MOVEMENT',					    'Amount',		                1),
('GOLDEN_TRAIT_IMPERIAL_FREE_WAR_MOVEMENT',					        'Amount',		                1);

INSERT OR REPLACE INTO ModifierArguments (ModifierId,			    Name,		                    Value) VALUES
('GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_MELEE_FROM_ENCAMPMENT',			'UnitPromotionClassType',		'PROMOTION_CLASS_MELEE'),
('GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_ENCAMPMENT_TILES_GOLD' , 			'YieldType' , 	'YIELD_GOLD'  ),
('GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_ENCAMPMENT_TILES_GOLD' , 			'Amount' , 		1  ),
('GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_ENCAMPMENT_TILES_PRODUCTION' , 	'YieldType' , 	'YIELD_PRODUCTION'  ),
('GOLDEN_TRAIT_HOLY_ROMAN_EMPEROR_ENCAMPMENT_TILES_PRODUCTION' , 	'Amount' , 		1  );


UPDATE ModifierArguments SET  Value = 3
WHERE ModifierId = 'TRAIT_POWERED_BUILDINGS_MORE_CULTURE' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 3
WHERE ModifierId = 'TRAIT_POWERED_BUILDINGS_MORE_GOLD' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 3
WHERE ModifierId = 'TRAIT_POWERED_BUILDINGS_MORE_PRODUCTION' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 3
WHERE ModifierId = 'TRAIT_POWERED_BUILDINGS_MORE_SCIENCE' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 3
WHERE ModifierId = 'TRAIT_POWERED_BUILDINGS_MORE_FOOD' AND Name = 'Amount';

UPDATE ModifierArguments SET  Value = 20
WHERE ModifierId = 'BARBAROSSA_COMBAT_BONUS_VS_CITY_STATES' AND Name = 'Amount';

---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
-- INSERT INTO RequirementSets
		-- (RequirementSetId,									RequirementSetType)
-- VALUES	('GOLDEN_GERMANY_OPPONENT_IS_CITY_STATE_OR_FREE_CIV_REQUIREMENTS',	'REQUIREMENTSET_TEST_ANY');
---------------------------------------------------------------------------------------------------------------					
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
-- INSERT INTO RequirementSetRequirements
		-- (RequirementSetId,									RequirementId)
-- VALUES	('GOLDEN_GERMANY_OPPONENT_IS_CITY_STATE_OR_FREE_CIV_REQUIREMENTS',	'REQUIRES_OPPONENT_IS_MINOR_CIV'),
		-- ('GOLDEN_GERMANY_OPPONENT_IS_CITY_STATE_OR_FREE_CIV_REQUIREMENTS',	'GOLDEN_REQUIRES_GERMANY_FREE_CITY_OPPONENT');
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
-- INSERT INTO Requirements
		-- (RequirementId,									RequirementType)
-- VALUES('GOLDEN_REQUIRES_GERMANY_FREE_CITY_OPPONENT',		'REQUIREMENT_CIVILIZATION_LEVEL');
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
-- INSERT INTO RequirementArguments
		-- (RequirementId,									Name,				Value)
-- VALUES	('GOLDEN_REQUIRES_GERMANY_FREE_CITY_OPPONENT',		'OpponentCivLevel',	'CIVILIZATION_LEVEL_FREE_CITIES');
