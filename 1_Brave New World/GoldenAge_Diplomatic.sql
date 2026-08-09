--v225 间谍
UPDATE UnitOperations SET BaseProbability = 15 WHERE OperationType = 'UNITOPERATION_SPY_RECRUIT_PARTISANS';
UPDATE UnitOperations SET BaseProbability = 13 WHERE OperationType = 'UNITOPERATION_SPY_STEAL_TECH_BOOST';
UPDATE UnitOperations SET BaseProbability = 14 WHERE OperationType = 'UNITOPERATION_SPY_DISRUPT_ROCKETRY';

--v229 删除送外交胜利点数的科技和市政
DELETE FROM TechnologyModifiers WHERE TechnologyType = 'TECH_SEASTEADS' AND ModifierId = 'TECH_SEASTEADS_DIPLOVP';
DELETE FROM CivicModifiers WHERE CivicType = 'CIVIC_GLOBAL_WARMING_MITIGATION' AND ModifierId = 'CIVIC_MITIGATION_GRANT_DIPLOVP';

--v232 平衡各个时代解放城邦后奖励使者数量
UPDATE Eras_XP1 SET LiberatedEnvoys = 2 	WHERE EraType = 'ERA_ANCIENT';			
UPDATE Eras_XP1 SET LiberatedEnvoys = 4 	WHERE EraType = 'ERA_CLASSICAL';		
UPDATE Eras_XP1 SET LiberatedEnvoys = 6 	WHERE EraType = 'ERA_MEDIEVAL';			
UPDATE Eras_XP1 SET LiberatedEnvoys = 8 	WHERE EraType = 'ERA_RENAISSANCE';		
UPDATE Eras_XP1 SET LiberatedEnvoys = 10 	WHERE EraType = 'ERA_INDUSTRIAL';		
UPDATE Eras_XP1 SET LiberatedEnvoys = 12 	WHERE EraType = 'ERA_MODERN';			
UPDATE Eras_XP1 SET LiberatedEnvoys = 14 	WHERE EraType = 'ERA_ATOMIC';			
UPDATE Eras_XP1 SET LiberatedEnvoys = 16 	WHERE EraType = 'ERA_INFORMATION';
UPDATE Eras_XP1 SET LiberatedEnvoys = 18 	WHERE EraType = 'ERA_FUTURE';	

--v236
UPDATE GlobalParameters SET Value = 40 WHERE Name = 'DIPLOMACY_DECLARED_FRIENDSHIP_TIME_LIMIT';
UPDATE GlobalParameters SET Value = 40 WHERE Name = 'DIPLOMACY_ALLIANCE_TIME_LIMIT';
UPDATE GlobalParameters SET Value = 40 WHERE Name = 'DIPLOMACY_DENOUNCE_TIME_LIMIT';

UPDATE DiplomaticActions SET InitiatorPrereqCivic = 'CIVIC_FEUDALISM'		WHERE DiplomaticActionType = 'DIPLOACTION_DECLARE_WAR_OF_RETRIBUTION';
UPDATE DiplomaticActions SET InitiatorPrereqCivic = 'CIVIC_COLONIALISM'		WHERE DiplomaticActionType = 'DIPLOACTION_DECLARE_COLONIAL_WAR';
UPDATE DiplomaticActions SET InitiatorPrereqCivic = 'CIVIC_SCORCHED_EARTH'	WHERE DiplomaticActionType = 'DIPLOACTION_DECLARE_TERRITORIAL_WAR';
UPDATE DiplomaticActions SET InitiatorPrereqCivic = 'CIVIC_REFORMED_CHURCH'	WHERE DiplomaticActionType = 'DIPLOACTION_DECLARE_HOLY_WAR';

--XML to SQL
--请求援助项目回合数
UPDATE EmergencyAlliances
SET Duration = 10, LockoutTime = 50
WHERE EmergencyType = 'EMERGENCY_SEND_AID';

--第三方文明因不满产出的不满
UPDATE ModifierArguments
SET Value = 4
WHERE Name = 'PercentOfGrievancesDelta' AND ModifierId = 'STANDARD_DIPLOMATIC_THIRD_PARTY_WARMONGER';

--城邦开局城墙
UPDATE StartingBuildings
SET MinDifficulty = 'DIFFICULTY_SETTLER'
WHERE Era = 'ERA_ANCIENT'
  AND MinorOnly = 1
  AND MinDifficulty = 'DIFFICULTY_IMMORTAL'
  AND Building = 'BUILDING_WALLS'
  AND District = 'DISTRICT_CITY_CENTER';

-- 世界议会外交胜利点数要求
REPLACE INTO GlobalParameters (Name, Value) VALUES ('DIPLOMATIC_VICTORY_POINTS_REQUIRED', 25);

-- 紧急事件/请求援助外交支持费用
REPLACE INTO GlobalParameters (Name, Value) VALUES ('FAVOR_COST_FOR_EMERGENCY', 40);
REPLACE INTO GlobalParameters (Name, Value) VALUES ('FAVOR_COST_FOR_REQUEST', 40);

-- 外交支持奖励
REPLACE INTO GlobalParameters (Name, Value) VALUES ('FAVOR_FOR_LIBERATE_CITY_STATE', 250);
REPLACE INTO GlobalParameters (Name, Value) VALUES ('FAVOR_FOR_LIBERATE_PLAYER_CITY', 250);
REPLACE INTO GlobalParameters (Name, Value) VALUES ('FAVOR_FOR_REVIVE_PLAYER', 1000);

-- AI 主动交易冷却
REPLACE INTO GlobalParameters (Name, Value) VALUES ('AI_TURNS_BETWEEN_TRADES', 20);
REPLACE INTO GlobalParameters (Name, Value) VALUES ('AI_TURNS_BETWEEN_PEACE_OFFERS', 5);
REPLACE INTO GlobalParameters (Name, Value) VALUES ('AI_TURNS_BETWEEN_FRIENDSHIP_OFFERS', 10);

-- 宗主国外交支持
REPLACE INTO GlobalParameters (Name, Value) VALUES ('WORLD_CONGRESS_SUZERAIN_FAVOR_PER_TURN', 1);

-- 城邦和自由城市忠诚度
REPLACE INTO GlobalParameters (Name, Value) VALUES ('IDENTITY_PER_TURN_FROM_CITY_STATES', 50);
REPLACE INTO GlobalParameters (Name, Value) VALUES ('IDENTITY_PER_TURN_FROM_FREE_CITIES', 10);

-- 宣战前谴责冷却
REPLACE INTO GlobalParameters (Name, Value) VALUES ('DIPLOMACY_DENOUNCE_WAR_DELAY', 3);

-- 城邦征兵费用
REPLACE INTO GlobalParameters (Name, Value) VALUES ('LEVY_MILITARY_PERCENT_OF_UNIT_PURCHASE_COST', 50);

-- 同盟升级经验值
REPLACE INTO GlobalParameters (Name, Value) VALUES ('ALLIANCE_LEVEL_TWO_XP', 240);
REPLACE INTO GlobalParameters (Name, Value) VALUES ('ALLIANCE_LEVEL_THREE_XP', 800);

-- 工业时代开始外交胜利议程
UPDATE Resolutions SET EarliestEra = 'ERA_INDUSTRIAL' WHERE ResolutionType = 'WC_RES_DIPLOVICTORY';

-- 间谍
UPDATE UnitOperations SET BaseProbability = 13 WHERE OperationType = 'UNITOPERATION_SPY_BREACH_DAM';
UPDATE UnitOperations SET BaseProbability = 16 WHERE OperationType = 'UNITOPERATION_SPY_SIPHON_FUNDS';
UPDATE UnitOperations SET BaseProbability = 16 WHERE OperationType = 'UNITOPERATION_SPY_FABRICATE_SCANDAL';