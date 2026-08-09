--无效？
-- UPDATE Parameters SET DefaultValue = 4
-- WHERE ParameterId = 'Realism';

--想默认关闭可以在这里设置
UPDATE Parameters SET DefaultValue = 1
WHERE ParameterId = 'GameMode_Apocalypse' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='GAMEMODE_APOCALYPSE');

UPDATE Parameters SET DefaultValue = 1
WHERE ParameterId = 'GameMode_SecretSocieties' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='GAMEMODE_SECRETSOCIETIES');

UPDATE Parameters SET DefaultValue = 1
WHERE ParameterId = 'GameMode_DramaticAges' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='GAMEMODE_DRAMATICAGES');

UPDATE Parameters SET DefaultValue = 1
WHERE ParameterId = 'GameMode_Heroes' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='GAMEMODE_HEROES');

UPDATE Parameters SET DefaultValue = 1
WHERE ParameterId = 'GameMode_Monopolies' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='GAMEMODE_MONOPOLIES');

UPDATE Parameters SET DefaultValue = 1
WHERE ParameterId = 'GameMode_BarbarianClans' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='GAMEMODE_BARBARIAN_CLANS');

--CSE
UPDATE Parameters SET GroupId = 'AdvancedOptions'
WHERE ParameterId = 'CSE_Favor_Suzerain' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='CSE_FAVOR_OPTION');
UPDATE Parameters SET GroupId = 'AdvancedOptions'
WHERE ParameterId = 'CSE_CityState_Walls' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='CSE_FAVOR_OPTION');
UPDATE Parameters SET GroupId = 'AdvancedOptions'
WHERE ParameterId = 'CSE_Favor_Consular' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='CSE_FAVOR_OPTION');
UPDATE Parameters SET GroupId = 'AdvancedOptions'
WHERE ParameterId = 'CSE_Ethiopia_Mode' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='CSE_FAVOR_OPTION');

DELETE FROM GameModeItems WHERE GameModeType='CSE_FAVOR_OPTION' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='CSE_FAVOR_OPTION');
DELETE FROM GameModeItems WHERE GameModeType='CSE_WALLS_OPTION' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='CSE_FAVOR_OPTION');
DELETE FROM GameModeItems WHERE GameModeType='CSE_CONSULAR_OPTION' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='CSE_FAVOR_OPTION');
DELETE FROM GameModeItems WHERE GameModeType='CSE_ETHIOPIA_OPTION' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='CSE_FAVOR_OPTION');

--Ocean
UPDATE Parameters SET DefaultValue = 1
WHERE ParameterId = 'GameMode_Suk_Oceans' AND EXISTS (SELECT * FROM GameModeItems WHERE GameModeType='GAMEMODE_SUK_OCEANS');
