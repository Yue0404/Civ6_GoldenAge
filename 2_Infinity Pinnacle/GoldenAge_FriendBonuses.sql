-- Gift_List
-- Author: Flactine
--------------------------------------------------------------
--=====
--GA_Official_Civilization
--=====
CREATE TABLE IF NOT EXISTS GA_Official_Civilization
    (
    CivilizationName	TEXT	NOT NULL,
	Kind				TEXT	NOT NULL,
	Value				TEXT	DEFAULT NULL,
	SubValue			TEXT	DEFAULT NULL
    );

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,								SubValue)
VALUES 		
-- 特殊改良 Unique Improvement
('CIVILIZATION_EGYPT',			'UI',		'IMPROVEMENT_SPHINX',				Null),
('CIVILIZATION_FRANCE',			'UI',		'IMPROVEMENT_CHATEAU',				Null),
('CIVILIZATION_NETHERLANDS',	'UI',		'IMPROVEMENT_POLDER',				Null),
('CIVILIZATION_CANADA',			'UI',		'IMPROVEMENT_ICE_HOCKEY_RINK',		Null),
('CIVILIZATION_CREE',			'UI',		'IMPROVEMENT_MEKEWAP',				Null),
('CIVILIZATION_MAPUCHE',		'UI',		'IMPROVEMENT_CHEMAMULL',			Null),
('CIVILIZATION_SCYTHIA',		'UI',		'IMPROVEMENT_KURGAN',				Null), 	
('CIVILIZATION_SCOTLAND',		'UI',		'IMPROVEMENT_GOLF_COURSE',			Null),
('CIVILIZATION_SUMERIA',		'UI',		'IMPROVEMENT_ZIGGURAT',				Null),
('CIVILIZATION_SPAIN',			'UI',		'IMPROVEMENT_MISSION',				Null),
('CIVILIZATION_INDIA',			'UI',		'IMPROVEMENT_STEPWELL',				Null),
('CIVILIZATION_INCA',			'UI',		'IMPROVEMENT_TERRACE_FARM',			Null),
('CIVILIZATION_CHINA',			'UI',		'IMPROVEMENT_GREAT_WALL',			Null),
-- 建筑产出 Building Yield
('CIVILIZATION_ARABIA',			'BY',		'DISTRICT_CAMPUS',					'YIELD_SCIENCE'),
('CIVILIZATION_OTTOMAN',		'BY',		'DISTRICT_COMMERCIAL_HUB',			'YIELD_GOLD'),
('CIVILIZATION_MAORI',			'BY',		'DISTRICT_THEATER',					'YIELD_CULTURE'),
('CIVILIZATION_AMERICA',		'BY',		'DISTRICT_THEATER',					'YIELD_CULTURE'),
('CIVILIZATION_JAPAN',			'BY',		'DISTRICT_INDUSTRIAL_ZONE',			'YIELD_PRODUCTION'),
('CIVILIZATION_NORWAY',			'BY',		'DISTRICT_HOLY_SITE',				'YIELD_FAITH'),
-- 建筑 宜居/住房 Building Bonus
('CIVILIZATION_HUNGARY',		'BB',		'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',				'DISTRICT_ALL_KIND_ENTERTAINMENT_COMPLEX'),
('CIVILIZATION_MONGOLIA',		'BB',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_HOUSING',			'DISTRICT_ENCAMPMENT'),
-- 区域 宜居/住房 District Bonus
('CIVILIZATION_BRAZIL',			'DB',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_ENTERTAINMENT',		'REQSET_GA_FRIEND_DISTRICT_IS_AMENITY'),
('CIVILIZATION_ROME',			'DB',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',					'REQSET_GA_FRIEND_DISTRICT_IS_AQUEDUCT'),
('CIVILIZATION_ZULU',			'DB',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',					'REQSET_GA_FRIEND_DISTRICT_IS_ENCAMPMENT'),
-- 伟人点数 Greatperson Point
('CIVILIZATION_KONGO',			'GP',		'ART',								Null),
('CIVILIZATION_GEORGIA',		'GP',		'ART',								Null),
('CIVILIZATION_SWEDEN',			'GP',		'SCI',								Null),
-- 区域邻接 District Adjancy
('CIVILIZATION_KOREA',			'DA',		'DISTRICT_CAMPUS',					'YIELD_SCIENCE'),
('CIVILIZATION_GERMANY',		'DA',		'DISTRICT_INDUSTRIAL_ZONE',			'YIELD_PRODUCTION'),
('CIVILIZATION_RUSSIA',			'DA',		'DISTRICT_HOLY_SITE',				'YIELD_FAITH'),
('CIVILIZATION_PHOENICIA',		'DA',		'DISTRICT_HARBOR',					'YIELD_GOLD'),
('CIVILIZATION_MALI',			'DA',		'DISTRICT_COMMERCIAL_HUB',			'YIELD_GOLD'),
('CIVILIZATION_GREECE',			'DA',		'DISTRICT_THEATER',					'YIELD_CULTURE'),
('CIVILIZATION_ENGLAND',		'DA',		'DISTRICT_HARBOR',					'YIELD_GOLD');
--=====
--DLC
--=====
-- 特殊改良 Unique Improvement
INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value)
SELECT	
'CIVILIZATION_ETHIOPIA',		'UI',		'IMPROVEMENT_ROCK_HEWN_CHURCH'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_ETHIOPIA');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value)
SELECT	
'CIVILIZATION_AUSTRALIA',		'UI',		'IMPROVEMENT_OUTBACK_STATION'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_AUSTRALIA');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value)
SELECT	
'CIVILIZATION_PERSIA',			'UI',		'IMPROVEMENT_PAIRIDAEZA'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_PERSIA');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value)
SELECT	
'CIVILIZATION_GRAN_COLOMBIA',	'UI',		'IMPROVEMENT_HACIENDA'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GRAN_COLOMBIA');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value)
SELECT	
'CIVILIZATION_NUBIA',			'UI',		'IMPROVEMENT_PYRAMID'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_NUBIA');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value)
SELECT	
'CIVILIZATION_INDONESIA',		'UI',		'IMPROVEMENT_KAMPUNG'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_INDONESIA');
-- 建筑产出 Building Yield
INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,							SubValue)
SELECT	
'CIVILIZATION_POLAND',			'BY',		'DISTRICT_COMMERCIAL_HUB',		'YIELD_GOLD'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_POLAND');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,							SubValue)
SELECT	
'CIVILIZATION_KHMER',			'BY',		'DISTRICT_HOLY_SITE',			'YIELD_FAITH'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_KHMER');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,							SubValue)
SELECT	
'CIVILIZATION_PORTUGAL',		'BY',		'DISTRICT_CAMPUS',				'YIELD_SCIENCE'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_PORTUGAL');
-- 建筑/区域 宜居/住房 MISC Building/District Amenity/Housing
INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,														SubValue)
SELECT	
'CIVILIZATION_AZTEC',			'BB',		'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',				'DISTRICT_ALL_KIND_ENTERTAINMENT_COMPLEX'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_AZTEC');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,														SubValue)
SELECT	
'CIVILIZATION_MACEDON',			'BB',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_HOUSING',			'DISTRICT_ENCAMPMENT'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_MACEDON');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,														SubValue)
SELECT	
'CIVILIZATION_BYZANTIUM',		'DB',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_ENTERTAINMENT',		'REQSET_GA_FRIEND_DISTRICT_IS_AMENITY'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_BYZANTIUM');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,														SubValue)
SELECT	
'CIVILIZATION_VIETNAM',			'DB',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',					'REQSET_GA_FRIEND_DISTRICT_IS_ENCAMPMENT'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_VIETNAM');
-- 伟人点数 Greatperson Point
INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value)
SELECT	
'CIVILIZATION_BABYLON_STK',		'GP',		'SCI'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_BABYLON_STK');
-- 区域邻接 District Adjancy
INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,								SubValue)
SELECT	
'CIVILIZATION_MAYA',			'DA',		'DISTRICT_CAMPUS',					'YIELD_SCIENCE'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_MAYA');

INSERT OR REPLACE INTO GA_Official_Civilization 
(CivilizationName,				Kind,		Value,							SubValue)
SELECT	
'CIVILIZATION_GAUL',			'DA',		'DISTRICT_INDUSTRIAL_ZONE',		'YIELD_PRODUCTION'
WHERE EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_GAUL');
--=====
--RequirementSets
--=====
INSERT OR REPLACE INTO RequirementSets 
(RequirementSetId,		RequirementSetType)
VALUES
('REQSET_GA_ALLY', 		'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements
(RequirementSetId,		RequirementId)
VALUES	
('REQSET_GA_ALLY', 		'REQ_GA_ALLY') ;

INSERT OR REPLACE INTO Requirements
(RequirementId, 		RequirementType)
VALUES
('REQ_GA_ALLY', 		'REQUIREMENT_REQUIREMENTSET_IS_MET');

INSERT OR REPLACE INTO RequirementArguments 
(RequirementId,		Name, 					Value)
VALUES 	
('REQ_GA_ALLY',		'RequirementSetId',		'PLAYER_ALLY');

-- Gift_Modifier_BB
--=====
--Table
--=====
CREATE TABLE IF NOT EXISTS GA_Building_District_TMP
    (
    BuildingType	TEXT	NOT NULL,
	DistrictType	TEXT	NOT NULL
    );
	
INSERT OR REPLACE INTO GA_Building_District_TMP 
(BuildingType, 		DistrictType)
SELECT
BuildingType,		PrereqDistrict
FROM Buildings WHERE TraitType IS NULL AND IsWonder = 0 AND PrereqDistrict IS NOT NULL;

UPDATE	GA_Building_District_TMP
SET		DistrictType = 'DISTRICT_ALL_KIND_ENTERTAINMENT_COMPLEX'
WHERE	DistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX' OR DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX';

--=====
--Trait
--=====
INSERT OR REPLACE INTO Types 
(Type, 										Kind)
SELECT
'GA_TRAIT_FRIENDS_BB_'||CivilizationName,	'KIND_TRAIT'
FROM GA_Official_Civilization WHERE Kind = 'BB';

-- INSERT OR REPLACE INTO Traits 
-- (TraitType,									Name,								Description)
-- SELECT
-- 'GA_TRAIT_FRIENDS_BB_'||CivilizationName,	'LOC_GA_TRAIT_FRIEND_GIFT_NAME',	'LOC_GA_TRAIT_FRIENDS_'||CivilizationName||'_DESCRIPTION'
-- FROM GA_Official_Civilization WHERE Kind = 'BB';

INSERT OR REPLACE INTO Traits 
(TraitType,									Name,								Description)
SELECT
'GA_TRAIT_FRIENDS_BB_'||CivilizationName,	null,	null
FROM GA_Official_Civilization WHERE Kind = 'BB';

INSERT OR REPLACE INTO CivilizationTraits 
(CivilizationType, 		TraitType)
SELECT
CivilizationName,		'GA_TRAIT_FRIENDS_BB_'||CivilizationName
FROM GA_Official_Civilization WHERE Kind = 'BB';

--Civilizations Start
INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BB_CIVILIZATION_HUNGARY',		'MODIFIER_GA_BB_'||BuildingType||'_AMENITY_FRIEND'
FROM GA_Building_District_TMP WHERE DistrictType = 'DISTRICT_ALL_KIND_ENTERTAINMENT_COMPLEX';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BB_CIVILIZATION_MONGOLIA',	'MODIFIER_GA_BB_'||BuildingType||'_HOUSING_FRIEND'
FROM GA_Building_District_TMP WHERE DistrictType = 'DISTRICT_ENCAMPMENT';

--Civilizations DLC

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BB_CIVILIZATION_AZTEC',		'MODIFIER_GA_BB_'||BuildingType||'_AMENITY_FRIEND'
FROM GA_Building_District_TMP WHERE DistrictType = 'DISTRICT_ALL_KIND_ENTERTAINMENT_COMPLEX' AND EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_AZTEC');

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BB_CIVILIZATION_MACEDON',		'MODIFIER_GA_BB_'||BuildingType||'_HOUSING_FRIEND'
FROM GA_Building_District_TMP WHERE DistrictType = 'DISTRICT_ENCAMPMENT' AND EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_MACEDON');

--Civilizations End

INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,							SubjectRequirementSetId)
SELECT
'MODIFIER_GA_BB_'||BuildingType||'_AMENITY_FRIEND',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'
FROM GA_Building_District_TMP;

INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType,							SubjectRequirementSetId)
SELECT
'MODIFIER_GA_BB_'||BuildingType||'_HOUSING_FRIEND',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'
FROM GA_Building_District_TMP;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 											Name, 			Value)
SELECT
'MODIFIER_GA_BB_'||BuildingType||'_AMENITY_FRIEND', 	'ModifierId',	'MODIFIER_GA_FRIEND_GAIN_BB_'||BuildingType||'_AMENITY_FRIEND'
FROM GA_Building_District_TMP;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 											Name, 			Value)
SELECT
'MODIFIER_GA_BB_'||BuildingType||'_HOUSING_FRIEND', 	'ModifierId',	'MODIFIER_GA_FRIEND_GAIN_BB_'||BuildingType||'_HOUSING_FRIEND'
FROM GA_Building_District_TMP;

--=====
--Modifiers 
--=====
INSERT OR REPLACE INTO Modifiers 
(ModifierId,														ModifierType,										SubjectRequirementSetId)
SELECT
'MODIFIER_GA_FRIEND_GAIN_BB_'||BuildingType||'_AMENITY_FRIEND',		'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',		'REQSET_GA_GIFT_HAS_BUILDING_'||BuildingType
FROM GA_Building_District_TMP;

INSERT OR REPLACE INTO Modifiers 
(ModifierId,														ModifierType,										SubjectRequirementSetId)
SELECT
'MODIFIER_GA_FRIEND_GAIN_BB_'||BuildingType||'_HOUSING_FRIEND',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_HOUSING',	'REQSET_GA_GIFT_HAS_BUILDING_'||BuildingType
FROM GA_Building_District_TMP;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 	Name, 			Value)
SELECT
ModifierId,		'Amount',		2
FROM Modifiers WHERE ModifierId LIKE 'MODIFIER_GA_FRIEND_GAIN_BB_%_AMENITY_FRIEND';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 	Name, 			Value)
SELECT
ModifierId,		'Amount',		1
FROM Modifiers WHERE ModifierId LIKE 'MODIFIER_GA_FRIEND_GAIN_BB_%_HOUSING_FRIEND';

--=====
--RequirementSets 
--=====
INSERT OR REPLACE INTO RequirementSets 
(RequirementSetId, 								RequirementSetType)
SELECT	
'REQSET_GA_GIFT_HAS_BUILDING_'||BuildingType,	'REQUIREMENTSET_TEST_ALL'
FROM GA_Building_District_TMP;

INSERT OR REPLACE INTO RequirementSetRequirements 
(RequirementSetId, 								RequirementId)
SELECT	
'REQSET_GA_GIFT_HAS_BUILDING_'||BuildingType,	'REQ_GA_GIFT_HAS_'||BuildingType
FROM GA_Building_District_TMP;

INSERT OR REPLACE INTO Requirements 
(RequirementId, 					RequirementType)
SELECT	
'REQ_GA_GIFT_HAS_'||BuildingType,	'REQUIREMENT_CITY_HAS_BUILDING'
FROM GA_Building_District_TMP;

INSERT OR REPLACE INTO RequirementArguments 
(RequirementId, 					Name,				Value)
SELECT	
'REQ_GA_GIFT_HAS_'||BuildingType,	'BuildingType',		BuildingType
FROM GA_Building_District_TMP;

DROP TABLE IF EXISTS GA_Building_District_TMP;

-- Gift_Modifier_BY
--=====
--Table
--=====
CREATE TABLE IF NOT EXISTS GA_Building_Yield_TMP
    (
    BuildingType	TEXT	NOT NULL,
	YieldType		TEXT	NOT NULL
    );
	
INSERT OR REPLACE INTO GA_Building_Yield_TMP 
(BuildingType, 		YieldType)
SELECT
BuildingType,		'YIELD_SCIENCE'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS';

INSERT OR REPLACE INTO GA_Building_Yield_TMP 
(BuildingType, 		YieldType)
SELECT
BuildingType,		'YIELD_CULTURE'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER';

INSERT OR REPLACE INTO GA_Building_Yield_TMP 
(BuildingType, 		YieldType)
SELECT
BuildingType,		'YIELD_GOLD'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB';

INSERT OR REPLACE INTO GA_Building_Yield_TMP 
(BuildingType, 		YieldType)
SELECT
BuildingType,		'YIELD_PRODUCTION'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE';

INSERT OR REPLACE INTO GA_Building_Yield_TMP 
(BuildingType, 		YieldType)
SELECT
BuildingType,		'YIELD_FAITH'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE';
--=====
--Trait
--=====
INSERT OR REPLACE INTO Types 
(Type, 										Kind)
SELECT
'GA_TRAIT_FRIENDS_BY_'||CivilizationName,	'KIND_TRAIT'
FROM GA_Official_Civilization WHERE Kind = 'BY';

-- INSERT OR REPLACE INTO Traits 
-- (TraitType,									Name,								Description)
-- SELECT
-- 'GA_TRAIT_FRIENDS_BY_'||CivilizationName,	'LOC_GA_TRAIT_FRIEND_GIFT_NAME',	'LOC_GA_TRAIT_FRIENDS_'||CivilizationName||'_DESCRIPTION'
-- FROM GA_Official_Civilization WHERE Kind = 'BY';

INSERT OR REPLACE INTO Traits 
(TraitType,									Name,								Description)
SELECT
'GA_TRAIT_FRIENDS_BY_'||CivilizationName,	null,	null
FROM GA_Official_Civilization WHERE Kind = 'BY';

INSERT OR REPLACE INTO CivilizationTraits 
(CivilizationType, 		TraitType)
SELECT
CivilizationName,		'GA_TRAIT_FRIENDS_BY_'||CivilizationName
FROM GA_Official_Civilization WHERE Kind = 'BY';

--Civilizations Start
INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BY_CIVILIZATION_ARABIA',		'MODIFIER_GA_BY_'||BuildingType||'_YIELD_SCIENCE_FRIEND'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BY_CIVILIZATION_OTTOMAN',		'MODIFIER_GA_BY_'||BuildingType||'_YIELD_GOLD_FRIEND'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BY_CIVILIZATION_MAORI',		'MODIFIER_GA_BY_'||BuildingType||'_YIELD_CULTURE_FRIEND'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BY_CIVILIZATION_AMERICA',		'MODIFIER_GA_BY_'||BuildingType||'_YIELD_CULTURE_FRIEND'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_THEATER';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BY_CIVILIZATION_JAPAN',		'MODIFIER_GA_BY_'||BuildingType||'_YIELD_PRODUCTION_FRIEND'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BY_CIVILIZATION_NORWAY',		'MODIFIER_GA_BY_'||BuildingType||'_YIELD_FAITH_FRIEND'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE';
--Civilizations DLC
INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BY_CIVILIZATION_POLAND',		'MODIFIER_GA_BY_'||BuildingType||'_YIELD_GOLD_FRIEND'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' AND EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_POLAND');

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 									ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BY_CIVILIZATION_KHMER',		'MODIFIER_GA_BY_'||BuildingType||'_YIELD_FAITH_FRIEND'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_HOLY_SITE' AND EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_KHMER');

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 										ModifierId)
SELECT	
'GA_TRAIT_FRIENDS_BY_CIVILIZATION_PORTUGAL',		'MODIFIER_GA_BY_'||BuildingType||'_YIELD_SCIENCE_FRIEND'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_CAMPUS' AND EXISTS (SELECT * FROM Civilizations WHERE CivilizationType = 'CIVILIZATION_PORTUGAL');
--Civilizations End

INSERT OR REPLACE INTO Modifiers 
(ModifierId,												ModifierType,							SubjectRequirementSetId)
SELECT
'MODIFIER_GA_BY_'||BuildingType||'_'||YieldType||'_FRIEND',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'
FROM GA_Building_Yield_TMP;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 													Name, 			Value)
SELECT
'MODIFIER_GA_BY_'||BuildingType||'_'||YieldType||'_FRIEND', 	'ModifierId',	'MODIFIER_GA_'||BuildingType||'_'||YieldType||'_FRIEND_GAIN_BY'
FROM GA_Building_Yield_TMP;
--=====
--Modifiers 
--=====
INSERT OR REPLACE INTO Modifiers 
(ModifierId,														ModifierType)
SELECT
'MODIFIER_GA_'||BuildingType||'_'||YieldType||'_FRIEND_GAIN_BY',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_MODIFIER'
FROM GA_Building_Yield_TMP;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 															Name, 			Value)
SELECT
'MODIFIER_GA_'||BuildingType||'_'||YieldType||'_FRIEND_GAIN_BY',		'Amount',		50
FROM GA_Building_Yield_TMP;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 														Name, 				Value)
SELECT
'MODIFIER_GA_'||BuildingType||'_'||YieldType||'_FRIEND_GAIN_BY',	'BuildingType',		BuildingType
FROM GA_Building_Yield_TMP;

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 														Name, 				Value)
SELECT
'MODIFIER_GA_'||BuildingType||'_'||YieldType||'_FRIEND_GAIN_BY',	'YieldType',		YieldType
FROM GA_Building_Yield_TMP;

DROP TABLE IF EXISTS GA_Building_Yield_TMP;

-- Gift_Modifier_DA
--=====
--Traits 
--=====
INSERT OR REPLACE INTO Types 
(Type, 										Kind)
SELECT
'GA_TRAIT_FRIENDS_DA_'||CivilizationName,	'KIND_TRAIT'
FROM GA_Official_Civilization WHERE Kind = 'DA';

-- INSERT OR REPLACE INTO Traits 
-- (TraitType,									Name,								Description)
-- SELECT
-- 'GA_TRAIT_FRIENDS_DA_'||CivilizationName,	'LOC_GA_TRAIT_FRIEND_GIFT_NAME',	'LOC_GA_TRAIT_FRIENDS_'||CivilizationName||'_DESCRIPTION'
-- FROM GA_Official_Civilization WHERE Kind = 'DA';

INSERT OR REPLACE INTO Traits 
(TraitType,									Name,								Description)
SELECT
'GA_TRAIT_FRIENDS_DA_'||CivilizationName,	null,	null
FROM GA_Official_Civilization WHERE Kind = 'DA';

INSERT OR REPLACE INTO CivilizationTraits 
(CivilizationType, 		TraitType)
SELECT
CivilizationName,		'GA_TRAIT_FRIENDS_DA_'||CivilizationName
FROM GA_Official_Civilization WHERE Kind = 'DA';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 								ModifierId)
SELECT
'GA_TRAIT_FRIENDS_DA_'||CivilizationName,	'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_DA'
FROM GA_Official_Civilization WHERE Kind = 'DA';

INSERT OR REPLACE INTO Modifiers 
(ModifierId,											ModifierType,							SubjectRequirementSetId)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_DA',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'
FROM GA_Official_Civilization WHERE Kind = 'DA';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 											Name, 			Value)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_DA', 	'ModifierId',	'MODIFIER_GA_'||CivilizationName||'_FRIEND_DA_MODIFIER'
FROM GA_Official_Civilization WHERE Kind = 'DA';
--=====
--Modifiers 
--=====
INSERT OR REPLACE INTO Modifiers 
(ModifierId,												ModifierType,										SubjectRequirementSetId)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_DA_MODIFIER', 	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'GOLDEN_DISTRICT_IS_'||Value||'_REQUIREMENTS'
FROM GA_Official_Civilization WHERE Kind = 'DA';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 												Name, 			Value)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_DA_MODIFIER', 	'YieldType',	SubValue
FROM GA_Official_Civilization WHERE Kind = 'DA';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 												Name, 			Value)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_DA_MODIFIER', 	'Amount',		50
FROM GA_Official_Civilization WHERE Kind = 'DA';

-- Gift_Modifier_DB
--=====
--Trait
--=====
INSERT OR REPLACE INTO Types 
(Type, 										Kind)
SELECT
'GA_TRAIT_FRIENDS_DB_'||CivilizationName,	'KIND_TRAIT'
FROM GA_Official_Civilization WHERE Kind = 'DB';

-- INSERT OR REPLACE INTO Traits 
-- (TraitType,									Name,								Description)
-- SELECT
-- 'GA_TRAIT_FRIENDS_DB_'||CivilizationName,	'LOC_GA_TRAIT_FRIEND_GIFT_NAME',	'LOC_GA_TRAIT_FRIENDS_'||CivilizationName||'_DESCRIPTION'
-- FROM GA_Official_Civilization WHERE Kind = 'DB';

INSERT OR REPLACE INTO Traits 
(TraitType,									Name,								Description)
SELECT
'GA_TRAIT_FRIENDS_DB_'||CivilizationName,	null,	null
FROM GA_Official_Civilization WHERE Kind = 'DB';

INSERT OR REPLACE INTO CivilizationTraits 
(CivilizationType, 		TraitType)
SELECT
CivilizationName,		'GA_TRAIT_FRIENDS_DB_'||CivilizationName
FROM GA_Official_Civilization WHERE Kind = 'DB';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 								ModifierId)
SELECT
'GA_TRAIT_FRIENDS_DB_'||CivilizationName,	'MODIFIER_GA_'||CivilizationName||'_FRIEND_DB_MODIFIER'
FROM GA_Official_Civilization WHERE Kind = 'DB';

INSERT OR REPLACE INTO Modifiers 
(ModifierId,												ModifierType,							SubjectRequirementSetId)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_DB_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'
FROM GA_Official_Civilization WHERE Kind = 'DB';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 												Name, 			Value)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_DB_MODIFIER', 	'ModifierId',	'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_DB'
FROM GA_Official_Civilization WHERE Kind = 'DB';
--=====
--Modifiers 
--=====
INSERT OR REPLACE INTO Modifiers 
(ModifierId,											ModifierType,			SubjectRequirementSetId)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_DB',	Value,					SubValue
FROM GA_Official_Civilization WHERE Kind = 'DB';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 											Name, 			Value)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_DB',	'Amount',		2
FROM GA_Official_Civilization WHERE Kind = 'DB' AND SubValue = 'REQSET_GA_FRIEND_DISTRICT_IS_AMENITY';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 											Name, 			Value)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_DB',	'Amount',		3
FROM GA_Official_Civilization WHERE Kind = 'DB' AND SubValue = 'REQSET_GA_FRIEND_DISTRICT_IS_AQUEDUCT';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 											Name, 			Value)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_DB',	'Amount',		2
FROM GA_Official_Civilization WHERE Kind = 'DB' AND SubValue = 'REQSET_GA_FRIEND_DISTRICT_IS_ENCAMPMENT';


INSERT OR REPLACE INTO RequirementSets 
(RequirementSetId, 							RequirementSetType)
VALUES
('REQSET_GA_FRIEND_DISTRICT_IS_AQUEDUCT',	'REQUIREMENTSET_TEST_ALL'),
('REQSET_GA_FRIEND_DISTRICT_IS_ENCAMPMENT',	'REQUIREMENTSET_TEST_ALL'),
('REQSET_GA_FRIEND_DISTRICT_IS_AMENITY',	'REQUIREMENTSET_TEST_ANY');

INSERT OR REPLACE INTO RequirementSetRequirements 
(RequirementSetId, 							RequirementId)
VALUES
('REQSET_GA_FRIEND_DISTRICT_IS_AQUEDUCT',	'REQUIRES_DISTRICT_IS_AQUEDUCT'),
('REQSET_GA_FRIEND_DISTRICT_IS_ENCAMPMENT',	'REQUIRES_DISTRICT_IS_ENCAMPMENT'),
('REQSET_GA_FRIEND_DISTRICT_IS_AMENITY',	'REQUIRES_DISTRICT_IS_ENTERTAINMENT_COMPLEX'),
('REQSET_GA_FRIEND_DISTRICT_IS_AMENITY',	'REQUIRES_DISTRICT_IS_WATER_ENTERTAINMENT_COMPLEX');

-- Gift_Modifier_GP
--=====
--Trait
--=====
INSERT OR REPLACE INTO Types 
(Type, 										Kind)
SELECT
'GA_TRAIT_FRIENDS_GP_'||CivilizationName,	'KIND_TRAIT'
FROM GA_Official_Civilization WHERE Kind = 'GP';

-- INSERT OR REPLACE INTO Traits 
-- (TraitType,									Name,								Description)
-- SELECT
-- 'GA_TRAIT_FRIENDS_GP_'||CivilizationName,	'LOC_GA_TRAIT_FRIEND_GIFT_NAME',	'LOC_GA_TRAIT_FRIENDS_'||CivilizationName||'_DESCRIPTION'
-- FROM GA_Official_Civilization WHERE Kind = 'GP';

INSERT OR REPLACE INTO Traits 
(TraitType,									Name,								Description)
SELECT
'GA_TRAIT_FRIENDS_GP_'||CivilizationName,	null,	null
FROM GA_Official_Civilization WHERE Kind = 'GP';

INSERT OR REPLACE INTO CivilizationTraits 
(CivilizationType, 		TraitType)
SELECT
CivilizationName,		'GA_TRAIT_FRIENDS_GP_'||CivilizationName
FROM GA_Official_Civilization WHERE Kind = 'GP';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 								ModifierId)
SELECT
'GA_TRAIT_FRIENDS_GP_'||CivilizationName,	'MODIFIER_GA_FRIEND_GP_GREAT_WRITER_MODIFIER'
FROM GA_Official_Civilization WHERE Kind = 'GP' AND Value = 'ART';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 								ModifierId)
SELECT
'GA_TRAIT_FRIENDS_GP_'||CivilizationName,	'MODIFIER_GA_FRIEND_GP_GREAT_ARTIST_MODIFIER'
FROM GA_Official_Civilization WHERE Kind = 'GP' AND Value = 'ART';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 								ModifierId)
SELECT
'GA_TRAIT_FRIENDS_GP_'||CivilizationName,	'MODIFIER_GA_FRIEND_GP_GREAT_MUSICIAN_MODIFIER'
FROM GA_Official_Civilization WHERE Kind = 'GP' AND Value = 'ART';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 								ModifierId)
SELECT
'GA_TRAIT_FRIENDS_GP_'||CivilizationName,	'MODIFIER_GA_FRIEND_GP_GREAT_ENGINEER_MODIFIER'
FROM GA_Official_Civilization WHERE Kind = 'GP' AND Value = 'SCI';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 								ModifierId)
SELECT
'GA_TRAIT_FRIENDS_GP_'||CivilizationName,	'MODIFIER_GA_FRIEND_GP_GREAT_MERCHANT_MODIFIER'
FROM GA_Official_Civilization WHERE Kind = 'GP' AND Value = 'SCI';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 								ModifierId)
SELECT
'GA_TRAIT_FRIENDS_GP_'||CivilizationName,	'MODIFIER_GA_FRIEND_GP_GREAT_SCIENTIST_MODIFIER'
FROM GA_Official_Civilization WHERE Kind = 'GP' AND Value = 'SCI';

INSERT OR REPLACE INTO Modifiers 
(ModifierId,											ModifierType,							SubjectRequirementSetId)
VALUES 	
('MODIFIER_GA_FRIEND_GP_GREAT_WRITER_MODIFIER',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'),
('MODIFIER_GA_FRIEND_GP_GREAT_ARTIST_MODIFIER',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'),
('MODIFIER_GA_FRIEND_GP_GREAT_MUSICIAN_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'),
('MODIFIER_GA_FRIEND_GP_GREAT_ENGINEER_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'),
('MODIFIER_GA_FRIEND_GP_GREAT_MERCHANT_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'),
('MODIFIER_GA_FRIEND_GP_GREAT_SCIENTIST_MODIFIER',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY');

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 											Name, 			Value)
VALUES 	
('MODIFIER_GA_FRIEND_GP_GREAT_WRITER_MODIFIER',			'ModifierId',	'MODIFIER_GA_FRIEND_GAIN_GP_GREAT_WRITER'),
('MODIFIER_GA_FRIEND_GP_GREAT_ARTIST_MODIFIER',			'ModifierId',	'MODIFIER_GA_FRIEND_GAIN_GP_GREAT_ARTIST'),
('MODIFIER_GA_FRIEND_GP_GREAT_MUSICIAN_MODIFIER',		'ModifierId',	'MODIFIER_GA_FRIEND_GAIN_GP_GREAT_MUSICIAN'),
('MODIFIER_GA_FRIEND_GP_GREAT_ENGINEER_MODIFIER',		'ModifierId',	'MODIFIER_GA_FRIEND_GAIN_GP_GREAT_ENGINEER'),
('MODIFIER_GA_FRIEND_GP_GREAT_MERCHANT_MODIFIER',		'ModifierId',	'MODIFIER_GA_FRIEND_GAIN_GP_GREAT_MERCHANT'),
('MODIFIER_GA_FRIEND_GP_GREAT_SCIENTIST_MODIFIER',		'ModifierId',	'MODIFIER_GA_FRIEND_GAIN_GP_GREAT_SCIENTIST');
--=====
--Modifiers 
--=====
INSERT OR REPLACE INTO Modifiers 
(ModifierId,										ModifierType)
VALUES
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_WRITER',			'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_ARTIST',			'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_MUSICIAN',		'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_ENGINEER',		'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_MERCHANT',		'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_SCIENTIST',		'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT');

INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,										Name,						Value)
VALUES
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_WRITER',			'GreatPersonClassType',		'GREAT_PERSON_CLASS_WRITER'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_ARTIST',			'GreatPersonClassType',		'GREAT_PERSON_CLASS_ARTIST'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_MUSICIAN',		'GreatPersonClassType',		'GREAT_PERSON_CLASS_MUSICIAN'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_ENGINEER',		'GreatPersonClassType',		'GREAT_PERSON_CLASS_ENGINEER'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_MERCHANT',		'GreatPersonClassType',		'GREAT_PERSON_CLASS_MERCHANT'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_SCIENTIST',		'GreatPersonClassType',		'GREAT_PERSON_CLASS_SCIENTIST'),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_WRITER',			'Amount',		25),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_ARTIST',			'Amount',		25),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_MUSICIAN',		'Amount',		25),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_ENGINEER',		'Amount',		25),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_MERCHANT',		'Amount',		25),
('MODIFIER_GA_FRIEND_GAIN_GP_GREAT_SCIENTIST',		'Amount',		25);

-- Gift_Modifier_UI
--=====
--Trait
--=====
INSERT OR REPLACE INTO Types 
(Type, 										Kind)
SELECT
'GA_TRAIT_FRIENDS_UI_'||CivilizationName,	'KIND_TRAIT'
FROM GA_Official_Civilization WHERE Kind = 'UI';

-- INSERT OR REPLACE INTO Traits 
-- (TraitType,									Name,								Description)
-- SELECT
-- 'GA_TRAIT_FRIENDS_UI_'||CivilizationName,	'LOC_GA_TRAIT_FRIEND_GIFT_NAME',	'LOC_GA_TRAIT_FRIENDS_'||CivilizationName||'_DESCRIPTION'
-- FROM GA_Official_Civilization WHERE Kind = 'UI';

INSERT OR REPLACE INTO Traits 
(TraitType,									Name,								Description)
SELECT
'GA_TRAIT_FRIENDS_UI_'||CivilizationName,	null,	null
FROM GA_Official_Civilization WHERE Kind = 'UI';

INSERT OR REPLACE INTO CivilizationTraits 
(CivilizationType, 		TraitType)
SELECT
CivilizationName,		'GA_TRAIT_FRIENDS_UI_'||CivilizationName
FROM GA_Official_Civilization WHERE Kind = 'UI';

INSERT OR REPLACE INTO TraitModifiers
(TraitType, 								ModifierId)
SELECT
'GA_TRAIT_FRIENDS_UI_'||CivilizationName,	'MODIFIER_GA_'||CivilizationName||'_FRIEND_UI_MODIFIER'
FROM GA_Official_Civilization WHERE Kind = 'UI';

INSERT OR REPLACE INTO Modifiers 
(ModifierId,												ModifierType,							SubjectRequirementSetId)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_UI_MODIFIER',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	'REQSET_GA_ALLY'
FROM GA_Official_Civilization WHERE Kind = 'UI';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 												Name, 			Value)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_UI_MODIFIER', 	'ModifierId',	'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_UI'
FROM GA_Official_Civilization WHERE Kind = 'UI';
--=====
--Modifiers 
--=====
INSERT OR REPLACE INTO Modifiers 
(ModifierId,											ModifierType)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_UI',	'MODIFIER_PLAYER_ADJUST_VALID_IMPROVEMENT'
FROM GA_Official_Civilization WHERE Kind = 'UI';

INSERT OR REPLACE INTO ModifierArguments
(ModifierId, 											Name, 				Value)
SELECT
'MODIFIER_GA_'||CivilizationName||'_FRIEND_GAIN_UI',	'ImprovementType',	Value
FROM GA_Official_Civilization WHERE Kind = 'UI';
