--AI yields percentage
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_PRODUCTION_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_GOLD_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FAITH_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_PRODUCTION_' ||DifficultyType,	        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_GOLD_' ||DifficultyType,	                'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FAITH_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_' ||DifficultyType,	                'YieldType',	'YIELD_PRODUCTION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_' ||DifficultyType,	                'Amount',		8            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_GOLD_' ||DifficultyType,	                        'YieldType',	'YIELD_GOLD' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_GOLD_' ||DifficultyType,	                        'Amount',		5            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FAITH_' ||DifficultyType,	                    'YieldType',	'YIELD_FAITH' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FAITH_' ||DifficultyType,	                    'Amount',		5            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
