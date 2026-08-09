--------------------------------------------------------------
-- ExcludedAdjacencies
--------------------------------------------------------------
DELETE FROM ExcludedAdjacencies WHERE TraitType = 'TRAIT_CIVILIZATION_GAUL';
--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_GAUL' , 'GOLDEN_TRAIT_GAUL_MILITARY_TO_WILDCARD' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_GAUL' , 'GOLDEN_TRAIT_GAUL_ECONOMIC_TO_WILDCARD' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_GAUL' , 'GOLDEN_TRAIT_GAUL_DIPLOMATIC_TO_WILDCARD' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_GAUL' , 'GOLDEN_TRAIT_GAUL_ENCAMPMENT_TIER1_CITIZENS' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_GAUL' , 'GOLDEN_TRAIT_GAUL_ENCAMPMENT_TIER2_CITIZENS' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_CIVILIZATION_GAUL' , 'GOLDEN_TRAIT_GAUL_ENCAMPMENT_TIER3_CITIZENS' );
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_GAUL_MILITARY_TO_WILDCARD' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_GAUL_ECONOMIC_TO_WILDCARD' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_GAUL_DIPLOMATIC_TO_WILDCARD' , 'MODIFIER_PLAYER_CULTURE_REPLACE_GOVERNMENT_SLOTS' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_GAUL_ENCAMPMENT_TIER1_CITIZENS' , 'MODIFIER_PLAYER_CITIES_ADD_POPULATION' , 0 , 0 , 'GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER1_REQUIREMENTS' );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_GAUL_ENCAMPMENT_TIER2_CITIZENS' , 'MODIFIER_PLAYER_CITIES_ADD_POPULATION' , 0 , 0 , 'GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER2_REQUIREMENTS' );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_GAUL_ENCAMPMENT_TIER3_CITIZENS' , 'MODIFIER_PLAYER_CITIES_ADD_POPULATION' , 0 , 0 , 'GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER3_REQUIREMENTS' );
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
UPDATE ModifierArguments SET Value = 1
WHERE ModifierId = 'TRAIT_CIVILIZATION_GAUL_HOLYSITE_ADJACENCYFAITH' AND Name = 'TilesRequired';
UPDATE ModifierArguments SET Value = 1
WHERE ModifierId = 'TRAIT_CIVILIZATION_GAUL_CAMPUS_ADJACENCYSCIENCE' AND Name = 'TilesRequired';
UPDATE ModifierArguments SET Value = 1
WHERE ModifierId = 'TRAIT_CIVILIZATION_GAUL_HARBOR_ADJACENCYGOLD' AND Name = 'TilesRequired';
UPDATE ModifierArguments SET Value = 1
WHERE ModifierId = 'TRAIT_CIVILIZATION_GAUL_COMMERCIALHUB_ADJACENCYGOLD' AND Name = 'TilesRequired';
UPDATE ModifierArguments SET Value = 1
WHERE ModifierId = 'TRAIT_CIVILIZATION_GAUL_THEATER_ADJACENCYCULTURE' AND Name = 'TilesRequired';
UPDATE ModifierArguments SET Value = 1
WHERE ModifierId = 'TRAIT_CIVILIZATION_GAUL_OPPIDUM_ADJACENCYPRODUCTION' AND Name = 'TilesRequired';
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_GAUL_MILITARY_TO_WILDCARD' , 'ReplacedGovernmentSlotType' , 'SLOT_MILITARY'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_GAUL_MILITARY_TO_WILDCARD' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_GAUL_ECONOMIC_TO_WILDCARD' , 'ReplacedGovernmentSlotType' , 'SLOT_ECONOMIC'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_GAUL_ECONOMIC_TO_WILDCARD' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_GAUL_DIPLOMATIC_TO_WILDCARD' , 'ReplacedGovernmentSlotType' , 'SLOT_DIPLOMATIC'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_GAUL_DIPLOMATIC_TO_WILDCARD' , 'AddedGovernmentSlotType' , 'SLOT_WILDCARD'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_GAUL_ENCAMPMENT_TIER1_CITIZENS' , 'Amount' , 2  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_GAUL_ENCAMPMENT_TIER2_CITIZENS' , 'Amount' , 2  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_GAUL_ENCAMPMENT_TIER3_CITIZENS' , 'Amount' , 2  );
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets(RequirementSetId,								RequirementSetType)VALUES	
('GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER1_REQUIREMENTS',			'REQUIREMENTSET_TEST_ANY'),
('GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER2_REQUIREMENTS',			'REQUIREMENTSET_TEST_ANY'),
('GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER3_REQUIREMENTS',			'REQUIREMENTSET_TEST_ANY');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements(RequirementSetId,								RequirementId)VALUES	
('GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER1_REQUIREMENTS',			'GOLDEN_REQUIRES_CITY_HAS_BUILDING_BARRACKS'),
('GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER1_REQUIREMENTS',			'GOLDEN_REQUIRES_CITY_HAS_BUILDING_STABLE'),
('GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER2_REQUIREMENTS',			'GOLDEN_REQUIRES_CITY_HAS_BUILDING_ARMORY'),
('GOLDEN_GAUL_CITY_HAS_ENCAMPMENT_TIER3_REQUIREMENTS',			'GOLDEN_REQUIRES_CITY_HAS_BUILDING_MILITARY_ACADEMY');
