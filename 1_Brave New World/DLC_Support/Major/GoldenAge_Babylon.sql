--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
-- DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_CIVILIZATION_BABYLON' AND ModifierId = 'TRAIT_SCIENCE_DECREASE';
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)VALUES
('TRAIT_CIVILIZATION_BABYLON', 'GOLDEN_BABYLON_SCIENTIST_POINT'),
-- ('TRAIT_CIVILIZATION_BABYLON', 'GOLDEN_BABYLON_SCIENCE_DEBUFF'),
('TRAIT_LEADER_HAMMURABI', 'GOLDEN_HAMMURABI_CODE_OF_LAW');
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)VALUES
('GOLDEN_BABYLON_SCIENTIST_POINT', 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT', 0, 0, NULL),
-- ('GOLDEN_BABYLON_SCIENCE_DEBUFF', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIERS_FOR_DISTRICT', 0, 0, NULL),
('GOLDEN_HAMMURABI_CODE_OF_LAW', 'MODIFIER_PLAYER_GRANT_RANDOM_CIVIC', 1, 1, 'GOLDEM_BABYLON_NO_CODE_OF_LAWS_REQUIREMENT');
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)VALUES
('GOLDEN_BABYLON_SCIENTIST_POINT', 'GreatPersonClassType', 'GREAT_PERSON_CLASS_SCIENTIST'),
('GOLDEN_BABYLON_SCIENTIST_POINT', 'Amount', 100),
-- ('GOLDEN_BABYLON_SCIENCE_DEBUFF', 'DistrictType', 'DISTRICT_CAMPUS'),
-- ('GOLDEN_BABYLON_SCIENCE_DEBUFF', 'YieldType', 'YIELD_SCIENCE'),
-- ('GOLDEN_BABYLON_SCIENCE_DEBUFF', 'Amount', -75),
('GOLDEN_HAMMURABI_CODE_OF_LAW', 'Amount', 1);

-- UPDATE ModifierArguments SET Value = 49
-- WHERE ModifierId = 'TRAIT_EUREKA_INCREASE' AND Name = 'Amount';
--------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets
			(RequirementSetId,									RequirementSetType)
VALUES		('GOLDEM_BABYLON_NO_CODE_OF_LAWS_REQUIREMENT',		'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements
			(RequirementSetId,									RequirementId)
VALUES		('GOLDEM_BABYLON_NO_CODE_OF_LAWS_REQUIREMENT',		'GOLDEN_REQUIRES_BABYLON_NO_CODE_OF_LAWS');

INSERT OR REPLACE INTO Requirements
			(RequirementId,										RequirementType,						Inverse)
VALUES		('GOLDEN_REQUIRES_BABYLON_NO_CODE_OF_LAWS',		    'REQUIREMENT_PLAYER_HAS_CIVIC',			1);

INSERT OR REPLACE INTO RequirementArguments
			(RequirementId,										Name,				Value)
VALUES		('GOLDEN_REQUIRES_BABYLON_NO_CODE_OF_LAWS',		    'CivicType',		'CIVIC_CODE_OF_LAWS');