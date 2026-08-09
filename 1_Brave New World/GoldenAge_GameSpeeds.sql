-- Rescaled Timeline
-- Online
DELETE FROM GameSpeed_Turns WHERE GameSpeedType = 'GAMESPEED_ONLINE';
INSERT OR REPLACE INTO GameSpeed_Turns (GameSpeedType, 		MonthIncrement, TurnsPerIncrement)--GoldenAge
VALUES 						('GAMESPEED_ONLINE', 	1920, 			20),			
							('GAMESPEED_ONLINE', 	840, 			20),			
							('GAMESPEED_ONLINE', 	480, 			20),			
							('GAMESPEED_ONLINE', 	216, 			20),			
							('GAMESPEED_ONLINE', 	72, 			20),			
							('GAMESPEED_ONLINE', 	36, 			40),				
			                ('GAMESPEED_ONLINE', 	18, 			20),            	
							('GAMESPEED_ONLINE', 	12, 			20);

-- Quick
DELETE FROM GameSpeed_Turns WHERE GameSpeedType = 'GAMESPEED_QUICK';
INSERT OR REPLACE INTO GameSpeed_Turns (GameSpeedType, 		MonthIncrement, TurnsPerIncrement)
VALUES 						('GAMESPEED_QUICK', 	1440, 			27),			
							('GAMESPEED_QUICK', 	630, 			27),			
							('GAMESPEED_QUICK', 	360, 			27),			
							('GAMESPEED_QUICK', 	162, 			27),					
							('GAMESPEED_QUICK', 	54, 			27),			
							('GAMESPEED_QUICK', 	27, 			52),			
							('GAMESPEED_QUICK', 	13, 			26),			
							('GAMESPEED_QUICK', 	9, 				26);			
																																							
-- Standard
DELETE FROM GameSpeed_Turns WHERE GameSpeedType = 'GAMESPEED_STANDARD';
INSERT OR REPLACE INTO GameSpeed_Turns (GameSpeedType, 		MonthIncrement, TurnsPerIncrement)--GoldenAge
VALUES 						('GAMESPEED_STANDARD', 	960, 			40),			-- -4000~-800 (3200 years) 80 years/turn      
							('GAMESPEED_STANDARD', 	420, 			40),			-- -800~600  (1400 years)  35 years/turn      
							('GAMESPEED_STANDARD', 	240, 			40),			-- 600~1400  (800 years)   20 years/turn     
							('GAMESPEED_STANDARD', 	108, 			40),			-- 1400~1760 (360 years)   9 years/turn       
							('GAMESPEED_STANDARD', 	36, 			40),			-- 1760~1880 (120 years)   3 years/turn       
							('GAMESPEED_STANDARD', 	18, 			80),			-- 1880~1940 (60 years)    1.5 years/turn     
			                ('GAMESPEED_STANDARD', 	9, 				40),            -- 1940~2000 (60 years)    0.75 years/turn
																					-- 2000~2030 (30 years)	   0.5years/turn
							('GAMESPEED_STANDARD', 	6, 				40);			-- 2030~2050 (20 years)	   0.5years/turn 	      
							
-- Epic	
DELETE FROM GameSpeed_Turns WHERE GameSpeedType = 'GAMESPEED_EPIC';
INSERT OR REPLACE INTO GameSpeed_Turns (GameSpeedType, 		MonthIncrement, TurnsPerIncrement)--GoldenAge
VALUES 						('GAMESPEED_EPIC', 	640, 			60),			
							('GAMESPEED_EPIC', 	280, 			60),			
							('GAMESPEED_EPIC', 	160, 			60),			
							('GAMESPEED_EPIC', 	72, 			60),			
							('GAMESPEED_EPIC', 	24, 			60),			
							('GAMESPEED_EPIC', 	12, 			120),			
							('GAMESPEED_EPIC', 	6, 				60),			                                       
							('GAMESPEED_EPIC', 	4, 				60);			
-- Marathon
DELETE FROM GameSpeed_Turns WHERE GameSpeedType = 'GAMESPEED_MARATHON';
INSERT OR REPLACE INTO GameSpeed_Turns (GameSpeedType, 		MonthIncrement, TurnsPerIncrement)--GoldenAge
VALUES 						('GAMESPEED_MARATHON', 	320, 			120),			
							('GAMESPEED_MARATHON', 	140, 			120),			
							('GAMESPEED_MARATHON', 	80, 			120),			
							('GAMESPEED_MARATHON', 	36, 			120),			
							('GAMESPEED_MARATHON', 	12, 			120),			
							('GAMESPEED_MARATHON', 	6, 			    240),			
							('GAMESPEED_MARATHON', 	3, 			    120),                                            			
							('GAMESPEED_MARATHON', 	2, 			    120);			
							
-- StartEras
UPDATE StartEras SET Year = -4000 	WHERE EraType = 'ERA_ANCIENT';			-- default -4000
UPDATE StartEras SET Year = -800 	WHERE EraType = 'ERA_CLASSICAL';		-- default -1000
UPDATE StartEras SET Year = 600 	WHERE EraType = 'ERA_MEDIEVAL';			-- default 500
UPDATE StartEras SET Year = 1400 	WHERE EraType = 'ERA_RENAISSANCE';		-- default 1350
UPDATE StartEras SET Year = 1760 	WHERE EraType = 'ERA_INDUSTRIAL';		-- default 1725
UPDATE StartEras SET Year = 1880 	WHERE EraType = 'ERA_MODERN';			-- default 1890
UPDATE StartEras SET Year = 1940 	WHERE EraType = 'ERA_ATOMIC';			-- default 1945
UPDATE StartEras SET Year = 2000 	WHERE EraType = 'ERA_INFORMATION';		-- default 1995
UPDATE StartEras SET Year = 2030 	WHERE EraType = 'ERA_FUTURE';

-- Eras_XP1 v232 每个时代从固定40回合改为35~45回合波动
UPDATE Eras_XP1 SET GameEraMinimumTurns = 35, GameEraMaximumTurns = 45 	WHERE EraType = 'ERA_ANCIENT';			
UPDATE Eras_XP1 SET GameEraMinimumTurns = 35, GameEraMaximumTurns = 45 	WHERE EraType = 'ERA_CLASSICAL';		
UPDATE Eras_XP1 SET GameEraMinimumTurns = 35, GameEraMaximumTurns = 45 	WHERE EraType = 'ERA_MEDIEVAL';			
UPDATE Eras_XP1 SET GameEraMinimumTurns = 35, GameEraMaximumTurns = 45 	WHERE EraType = 'ERA_RENAISSANCE';		
UPDATE Eras_XP1 SET GameEraMinimumTurns = 35, GameEraMaximumTurns = 45 	WHERE EraType = 'ERA_INDUSTRIAL';		
UPDATE Eras_XP1 SET GameEraMinimumTurns = 35, GameEraMaximumTurns = 45 	WHERE EraType = 'ERA_MODERN';			
UPDATE Eras_XP1 SET GameEraMinimumTurns = 35, GameEraMaximumTurns = 45 	WHERE EraType = 'ERA_ATOMIC';			
UPDATE Eras_XP1 SET GameEraMinimumTurns = 35, GameEraMaximumTurns = 45 	WHERE EraType = 'ERA_INFORMATION';
UPDATE Eras_XP1 SET GameEraMaximumTurns = Null 	WHERE EraType = 'ERA_FUTURE';	