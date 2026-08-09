--TraitModifiers
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_CAESAR';
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) SELECT	
'TRAIT_LEADER_CAESAR', 'TRAIT_CAESAR_GOLD_CAPTURED_CITY_'|| EraType FROM Eras;
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) SELECT	
'TRAIT_LEADER_CAESAR', 'TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_'|| EraType FROM Eras;
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) SELECT	
'TRAIT_LEADER_CAESAR', 'TRAIT_CAESAR_CULTURE_CAPTURED_CITY_'|| EraType FROM Eras;
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) SELECT	
'TRAIT_LEADER_CAESAR', 'TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_'|| EraType FROM Eras;
INSERT OR REPLACE INTO TraitModifiers 
(TraitType, 					ModifierId)VALUES 
('TRAIT_LEADER_CAESAR' ,		'GOLDEN_TRAIT_CAESAR_FREE_UNIT_ROMAN_LEGION');
----Modifiers
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType, 										SubjectRequirementSetId) SELECT
'TRAIT_CAESAR_GOLD_CAPTURED_CITY_'|| EraType,						'MODIFIER_PLAYER_CAPTURED_CITY_ATTACH_MODIFIER', 	'GOLDEN_GAME_ERA_IS_'|| EraType ||'_REQUIREMENTS' FROM Eras;
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType, 					Permanent, 	RunOnce) SELECT
'TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_'|| EraType,				'MODIFIER_PLAYER_GRANT_YIELD', 	1, 			1 FROM Eras;
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType, 										SubjectRequirementSetId) SELECT
'TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_'|| EraType,					'MODIFIER_PLAYER_CAPTURED_CITY_ATTACH_MODIFIER', 	'GOLDEN_GAME_ERA_IS_'|| EraType ||'_REQUIREMENTS' FROM Eras;
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType, 					Permanent, 	RunOnce) SELECT
'TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_'|| EraType,			'MODIFIER_PLAYER_GRANT_YIELD', 	1, 			1 FROM Eras;
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType, 										SubjectRequirementSetId) SELECT
'TRAIT_CAESAR_CULTURE_CAPTURED_CITY_'|| EraType,					'MODIFIER_PLAYER_CAPTURED_CITY_ATTACH_MODIFIER', 	'GOLDEN_GAME_ERA_IS_'|| EraType ||'_REQUIREMENTS' FROM Eras;
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType, 					Permanent, 	RunOnce) SELECT
'TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_'|| EraType,			'MODIFIER_PLAYER_GRANT_YIELD', 	1, 			1 FROM Eras;
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType, 										SubjectRequirementSetId) SELECT
'TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_'|| EraType,						'MODIFIER_PLAYER_ADJUST_GOLD_DISPERSAL', 			'GOLDEN_GAME_ERA_IS_'|| EraType ||'_REQUIREMENTS' FROM Eras;
INSERT OR REPLACE INTO Modifiers 
(ModifierId, 												ModifierType, 										RunOnce, 	Permanent, 		SubjectRequirementSetId) VALUES 
('GOLDEN_TRAIT_CAESAR_FREE_UNIT_ROMAN_LEGION' ,				'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL', 			0, 			0 ,				'GOLDEN_PLAYER_HAS_TECH_IRON_WORKING_REQUIREMENTS');
--ModifierArguments
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        	Value) SELECT
'TRAIT_CAESAR_GOLD_CAPTURED_CITY_'|| EraType,							'ModifierId',			'TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_'|| EraType FROM Eras;
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        	Value) SELECT
'TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_'|| EraType,					'YieldType',			'YIELD_GOLD' FROM Eras;
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        Value,		Type) VALUES
('TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_ERA_ANCIENT',				'Amount',	        150,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_ERA_CLASSICAL',				'Amount',	        240,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_ERA_MEDIEVAL',				'Amount',	        384,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_ERA_RENAISSANCE',			'Amount',	        614,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_ERA_INDUSTRIAL',				'Amount',	        983,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_ERA_MODERN',					'Amount',	        1573,       'ScaleByGameSpeed'),
('TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_ERA_ATOMIC',					'Amount',	        2517,       'ScaleByGameSpeed'),
('TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_ERA_INFORMATION',			'Amount',	        4027,       'ScaleByGameSpeed'),
('TRAIT_CAESAR_GOLD_CAPTURED_CITY_MODIFIER_ERA_FUTURE',					'Amount',	        6442,       'ScaleByGameSpeed');
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        	Value) SELECT
'TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_'|| EraType,						'ModifierId',			'TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_'|| EraType FROM Eras;
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        	Value) SELECT
'TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_'|| EraType,				'YieldType',			'YIELD_SCIENCE' FROM Eras;
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        Value,		Type) VALUES
('TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_ERA_ANCIENT',				'Amount',	        150,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_ERA_CLASSICAL',			'Amount',	        240,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_ERA_MEDIEVAL',			'Amount',	        384,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_ERA_RENAISSANCE',			'Amount',	        614,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_ERA_INDUSTRIAL',			'Amount',	        983,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_ERA_MODERN',				'Amount',	        1573,       'ScaleByGameSpeed'),
('TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_ERA_ATOMIC',				'Amount',	        2517,       'ScaleByGameSpeed'),
('TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_ERA_INFORMATION',			'Amount',	        4027,       'ScaleByGameSpeed'),
('TRAIT_CAESAR_SCIENCE_CAPTURED_CITY_MODIFIER_ERA_FUTURE',				'Amount',	        6442,       'ScaleByGameSpeed');
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        	Value) SELECT
'TRAIT_CAESAR_CULTURE_CAPTURED_CITY_'|| EraType,						'ModifierId',			'TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_'|| EraType FROM Eras;
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        	Value) SELECT
'TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_'|| EraType,				'YieldType',			'YIELD_CULTURE' FROM Eras;
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        Value,		Type) VALUES
('TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_ERA_ANCIENT',				'Amount',	        150,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_ERA_CLASSICAL',			'Amount',	        240,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_ERA_MEDIEVAL',			'Amount',	        384,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_ERA_RENAISSANCE',			'Amount',	        614,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_ERA_INDUSTRIAL',			'Amount',	        983,        'ScaleByGameSpeed'),
('TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_ERA_MODERN',				'Amount',	        1573,       'ScaleByGameSpeed'),
('TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_ERA_ATOMIC',				'Amount',	        2517,       'ScaleByGameSpeed'),
('TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_ERA_INFORMATION',			'Amount',	        4027,       'ScaleByGameSpeed'),
('TRAIT_CAESAR_CULTURE_CAPTURED_CITY_MODIFIER_ERA_FUTURE',				'Amount',	        6442,       'ScaleByGameSpeed');
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        	Value) SELECT
'TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_'|| EraType,							'Improvement',			'IMPROVEMENT_BARBARIAN_CAMP' FROM Eras;
INSERT OR REPLACE INTO ModifierArguments (ModifierId,				    Name,		        Value) VALUES
('TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_ERA_ANCIENT',						'Amount',	        100),
('TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_ERA_CLASSICAL',						'Amount',	        160),
('TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_ERA_MEDIEVAL',						'Amount',	        256),
('TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_ERA_RENAISSANCE',					'Amount',	        410),
('TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_ERA_INDUSTRIAL',						'Amount',	        655),
('TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_ERA_MODERN',							'Amount',	        1049),
('TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_ERA_ATOMIC',							'Amount',	        1678),
('TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_ERA_INFORMATION',					'Amount',	        2684),
('TRAIT_CAESAR_GOLD_BARBARIAN_CAMP_ERA_FUTURE',							'Amount',	        4295);
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId, Name, Value) VALUES 
('GOLDEN_TRAIT_CAESAR_FREE_UNIT_ROMAN_LEGION',		'UnitType',		'UNIT_ROMAN_LEGION'),
('GOLDEN_TRAIT_CAESAR_FREE_UNIT_ROMAN_LEGION',		'Amount',		3);