UPDATE Units SET PopulationCost = 1, PrereqPopulation = 2 
WHERE UnitType IN (SELECT UnitType FROM Units WHERE Combat > 0 AND PrereqPopulation IS Null);

--v236 +1 start citizen
UPDATE StartEras	SET StartingPopulationCapital = 2	WHERE EraType = 'ERA_ANCIENT';

--老马右一冲突问题
DELETE FROM GovernorPromotionModifiers WHERE GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION' AND ModifierId = 'EXPEDITION_ADJUST_SETTLERS_CONSUME_POPULATION';

INSERT OR REPLACE INTO GovernorPromotionModifiers			
(GovernorPromotionType,						ModifierId) VALUES
('GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION', 	'MODIFIER_GA_SETTLER_POPULATION_REFUND');

INSERT OR REPLACE INTO Modifiers			
(ModifierId,								ModifierType,												SubjectRequirementSetId) VALUES
('MODIFIER_GA_SETTLER_POPULATION_REFUND',	'MODIFIER_PLAYER_CITIES_CHANGE_POPULATION_CREATE_UNIT',		'GA_CITY_FOUNDED');

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,								Name,		Value) VALUES						
('MODIFIER_GA_SETTLER_POPULATION_REFUND',	'UnitType',	'UNIT_SETTLER'),
('MODIFIER_GA_SETTLER_POPULATION_REFUND',	'Amount',	1);

INSERT OR REPLACE INTO RequirementSets 				(RequirementSetId ,     RequirementSetType) 	VALUES
('GA_CITY_FOUNDED' , 			'REQUIREMENTSET_TEST_ALL');
--RequirementSetRequirements
INSERT OR REPLACE INTO RequirementSetRequirements 	(RequirementSetId ,   RequirementId) 			VALUES
('GA_CITY_FOUNDED' , 		      'CITY_IS_ORIGINAL_OWNER_REQUIREMENTS');
--Requirements
INSERT OR REPLACE INTO 		Requirements (RequirementId,				   RequirementType) VALUES		
('CITY_IS_ORIGINAL_OWNER_REQUIREMENTS',                      'REQUIREMENT_CITY_IS_ORIGINAL_OWNER');

--AI_Food
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FOOD_' ||DifficultyType FROM Difficulties;
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FOOD_' ||DifficultyType FROM Difficulties;

INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,										SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FOOD_' ||DifficultyType,	        		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties;

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                    Name,			Value) SELECT	
'GOLDEN_AI_FOOD_' ||DifficultyType,	               		'YieldType',	'YIELD_FOOD'            FROM Difficulties;
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                    Name,			Value) SELECT	
'GOLDEN_AI_FOOD_' ||DifficultyType,	               		'Amount',		3            FROM Difficulties;

--AI Food --Total War
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FOOD_PLUS_' ||DifficultyType FROM Difficulties WHERE EXISTS (SELECT * FROM TraitModifiers WHERE ModifierId = 'GOLDEN_AI_PRODUCTION_DIFFICULTY_SETTLER');

INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FOOD_PLUS_' ||DifficultyType,	        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE EXISTS (SELECT * FROM TraitModifiers WHERE ModifierId = 'GOLDEN_AI_PRODUCTION_DIFFICULTY_SETTLER');

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FOOD_PLUS_' ||DifficultyType,	                'YieldType',	'YIELD_FOOD' FROM Difficulties WHERE EXISTS (SELECT * FROM TraitModifiers WHERE ModifierId = 'GOLDEN_AI_PRODUCTION_DIFFICULTY_SETTLER');
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FOOD_PLUS_' ||DifficultyType,	                'Amount',		1            FROM Difficulties WHERE EXISTS (SELECT * FROM TraitModifiers WHERE ModifierId = 'GOLDEN_AI_PRODUCTION_DIFFICULTY_SETTLER');