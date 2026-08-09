-----------------------------------------------
-- TraitModifiers
-----------------------------------------------
INSERT OR REPLACE INTO TraitModifiers 
(TraitType,					ModifierId) 
VALUES	
('TRAIT_LEADER_TOKUGAWA',	'GA_TOKUGAWA_POSITIVE_DOMESTIC_PRODUCTION_DISTRICTS');
-----------------------------------------------
-- Modifiers
-----------------------------------------------
INSERT OR REPLACE INTO Modifiers 
(ModifierId,											ModifierType) 
VALUES	
('GA_TOKUGAWA_POSITIVE_DOMESTIC_PRODUCTION_DISTRICTS',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_SPECIALTY_DISTRICT_FOR_DOMESTIC');
-----------------------------------------------
-- ModifierArguments
-----------------------------------------------
INSERT OR REPLACE INTO ModifierArguments 
(ModifierId,											Name,			Value) 
VALUES	
('GA_TOKUGAWA_POSITIVE_DOMESTIC_PRODUCTION_DISTRICTS',	'YieldType',	'YIELD_PRODUCTION'),
('GA_TOKUGAWA_POSITIVE_DOMESTIC_PRODUCTION_DISTRICTS',	'Amount',		1);

UPDATE ModifierArguments SET Value = 1
WHERE ModifierId = 'TOKUGAWA_POSITIVE_DOMESTIC_GOLD_DISTRICTS' AND Name = 'Amount';

