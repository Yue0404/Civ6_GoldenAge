-- GA1_Fix_Config
-- Author: Flactine
-- DateCreated: 8/31/2022 9:33:44 AM
--------------------------------------------------------------
-------
--允许地图只有一个玩家
-------
UPDATE MapSizes
SET MinPlayers = 0
WHERE MinPlayers != 0;