--更多资源
UPDATE Resources SET Frequency = 4 WHERE Frequency <> 0 AND ResourceClassType = 'RESOURCECLASS_LUXURY';

UPDATE Resources SET Frequency = 10 WHERE ResourceType = 'RESOURCE_BANANAS';
UPDATE Resources SET Frequency = 12 WHERE ResourceType = 'RESOURCE_CATTLE';
UPDATE Resources SET Frequency = 12 WHERE ResourceType = 'RESOURCE_COPPER';
UPDATE Resources SET Frequency = 30 WHERE ResourceType = 'RESOURCE_CRABS';
UPDATE Resources SET Frequency = 12 WHERE ResourceType = 'RESOURCE_DEER';
UPDATE Resources SET Frequency = 40 WHERE ResourceType = 'RESOURCE_FISH';
UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_RICE';
UPDATE Resources SET Frequency = 12 WHERE ResourceType = 'RESOURCE_SHEEP';
UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_STONE';
UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_WHEAT';
UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_MAIZE' AND EXISTS (SELECT * FROM Resources WHERE ResourceType='RESOURCE_MAIZE');

UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_HORSES';
UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_IRON';
UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_NITER';
UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_COAL';
UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_ALUMINUM';
UPDATE Resources SET Frequency = 12, SeaFrequency = 12 WHERE ResourceType = 'RESOURCE_OIL';
UPDATE Resources SET Frequency = 20 WHERE ResourceType = 'RESOURCE_URANIUM';

--v238 战略资源提取率
UPDATE Resource_Consumption SET BaseExtractionRate = 1, ImprovedExtractionRate = 4  WHERE ResourceType = 'RESOURCE_COAL';
UPDATE Resource_Consumption SET BaseExtractionRate = 1, ImprovedExtractionRate = 4  WHERE ResourceType = 'RESOURCE_OIL';
UPDATE Resource_Consumption SET BaseExtractionRate = 1, ImprovedExtractionRate = 4  WHERE ResourceType = 'RESOURCE_URANIUM';

UPDATE Resource_Consumption SET BaseExtractionRate = 1, ImprovedExtractionRate = 2  WHERE ResourceType = 'RESOURCE_HORSES';
UPDATE Resource_Consumption SET BaseExtractionRate = 1, ImprovedExtractionRate = 2  WHERE ResourceType = 'RESOURCE_IRON';
UPDATE Resource_Consumption SET BaseExtractionRate = 1, ImprovedExtractionRate = 2  WHERE ResourceType = 'RESOURCE_NITER';
UPDATE Resource_Consumption SET BaseExtractionRate = 1, ImprovedExtractionRate = 2  WHERE ResourceType = 'RESOURCE_ALUMINUM';

--收获奢侈品资源
INSERT OR REPLACE INTO Resource_Harvests
(ResourceType, YieldType,    Amount, PrereqTech) SELECT 
ResourceType,  'YIELD_GOLD', 30,     'TECH_CURRENCY' FROM Resources WHERE ResourceClassType='RESOURCECLASS_LUXURY';

--luxury yield gold
DELETE FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE ResourceClassType='RESOURCECLASS_LUXURY' AND Happiness=4);
INSERT OR REPLACE INTO Resource_YieldChanges
(ResourceType, YieldType,    YieldChange) SELECT 
ResourceType,  'YIELD_GOLD', 1 FROM Resources WHERE ResourceClassType='RESOURCECLASS_LUXURY';

--more IMPROVEMENT_QUARRY improved resources
UPDATE Improvement_ValidResources SET ImprovementType = 'IMPROVEMENT_QUARRY' WHERE ResourceType = 'RESOURCE_NITER' AND ImprovementType = 'IMPROVEMENT_MINE';
UPDATE Improvement_ValidResources SET ImprovementType = 'IMPROVEMENT_QUARRY' WHERE ResourceType = 'RESOURCE_JADE' AND ImprovementType = 'IMPROVEMENT_MINE';
UPDATE Improvement_ValidResources SET ImprovementType = 'IMPROVEMENT_QUARRY' WHERE ResourceType = 'RESOURCE_DIAMONDS' AND ImprovementType = 'IMPROVEMENT_MINE';
UPDATE Improvement_ValidResources SET ImprovementType = 'IMPROVEMENT_QUARRY' WHERE ResourceType = 'RESOURCE_AMBER' AND ImprovementType = 'IMPROVEMENT_MINE';

--luxury gold by tech, strategic science
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,						ModifierId) VALUES	
('TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_LUXURY_ADD_GOLD_CIVIC_MEDIEVAL_FAIRES' ),
('MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_LUXURY_ADD_GOLD_CIVIC_MEDIEVAL_FAIRES' ),
('TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_LUXURY_ADD_GOLD_CIVIC_CAPITALISM' ),
('MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_LUXURY_ADD_GOLD_CIVIC_CAPITALISM' );
-- ('TRAIT_LEADER_MAJOR_CIV',		'GOLDEN_STRATEGIC_ADD_SCIENCE_CIVIC_SCORCHED_EARTH' ),
-- ('MINOR_CIV_DEFAULT_TRAIT',		'GOLDEN_STRATEGIC_ADD_SCIENCE_CIVIC_SCORCHED_EARTH' );

INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,												SubjectRequirementSetId) VALUES	
('GOLDEN_LUXURY_ADD_GOLD_CIVIC_MEDIEVAL_FAIRES',	            'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'GOLDEN_PLOT_HAS_LUXURY_MEDIEVAL_FAIRES' ),
('GOLDEN_LUXURY_ADD_GOLD_CIVIC_CAPITALISM',	                    'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'GOLDEN_PLOT_HAS_LUXURY_CAPITALISM' );
-- ('GOLDEN_STRATEGIC_ADD_SCIENCE_CIVIC_SCORCHED_EARTH',	        'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'GOLDEN_PLOT_HAS_STRATEGIC_SCORCHED_EARTH' );

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,										Name,			Value) VALUES	
('GOLDEN_LUXURY_ADD_GOLD_CIVIC_MEDIEVAL_FAIRES',	            'YieldType',	'YIELD_GOLD'),
('GOLDEN_LUXURY_ADD_GOLD_CIVIC_MEDIEVAL_FAIRES',	            'Amount',	    1),
('GOLDEN_LUXURY_ADD_GOLD_CIVIC_CAPITALISM',	                    'YieldType',	'YIELD_GOLD'),
('GOLDEN_LUXURY_ADD_GOLD_CIVIC_CAPITALISM',	                    'Amount',	    1);
-- ('GOLDEN_STRATEGIC_ADD_SCIENCE_CIVIC_SCORCHED_EARTH',	        'YieldType',	'YIELD_SCIENCE'),
-- ('GOLDEN_STRATEGIC_ADD_SCIENCE_CIVIC_SCORCHED_EARTH',	        'Amount',	    1);

INSERT OR REPLACE INTO RequirementSets 
(RequirementSetId,							RequirementSetType) VALUES	
('GOLDEN_PLOT_HAS_LUXURY_MEDIEVAL_FAIRES',	        'REQUIREMENTSET_TEST_ALL' ),
('GOLDEN_PLOT_HAS_LUXURY_CAPITALISM',	            'REQUIREMENTSET_TEST_ALL' ),
('GOLDEN_PLOT_HAS_STRATEGIC_SCORCHED_EARTH',	    'REQUIREMENTSET_TEST_ALL' );

INSERT OR REPLACE INTO RequirementSetRequirements 
(RequirementSetId,							RequirementId) VALUES	
('GOLDEN_PLOT_HAS_LUXURY_MEDIEVAL_FAIRES',         	'REQUIRES_PLOT_HAS_LUXURY'),
('GOLDEN_PLOT_HAS_LUXURY_MEDIEVAL_FAIRES',	        'GOLDEN_REQUIRES_PLAYER_HAS_CIVIC_MEDIEVAL_FAIRES'),
('GOLDEN_PLOT_HAS_LUXURY_CAPITALISM',	            'REQUIRES_PLOT_HAS_LUXURY'),
('GOLDEN_PLOT_HAS_LUXURY_CAPITALISM',	            'GOLDEN_REQUIRES_PLAYER_HAS_CIVIC_CAPITALISM'),
('GOLDEN_PLOT_HAS_STRATEGIC_SCORCHED_EARTH',	    'REQUIRES_PLOT_HAS_STRATEGIC'),
('GOLDEN_PLOT_HAS_STRATEGIC_SCORCHED_EARTH',	    'GOLDEN_REQUIRES_PLAYER_HAS_CIVIC_SCORCHED_EARTH');
