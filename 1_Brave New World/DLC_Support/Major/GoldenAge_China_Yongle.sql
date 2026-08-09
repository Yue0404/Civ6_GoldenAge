--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_YONGLE' AND ModifierId = 'YONGLE_FOOD_PROJECT';
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_YONGLE' AND ModifierId = 'YONGLE_GOLD_PROJECT';
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)VALUES
('TRAIT_LEADER_YONGLE', 'GOLDEN_YONGLE_GREAT_WORK_WRITING_SCIENCE'),
('TRAIT_LEADER_YONGLE', 'GOLDEN_YONGLE_GREAT_WORK_WRITING_CULTURE');
--------------------------------------------------------------
-- Project_YieldConversions
--------------------------------------------------------------
UPDATE Project_YieldConversions SET PercentOfProductionRate = 25
WHERE ProjectType = 'PROJECT_LIJIA_FAITH' AND YieldType = 'YIELD_FAITH';

INSERT OR REPLACE INTO Project_YieldConversions
(ProjectType,							YieldType,			PercentOfProductionRate) VALUES	
('PROJECT_LIJIA_FAITH',		'YIELD_GOLD',	25),
('PROJECT_LIJIA_FAITH',		'YIELD_FOOD',	25);

--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
UPDATE Modifiers SET SubjectRequirementSetId = 'CITY_HAS_GOVERNOR'
WHERE ModifierId = 'YONGLE_SCIENCE_POPULATION';
UPDATE Modifiers SET SubjectRequirementSetId = 'CITY_HAS_GOVERNOR'
WHERE ModifierId = 'YONGLE_CULTURE_POPULATION';
UPDATE Modifiers SET SubjectRequirementSetId = 'CITY_HAS_GOVERNOR'
WHERE ModifierId = 'YONGLE_GOLD_POPULATION';
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)VALUES
('GOLDEN_YONGLE_GREAT_WORK_WRITING_SCIENCE', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD', 0, 0, NULL),
('GOLDEN_YONGLE_GREAT_WORK_WRITING_CULTURE', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD', 0, 0, NULL);
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
UPDATE ModifierArguments SET Value = 1
WHERE ModifierId = 'YONGLE_GOLD_POPULATION' AND Name = 'Amount';
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)VALUES
('GOLDEN_YONGLE_GREAT_WORK_WRITING_SCIENCE', 'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING'),
('GOLDEN_YONGLE_GREAT_WORK_WRITING_SCIENCE', 'YieldChange', 5),
('GOLDEN_YONGLE_GREAT_WORK_WRITING_SCIENCE', 'YieldType', 'YIELD_SCIENCE'),
('GOLDEN_YONGLE_GREAT_WORK_WRITING_CULTURE', 'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING'),
('GOLDEN_YONGLE_GREAT_WORK_WRITING_CULTURE', 'YieldChange', 5),
('GOLDEN_YONGLE_GREAT_WORK_WRITING_CULTURE', 'YieldType', 'YIELD_CULTURE');