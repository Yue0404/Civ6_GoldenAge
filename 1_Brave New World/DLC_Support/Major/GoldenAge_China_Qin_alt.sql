--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId)VALUES
('TRAIT_LEADER_QIN', 'GOLDEN_QIN_UNIT_MAINTENANCE');

--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------

INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)VALUES
('GOLDEN_QIN_UNIT_MAINTENANCE', 'MODIFIER_PLAYER_ADJUST_UNIT_MAINTENANCE_DISCOUNT', NULL);
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)VALUES
('GOLDEN_QIN_UNIT_MAINTENANCE', 'Amount', 1);


-----------------------------------------------
-- TypeTags
-----------------------------------------------		
INSERT OR REPLACE INTO TypeTags (Type,									Tag) VALUES	
('ABILITY_QIN_MELEE_UNITS',				'CLASS_LIGHT_CAVALRY'),
('ABILITY_QIN_MELEE_UNITS',			    'CLASS_HEAVY_CAVALRY'),
-- ('ABILITY_QIN_MELEE_UNITS',			    'CLASS_MELEE'),
('ABILITY_QIN_MELEE_UNITS',			    'CLASS_TRUE_RANGED'),
('ABILITY_QIN_MELEE_UNITS',			    'CLASS_SIEGE'),
('ABILITY_QIN_MELEE_UNITS',			    'CLASS_RECON'),
('ABILITY_QIN_MELEE_UNITS',			    'CLASS_ANTI_CAVALRY');