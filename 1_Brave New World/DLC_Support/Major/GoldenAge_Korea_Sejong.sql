-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_SEJONG';

INSERT OR REPLACE INTO TraitModifiers 
(TraitType,	ModifierId)
SELECT
TraitType,	'GOLDEN_TRAIT_SEJONG_SEOWON_TILES_CULTURE'
FROM Traits WHERE TraitType = 'TRAIT_LEADER_SEJONG';

INSERT OR REPLACE INTO TraitModifiers 
(TraitType,	ModifierId)
SELECT
TraitType,	'GOLDEN_TRAIT_SEJONG_THEATER_TILES_SCIENCE'
FROM Traits WHERE TraitType = 'TRAIT_LEADER_SEJONG';

INSERT OR REPLACE INTO TraitModifiers 	
(TraitType,			ModifierId)
SELECT
a.TraitType,		'GOLDEN_SEJONG_TECH_SCIENCE_INTO_CULTURE_' || b.EraType 
FROM Traits AS a, Eras AS b
WHERE a.TraitType = 'TRAIT_LEADER_SEJONG';
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)VALUES
('GOLDEN_TRAIT_SEJONG_SEOWON_TILES_CULTURE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 1, 'GA_GOLDEN_PLOT_IS_ADJACENT_TO_DISTRICT_SEOWON_REQUIREMENTS'),
('GOLDEN_TRAIT_SEJONG_THEATER_TILES_SCIENCE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 0, 1, 'GOLDEN_PLOT_IS_ADJACENT_TO_DISTRICT_THEATER_REQUIREMENTS');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
SELECT	'GOLDEN_SEJONG_TECH_SCIENCE_INTO_CULTURE_' || EraType,	'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE', 1,	1,	'GOLDEN_PLAYER_HAS_'|| EraType ||'_TECH_REQUIREMENTS' FROM Eras;	
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
SELECT	'GOLDEN_SEJONG_CIVIC_CULTURE_INTO_SCIENCE_' || EraType,	'MODIFIER_PLAYER_GRANT_YIELD_BASED_ON_CURRENT_YIELD_RATE', 1,	1,	'GOLDEN_PLAYER_HAS_'|| EraType ||'_CIVIC_REQUIREMENTS' FROM Eras;	

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)VALUES
('GOLDEN_TRAIT_SEJONG_SEOWON_TILES_CULTURE' , 	'YieldType' , 	'YIELD_CULTURE'  ),
('GOLDEN_TRAIT_SEJONG_SEOWON_TILES_CULTURE' , 	'Amount' , 		1  ),
('GOLDEN_TRAIT_SEJONG_THEATER_TILES_SCIENCE' , 	'YieldType' , 	'YIELD_SCIENCE'  ),
('GOLDEN_TRAIT_SEJONG_THEATER_TILES_SCIENCE' , 	'Amount' , 		1  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_SEJONG_TECH_SCIENCE_INTO_CULTURE_' || EraType,	'YieldToGrant', 'YIELD_CULTURE' FROM	Eras;	
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_SEJONG_TECH_SCIENCE_INTO_CULTURE_' || EraType,	'YieldToBaseOn', 'YIELD_SCIENCE' FROM	Eras;	
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_SEJONG_TECH_SCIENCE_INTO_CULTURE_' || EraType,	'Multiplier', 3 FROM	Eras;	
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_SEJONG_CIVIC_CULTURE_INTO_SCIENCE_' || EraType,	'YieldToGrant', 'YIELD_SCIENCE' FROM	Eras;	
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_SEJONG_CIVIC_CULTURE_INTO_SCIENCE_' || EraType,	'YieldToBaseOn', 'YIELD_CULTURE' FROM	Eras;	
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_SEJONG_CIVIC_CULTURE_INTO_SCIENCE_' || EraType,	'Multiplier', 3 FROM	Eras;	

-----------------------------------------------------------------------------------------------------------
-- RequirementSets
-----------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets
(RequirementSetId,										RequirementSetType) VALUES	
('GA_GOLDEN_PLOT_IS_ADJACENT_TO_DISTRICT_SEOWON_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------------------------------------------------------------------					
-- RequirementSetRequirements
-----------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements
(RequirementSetId,										RequirementId) VALUES	
('GA_GOLDEN_PLOT_IS_ADJACENT_TO_DISTRICT_SEOWON_REQUIREMENTS',				'GA_GOLDEN_REQUIRES_PLOT_IS_ADJACENT_TO_DISTRICT_SEOWON');
-----------------------------------------------------------------------------------------------------------					
-- Requirements
-----------------------------------------------------------------------------------------------------------					
INSERT OR REPLACE INTO Requirements (RequirementId,			RequirementType) VALUES
('GA_GOLDEN_REQUIRES_PLOT_IS_ADJACENT_TO_DISTRICT_SEOWON',	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES');
-----------------------------------------------------------------------------------------------------------					
-- RequirementArguments
-----------------------------------------------------------------------------------------------------------					
INSERT OR REPLACE INTO RequirementArguments (RequirementId,				Name,				Value) VALUES
('GA_GOLDEN_REQUIRES_PLOT_IS_ADJACENT_TO_DISTRICT_SEOWON',		'DistrictType',	    'DISTRICT_SEOWON');	
