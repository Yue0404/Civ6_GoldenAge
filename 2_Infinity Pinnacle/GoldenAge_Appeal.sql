--------------------------------------------------------------
--Appeal change: Genernal, no unique
--------------------------------------------------------------
UPDATE Features		SET Appeal = 1	WHERE FeatureType = 'FEATURE_REEF';
UPDATE Features		SET Appeal = 1	WHERE FeatureType = 'FEATURE_GEOTHERMAL_FISSURE';
UPDATE Features		SET Appeal = 1	WHERE FeatureType = 'FEATURE_ICE';
UPDATE Features		SET Appeal = 1	WHERE FeatureType = 'FEATURE_VOLCANO';
UPDATE Features		SET Appeal = -1	WHERE FeatureType = 'FEATURE_VOLCANIC_SOIL';

UPDATE Districts	SET Appeal = -2	WHERE DistrictType = 'DISTRICT_INDUSTRIAL_ZONE';
UPDATE Districts	SET Appeal = -1	WHERE DistrictType = 'DISTRICT_ENCAMPMENT';
UPDATE Districts	SET Appeal = -1	WHERE DistrictType = 'DISTRICT_HARBOR';
UPDATE Districts	SET Appeal = -2	WHERE DistrictType = 'DISTRICT_SPACEPORT';
UPDATE Districts	SET Appeal = -2	WHERE DistrictType = 'DISTRICT_AERODROME';
UPDATE Districts	SET Appeal = 1	WHERE DistrictType = 'DISTRICT_AQUEDUCT';
UPDATE Districts	SET Appeal = 1	WHERE DistrictType = 'DISTRICT_CANAL';
UPDATE Districts	SET Appeal = 1	WHERE DistrictType = 'DISTRICT_DAM';
UPDATE Improvements	SET Appeal = -2	WHERE ImprovementType = 'IMPROVEMENT_MISSILE_SILO';
UPDATE Improvements	SET Appeal = -2	WHERE ImprovementType = 'IMPROVEMENT_AIRSTRIP';
UPDATE Improvements	SET Appeal = -1	WHERE ImprovementType = 'IMPROVEMENT_LUMBER_MILL';
UPDATE Improvements	SET Appeal = -1	WHERE ImprovementType = 'IMPROVEMENT_FORT';
UPDATE Improvements	SET Appeal = 1	WHERE ImprovementType = 'IMPROVEMENT_CITY_PARK';
UPDATE Improvements	SET Appeal = 1	WHERE ImprovementType = 'IMPROVEMENT_SKI_RESORT';
UPDATE Improvements	SET Appeal = 1	WHERE ImprovementType = 'IMPROVEMENT_BEACH_RESORT';
UPDATE Improvements	SET Appeal = 0	WHERE ImprovementType = 'IMPROVEMENT_GEOTHERMAL_PLANT';
UPDATE Improvements	SET Appeal = -1	WHERE ImprovementType = 'IMPROVEMENT_OIL_WELL';
UPDATE Improvements	SET Appeal = -1	WHERE ImprovementType = 'IMPROVEMENT_OFFSHORE_OIL_RIG';
UPDATE Improvements	SET Appeal = -2	WHERE ImprovementType = 'IMPROVEMENT_MOUNTAIN_TUNNEL';
--------------------------------------------------------------
-- TraitModifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType,					ModifierId) VALUES	
('TRAIT_LEADER_MAJOR_CIV',	'DISTRICT_BREATHTAKING_APPEAL_TO_AMENITIES'),
('TRAIT_LEADER_MAJOR_CIV',	'DISTRICT_CHARMING_APPEAL_TO_HOUSING'),
('TRAIT_LEADER_MAJOR_CIV',	'DISTRICT_UNINVITING_APPEAL_TO_HOUSING'),
('TRAIT_LEADER_MAJOR_CIV',	'DISTRICT_DISGUSTING_APPEAL_TO_AMENITIES'),
('TRAIT_LEADER_MAJOR_CIV',	'GOLDEN_MARSH_APPEAL'),
('TRAIT_LEADER_MAJOR_CIV',	'GOLDEN_JUNGLE_APPEAL');
--------------------------------------------------------------
-- Modifiers
--------------------------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId,	ModifierType,											SubjectRequirementSetId) VALUES
('DISTRICT_BREATHTAKING_APPEAL_TO_AMENITIES',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_ENTERTAINMENT',	                    'DISTRICT_BREATHTAKING_APPEAL'),
('DISTRICT_CHARMING_APPEAL_TO_HOUSING',	        'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',	                                'DISTRICT_CHARMING_APPEAL'),
('DISTRICT_UNINVITING_APPEAL_TO_HOUSING',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',            	                    'DISTRICT_UNINVITING_APPEAL'),
('DISTRICT_DISGUSTING_APPEAL_TO_AMENITIES',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_ENTERTAINMENT',	                    'DISTRICT_DISGUSTING_APPEAL'),
('GOLDEN_MARSH_APPEAL',		                    'MODIFIER_PLAYER_CITIES_ADJUST_FEATURE_APPEAL_MODIFIER',            	    'GOLDEN_PLAYER_HAS_CIVIC_CONSERVATION_REQUIREMENTS'),
('GOLDEN_JUNGLE_APPEAL',		                'MODIFIER_PLAYER_CITIES_ADJUST_FEATURE_APPEAL_MODIFIER',            	    'GOLDEN_PLAYER_HAS_CIVIC_CONSERVATION_REQUIREMENTS');	
--------------------------------------------------------------
-- ModifierArguments
--------------------------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,										Name,		Value) VALUES
('DISTRICT_BREATHTAKING_APPEAL_TO_AMENITIES',	'Amount',	   1),
('DISTRICT_CHARMING_APPEAL_TO_HOUSING',	        'Amount',	   1),
('DISTRICT_UNINVITING_APPEAL_TO_HOUSING',		'Amount',	   -1),
('DISTRICT_DISGUSTING_APPEAL_TO_AMENITIES',	 	'Amount',	   -1),
('GOLDEN_MARSH_APPEAL',                         'FeatureType', 'FEATURE_MARSH'),
('GOLDEN_MARSH_APPEAL',                         'Amount',      2),
('GOLDEN_JUNGLE_APPEAL',                        'FeatureType', 'FEATURE_JUNGLE'),
('GOLDEN_JUNGLE_APPEAL',                        'Amount',      1);
--------------------------------------------------------------
-- RequirementSets
--------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets
		(RequirementSetId,										RequirementSetType)
VALUES	('DISTRICT_BREATHTAKING_APPEAL',					'REQUIREMENTSET_TEST_ALL'),
        ('DISTRICT_CHARMING_APPEAL',				     	'REQUIREMENTSET_TEST_ALL'),
		('DISTRICT_UNINVITING_APPEAL',						'REQUIREMENTSET_TEST_ALL'),
		('DISTRICT_DISGUSTING_APPEAL',						'REQUIREMENTSET_TEST_ALL');
--------------------------------------------------------------
-- RequirementSetRequirements
--------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements
		(RequirementSetId,										RequirementId)
VALUES	('DISTRICT_BREATHTAKING_APPEAL',					'GOLDEN_REQUIRES_PLOT_HAS_ANY_DISTRICT'),
        ('DISTRICT_CHARMING_APPEAL',					    'GOLDEN_REQUIRES_PLOT_HAS_ANY_DISTRICT'),
		('DISTRICT_UNINVITING_APPEAL',						'GOLDEN_REQUIRES_PLOT_HAS_ANY_DISTRICT'),
		('DISTRICT_DISGUSTING_APPEAL',						'GOLDEN_REQUIRES_PLOT_HAS_ANY_DISTRICT'),
		('DISTRICT_BREATHTAKING_APPEAL',					'GOLDEN_REQUIRES_BREATHTAKING_APPEAL'),
		('DISTRICT_CHARMING_APPEAL',					    'GOLDEN_REQUIRES_CHARMING_APPEAL'),
		('DISTRICT_UNINVITING_APPEAL',						'GOLDEN_REQUIRES_UNINVITING_APPEAL'),
		('DISTRICT_DISGUSTING_APPEAL',						'GOLDEN_REQUIRES_DISGUSTING_APPEAL');
--------------------------------------------------------------		
--工业区T3建筑
--------------------------------------------------------------
INSERT OR REPLACE INTO BuildingModifiers (BuildingType, ModifierId) VALUES 
('BUILDING_COAL_POWER_PLANT', 			'GOLDEN_IZ_T3_APPEAL_DEBUFF'),
('BUILDING_FOSSIL_FUEL_POWER_PLANT', 	'GOLDEN_IZ_T3_APPEAL_DEBUFF');
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
('GOLDEN_IZ_T3_APPEAL_DEBUFF', 'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL', NULL);
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('GOLDEN_IZ_T3_APPEAL_DEBUFF', 'Amount', -1);