-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) VALUES	
('TRAIT_CIVILIZATION_ITERU',	'GOLDEN_TRAIT_ITERU_TECH_IRRIGATION');
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId)
SELECT	'TRAIT_CIVILIZATION_ITERU',		'GOLDEN_TRAIT_ITERU_RIVER_' ||ResourceType|| '_DOUBLE_' ||YieldType
FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE Frequency > 0);
INSERT OR REPLACE INTO TraitModifiers (TraitType,						ModifierId)
SELECT	'TRAIT_CIVILIZATION_ITERU',		'GOLDEN_TRAIT_ITERU_FLOODPLAINS_' ||ResourceType|| '_DOUBLE_' ||YieldType
FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE Frequency > 0);
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_ITERU_TECH_IRRIGATION',	         'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY', 1, 1, NULL);
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_ITERU_RIVER_' ||ResourceType|| '_DOUBLE_' ||YieldType,	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'GOLDEN_EGYPT_PLOT_HAS_RIVER_' ||ResourceType
FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE Frequency > 0);
INSERT OR REPLACE INTO Modifiers (ModifierId,										ModifierType,												SubjectRequirementSetId)
SELECT	'GOLDEN_TRAIT_ITERU_FLOODPLAINS_' ||ResourceType|| '_DOUBLE_' ||YieldType,	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'GOLDEN_EGYPT_PLOT_HAS_FLOODPLAINS_' ||ResourceType
FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE Frequency > 0);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_TRAIT_ITERU_TECH_IRRIGATION',		            'TechType',	        'TECH_IRRIGATION');
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_TRAIT_ITERU_RIVER_' ||ResourceType|| '_DOUBLE_' ||YieldType,	'YieldType',	YieldType
FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE Frequency > 0);
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_TRAIT_ITERU_RIVER_' ||ResourceType|| '_DOUBLE_' ||YieldType,	'Amount',		YieldChange
FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE Frequency > 0);
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_TRAIT_ITERU_FLOODPLAINS_' ||ResourceType|| '_DOUBLE_' ||YieldType,	'YieldType',	YieldType
FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE Frequency > 0);
INSERT OR REPLACE INTO ModifierArguments (ModifierId,												Name,			Value)
SELECT	'GOLDEN_TRAIT_ITERU_FLOODPLAINS_' ||ResourceType|| '_DOUBLE_' ||YieldType,	'Amount',		YieldChange
FROM Resource_YieldChanges WHERE ResourceType IN (SELECT ResourceType FROM Resources WHERE Frequency > 0);

UPDATE ModifierArguments SET  Value = 50
WHERE ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_DISTRICT' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 50
WHERE ModifierId = 'TRAIT_RIVER_FASTER_BUILDTIME_WONDER' AND Name = 'Amount';
---------------------------------------------------------------------------------------------------------------
-- RequirementSets
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							RequirementSetType)
SELECT	'GOLDEN_EGYPT_PLOT_HAS_RIVER_' ||ResourceType,	'REQUIREMENTSET_TEST_ALL' FROM Resources WHERE Frequency > 0;
INSERT OR REPLACE INTO RequirementSets (RequirementSetId,							RequirementSetType)
SELECT	'GOLDEN_EGYPT_PLOT_HAS_FLOODPLAINS_' ||ResourceType,	'REQUIREMENTSET_TEST_ALL' FROM Resources WHERE Frequency > 0;
---------------------------------------------------------------------------------------------------------------
-- RequirementSetRequirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_EGYPT_PLOT_HAS_RIVER_' ||ResourceType,	'REQUIRES_PLOT_ADJACENT_TO_RIVER' FROM Resources WHERE Frequency > 0;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_EGYPT_PLOT_HAS_RIVER_' ||ResourceType,	'GOLDEN_EGYPT_REQUIRES_PLOT_HAS_' ||ResourceType FROM Resources WHERE Frequency > 0;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_EGYPT_PLOT_HAS_FLOODPLAINS_' ||ResourceType,	'GOLDEN_REQUIRES_PLOT_HAS_ANY_FLOODPLAINS' FROM Resources WHERE Frequency > 0;
INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId,							RequirementId)
SELECT	'GOLDEN_EGYPT_PLOT_HAS_FLOODPLAINS_' ||ResourceType,	'GOLDEN_EGYPT_REQUIRES_PLOT_HAS_' ||ResourceType FROM Resources WHERE Frequency > 0;
---------------------------------------------------------------------------------------------------------------
-- Requirements
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO Requirements (RequirementId,									RequirementType)
SELECT	'GOLDEN_EGYPT_REQUIRES_PLOT_HAS_' ||ResourceType,	'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES' FROM Resources WHERE Frequency > 0;
---------------------------------------------------------------------------------------------------------------
-- RequirementArguments
---------------------------------------------------------------------------------------------------------------
INSERT OR REPLACE INTO RequirementArguments (RequirementId,									Name,			Value)
SELECT	'GOLDEN_EGYPT_REQUIRES_PLOT_HAS_' ||ResourceType,	'ResourceType',	ResourceType FROM Resources WHERE Frequency > 0;



-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
DELETE FROM TraitModifiers WHERE TraitType = 'TRAIT_LEADER_MEDITERRANEAN';
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierId) VALUES	
('TRAIT_LEADER_MEDITERRANEAN',	'TRAIT_ALLIANCE_POINTS_FROM_TRADE'),
('TRAIT_LEADER_MEDITERRANEAN',	'TRAIT_INCOMING_TRADE_GAIN_GOLD'),
('TRAIT_LEADER_MEDITERRANEAN',	'TRAIT_INCOMING_TRADE_OFFER_FOOD'),
('TRAIT_LEADER_MEDITERRANEAN',	'TRAIT_INTERNATIONAL_TRADE_FOOD'),
('TRAIT_LEADER_MEDITERRANEAN',	'TRAIT_INTERNATIONAL_TRADE_PRODUCTION'),
('TRAIT_LEADER_MEDITERRANEAN',	'TRAIT_ALLY_TRADE_FOOD'),
('TRAIT_LEADER_MEDITERRANEAN',	'TRAIT_ALLY_TRADE_PRODUCTION'),
('TRAIT_LEADER_MEDITERRANEAN',	'TRAIT_ATTACH_ALLIANCE_COMBAT_ADJUSTMENT');--exp1 Leader TRAIT_LEADER_ADVENTURES_ENKIDU

-----------------------------------------------
-- Modifiers
-----------------------------------------------
-- INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES	
-- ('GA_TRAIT_MEDITERRANEAN_EARLY_ALLY',	         'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', NULL),
-- ('GA_TRAIT_MEDITERRANEAN_EARLY_ALLY_MODIFIER',	         'MODIFIER_PLAYER_ADD_DIPLOMATIC_ACTION_OVERRIDE', NULL);
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES	
('TRAIT_INTERNATIONAL_TRADE_FOOD',	         		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', NULL),
('TRAIT_INTERNATIONAL_TRADE_PRODUCTION',	        'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', NULL),
('TRAIT_ALLY_TRADE_FOOD',	         				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE', NULL),
('TRAIT_ALLY_TRADE_PRODUCTION',	        			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE', NULL);

-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
-- INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
-- ('GA_TRAIT_MEDITERRANEAN_EARLY_ALLY',		            'ModifierId',	        'GA_TRAIT_MEDITERRANEAN_EARLY_ALLY_MODIFIER'),
-- ('GA_TRAIT_MEDITERRANEAN_EARLY_ALLY_MODIFIER',		            'DiplomaticAction',	    'DIPLOACTION_ALLIANCE'),
-- ('GA_TRAIT_MEDITERRANEAN_EARLY_ALLY_MODIFIER',		            'CivicType',	        'CIVIC_CODE_OF_LAWS');
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('TRAIT_INTERNATIONAL_TRADE_FOOD', 			'YieldType', 	'YIELD_FOOD'),
('TRAIT_INTERNATIONAL_TRADE_FOOD', 			'Amount', 		2), 
('TRAIT_INTERNATIONAL_TRADE_PRODUCTION', 	'YieldType', 	'YIELD_PRODUCTION'),
('TRAIT_INTERNATIONAL_TRADE_PRODUCTION', 	'Amount', 		2), 
('TRAIT_ALLY_TRADE_FOOD', 					'YieldType', 	'YIELD_FOOD'),
('TRAIT_ALLY_TRADE_FOOD', 					'Amount', 		2), 
('TRAIT_ALLY_TRADE_PRODUCTION', 			'YieldType', 	'YIELD_PRODUCTION'),
('TRAIT_ALLY_TRADE_PRODUCTION', 			'Amount', 		2);


UPDATE ModifierArguments SET  Value = 2
WHERE ModifierId = 'TRAIT_ALLIANCE_POINTS_FROM_TRADE' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 3
WHERE ModifierId = 'TRAIT_INCOMING_TRADE_GAIN_GOLD' AND Name = 'Amount';--2 gold to 3 gold
UPDATE ModifierArguments SET  Value = 'YIELD_GOLD'
WHERE ModifierId = 'TRAIT_INCOMING_TRADE_OFFER_FOOD' AND Name = 'YieldType';--2 food to 3 gold
UPDATE ModifierArguments SET  Value = 3
WHERE ModifierId = 'TRAIT_INCOMING_TRADE_OFFER_FOOD' AND Name = 'Amount';--2 food to 3 gold

-- ('TRAIT_CIVILIZATION_ITERU',	'GOLDEN_TRAIT_ITERU_FARM_FOOD'),
-- ('TRAIT_CIVILIZATION_ITERU',	'GOLDEN_TRAIT_ITERU_FARM_PRODUCTION'),
-- ('TRAIT_CIVILIZATION_ITERU',	'GOLDEN_TRAIT_ITERU_TECH_MATHEMATICS_BOOST'),
-- ('TRAIT_CIVILIZATION_ITERU',	'GOLDEN_TRAIT_ITERU_TECH_ASTRONOMY_BOOST'),
-- ('TRAIT_LEADER_MEDITERRANEAN',	'GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_FOOD'),
-- ('TRAIT_LEADER_MEDITERRANEAN',	'GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_PRODUCTION'),
-- ('TRAIT_LEADER_MEDITERRANEAN',	'GOLDEN_TRAIT_TRADEROUTE_FOODFROMALLY'),
-- ('TRAIT_LEADER_MEDITERRANEAN',	'GOLDEN_TRAIT_TRADEROUTE_PRODUCTIONFROMALLY'),
-- ('TRAIT_LEADER_MEDITERRANEAN',	'GOLDEN_TRAIT_TRADEROUTE_GOLDFROMALLY'),
-- ('TRAIT_LEADER_MAJOR_CIV',	    'GOLDEN_TRAIT_NO_FORMAL_WAR_ON_EGYPT');

-- INSERT OR REPLACE INTO Modifiers (ModifierId,						ModifierType,								                                    SubjectRequirementSetId) VALUES	
-- ('GOLDEN_TRAIT_ITERU_FARM_FOOD',			            'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		                                    'GOLDEN_PLOT_HAS_FARM_ON_ANY_FLOODPLAINS_REQUIREMENTS'),
-- ('GOLDEN_TRAIT_ITERU_FARM_PRODUCTION',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		                                    'GOLDEN_PLOT_HAS_FARM_ON_ANY_FLOODPLAINS_REQUIREMENTS');
-- ('GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_FOOD',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',		            NULL),
-- ('GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',		            NULL),
-- ('GOLDEN_TRAIT_TRADEROUTE_FOODFROMALLY',			    'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE',		        NULL),
-- ('GOLDEN_TRAIT_TRADEROUTE_PRODUCTIONFROMALLY',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE',		        NULL),
-- ('GOLDEN_TRAIT_TRADEROUTE_GOLDFROMALLY',	            'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE',		        NULL),
-- ('GOLDEN_TRAIT_NO_FORMAL_WAR_ON_EGYPT',	                'MODIFIER_PLAYER_ADJUST_BANNED_DIPLOMATIC_ACTION_SPECIFIC_CIVILIZATION',		NULL);
-- ('GOLDEN_TRAIT_ITERU_TECH_MATHEMATICS_BOOST', 'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST', 1, 1, NULL),
-- ('GOLDEN_TRAIT_ITERU_TECH_ASTRONOMY_BOOST',	 'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST', 1, 1, NULL),

-- ('GOLDEN_TRAIT_ITERU_FARM_FOOD',					'YieldType',	    'YIELD_FOOD'),
-- ('GOLDEN_TRAIT_ITERU_FARM_FOOD',					'Amount',	        1),
-- ('GOLDEN_TRAIT_ITERU_FARM_PRODUCTION',				'YieldType',	    'YIELD_PRODUCTION'),
-- ('GOLDEN_TRAIT_ITERU_FARM_PRODUCTION',				'Amount',	        1),
-- ('GOLDEN_TRAIT_ITERU_TECH_MATHEMATICS_BOOST',		'TechType',	        'TECH_MATHEMATICS'),
-- ('GOLDEN_TRAIT_ITERU_TECH_ASTRONOMY_BOOST',			'TechType',	        'TECH_ASTRONOMY'),
-- ('GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_FOOD',					'YieldType',	    'YIELD_FOOD'),
-- ('GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_FOOD',					'Amount',	        1),
-- ('GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_FOOD',					'Intercontinental',	0),
-- ('GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_PRODUCTION',			'YieldType',	    'YIELD_PRODUCTION'),
-- ('GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_PRODUCTION',			'Amount',	        1),
-- ('GOLDEN_TRAIT_INTERNATIONAL_TRADE_GAIN_PRODUCTION',			'Intercontinental',	0),
-- ('GOLDEN_TRAIT_TRADEROUTE_FOODFROMALLY',					    'YieldType',	    'YIELD_FOOD'),
-- ('GOLDEN_TRAIT_TRADEROUTE_FOODFROMALLY',					    'Amount',	        1),
-- ('GOLDEN_TRAIT_TRADEROUTE_PRODUCTIONFROMALLY',					'YieldType',	    'YIELD_PRODUCTION'),
-- ('GOLDEN_TRAIT_TRADEROUTE_PRODUCTIONFROMALLY',					'Amount',	        1),
-- ('GOLDEN_TRAIT_TRADEROUTE_GOLDFROMALLY',					    'YieldType',	    'YIELD_GOLD'),
-- ('GOLDEN_TRAIT_TRADEROUTE_GOLDFROMALLY',					    'Amount',	        2),
-- ('GOLDEN_TRAIT_NO_FORMAL_WAR_ON_EGYPT',					        'CivilizationType',	        'CIVILIZATION_EGYPT'),
-- ('GOLDEN_TRAIT_NO_FORMAL_WAR_ON_EGYPT',					        'DiplomaticActionType',	    'DIPLOACTION_DECLARE_FORMAL_WAR');
-- UPDATE ModifierArguments SET  Value = 2
-- WHERE ModifierId = 'TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD' AND Name = 'Amount';

-- INSERT OR REPLACE INTO RequirementSets 				(RequirementSetId ,         RequirementSetType) 	
-- VALUES 		('GOLDEN_PLOT_HAS_FARM_ON_ANY_FLOODPLAINS_REQUIREMENTS' , 		    'REQUIREMENTSET_TEST_ALL');

-- INSERT OR REPLACE INTO RequirementSetRequirements 	(RequirementSetId ,         RequirementId) 			
-- VALUES 		('GOLDEN_PLOT_HAS_FARM_ON_ANY_FLOODPLAINS_REQUIREMENTS' , 		    'GOLDEN_REQUIRES_PLOT_HAS_IMPROVEMENT_FARM'),
            -- ('GOLDEN_PLOT_HAS_FARM_ON_ANY_FLOODPLAINS_REQUIREMENTS' , 		    'GOLDEN_REQUIRES_PLOT_HAS_ANY_FLOODPLAINS');
