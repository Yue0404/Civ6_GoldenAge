--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_MAGNIFICENCES' , 'GOLDEN_TRAIT_MAGNIFICENCES_AUTO_THEME_MUSEUM' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_MAGNIFICENCES' , 'GOLDEN_TRAIT_MAGNIFICENCES_OWNED_LUXURY_EXTRA_AMENITIES' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_MAGNIFICENCES' , 'GOLDEN_TRAIT_MAGNIFICENCES_THEATER_PRODUCTION' );
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_MAGNIFICENCES' , 'GOLDEN_TRAIT_MAGNIFICENCES_THEATER_BUILDINGS_PRODUCTION' );
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_AUTO_THEME_MUSEUM' , 'MODIFIER_PLAYER_ADJUST_AUTO_THEMED_BUILDING' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_OWNED_LUXURY_EXTRA_AMENITIES' , 'MODIFIER_PLAYER_OWNED_LUXURY_EXTRA_AMENITIES' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_THEATER_PRODUCTION' , 'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION' , 0 , 0 , NULL );
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_THEATER_BUILDINGS_PRODUCTION' , 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION' , 0 , 0 , NULL );
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_AUTO_THEME_MUSEUM' , 'BuildingType' , 'BUILDING_MUSEUM_ART'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_OWNED_LUXURY_EXTRA_AMENITIES' , 'Amount' , 100  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_THEATER_PRODUCTION' , 'DistrictType' , 'DISTRICT_THEATER'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_THEATER_PRODUCTION' , 'Amount' , 100  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_THEATER_BUILDINGS_PRODUCTION' , 'DistrictType' , 'DISTRICT_THEATER'  );
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('GOLDEN_TRAIT_MAGNIFICENCES_THEATER_BUILDINGS_PRODUCTION' , 'Amount' , 100  );