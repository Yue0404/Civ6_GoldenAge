--Extra units
DELETE FROM MajorStartingUnits WHERE AiOnly = 1;
UPDATE MajorStartingUnits SET  Unit = 'UNIT_SCOUT'
WHERE Unit = 'UNIT_WARRIOR';

DELETE FROM BonusMinorStartingUnits WHERE Era = 'ERA_ANCIENT';
---
-- DELETE FROM TraitModifiers WHERE ModifierId = 'MINOR_CIV_PRODUCTION_PENALTY';

DELETE FROM TraitModifiers WHERE ModifierId = 'HIGH_DIFFICULTY_SCIENCE_SCALING';
DELETE FROM TraitModifiers WHERE ModifierId = 'HIGH_DIFFICULTY_CULTURE_SCALING';
DELETE FROM TraitModifiers WHERE ModifierId = 'HIGH_DIFFICULTY_PRODUCTION_SCALING';
DELETE FROM TraitModifiers WHERE ModifierId = 'HIGH_DIFFICULTY_GOLD_SCALING';
DELETE FROM TraitModifiers WHERE ModifierId = 'HIGH_DIFFICULTY_FAITH_SCALING';
DELETE FROM TraitModifiers WHERE ModifierId = 'BARBARIAN_CAMP_GOLD_SCALING';
-- DELETE FROM TraitModifiers WHERE ModifierId = 'HIGH_DIFFICULTY_COMBAT_SCALING';
DELETE FROM TraitModifiers WHERE ModifierId = 'LOW_DIFFICULTY_COMBAT_SCALING';
DELETE FROM TraitModifiers WHERE ModifierId = 'HIGH_DIFFICULTY_UNIT_XP_SCALING';
DELETE FROM TraitModifiers WHERE ModifierId = 'LOW_DIFFICULTY_UNIT_XP_SCALING';
DELETE FROM TraitModifiers WHERE ModifierId = 'HIGH_DIFFICULTY_FREE_TECH_BOOSTS';
DELETE FROM TraitModifiers WHERE ModifierId = 'HIGH_DIFFICULTY_FREE_CIVIC_BOOSTS';

---------------------------------------------------------
--Built for AI free strategic resources
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId)
SELECT	'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_RESOURCE_HORSES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId)
SELECT	'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_RESOURCE_IRON_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId)
SELECT	'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_RESOURCE_NITER_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId)
SELECT	'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_RESOURCE_COAL_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId)
SELECT	'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_RESOURCE_ALUMINUM_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId)
SELECT	'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_RESOURCE_OIL_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId)
SELECT	'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_RESOURCE_URANIUM_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_AI_FREE_RESOURCE_HORSES_' ||DifficultyType,	            'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_EXTRACTION',			'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ANIMAL_HUSBANDRY_REQUIREMENTS' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_AI_FREE_RESOURCE_IRON_' ||DifficultyType,	            'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_EXTRACTION',			'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_IRON_WORKING_REQUIREMENTS' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_AI_FREE_RESOURCE_NITER_' ||DifficultyType,	            'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_EXTRACTION',			'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_MILITARY_ENGINEERING_REQUIREMENTS' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_AI_FREE_RESOURCE_COAL_' ||DifficultyType,	            'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_EXTRACTION',			'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_INDUSTRIALIZATION_REQUIREMENTS' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_AI_FREE_RESOURCE_ALUMINUM_' ||DifficultyType,	        'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_EXTRACTION',			'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_REFINING_REQUIREMENTS' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_AI_FREE_RESOURCE_OIL_' ||DifficultyType,	            'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_EXTRACTION',			'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_CHEMISTRY_REQUIREMENTS' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_AI_FREE_RESOURCE_URANIUM_' ||DifficultyType,	        'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_EXTRACTION',			'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_COMBINED_ARMS_REQUIREMENTS' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_HORSES_' ||DifficultyType,	                            'ResourceType',	'RESOURCE_HORSES' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_HORSES_' ||DifficultyType,	                            'Amount',		1 FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_IRON_' ||DifficultyType,	                            'ResourceType',	'RESOURCE_IRON' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_IRON_' ||DifficultyType,	                            'Amount',		1 FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_NITER_' ||DifficultyType,	                            'ResourceType',	'RESOURCE_NITER' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_NITER_' ||DifficultyType,	                            'Amount',		1 FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_COAL_' ||DifficultyType,	                            'ResourceType',	'RESOURCE_COAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_COAL_' ||DifficultyType,	                            'Amount',		1 FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_ALUMINUM_' ||DifficultyType,	                        'ResourceType',	'RESOURCE_ALUMINUM' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_ALUMINUM_' ||DifficultyType,	                        'Amount',		1 FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_OIL_' ||DifficultyType,	                            'ResourceType',	'RESOURCE_OIL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_OIL_' ||DifficultyType,	                            'Amount',		1 FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_URANIUM_' ||DifficultyType,	                        'ResourceType',	'RESOURCE_URANIUM' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_AI_FREE_RESOURCE_URANIUM_' ||DifficultyType,	                        'Amount',		1 FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ANIMAL_HUSBANDRY_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_IRON_WORKING_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_MILITARY_ENGINEERING_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_INDUSTRIALIZATION_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_REFINING_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_CHEMISTRY_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_COMBINED_ARMS_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ANIMAL_HUSBANDRY_REQUIREMENTS',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ANIMAL_HUSBANDRY_REQUIREMENTS',	        'GOLDEN_REQUIRES_PLAYER_HAS_TECH_ANIMAL_HUSBANDRY' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ANIMAL_HUSBANDRY_REQUIREMENTS',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_IRON_WORKING_REQUIREMENTS',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_IRON_WORKING_REQUIREMENTS',	        'GOLDEN_REQUIRES_PLAYER_HAS_TECH_IRON_WORKING' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_IRON_WORKING_REQUIREMENTS',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_MILITARY_ENGINEERING_REQUIREMENTS',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_MILITARY_ENGINEERING_REQUIREMENTS',	        'GOLDEN_REQUIRES_PLAYER_HAS_TECH_MILITARY_ENGINEERING' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_MILITARY_ENGINEERING_REQUIREMENTS',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_INDUSTRIALIZATION_REQUIREMENTS',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_INDUSTRIALIZATION_REQUIREMENTS',	        'GOLDEN_REQUIRES_PLAYER_HAS_TECH_INDUSTRIALIZATION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_INDUSTRIALIZATION_REQUIREMENTS',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_REFINING_REQUIREMENTS',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_REFINING_REQUIREMENTS',	        'GOLDEN_REQUIRES_PLAYER_HAS_TECH_REFINING' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_REFINING_REQUIREMENTS',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_CHEMISTRY_REQUIREMENTS',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_CHEMISTRY_REQUIREMENTS',	        'GOLDEN_REQUIRES_PLAYER_HAS_TECH_CHEMISTRY' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_CHEMISTRY_REQUIREMENTS',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_COMBINED_ARMS_REQUIREMENTS',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_COMBINED_ARMS_REQUIREMENTS',	        'GOLDEN_REQUIRES_PLAYER_HAS_TECH_COMBINED_ARMS' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_COMBINED_ARMS_REQUIREMENTS',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

--AI free Amenities and Housing
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_AMENITIES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_HOUSING_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FREE_AMENITIES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FREE_HOUSING_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FREE_AMENITIES_' ||DifficultyType,	    'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY',			    'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FREE_HOUSING_' ||DifficultyType,	        'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',			    'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FREE_AMENITIES_' ||DifficultyType,	                    'Amount',		1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FREE_HOUSING_' ||DifficultyType,	                    'Amount',		1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

--AI yields per citizen
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_SCIENCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_SCIENCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_SCIENCE_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_SCIENCE_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_SCIENCE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_SCIENCE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_SCIENCE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_SCIENCE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_SCIENCE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_SCIENCE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_SCIENCE_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_SCIENCE_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_SCIENCE_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_SCIENCE_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_SCIENCE_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_SCIENCE_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_CULTURE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_CULTURE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_CULTURE_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_CULTURE_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_CULTURE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_CULTURE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_CULTURE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_CULTURE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_CULTURE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_CULTURE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_CULTURE_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_CULTURE_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_CULTURE_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_CULTURE_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_CULTURE_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_CULTURE_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_PRODUCTION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_PRODUCTION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_PRODUCTION_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_PRODUCTION_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_PRODUCTION_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_PRODUCTION_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_PRODUCTION_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_PRODUCTION_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_PRODUCTION_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_PRODUCTION_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_PRODUCTION_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_PRODUCTION_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_PRODUCTION_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_PRODUCTION_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_PRODUCTION_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_PRODUCTION_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FAITH_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FAITH_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FAITH_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FAITH_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FAITH_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FAITH_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FAITH_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FAITH_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FAITH_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FAITH_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FAITH_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FAITH_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FAITH_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FAITH_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FAITH_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_FAITH_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_GOLD_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_GOLD_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_GOLD_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_GOLD_CLASSICAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_GOLD_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_GOLD_MEDIEVAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_GOLD_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_GOLD_RENAISSANCE_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_GOLD_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_GOLD_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_GOLD_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_GOLD_MODERN_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_GOLD_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_GOLD_ATOMIC_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_GOLD_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_GOLD_INFORMATION_PER_CITIZEN_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_SCIENCE_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_SCIENCE_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_CLASSICAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_SCIENCE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MEDIEVAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_SCIENCE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_RENAISSANCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_SCIENCE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INDUSTRIAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_SCIENCE_MODERN_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MODERN' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_SCIENCE_ATOMIC_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_ATOMIC' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_SCIENCE_INFORMATION_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INFORMATION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_CULTURE_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_CULTURE_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_CLASSICAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_CULTURE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MEDIEVAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_CULTURE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_RENAISSANCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_CULTURE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INDUSTRIAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_CULTURE_MODERN_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MODERN' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_CULTURE_ATOMIC_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_ATOMIC' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_CULTURE_INFORMATION_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INFORMATION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_GOLD_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_GOLD_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_CLASSICAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_GOLD_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MEDIEVAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_GOLD_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_RENAISSANCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_GOLD_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INDUSTRIAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_GOLD_MODERN_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MODERN' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_GOLD_ATOMIC_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_ATOMIC' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_GOLD_INFORMATION_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INFORMATION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FAITH_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FAITH_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_CLASSICAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FAITH_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MEDIEVAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FAITH_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_RENAISSANCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FAITH_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INDUSTRIAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FAITH_MODERN_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MODERN' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FAITH_ATOMIC_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_ATOMIC' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FAITH_INFORMATION_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INFORMATION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_PRODUCTION_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_PRODUCTION_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_CLASSICAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_PRODUCTION_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MEDIEVAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_PRODUCTION_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_RENAISSANCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_PRODUCTION_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INDUSTRIAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_PRODUCTION_MODERN_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MODERN' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_PRODUCTION_ATOMIC_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_ATOMIC' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_PRODUCTION_INFORMATION_PER_CITIZEN_' ||DifficultyType,	            'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INFORMATION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_SCIENCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_SCIENCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_SCIENCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_SCIENCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_SCIENCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_SCIENCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_SCIENCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_SCIENCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_SCIENCE_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_CULTURE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_CULTURE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_CULTURE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_CULTURE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_CULTURE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_CULTURE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_CULTURE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_CULTURE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_CULTURE_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_GOLD_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_GOLD' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_GOLD_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_GOLD_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_GOLD' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_GOLD_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_GOLD_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_GOLD' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_GOLD_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_GOLD_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_GOLD' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_GOLD_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_GOLD_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_GOLD' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_GOLD_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_GOLD_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_GOLD' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_GOLD_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_GOLD_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_GOLD' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_GOLD_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_GOLD_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_GOLD' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_GOLD_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FAITH_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_FAITH' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FAITH_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FAITH_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_FAITH' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FAITH_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FAITH_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_FAITH' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FAITH_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FAITH_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_FAITH' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FAITH_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FAITH_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_FAITH' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FAITH_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FAITH_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_FAITH' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FAITH_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FAITH_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_FAITH' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FAITH_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_FAITH_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_FAITH' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_FAITH_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_PRODUCTION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_PRODUCTION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_CLASSICAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_PRODUCTION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_MEDIEVAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_PRODUCTION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_RENAISSANCE_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_PRODUCTION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_INDUSTRIAL_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_PRODUCTION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_MODERN_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.2            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_PRODUCTION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_ATOMIC_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,												Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'YieldType',	'YIELD_PRODUCTION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_PRODUCTION_INFORMATION_PER_CITIZEN_' ||DifficultyType,	                    'Amount',		0.3            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';


------
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_CLASSICAL',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MEDIEVAL',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_RENAISSANCE',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INDUSTRIAL',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MODERN',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_ATOMIC',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							    RequirementSetType)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INFORMATION',	'REQUIREMENTSET_TEST_ALL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_CLASSICAL',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_CLASSICAL',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_CLASSICAL',	        'GOLDEN_REQUIRES_GAME_ERA_ATLEAST_ERA_CLASSICAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MEDIEVAL',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MEDIEVAL',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MEDIEVAL',	        'GOLDEN_REQUIRES_GAME_ERA_ATLEAST_ERA_MEDIEVAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_RENAISSANCE',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_RENAISSANCE',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_RENAISSANCE',	        'GOLDEN_REQUIRES_GAME_ERA_ATLEAST_ERA_RENAISSANCE' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INDUSTRIAL',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INDUSTRIAL',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INDUSTRIAL',	        'GOLDEN_REQUIRES_GAME_ERA_ATLEAST_ERA_INDUSTRIAL' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MODERN',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MODERN',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_MODERN',	        'GOLDEN_REQUIRES_GAME_ERA_ATLEAST_ERA_MODERN' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_ATOMIC',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_ATOMIC',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_ATOMIC',	        'GOLDEN_REQUIRES_GAME_ERA_ATLEAST_ERA_ATOMIC' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INFORMATION',	        'REQUIRES_PLAYER_IS_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INFORMATION',	        'GOLDEN_REQUIRES_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI_ERA_INFORMATION',	        'GOLDEN_REQUIRES_GAME_ERA_ATLEAST_ERA_INFORMATION' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
------

--AI combat
UPDATE ModifierArguments SET  Value = 2
WHERE ModifierId = 'HIGH_DIFFICULTY_COMBAT_SCALING' AND Name = 'Amount';
UPDATE RequirementArguments SET  Value = 'DIFFICULTY_SETTLER'
WHERE RequirementId = 'REQUIRES_HIGH_DIFFICULTY' AND Name = 'Handicap';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) VALUES	
('MINOR_CIV_DEFAULT_TRAIT',		'HIGH_DIFFICULTY_COMBAT_SCALING');

-- INSERT OR REPLACE INTO Modifiers 
-- (ModifierId,										ModifierType,												SubjectRequirementSetId) VALUES	
-- ('GOLDEN_AI_COMBAT',	                            'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_DIFFICULTY',		    'GOLDEN_PLAYER_IS_AI_DIFFICULTY_SETTLER');

-- INSERT OR REPLACE INTO ModifierArguments 
-- (ModifierId,		                        Name,			Type,                           Value, Extra) VALUES	
-- ('GOLDEN_AI_COMBAT',	                    'Amount',		'LinearScaleFromDefaultHandicap', 2,     1);

-- INSERT OR REPLACE INTO ModifierStrings 
-- (ModifierId,		                                        Context,			Text) VALUES	
-- ('GOLDEN_AI_COMBAT',	                    'Preview',		    'GOLDEN_LOC_COMBAT_SCALING');

-- INSERT OR REPLACE INTO RequirementSets 				(RequirementSetId ,         RequirementSetType) 	
-- VALUES 		('GOLDEN_PLAYER_IS_AI_DIFFICULTY_SETTLER', 		    'REQUIREMENTSET_TEST_ALL');

-- INSERT OR REPLACE INTO RequirementSetRequirements 	(RequirementSetId ,         RequirementId) 			
-- VALUES 		('GOLDEN_PLAYER_IS_AI_DIFFICULTY_SETTLER', 		    'REQUIRES_PLAYER_IS_AI'),
            -- ('GOLDEN_PLAYER_IS_AI_DIFFICULTY_SETTLER', 		    'GOLDEN_REQUIRES_DIFFICULTY_SETTLER');
			
--AI BOOST (removed from major AI)
-- INSERT OR REPLACE INTO TraitModifiers 
-- (TraitType,						ModifierId) SELECT	
-- 'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_TECH_BOOST_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
-- INSERT OR REPLACE INTO TraitModifiers 
-- (TraitType,						ModifierId) SELECT	
-- 'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_CIVIC_BOOST_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_TECH_BOOST_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) SELECT	
'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_CIVIC_BOOST_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_TECH_BOOST_' ||DifficultyType,	            'MODIFIER_PLAYER_GRANT_RANDOM_TECHNOLOGY_BOOST_ON_NEW_ERA',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
'GOLDEN_AI_CIVIC_BOOST_' ||DifficultyType,	            'MODIFIER_PLAYER_GRANT_RANDOM_CIVIC_BOOST_ON_NEW_ERA',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_TECH_BOOST_' ||DifficultyType,	                    'Amount',		1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        Name,			Value) SELECT	
'GOLDEN_AI_CIVIC_BOOST_' ||DifficultyType,	                    'Amount',		1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

--AI unit experience
-- INSERT OR REPLACE INTO TraitModifiers 
-- (TraitType,						ModifierId) SELECT	
-- 'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_EXPERIENCE_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
-- INSERT OR REPLACE INTO TraitModifiers 
-- (TraitType,						ModifierId) SELECT	
-- 'MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_AI_EXPERIENCE_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

-- INSERT OR REPLACE INTO Modifiers 
-- (ModifierId,										ModifierType,												SubjectRequirementSetId) SELECT	
-- 'GOLDEN_AI_EXPERIENCE_' ||DifficultyType,	        'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_EXPERIENCE_MODIFIER',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

-- INSERT OR REPLACE INTO ModifierArguments 
-- (ModifierId,		                                        Name,			Value) SELECT	
-- 'GOLDEN_AI_EXPERIENCE_' ||DifficultyType,	                    'Amount',		5            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

--V229 AI ATTACK DISTRICT BONUS
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_DISTRICT_COMBAT_BONUS_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,													ModifierType,													SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FREE_DISTRICT_COMBAT_BONUS_' ||DifficultyType,	    'MODIFIER_GOVERNOR_ADJUST_DISTRICT_COMBAT_BONUS',			    'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        					Name,			Value) SELECT	
'GOLDEN_AI_FREE_DISTRICT_COMBAT_BONUS_' ||DifficultyType,	                    'Amount',		1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

--V229 AI SCIENTIFIC VICTORY BONUS
INSERT OR REPLACE INTO ProjectCompletionModifiers (ProjectType,						ModifierId) SELECT	
'PROJECT_LAUNCH_EXOPLANET_EXPEDITION',		'GOLDEN_AI_SCIENTIFIC_VICTORY_BONUS_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,												ModifierType,													SubjectRequirementSetId) SELECT	
'GOLDEN_AI_SCIENTIFIC_VICTORY_BONUS_' ||DifficultyType,	    'MODIFIER_PLAYER_ADJUST_SCIENCE_VICTORY_POINTS_PER_TURN',		'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        				Name,			Value) SELECT	
'GOLDEN_AI_SCIENTIFIC_VICTORY_BONUS_' ||DifficultyType,	                    'Amount',		1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

--V229 AI DIPLOMIATIC VICTORY BONUS
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId) SELECT	
'TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_AI_FREE_DIPLOMIATIC_VICTORY_BONUS_' ||DifficultyType FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO Modifiers 
(ModifierId,													ModifierType,													SubjectRequirementSetId) SELECT	
'GOLDEN_AI_FREE_DIPLOMIATIC_VICTORY_BONUS_' ||DifficultyType,	    'MODIFIER_PLAYER_ADJUST_DIPLOMATIC_VICTORY_POINTS',			    'GOLDEN_PLAYER_IS_' ||DifficultyType|| '_AI' FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        					Name,			Value) SELECT	
'GOLDEN_AI_FREE_DIPLOMIATIC_VICTORY_BONUS_' ||DifficultyType,	                'Amount',		1            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,		                                        					Name,			Value) SELECT	
'GOLDEN_AI_FREE_DIPLOMIATIC_VICTORY_BONUS_' ||DifficultyType,	                'Tooltip',		'LOC_DVP_TOOLTIP_DIFFICULTIES'            FROM Difficulties WHERE DifficultyType <> 'DIFFICULTY_SETTLER';

--AI free builder units by era
-- INSERT OR REPLACE INTO TraitModifiers
       -- (TraitType ,           ModifierId)
-- SELECT 'TRAIT_LEADER_MAJOR_CIV' ,  'GOLDEN_AI_UNIT_BUILDER_' ||EraType FROM Eras WHERE ChronologyIndex > 2;

-- INSERT OR REPLACE INTO Modifiers
       -- (ModifierId ,                                ModifierType,                                    		SubjectRequirementSetId)
-- SELECT 'GOLDEN_AI_UNIT_BUILDER_' ||EraType,        	'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',   				'GOLDEN_AI_IS_GAME_ERA_ATLEAST_' ||EraType|| '_REQUIREMENTS' FROM Eras WHERE ChronologyIndex > 1;

-- INSERT OR REPLACE INTO ModifierArguments
       -- (ModifierId , Name , Value)
-- SELECT ModifierId , 'Amount' , 		2 FROM TraitModifiers WHERE ModifierId LIKE 'GOLDEN_AI_UNIT_BUILDER_%';
-- INSERT OR REPLACE INTO ModifierArguments
       -- (ModifierId , Name , Value)
-- SELECT ModifierId , 'UnitType' , 	'UNIT_BUILDER' FROM TraitModifiers WHERE ModifierId LIKE 'GOLDEN_AI_UNIT_BUILDER_%';