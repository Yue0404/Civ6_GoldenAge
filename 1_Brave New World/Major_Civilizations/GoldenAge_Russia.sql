-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers (TraitType, 			ModifierID) VALUES	
('TRAIT_CIVILIZATION_MOTHER_RUSSIA',	'TUNDRA_RESOURCE_EXTRACTION'),
('TRAIT_CIVILIZATION_MOTHER_RUSSIA',	'TUNDRA_HILLS_RESOURCE_EXTRACTION'),
('TRAIT_CIVILIZATION_MOTHER_RUSSIA',	'SNOW_RESOURCE_EXTRACTION'),
('TRAIT_CIVILIZATION_MOTHER_RUSSIA',	'SNOW_HILLS_RESOURCE_EXTRACTION'),
('TRAIT_LEADER_GRAND_EMBASSY',	        'GOLDEN_TRAIT_STEALTECHTIME'),
('TRAIT_LEADER_GRAND_EMBASSY',	        'GOLDEN_TRAIT_HEISTTIME'),
('TRAIT_LEADER_GRAND_EMBASSY',	        'GOLDEN_TRAIT_EXTRABOOSTS');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers (ModifierId,			ModifierType,								                                    SubjectRequirementSetId) VALUES	
('GOLDEN_TRAIT_STEALTECHTIME',			    'MODIFIER_PLAYER_UNITS_ADJUST_SPY_OPERATION_TIME',		                        'UNIT_IS_SPY'),
('GOLDEN_TRAIT_HEISTTIME',					'MODIFIER_PLAYER_UNITS_ADJUST_SPY_OPERATION_TIME',		                        'UNIT_IS_SPY'),
('GOLDEN_TRAIT_EXTRABOOSTS',				'MODIFIER_PLAYER_ADJUST_STEAL_TECH_BOOSTS',		                                NULL);
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments (ModifierId,			Name,		        Value) VALUES
('GOLDEN_TRAIT_STEALTECHTIME',					'OperationType',	    'UNITOPERATION_SPY_STEAL_TECH_BOOST'),
('GOLDEN_TRAIT_STEALTECHTIME',					'ReductionPercent',	    50),
('GOLDEN_TRAIT_HEISTTIME',					    'OperationType',	    'UNITOPERATION_SPY_GREAT_WORK_HEIST'),
('GOLDEN_TRAIT_HEISTTIME',					    'ReductionPercent',	    50),
('GOLDEN_TRAIT_EXTRABOOSTS',					'Amount',	            1);

UPDATE ModifierArguments SET  Value = 8
WHERE ModifierId = 'TRAIT_INCREASED_TILES' AND Name = 'Amount';
UPDATE ModifierArguments SET  Value = 1
WHERE ModifierId = 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS' AND Name = 'TechCivicsPerYield';