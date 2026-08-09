--跨时代科研与文化花费（20）
UPDATE	GlobalParameters SET Value = 66 WHERE Name = 'TECH_COST_PERCENT_CHANGE_AFTER_GAME_ERA';
UPDATE	GlobalParameters SET Value = -33 WHERE Name = 'TECH_COST_PERCENT_CHANGE_BEFORE_GAME_ERA';
UPDATE	GlobalParameters SET Value = 66 WHERE Name = 'CIVIC_COST_PERCENT_CHANGE_AFTER_GAME_ERA';
UPDATE	GlobalParameters SET Value = -33 WHERE Name = 'CIVIC_COST_PERCENT_CHANGE_BEFORE_GAME_ERA';

--尤里卡与鼓舞
UPDATE Boosts SET Boost=30;

--增加科技与市政所需的科研和文化
UPDATE Technologies SET Cost = Cost*1.2 WHERE EraType = 'ERA_ANCIENT';
UPDATE Technologies SET Cost = Cost*1.6 WHERE EraType = 'ERA_CLASSICAL';
UPDATE Technologies SET Cost = Cost*2.6 WHERE EraType = 'ERA_MEDIEVAL';
UPDATE Technologies SET Cost = Cost*3.6 WHERE EraType = 'ERA_RENAISSANCE';
UPDATE Technologies SET Cost = Cost*4.6 WHERE EraType = 'ERA_INDUSTRIAL';
UPDATE Technologies SET Cost = Cost*5.6 WHERE EraType = 'ERA_MODERN';
UPDATE Technologies SET Cost = Cost*6.6 WHERE EraType = 'ERA_ATOMIC';
UPDATE Technologies SET Cost = Cost*7.6 WHERE EraType = 'ERA_INFORMATION';
UPDATE Technologies SET Cost = Cost*8.6 WHERE EraType = 'ERA_FUTURE';

UPDATE Civics SET Cost = Cost*1.1 WHERE EraType = 'ERA_ANCIENT';
UPDATE Civics SET Cost = Cost*1.3 WHERE EraType = 'ERA_CLASSICAL';
UPDATE Civics SET Cost = Cost*1.7 WHERE EraType = 'ERA_MEDIEVAL';
UPDATE Civics SET Cost = Cost*2.3 WHERE EraType = 'ERA_RENAISSANCE';
UPDATE Civics SET Cost = Cost*3.1 WHERE EraType = 'ERA_INDUSTRIAL';
UPDATE Civics SET Cost = Cost*4.1 WHERE EraType = 'ERA_MODERN';
UPDATE Civics SET Cost = Cost*5.3 WHERE EraType = 'ERA_ATOMIC';
UPDATE Civics SET Cost = Cost*6.7 WHERE EraType = 'ERA_INFORMATION';
UPDATE Civics SET Cost = Cost*8.3 WHERE EraType = 'ERA_FUTURE';

--TreeRandomizer mode						
CREATE TABLE IF NOT EXISTS TechnologyRandomCosts (Cost INT, TechnologyType TEXT); 
UPDATE TechnologyRandomCosts SET Cost = Cost*1.2 WHERE TechnologyType IN (SELECT TechnologyType FROM Technologies WHERE EraType = 'ERA_ANCIENT');
UPDATE TechnologyRandomCosts SET Cost = Cost*1.6 WHERE TechnologyType IN (SELECT TechnologyType FROM Technologies WHERE EraType = 'ERA_CLASSICAL');
UPDATE TechnologyRandomCosts SET Cost = Cost*2.6 WHERE TechnologyType IN (SELECT TechnologyType FROM Technologies WHERE EraType = 'ERA_MEDIEVAL');
UPDATE TechnologyRandomCosts SET Cost = Cost*3.6 WHERE TechnologyType IN (SELECT TechnologyType FROM Technologies WHERE EraType = 'ERA_RENAISSANCE');
UPDATE TechnologyRandomCosts SET Cost = Cost*4.6 WHERE TechnologyType IN (SELECT TechnologyType FROM Technologies WHERE EraType = 'ERA_INDUSTRIAL');
UPDATE TechnologyRandomCosts SET Cost = Cost*5.6 WHERE TechnologyType IN (SELECT TechnologyType FROM Technologies WHERE EraType = 'ERA_MODERN');
UPDATE TechnologyRandomCosts SET Cost = Cost*6.6 WHERE TechnologyType IN (SELECT TechnologyType FROM Technologies WHERE EraType = 'ERA_ATOMIC');
UPDATE TechnologyRandomCosts SET Cost = Cost*7.6 WHERE TechnologyType IN (SELECT TechnologyType FROM Technologies WHERE EraType = 'ERA_INFORMATION');
UPDATE TechnologyRandomCosts SET Cost = Cost*8.6 WHERE TechnologyType IN (SELECT TechnologyType FROM Technologies WHERE EraType = 'ERA_FUTURE');

CREATE TABLE IF NOT EXISTS CivicRandomCosts (Cost INT, CivicType TEXT); 							
UPDATE CivicRandomCosts SET Cost = Cost*1.1 WHERE CivicType IN (SELECT CivicType FROM Civics WHERE EraType = 'ERA_ANCIENT');
UPDATE CivicRandomCosts SET Cost = Cost*1.3 WHERE CivicType IN (SELECT CivicType FROM Civics WHERE EraType = 'ERA_CLASSICAL');
UPDATE CivicRandomCosts SET Cost = Cost*1.7 WHERE CivicType IN (SELECT CivicType FROM Civics WHERE EraType = 'ERA_MEDIEVAL');
UPDATE CivicRandomCosts SET Cost = Cost*2.3 WHERE CivicType IN (SELECT CivicType FROM Civics WHERE EraType = 'ERA_RENAISSANCE');
UPDATE CivicRandomCosts SET Cost = Cost*3.1 WHERE CivicType IN (SELECT CivicType FROM Civics WHERE EraType = 'ERA_INDUSTRIAL');
UPDATE CivicRandomCosts SET Cost = Cost*4.1 WHERE CivicType IN (SELECT CivicType FROM Civics WHERE EraType = 'ERA_MODERN');
UPDATE CivicRandomCosts SET Cost = Cost*5.3 WHERE CivicType IN (SELECT CivicType FROM Civics WHERE EraType = 'ERA_ATOMIC');
UPDATE CivicRandomCosts SET Cost = Cost*6.7 WHERE CivicType IN (SELECT CivicType FROM Civics WHERE EraType = 'ERA_INFORMATION');
UPDATE CivicRandomCosts SET Cost = Cost*8.3 WHERE CivicType IN (SELECT CivicType FROM Civics WHERE EraType = 'ERA_FUTURE');