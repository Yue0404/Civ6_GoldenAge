-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) VALUES	
('TRAJANS_COLUMN_TRAIT',	                'GOLDEN_COLUMN_TRAIT_THIRD_RANGE_PRODUCTION'),
('TRAJANS_COLUMN_TRAIT',	                'GOLDEN_COLUMN_TRAIT_THIRD_RANGE_GOLD'),
('TRAIT_CIVILIZATION_ALL_ROADS_TO_ROME',	'TRAIT_EACH_DIPLO_VISIBILITY_COMBAT_MODIFIER'),
('TRAJANS_COLUMN_TRAIT',	                'GOLDEN_ROME_CULTURE_BORDER_EXPANSION');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId,						    ModifierType,								                                    SubjectRequirementSetId) VALUES	
('GOLDEN_COLUMN_TRAIT_THIRD_RANGE_PRODUCTION',			    'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		                                    'GOLDEN_ROME_PLOT_IS_THREE_PLOT_AWAY_FROM_CITY_CENTER_REQUIREMENTS'),
('GOLDEN_COLUMN_TRAIT_THIRD_RANGE_GOLD',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		                                    'GOLDEN_ROME_PLOT_IS_THREE_PLOT_AWAY_FROM_CITY_CENTER_REQUIREMENTS'),
('GOLDEN_ROME_CULTURE_BORDER_EXPANSION',					'GOLDEN_MODIFIER_PLAYER_CITIES_CULTURE_BORDER_EXPANSION',		                NULL);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_COLUMN_TRAIT_THIRD_RANGE_PRODUCTION',					'YieldType',	    'YIELD_PRODUCTION'),
('GOLDEN_COLUMN_TRAIT_THIRD_RANGE_PRODUCTION',					'Amount',	        1),
('GOLDEN_COLUMN_TRAIT_THIRD_RANGE_GOLD',					    'YieldType',	    'YIELD_GOLD'),
('GOLDEN_COLUMN_TRAIT_THIRD_RANGE_GOLD',					    'Amount',	        1),
('GOLDEN_ROME_CULTURE_BORDER_EXPANSION',					    'Amount',	        50);

-----------------------------------------------
--RequirementSets
-----------------------------------------------
INSERT OR REPLACE INTO RequirementSets 				(RequirementSetId ,     RequirementSetType) 	
VALUES 		('GOLDEN_ROME_PLOT_IS_THREE_PLOT_AWAY_FROM_CITY_CENTER_REQUIREMENTS' , 		    'REQUIREMENTSET_TEST_ALL');	
-----------------------------------------------
--RequirementSetRequirements	
-----------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements 	(RequirementSetId ,     RequirementId) 			
VALUES 		('GOLDEN_ROME_PLOT_IS_THREE_PLOT_AWAY_FROM_CITY_CENTER_REQUIREMENTS' , 		    'GOLDEN_REQUIRES_ROME_PLOT_IS_THREE_PLOT_AWAY_FROM_CITY_CENTER');	
-----------------------------------------------
--Requirements
-----------------------------------------------
INSERT OR REPLACE INTO 		Requirements (RequirementId,				            RequirementType)
VALUES						('GOLDEN_REQUIRES_ROME_PLOT_IS_THREE_PLOT_AWAY_FROM_CITY_CENTER',			    'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES');		
-----------------------------------------------						
--RequirementArguments	
-----------------------------------------------
INSERT OR REPLACE INTO 		RequirementArguments (RequirementId,		            Name,			    Value)
VALUES						('GOLDEN_REQUIRES_ROME_PLOT_IS_THREE_PLOT_AWAY_FROM_CITY_CENTER',			    'DistrictType',		'DISTRICT_CITY_CENTER'),	
                            ('GOLDEN_REQUIRES_ROME_PLOT_IS_THREE_PLOT_AWAY_FROM_CITY_CENTER',		        'MaxRange',		    3),
							('GOLDEN_REQUIRES_ROME_PLOT_IS_THREE_PLOT_AWAY_FROM_CITY_CENTER',		        'MinRange',		    3);		