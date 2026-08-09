--平民单位
UPDATE Units SET BaseSightRange = 1 WHERE FormationClass = 'FORMATION_CLASS_CIVILIAN';
UPDATE Units SET Cost = 50, CostProgressionParam1 = 75 WHERE UnitType = 'UNIT_SETTLER';
UPDATE Units SET Cost = 50, CostProgressionParam1 = 10 WHERE UnitType = 'UNIT_BUILDER';
UPDATE Units SET Cost = 50, CostProgressionParam1 = 10, CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES' WHERE UnitType = 'UNIT_TRADER';
UPDATE Units SET Cost = 150, CostProgressionParam1 = 30, CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES', BaseMoves=4, BuildCharges=3 WHERE UnitType = 'UNIT_MILITARY_ENGINEER';
UPDATE Units SET Cost = 50, CostProgressionParam1 = 10, PrereqCivic = null WHERE UnitType = 'UNIT_MISSIONARY';
UPDATE Units SET Cost = 150, CostProgressionParam1 = 25 WHERE UnitType = 'UNIT_APOSTLE';
UPDATE Units SET Cost = 200, CostProgressionParam1 = 100, BaseSightRange=3 WHERE UnitType = 'UNIT_SPY';
UPDATE Units SET Cost = 400, CostProgressionParam1 = 100 WHERE UnitType = 'UNIT_NATURALIST';
UPDATE Units SET Cost = 400, CostProgressionParam1 = 100, PrereqCivic='CIVIC_PROFESSIONAL_SPORTS'  WHERE UnitType = 'UNIT_ROCK_BAND';

--支援单位
UPDATE Units SET BaseSightRange = 1 WHERE FormationClass = 'FORMATION_CLASS_SUPPORT';
UPDATE Units SET Cost = 50 WHERE UnitType = 'UNIT_BATTERING_RAM';

UPDATE Units SET Cost = 150, Maintenance=2, PrereqTech='TECH_EDUCATION' WHERE UnitType = 'UNIT_MEDIC';
UPDATE Units SET Cost = 400, Maintenance=4 WHERE UnitType = 'UNIT_SUPPLY_CONVOY';
UPDATE Units SET Cost = 500, Maintenance=3 WHERE UnitType = 'UNIT_ANTIAIR_GUN';
UPDATE Units SET Cost = 600 WHERE UnitType = 'UNIT_MOBILE_SAM';


UPDATE Units SET BaseSightRange= 6, Cost=300, Maintenance=5, BaseMoves=2, PrereqTech='TECH_SCIENTIFIC_THEORY' WHERE UnitType = 'UNIT_OBSERVATION_BALLOON';
UPDATE Units SET BaseSightRange= 8, Cost=500, Maintenance=7, BaseMoves=5, PrereqTech = 'TECH_COMPUTERS'  WHERE UnitType = 'UNIT_DRONE';
INSERT OR REPLACE INTO TypeTags (Type,					Tag) VALUES	
('UNIT_OBSERVATION_BALLOON',	'CLASS_REVEAL_STEALTH'),
('UNIT_DRONE',					'CLASS_REVEAL_STEALTH');
DELETE FROM TypeTags WHERE Type = 'ABILITY_OBSERVATION_STRENGTH_BONUS' AND Tag = 'CLASS_OBSERVATION' ;
DELETE FROM TypeTags WHERE Type = 'ABILITY_DRONE_GRANT_SIEGE_BONUS' AND Tag = 'CLASS_DRONE' ;
DELETE FROM UnitAbilityModifiers WHERE UnitAbilityType = 'ABILITY_RECEIVE_RANGE_BONUS' AND ModifierId = 'RECEIVE_RANGE_BONUS' ; --气球和无人机给攻城单位+1射程

--军事工程师加速
INSERT OR REPLACE INTO Building_BuildChargeProductions
(BuildingType,			UnitType,					PercentProductionPerCharge) VALUES	
('BUILDING_WALLS',		'UNIT_MILITARY_ENGINEER',	50),
('BUILDING_CASTLE',		'UNIT_MILITARY_ENGINEER',	40),
('BUILDING_STAR_FORT',	'UNIT_MILITARY_ENGINEER',	30),
('BUILDING_TSIKHE',		'UNIT_ROMAN_LEGION',		40);--UB

INSERT OR REPLACE INTO District_BuildChargeProductions
(DistrictType,			UnitType,					PercentProductionPerCharge) VALUES	
('DISTRICT_NEIGHBORHOOD',		'UNIT_MILITARY_ENGINEER',	30),
('DISTRICT_MBANZA',		'UNIT_MILITARY_ENGINEER',	30);
UPDATE District_BuildChargeProductions SET PercentProductionPerCharge = 30
WHERE DistrictType = 'DISTRICT_CANAL';
UPDATE District_BuildChargeProductions SET PercentProductionPerCharge = 30
WHERE DistrictType = 'DISTRICT_DAM';
UPDATE District_BuildChargeProductions SET PercentProductionPerCharge = 30
WHERE DistrictType = 'DISTRICT_AQUEDUCT';
UPDATE District_BuildChargeProductions SET PercentProductionPerCharge = 30
WHERE DistrictType = 'DISTRICT_BATH';--UD

--平衡各个时代陆地单位上船后的战斗力
UPDATE Eras SET EmbarkedUnitStrength = 5  WHERE EraType = 'ERA_ANCIENT';--null
UPDATE Eras SET EmbarkedUnitStrength = 15 WHERE EraType = 'ERA_CLASSICAL';
UPDATE Eras SET EmbarkedUnitStrength = 25 WHERE EraType = 'ERA_MEDIEVAL';
UPDATE Eras SET EmbarkedUnitStrength = 35 WHERE EraType = 'ERA_RENAISSANCE';
UPDATE Eras SET EmbarkedUnitStrength = 45 WHERE EraType = 'ERA_INDUSTRIAL';
UPDATE Eras SET EmbarkedUnitStrength = 55 WHERE EraType = 'ERA_MODERN';
UPDATE Eras SET EmbarkedUnitStrength = 65 WHERE EraType = 'ERA_ATOMIC';
UPDATE Eras SET EmbarkedUnitStrength = 75 WHERE EraType = 'ERA_INFORMATION';
UPDATE Eras SET EmbarkedUnitStrength = 85 WHERE EraType = 'ERA_FUTURE';--null

-----------------------------------------------
--视野系统
-----------------------------------------------										
INSERT OR REPLACE INTO Types						
(Type,									Kind) VALUES						
('ABILITY_ENHANCED_SIGHT',				'KIND_ABILITY');

INSERT OR REPLACE INTO UnitAbilityModifiers		
 (UnitAbilityType,				ModifierId) VALUES
('ABILITY_ENHANCED_SIGHT',		'GOLDEN_ENHANCED_SIGHT_ON_HILLS');
										
INSERT OR REPLACE INTO UnitAbilities				
(UnitAbilityType,				Name,								Description,										Inactive) VALUES
('ABILITY_ENHANCED_SIGHT',		'LOC_ABILITY_ENHANCED_SIGHT_NAME',	'LOC_ABILITY_ENHANCED_SIGHT_MODIFIER_DESCRIPTION',	0);
									
INSERT OR REPLACE INTO Modifiers					
(ModifierId,							ModifierType,						    Permanent,		SubjectRequirementSetId,	SubjectStackLimit) VALUES						
('GOLDEN_ENHANCED_SIGHT_ON_HILLS',		'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT',	0,				'GOLDEN_TERRAIN_IS_A_HILL_REQUIREMENTS',	1);									
INSERT OR REPLACE INTO Modifiers				
(ModifierId,								        ModifierType,						Permanent) VALUES						
('GOLDEN_ENHANCED_SIGHT_ON_HILLS_MODIFIER',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',			1);		
								
 INSERT OR REPLACE INTO ModifierArguments			
 (ModifierId,								Name,			Value) VALUES						
('GOLDEN_ENHANCED_SIGHT_ON_HILLS',		'ModifierId',	'GOLDEN_ENHANCED_SIGHT_ON_HILLS_MODIFIER'),
('GOLDEN_ENHANCED_SIGHT_ON_HILLS',		'Amount',		1);
										
INSERT OR REPLACE INTO ModifierStrings				
(ModifierId,							    Context,	Text)	VALUES								
('GOLDEN_ENHANCED_SIGHT_ON_HILLS',	'Preview',	'LOC_ABILITY_ENHANCED_SIGHT_MODIFIER_DESCRIPTION');

INSERT OR REPLACE INTO	RequirementSets				
(RequirementSetId,                                  RequirementSetType)		VALUES		
('GOLDEN_TERRAIN_IS_A_HILL_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements	
(RequirementSetId,                                  RequirementId)			VALUES		
('GOLDEN_TERRAIN_IS_A_HILL_REQUIREMENTS',			'GOLDEN_REQUIRES_TERRAIN_ON_HILL');

INSERT OR REPLACE INTO Requirements				
(RequirementId,										 RequirementType)VALUES						
('GOLDEN_REQUIRES_TERRAIN_ON_HILL',					'REQUIREMENT_PLOT_IS_HILLS');	
										
INSERT OR REPLACE INTO TypeTags 	
([Type] , Tag) 	VALUES 	
('ABILITY_ENHANCED_SIGHT',	'CLASS_MELEE'),
('ABILITY_ENHANCED_SIGHT',	'CLASS_ANTI_CAVALRY'),
('ABILITY_ENHANCED_SIGHT',	'CLASS_TRUE_RANGED'),
('ABILITY_ENHANCED_SIGHT',	'CLASS_FIRESUPPORT'),
('ABILITY_ENHANCED_SIGHT',	'CLASS_SIEGE');		

-----------------------------------------------
--军事工程师帮助攻城
-----------------------------------------------
UPDATE UnitUpgrades SET UpgradeUnit='UNIT_MILITARY_ENGINEER' WHERE Unit='UNIT_SIEGE_TOWER';

INSERT OR REPLACE INTO Types
(Type,																		Kind) VALUES	
('ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE',							'KIND_ABILITY'),
('ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY',					'KIND_ABILITY');
		
INSERT OR REPLACE INTO Tags						
(Tag,									Vocabulary) VALUES						
('CLASS_SAPPER',				    'ABILITY_CLASS');

INSERT OR REPLACE INTO TypeTags
(Type,														Tag) VALUES	
('UNIT_MILITARY_ENGINEER',									'CLASS_SAPPER'),
('ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE',			    'CLASS_MELEE'),
('ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY',	    'CLASS_ANTI_CAVALRY');

INSERT OR REPLACE INTO UnitAbilities
(UnitAbilityType,										Inactive,	Description) VALUES	
('ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE',			1,			NULL),
('ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY',	1,			NULL);

INSERT OR REPLACE INTO UnitAbilityModifiers
(UnitAbilityType,										ModifierId) VALUES	
('ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE',			'ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE'),
('ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY',	'ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY');

INSERT OR REPLACE INTO TechnologyModifiers
(TechnologyType,		ModifierId) VALUES	
('TECH_MILITARY_ENGINEERING',	'GRANT_ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE'),
('TECH_MILITARY_ENGINEERING',	'GRANT_ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY');
		
INSERT OR REPLACE INTO Modifiers
(ModifierId,														ModifierType,																    SubjectRequirementSetId) VALUES	
('GRANT_ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE',			    'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',										    NULL),
('GRANT_ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY',	    'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',										    NULL),
('ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE',							    'GOLDEN_MODIFIER_OWNER_ADJUST_ENABLE_WALL_ATTACK_WHOLE_GAME_PROMOTION_CLASS',	'ADJACENT_TO_SAPPER_CLASS'),
('ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY',					    'GOLDEN_MODIFIER_OWNER_ADJUST_ENABLE_WALL_ATTACK_WHOLE_GAME_PROMOTION_CLASS',	'ADJACENT_TO_SAPPER_CLASS');

INSERT OR REPLACE INTO ModifierArguments
(ModifierId,														Name,				Value) VALUES	
('GRANT_ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE',			    'AbilityType',		'ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE'),
('GRANT_ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY',	    'AbilityType',		'ABILITY_ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY'),
('ENABLE_WALL_ATTACK_WHOLE_GAME_MELEE',							    'PromotionClass',	'PROMOTION_CLASS_MELEE'),
('ENABLE_WALL_ATTACK_WHOLE_GAME_ANTI_CAVALRY',					    'PromotionClass',	'PROMOTION_CLASS_ANTI_CAVALRY');

INSERT OR REPLACE INTO RequirementSets
(RequirementSetId,					RequirementSetType) VALUES	
('ADJACENT_TO_SAPPER_CLASS',	'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements
(RequirementSetId,					RequirementId) VALUES	
('ADJACENT_TO_SAPPER_CLASS',	'REQUIRES_ADJACENT_SAPPER');

INSERT OR REPLACE INTO Requirements
(RequirementId,						RequirementType) VALUES	
('REQUIRES_ADJACENT_SAPPER',	'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES');

INSERT OR REPLACE INTO RequirementArguments
(RequirementId,						Name,	Value) VALUES	
('REQUIRES_ADJACENT_SAPPER',	'Tag',	'CLASS_SAPPER');
