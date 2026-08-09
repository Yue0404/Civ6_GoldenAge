-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) VALUES	
('TRAIT_CIVILIZATION_PORTUGAL',	'GOLDEN_TRAIT_PORTUGAL_GRANT_ABILITY'),
('TRAIT_CIVILIZATION_PORTUGAL',	'GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_LUXURY_GOLD'),
('TRAIT_CIVILIZATION_PORTUGAL',	'GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_STRATEGIC_PRODUCTION'),
('TRAIT_CIVILIZATION_PORTUGAL',	'GOLDEN_TRAIT_PORTUGAL_TECH_CARTOGRAPHY'),
('TRAIT_CIVILIZATION_PORTUGAL',	'GOLDEN_TRAIT_PORTUGAL_TECH_SQUARE_RIGGING');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType,								                                    SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_PORTUGAL_GRANT_ABILITY',			            		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		                        			NULL),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_LUXURY_GOLD',			        'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',		                        		'GOLDEN_CITY_IS_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS'),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_LUXURY_GOLD_MODIFIER',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		                        	'GOLDEN_PLOT_HAS_LUXURY_RESOURCE_REQUIREMENTS'),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_STRATEGIC_PRODUCTION',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',		                        		'GOLDEN_CITY_IS_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS'),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_STRATEGIC_PRODUCTION_MODIFIER','MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		                        	'GOLDEN_PLOT_HAS_STRATEGIC_RESOURCE_REQUIREMENTS'),
('GOLDEN_TRAIT_PORTUGAL_TECH_CARTOGRAPHY',			            	'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',		                        	'GOLDEN_PLAYER_HAS_TECH_BUTTRESS_AND_TECH_EDUCATION_REQUIREMENTS'),
('GOLDEN_TRAIT_PORTUGAL_TECH_SQUARE_RIGGING',			            'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',		                        	'GOLDEN_PLAYER_HAS_TECH_BUTTRESS_AND_TECH_EDUCATION_REQUIREMENTS');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,					Name,		        Value) VALUES
('GOLDEN_TRAIT_PORTUGAL_GRANT_ABILITY',									'AbilityType',	    'ABILITY_PORTUGAL_PLUNDER_IMMUNITY_SEA'),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_LUXURY_GOLD',						'ModifierId',	    'GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_LUXURY_GOLD_MODIFIER'),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_LUXURY_GOLD_MODIFIER',				'YieldType',	    'YIELD_GOLD'),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_LUXURY_GOLD_MODIFIER',				'Amount',	        4),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_STRATEGIC_PRODUCTION',				'ModifierId',	    'GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_STRATEGIC_PRODUCTION_MODIFIER'),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_STRATEGIC_PRODUCTION_MODIFIER',	'YieldType',	    'YIELD_PRODUCTION'),
('GOLDEN_TRAIT_PORTUGAL_FOREIGN_CITY_STRATEGIC_PRODUCTION_MODIFIER',	'Amount',	        3),
('GOLDEN_TRAIT_PORTUGAL_TECH_CARTOGRAPHY',		                		'TechType',	        'TECH_CARTOGRAPHY'),
('GOLDEN_TRAIT_PORTUGAL_TECH_SQUARE_RIGGING',		           			'TechType',	        'TECH_SQUARE_RIGGING');
-----------------------------------------------
-- RequirementSets
-----------------------------------------------
INSERT OR REPLACE INTO RequirementSets 				(RequirementSetId ,         RequirementSetType) 	
VALUES 		('GOLDEN_PLAYER_HAS_TECH_BUTTRESS_AND_TECH_EDUCATION_REQUIREMENTS' , 		    'REQUIREMENTSET_TEST_ALL');
-----------------------------------------------
-- RequirementSetRequirements
-----------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements 	(RequirementSetId ,         RequirementId) 			
VALUES 		('GOLDEN_PLAYER_HAS_TECH_BUTTRESS_AND_TECH_EDUCATION_REQUIREMENTS' , 		    'GOLDEN_REQUIRES_PLAYER_HAS_TECH_BUTTRESS'),
            ('GOLDEN_PLAYER_HAS_TECH_BUTTRESS_AND_TECH_EDUCATION_REQUIREMENTS' , 		    'GOLDEN_REQUIRES_PLAYER_HAS_TECH_EDUCATION');
-----------------------------------------------
-- Types
-----------------------------------------------
INSERT OR REPLACE INTO Types (Type,						Kind) VALUES
('ABILITY_PORTUGAL_PLUNDER_IMMUNITY_SEA',				'KIND_ABILITY');
-----------------------------------------------
-- TypeTags
-----------------------------------------------		
INSERT OR REPLACE INTO TypeTags (Type,					Tag) VALUES	
('ABILITY_PORTUGAL_PLUNDER_IMMUNITY_SEA',				'CLASS_TRADER');
-----------------------------------------------
-- UnitAbilities
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilities (UnitAbilityType,						Inactive) VALUES	
('ABILITY_PORTUGAL_PLUNDER_IMMUNITY_SEA',									1);
-----------------------------------------------
-- UnitAbilityModifiers
-----------------------------------------------
INSERT OR REPLACE INTO UnitAbilityModifiers (UnitAbilityType,						ModifierId) VALUES	
('ABILITY_PORTUGAL_PLUNDER_IMMUNITY_SEA',			            'ECONOMIC_GOLDEN_AGE_PLUNDER_IMMUNITY_SEA');