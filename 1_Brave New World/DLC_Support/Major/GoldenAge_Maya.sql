--------------------------------------------------------------
-- Improvement_Adjacencies
--------------------------------------------------------------
DELETE FROM Improvement_Adjacencies WHERE ImprovementType = 'IMPROVEMENT_FARM' AND YieldChangeId = 'Farm_FoodObservatoryAdjacency';
--------------------------------------------------------------
-- District_GreatPersonPoints
--------------------------------------------------------------
UPDATE District_GreatPersonPoints SET PointsPerTurn = 3
WHERE DistrictType = 'DISTRICT_OBSERVATORY' AND GreatPersonClassType = 'GREAT_PERSON_CLASS_SCIENTIST';
--------------------------------------------------------------
-- ImprovementModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO ImprovementModifiers (ImprovementType, ModifierId)
VALUES ('IMPROVEMENT_PLANTATION' , 'FARM_HOUSING_WITH_MAYAB_TRAIT' );
--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
-- INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
-- VALUES ('TRAIT_CIVILIZATION_MAYAB' , 'GOLDEN_TRAIT_MAYAB_MONUMENT_BUILDER' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_MAYAB' , 'GOLDEN_TRAIT_MAYA_PLANTATION_GOLD' );
DELETE FROM TraitModifiers WHERE ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_GAIN_YIELDS';
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_LEADER_MUTAL', 'GOLDEN_TRAIT_MUTAL_BUFF' || YieldType FROM Yields;
DELETE FROM TraitModifiers WHERE ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_LOSE_YIELDS';
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
SELECT	'TRAIT_LEADER_MUTAL', 'GOLDEN_TRAIT_MUTAL_DEBUFF' || YieldType FROM Yields;
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
-- INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
-- VALUES ('GOLDEN_TRAIT_MAYAB_MONUMENT_BUILDER' , 'MODIFIER_PLAYER_BUILT_CITIES_GRANT_FREE_UNIT' , 0 , 0 , 'GOLDEN_CITY_HAS_BUILDING_MONUMENT_REQUIREMENTS' );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_MAYA_PLANTATION_GOLD' , 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD_GRANCOLOMBIA_MAYA' , 0 , 0 , 'GOLDEN_PLOT_HAS_IMPROVEMENT_PLANTATION_REQUIREMENTS' );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_MUTAL_BUFF' || YieldType,	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 'OBJECT_IS_6_TILES_FROM_CAPITAL_NOT_CAPITAL_REQUIREMENTS' FROM Yields;	
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_MUTAL_DEBUFF' || YieldType,	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 'OBJECT_IS_7_OR_MORE_TILES_FROM_CAPITAL_REQUIREMENTS' FROM Yields;	
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
-- VALUES ('GOLDEN_TRAIT_MAYAB_MONUMENT_BUILDER' , 'UnitType' , 'UNIT_BUILDER'  );
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
-- VALUES ('GOLDEN_TRAIT_MAYAB_MONUMENT_BUILDER' , 'Amount' , 1  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MAYA_PLANTATION_GOLD' , 'YieldType' , 'YIELD_GOLD'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MAYA_PLANTATION_GOLD' , 'Amount' , 1  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_MUTAL_BUFF' || YieldType,	'YieldType', YieldType FROM	Yields;			
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_MUTAL_BUFF' || YieldType,	'Amount', 15 FROM Yields;	
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_MUTAL_DEBUFF' || YieldType,	'YieldType', YieldType FROM	Yields;			
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT	'GOLDEN_TRAIT_MUTAL_DEBUFF' || YieldType,	'Amount', -10 FROM Yields;	
--------------------------------------------------------------
-- RequirementArguments
--------------------------------------------------------------

