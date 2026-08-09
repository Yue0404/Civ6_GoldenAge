--Buildings as city policies
INSERT OR REPLACE INTO Types 
(Type,					                	Kind) VALUES
('BUILDING_CITIPOLICY_NONE',	        	'KIND_BUILDING');
INSERT OR REPLACE INTO Types 
(Type,					                	 Kind) SELECT
'BUILDING_CITIPOLICY_' ||YieldType,	 		'KIND_BUILDING' FROM Yields;

INSERT OR REPLACE INTO Buildings 
(BuildingType,					        	Name,                                       		Description,                                      		Cost, 	Maintenance, PrereqDistrict,         AdvisorType,       InternalOnly) VALUES
('BUILDING_CITIPOLICY_NONE',	        	'LOC_BUILDING_CITIPOLICY_NONE_NAME',       			NULL,      												1,    	0,           'DISTRICT_CITY_CENTER', 'ADVISOR_GENERIC', 0),
('BUILDING_CITIPOLICY_YIELD_SCIENCE',	    'LOC_BUILDING_CITIPOLICY_YIELD_SCIENCE_NAME',     	'LOC_BUILDING_CITIPOLICY_YIELD_SCIENCE_DESCRIPTION',    1,  	0,           'DISTRICT_CITY_CENTER', 'ADVISOR_GENERIC', 0),
('BUILDING_CITIPOLICY_YIELD_CULTURE',	    'LOC_BUILDING_CITIPOLICY_YIELD_CULTURE_NAME',     	'LOC_BUILDING_CITIPOLICY_YIELD_CULTURE_DESCRIPTION',    1,  	0,           'DISTRICT_CITY_CENTER', 'ADVISOR_GENERIC', 0),
('BUILDING_CITIPOLICY_YIELD_FOOD',	        'LOC_BUILDING_CITIPOLICY_YIELD_FOOD_NAME',        	'LOC_BUILDING_CITIPOLICY_YIELD_FOOD_DESCRIPTION',       1,  	0,           'DISTRICT_CITY_CENTER', 'ADVISOR_GENERIC', 0),
('BUILDING_CITIPOLICY_YIELD_PRODUCTION',	'LOC_BUILDING_CITIPOLICY_YIELD_PRODUCTION_NAME',  	'LOC_BUILDING_CITIPOLICY_YIELD_PRODUCTION_DESCRIPTION', 1,  	0,           'DISTRICT_CITY_CENTER', 'ADVISOR_GENERIC', 0),
('BUILDING_CITIPOLICY_YIELD_GOLD',	    	'LOC_BUILDING_CITIPOLICY_YIELD_GOLD_NAME',    		'LOC_BUILDING_CITIPOLICY_YIELD_GOLD_DESCRIPTION', 		1,  	0,           'DISTRICT_CITY_CENTER', 'ADVISOR_GENERIC', 0),
('BUILDING_CITIPOLICY_YIELD_FAITH',	    	'LOC_BUILDING_CITIPOLICY_YIELD_FAITH_NAME',    		'LOC_BUILDING_CITIPOLICY_YIELD_FAITH_DESCRIPTION',      1,  	0,           'DISTRICT_CITY_CENTER', 'ADVISOR_GENERIC', 0);

INSERT OR REPLACE INTO Buildings_XP2
(BuildingType , Pillage) SELECT
BuildingType , 0 FROM Buildings WHERE BuildingType LIKE 'BUILDING_CITIPOLICY_%';

INSERT OR REPLACE INTO MutuallyExclusiveBuildings 
(Building,					                MutuallyExclusiveBuilding) SELECT
'BUILDING_CITIPOLICY_NONE',        			BuildingType FROM Buildings WHERE BuildingType LIKE 'BUILDING_CITIPOLICY_YIELD_%';
INSERT OR REPLACE INTO MutuallyExclusiveBuildings 
(Building,					                MutuallyExclusiveBuilding) SELECT
'BUILDING_CITIPOLICY_YIELD_SCIENCE',        BuildingType FROM Buildings WHERE BuildingType LIKE 'BUILDING_CITIPOLICY_%' AND BuildingType <> 'BUILDING_CITIPOLICY_YIELD_SCIENCE';
INSERT OR REPLACE INTO MutuallyExclusiveBuildings 
(Building,					                MutuallyExclusiveBuilding) SELECT
'BUILDING_CITIPOLICY_YIELD_CULTURE',        BuildingType FROM Buildings WHERE BuildingType LIKE 'BUILDING_CITIPOLICY_%' AND BuildingType <> 'BUILDING_CITIPOLICY_YIELD_CULTURE';
INSERT OR REPLACE INTO MutuallyExclusiveBuildings 
(Building,					                MutuallyExclusiveBuilding) SELECT
'BUILDING_CITIPOLICY_YIELD_FOOD',        	BuildingType FROM Buildings WHERE BuildingType LIKE 'BUILDING_CITIPOLICY_%' AND BuildingType <> 'BUILDING_CITIPOLICY_YIELD_FOOD';
INSERT OR REPLACE INTO MutuallyExclusiveBuildings 
(Building,					                MutuallyExclusiveBuilding) SELECT
'BUILDING_CITIPOLICY_YIELD_PRODUCTION',     BuildingType FROM Buildings WHERE BuildingType LIKE 'BUILDING_CITIPOLICY_%' AND BuildingType <> 'BUILDING_CITIPOLICY_YIELD_PRODUCTION';
INSERT OR REPLACE INTO MutuallyExclusiveBuildings 
(Building,					                MutuallyExclusiveBuilding) SELECT
'BUILDING_CITIPOLICY_YIELD_GOLD',        	BuildingType FROM Buildings WHERE BuildingType LIKE 'BUILDING_CITIPOLICY_%' AND BuildingType <> 'BUILDING_CITIPOLICY_YIELD_GOLD';
INSERT OR REPLACE INTO MutuallyExclusiveBuildings 
(Building,					                MutuallyExclusiveBuilding) SELECT
'BUILDING_CITIPOLICY_YIELD_FAITH',        	BuildingType FROM Buildings WHERE BuildingType LIKE 'BUILDING_CITIPOLICY_%' AND BuildingType <> 'BUILDING_CITIPOLICY_YIELD_FAITH';

--Buff
INSERT OR REPLACE INTO BuildingModifiers 
(BuildingType,					    ModifierId) SELECT
'BUILDING_CITIPOLICY_' ||YieldType, 'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_BUFF'  FROM Yields;

INSERT OR REPLACE INTO Modifiers
(ModifierId ,      											ModifierType) SELECT  
'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_BUFF',        'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER' FROM Yields;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId ,      										Name,		Value) SELECT  
'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_BUFF',  	'Amount',    20     	FROM Yields;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId ,      										Name,		 Value) SELECT 
'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_BUFF', 	'YieldType', YieldType FROM Yields;

--Debuff
INSERT OR REPLACE INTO BuildingModifiers 
(BuildingType,					    	ModifierId) SELECT
'BUILDING_CITIPOLICY_YIELD_SCIENCE', 	'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_DEBUFF'  FROM Yields WHERE YieldType <> 'YIELD_SCIENCE';
INSERT OR REPLACE INTO BuildingModifiers 
(BuildingType,					    	ModifierId) SELECT
'BUILDING_CITIPOLICY_YIELD_CULTURE', 	'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_DEBUFF'  FROM Yields WHERE YieldType <> 'YIELD_CULTURE';
INSERT OR REPLACE INTO BuildingModifiers 
(BuildingType,					    	ModifierId) SELECT
'BUILDING_CITIPOLICY_YIELD_FOOD', 		'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_DEBUFF'  FROM Yields WHERE YieldType <> 'YIELD_FOOD';
INSERT OR REPLACE INTO BuildingModifiers 
(BuildingType,					    	ModifierId) SELECT
'BUILDING_CITIPOLICY_YIELD_PRODUCTION', 'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_DEBUFF'  FROM Yields WHERE YieldType <> 'YIELD_PRODUCTION';
INSERT OR REPLACE INTO BuildingModifiers 
(BuildingType,					    	ModifierId) SELECT
'BUILDING_CITIPOLICY_YIELD_GOLD', 		'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_DEBUFF'  FROM Yields WHERE YieldType <> 'YIELD_GOLD';
INSERT OR REPLACE INTO BuildingModifiers 
(BuildingType,					    	ModifierId) SELECT
'BUILDING_CITIPOLICY_YIELD_FAITH', 		'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_DEBUFF'  FROM Yields WHERE YieldType <> 'YIELD_FAITH';

INSERT OR REPLACE INTO Modifiers
(ModifierId ,      											ModifierType) SELECT  
'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_DEBUFF',        'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER' FROM Yields;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId ,      										Name,		Value) SELECT  
'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_DEBUFF',  'Amount',    -5     	FROM Yields;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId ,      										Name,		 Value) SELECT 
'GOLDEN_BUILDING_CITIPOLICY_' ||YieldType||	'_DEBUFF', 	'YieldType', YieldType FROM Yields;

--Free BUILDING_CITIPOLICY_NONE
INSERT OR REPLACE INTO DistrictModifiers 
(DistrictType,					ModifierId) VALUES	
('DISTRICT_CITY_CENTER',	    'GOLDEN_FREE_BUILDING_CITIPOLICY_NONE');

INSERT OR REPLACE INTO Modifiers 
(ModifierId,								                ModifierType,										        SubjectRequirementSetId, RunOnce, Permanent) VALUES
('GOLDEN_FREE_BUILDING_CITIPOLICY_NONE',	                'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',	    NULL,                    1,       1);

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,								Name,		    	Value) VALUES
('GOLDEN_FREE_BUILDING_CITIPOLICY_NONE',	'BuildingType',	    'BUILDING_CITIPOLICY_NONE');

--Projects 
INSERT OR REPLACE INTO Types 
(Type,					                	 Kind) SELECT
'PROJECT_CITIPOLICY_NONE_TO_' ||YieldType,	 'KIND_PROJECT' FROM Yields;
INSERT OR REPLACE INTO Types 
(Type,					                	 Kind) SELECT
'PROJECT_CITIPOLICY_' ||YieldType|| '_TO_NONE',	 'KIND_PROJECT' FROM Yields;

INSERT OR REPLACE INTO Projects 
(ProjectType,					            	Name,                                      					ShortName,                                  				Description,                                      					Cost, 	PrereqDistrict,         AdvisorType) SELECT
'PROJECT_CITIPOLICY_NONE_TO_' ||YieldType,	    'LOC_PROJECT_CITIPOLICY_NONE_TO_' ||YieldType|| '_NAME',    'LOC_PROJECT_CITIPOLICY_NONE_TO_' ||YieldType|| '_NAME',    'LOC_BUILDING_CITIPOLICY_' ||YieldType|| '_DESCRIPTION',     100, 	'DISTRICT_CITY_CENTER', 'ADVISOR_GENERIC' FROM Yields;
INSERT OR REPLACE INTO Projects 
(ProjectType,					            	Name,                                      					ShortName,                                  				Description,                                      					Cost, 	PrereqDistrict,         AdvisorType) SELECT
'PROJECT_CITIPOLICY_' ||YieldType|| '_TO_NONE',	'LOC_PROJECT_CITIPOLICY_TO_NONE_NAME',    					'LOC_PROJECT_CITIPOLICY_TO_NONE_NAME',    					NULL,     100, 	'DISTRICT_CITY_CENTER', 'ADVISOR_GENERIC' FROM Yields;

UPDATE Projects SET PrereqCivic = 'CIVIC_FEUDALISM' WHERE ProjectType = 'PROJECT_CITIPOLICY_NONE_TO_YIELD_FOOD';
UPDATE Projects SET PrereqCivic = 'CIVIC_CIVIL_ENGINEERING' WHERE ProjectType = 'PROJECT_CITIPOLICY_NONE_TO_YIELD_PRODUCTION';
UPDATE Projects SET PrereqCivic = 'CIVIC_THE_ENLIGHTENMENT' WHERE ProjectType = 'PROJECT_CITIPOLICY_NONE_TO_YIELD_CULTURE';
UPDATE Projects SET PrereqCivic = 'CIVIC_THE_ENLIGHTENMENT' WHERE ProjectType = 'PROJECT_CITIPOLICY_NONE_TO_YIELD_SCIENCE';
UPDATE Projects SET PrereqCivic = 'CIVIC_REFORMED_CHURCH' WHERE ProjectType = 'PROJECT_CITIPOLICY_NONE_TO_YIELD_FAITH';
UPDATE Projects SET PrereqCivic = 'CIVIC_MERCANTILISM' WHERE ProjectType = 'PROJECT_CITIPOLICY_NONE_TO_YIELD_GOLD';

INSERT OR REPLACE INTO Projects_XP2 
(ProjectType,					        			RequiredBuilding, 					CreateBuilding) SELECT	
'PROJECT_CITIPOLICY_NONE_TO_' ||YieldType,			'BUILDING_CITIPOLICY_NONE', 		'BUILDING_CITIPOLICY_' ||YieldType FROM Yields;
INSERT OR REPLACE INTO Projects_XP2 
(ProjectType,					        			RequiredBuilding, 					CreateBuilding) SELECT	
'PROJECT_CITIPOLICY_' ||YieldType|| '_TO_NONE',		'BUILDING_CITIPOLICY_' ||YieldType,	'BUILDING_CITIPOLICY_NONE' FROM Yields;

INSERT OR REPLACE INTO Project_BuildingCosts 
(ProjectType,					        		ConsumedBuildingType) SELECT	
'PROJECT_CITIPOLICY_NONE_TO_' ||YieldType,		'BUILDING_CITIPOLICY_NONE' FROM Yields;
INSERT OR REPLACE INTO Project_BuildingCosts 
(ProjectType,					        		ConsumedBuildingType) SELECT	
'PROJECT_CITIPOLICY_' ||YieldType|| '_TO_NONE', 'BUILDING_CITIPOLICY_' ||YieldType FROM Yields;