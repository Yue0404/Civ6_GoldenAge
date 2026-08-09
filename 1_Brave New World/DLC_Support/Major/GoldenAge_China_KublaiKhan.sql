CREATE TABLE IF NOT EXISTS GA_KubCap_CIV_UA (
	CivilizationType    TEXT   NOT NULL,
    TraitType    		TEXT   NOT NULL,
	TraitName			TEXT,
    ModifierId   		TEXT   NOT NULL,
    PRIMARY KEY (CivilizationType, ModifierId)
);

INSERT OR REPLACE INTO GA_KubCap_CIV_UA (CivilizationType, TraitType, TraitName, ModifierId)
SELECT Civilizations.CivilizationType,CivilizationTraits.TraitType,Traits.Name,TraitModifiers.ModifierId FROM Civilizations
INNER JOIN CivilizationTraits ON Civilizations.CivilizationType = CivilizationTraits.CivilizationType
INNER JOIN Traits ON Traits.TraitType = CivilizationTraits.TraitType
INNER JOIN TraitModifiers ON TraitModifiers.TraitType = Traits.TraitType
INNER JOIN Modifiers ON Modifiers.ModifierId = TraitModifiers.ModifierId
WHERE Civilizations.StartingCivilizationLevelType IS 'CIVILIZATION_LEVEL_FULL_CIV';

-- extra mod and dlc
CREATE TRIGGER KublaiKhanCCNewUA
AFTER INSERT ON TraitModifiers
WHEN NEW.TraitType NOT NULL
BEGIN
	INSERT OR REPLACE INTO GA_KubCap_CIV_UA 
	(CivilizationType, TraitType, ModifierId)
	SELECT Civilizations.CivilizationType,CivilizationTraits.TraitType,TraitModifiers.ModifierId FROM TraitModifiers
	INNER JOIN Traits ON Traits.TraitType = TraitModifiers.TraitType
	INNER JOIN CivilizationTraits ON Traits.TraitType = CivilizationTraits.TraitType
	INNER JOIN Civilizations ON Civilizations.CivilizationType = CivilizationTraits.CivilizationType
	WHERE TraitModifiers.TraitType = NEW.TraitType AND Civilizations.StartingCivilizationLevelType IS 'CIVILIZATION_LEVEL_FULL_CIV';

END;
-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_KUBLAI' AND ModifierId = 'TRAIT_ECONOMIC_GOVERNMENT_SLOT';

-- INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) VALUES	
-- ('TRAIT_LEADER_KUBLAI',	'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TECH_BOOST'),
-- ('TRAIT_LEADER_KUBLAI',	'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_CIVIC_BOOST'),
-- ('TRAIT_LEADER_KUBLAI',	'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_GOVERNOR_TITLE'),
-- ('TRAIT_LEADER_KUBLAI',	'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TRADE_ROUTE');
-- INSERT OR REPLACE INTO TraitModifiers (TraitType,				ModifierId)
-- SELECT	'TRAIT_LEADER_KUBLAI',		'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_' ||YieldType FROM Yields WHERE YieldType<>'YIELD_FOOD';

-----------------------------------------------
-- Modifiers
-----------------------------------------------
-- INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType,								                                    SubjectRequirementSetId) VALUES	
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TECH_BOOST',			            'MODIFIER_PLAYER_CAPTURED_CITY_ATTACH_MODIFIER',		                        'GOLDEN_CITY_HAS_TEN_POPULATION_REQUIREMENTS'),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_CIVIC_BOOST',			        'MODIFIER_PLAYER_CAPTURED_CITY_ATTACH_MODIFIER',		                        'GOLDEN_CITY_HAS_TEN_POPULATION_REQUIREMENTS'),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_GOVERNOR_TITLE',			        'MODIFIER_PLAYER_CAPTURED_CITY_ATTACH_MODIFIER',		                        'GOLDEN_CITY_HAS_TEN_POPULATION_REQUIREMENTS'),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TRADE_ROUTE',			        'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_CAPACITY',		                    'GOLDEN_KUBLAI_CITY_NOT_FOUNDED_HAS_TWENTY_POPULATION_REQUIREMENTS');

-- INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectStackLimit, SubjectRequirementSetId) VALUES	
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TECH_BOOST_MODIFIER',             'MODIFIER_PLAYER_GRANT_RANDOM_TECHNOLOGY_BOOST_GOODY_HUT',               1, 1, 0, NULL),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_CIVIC_BOOST_MODIFIER',            'MODIFIER_PLAYER_GRANT_RANDOM_CIVIC_BOOST_GOODY_HUT',                    1, 1, 0, NULL),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_GOVERNOR_TITLE_MODIFIER',         'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',                                1, 1, 0, NULL);

-- INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
-- SELECT	'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_' ||YieldType,	                'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',				'GOLDEN_KUBLAI_CITY_NOT_FOUNDED_HAS_THIRTY_POPULATION_REQUIREMENTS' FROM Yields WHERE YieldType<>'YIELD_FOOD';

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TECH_BOOST',					'ModifierId',	    'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TECH_BOOST_MODIFIER'),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TECH_BOOST_MODIFIER',		'Amount',	        1),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TECH_BOOST_MODIFIER',		'Source',	        'CAPTURED_CITY'),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_CIVIC_BOOST',				'ModifierId',	    'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_CIVIC_BOOST_MODIFIER'),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_CIVIC_BOOST_MODIFIER',		'Amount',	        1),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_CIVIC_BOOST_MODIFIER',		'Source',	        'CAPTURED_CITY'),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_GOVERNOR_TITLE',			    'ModifierId',		'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_GOVERNOR_TITLE_MODIFIER'),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_GOVERNOR_TITLE_MODIFIER',	'Delta',		    1),
-- ('GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_TRADE_ROUTE',				'Amount',       	1);

-- INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
-- SELECT	'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_' ||YieldType,	        'Amount',	    20 FROM Yields WHERE YieldType<>'YIELD_FOOD';
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId,						Name,			            Value)
-- SELECT	'GOLDEN_TRAIT_KUBLAI_CAPURED_CITY_' ||YieldType,	        'YieldType',	YieldType FROM Yields WHERE YieldType<>'YIELD_FOOD';
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
-- INSERT OR REPLACE INTO RequirementSets(RequirementSetId,								RequirementSetType)VALUES	
-- ('GOLDEN_KUBLAI_CITY_NOT_FOUNDED_HAS_TWENTY_POPULATION_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL'),
-- ('GOLDEN_KUBLAI_CITY_NOT_FOUNDED_HAS_THIRTY_POPULATION_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
-- INSERT OR REPLACE INTO RequirementSetRequirements(RequirementSetId,								RequirementId)VALUES	
-- ('GOLDEN_KUBLAI_CITY_NOT_FOUNDED_HAS_TWENTY_POPULATION_REQUIREMENTS',				'GOLDEN_REQUIRES_CITY_HAS_TWENTY_POPULATION'),
-- ('GOLDEN_KUBLAI_CITY_NOT_FOUNDED_HAS_TWENTY_POPULATION_REQUIREMENTS',				'CITY_IS_NOT_ORIGINAL_OWNER_REQUIREMENTS'),
-- ('GOLDEN_KUBLAI_CITY_NOT_FOUNDED_HAS_THIRTY_POPULATION_REQUIREMENTS',				'GOLDEN_REQUIRES_CITY_HAS_THIRTY_POPULATION'),
-- ('GOLDEN_KUBLAI_CITY_NOT_FOUNDED_HAS_THIRTY_POPULATION_REQUIREMENTS',				'CITY_IS_NOT_ORIGINAL_OWNER_REQUIREMENTS');



