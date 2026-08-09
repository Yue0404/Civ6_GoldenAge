--v234 沙漠森林
INSERT OR REPLACE INTO Feature_ValidTerrains
(FeatureType,					TerrainType) VALUES	
('FEATURE_FOREST',				'TERRAIN_DESERT'),
('FEATURE_FOREST',				'TERRAIN_DESERT_HILLS');

--FEATURE_FLOODPLAINS_TUNDRA
--------------------------------------------------------------
-- Types
--------------------------------------------------------------
INSERT OR REPLACE INTO Types
(Type,							Kind) VALUES	
('FEATURE_FLOODPLAINS_TUNDRA',	'KIND_FEATURE');
--------------------------------------------------------------
-- TypeTags
--------------------------------------------------------------
INSERT OR REPLACE INTO TypeTags
(Type,							Tag) VALUES	
('FEATURE_FLOODPLAINS_TUNDRA',	'CLASS_FLOODPLAINS');
--------------------------------------------------------------
-- Features
--------------------------------------------------------------
INSERT OR REPLACE INTO Features
(FeatureType,                   RequiresRiver, DefenseModifier, Appeal, Removable, RemoveTech,         AntiquityPriority, Name,                                   Description) VALUES	
('FEATURE_FLOODPLAINS_TUNDRA',  1,             -2,              -1,     1,         'TECH_IRRIGATION', 1,                 'LOC_FEATURE_FLOODPLAINS_TUNDRA_NAME',  'LOC_FEATURE_FLOODPLAINS_TUNDRA_DESCRIPTION');
--------------------------------------------------------------
-- Feature_Removes
--------------------------------------------------------------
INSERT OR REPLACE INTO Feature_Removes
(FeatureType,					YieldType,	   Yield) VALUES	
('FEATURE_FLOODPLAINS_TUNDRA',	'YIELD_FOOD',  14);
--------------------------------------------------------------
-- Feature_YieldChanges
--------------------------------------------------------------
INSERT OR REPLACE INTO Feature_YieldChanges
(FeatureType,					YieldType,	   YieldChange) VALUES	
('FEATURE_FLOODPLAINS_TUNDRA',	'YIELD_FOOD',   2),
('FEATURE_FLOODPLAINS_TUNDRA',	'YIELD_FAITH',  -1);
--------------------------------------------------------------
-- Features_XP2
--------------------------------------------------------------
INSERT OR REPLACE INTO Features_XP2
(FeatureType,					ValidWonderPlacement,	ValidDistrictPlacement,	ValidForReplacement) VALUES	
('FEATURE_FLOODPLAINS_TUNDRA',	0,						0,						1);
--------------------------------------------------------------
-- Feature_ValidTerrains
--------------------------------------------------------------
INSERT OR REPLACE INTO Feature_ValidTerrains
(FeatureType,					TerrainType) VALUES	
('FEATURE_FLOODPLAINS_TUNDRA',	'TERRAIN_TUNDRA');
--------------------------------------------------------------
-- Feature_Floodplains
--------------------------------------------------------------
INSERT OR REPLACE INTO Feature_Floodplains
(FeatureType) VALUES	
('FEATURE_FLOODPLAINS_TUNDRA');
--------------------------------------------------------------
-- Building_RequiredFeatures
--------------------------------------------------------------
INSERT OR REPLACE INTO Building_RequiredFeatures
(BuildingType,				FeatureType) VALUES	
('BUILDING_MONT_ST_MICHEL',	'FEATURE_FLOODPLAINS_TUNDRA'),
('BUILDING_GREAT_BATH',		'FEATURE_FLOODPLAINS_TUNDRA');
--------------------------------------------------------------
-- District_RequiredFeatures
--------------------------------------------------------------
INSERT OR REPLACE INTO District_RequiredFeatures
(DistrictType,		FeatureType) VALUES	
('DISTRICT_DAM',	'FEATURE_FLOODPLAINS_TUNDRA');
--------------------------------------------------------------
-- Improvement_ValidFeatures
--------------------------------------------------------------
INSERT OR REPLACE INTO Improvement_ValidFeatures
(ImprovementType,				FeatureType) VALUES
('IMPROVEMENT_FARM',			'FEATURE_FLOODPLAINS_TUNDRA'),
	
('IMPROVEMENT_MOUND',			'FEATURE_FLOODPLAINS_TUNDRA'),
('IMPROVEMENT_BARBARIAN_CAMP',	'FEATURE_FLOODPLAINS_TUNDRA'),
('IMPROVEMENT_GOODY_HUT',		'FEATURE_FLOODPLAINS_TUNDRA'),
('IMPROVEMENT_SPHINX',			'FEATURE_FLOODPLAINS_TUNDRA'),
('IMPROVEMENT_CHATEAU',			'FEATURE_FLOODPLAINS_TUNDRA'),
('IMPROVEMENT_ZIGGURAT',		'FEATURE_FLOODPLAINS_TUNDRA');
--------------------------------------------------------------

INSERT OR REPLACE INTO 		Requirements (RequirementId,				        RequirementType,			             Inverse) VALUES
('GOLDEN_REQUIRES_PLOT_IS_FLOODPLAINS_TUNDRA_ADJACENT',		        'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES',    0),
('GA_REQUIRES_PLOT_HAS_FLOODPLAINS_TUNDRA',						'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES',    		 0);

INSERT OR REPLACE INTO 		RequirementArguments (RequirementId,		            Name,			    Value) VALUES		
('GOLDEN_REQUIRES_PLOT_IS_FLOODPLAINS_TUNDRA_ADJACENT',		'FeatureType',		'FEATURE_FLOODPLAINS_TUNDRA'),
('GA_REQUIRES_PLOT_HAS_FLOODPLAINS_TUNDRA',		    	'FeatureType',		'FEATURE_FLOODPLAINS_TUNDRA');