--删除雪地地形的野蛮人营地和部落村庄
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' AND TerrainType = 'TERRAIN_SNOW';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' AND TerrainType = 'TERRAIN_SNOW_HILLS';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_GOODY_HUT' AND TerrainType = 'TERRAIN_SNOW';
DELETE FROM Improvement_ValidTerrains WHERE ImprovementType = 'IMPROVEMENT_GOODY_HUT' AND TerrainType = 'TERRAIN_SNOW_HILLS';

--双倍自然奇观/地图大陆数量
UPDATE Maps SET NumNaturalWonders = 4, Continents = 3 WHERE MapSizeType = 'MAPSIZE_DUEL';
UPDATE Maps SET NumNaturalWonders = 6, Continents = 4 WHERE MapSizeType = 'MAPSIZE_TINY';
UPDATE Maps SET NumNaturalWonders = 8, Continents = 5 WHERE MapSizeType = 'MAPSIZE_SMALL';
UPDATE Maps SET NumNaturalWonders = 10, Continents = 6 WHERE MapSizeType = 'MAPSIZE_STANDARD';
UPDATE Maps SET NumNaturalWonders = 12, Continents = 7 WHERE MapSizeType = 'MAPSIZE_LARGE';
UPDATE Maps SET NumNaturalWonders = 14, Continents = 8 WHERE MapSizeType = 'MAPSIZE_HUGE';

--海平面上升所需碳排放
UPDATE Maps_XP2 SET CO2For1DegreeTempRise = CO2For1DegreeTempRise*10;

--v237 更多玩家
UPDATE Maps SET DefaultPlayers=3 WHERE MapSizeType = 'MAPSIZE_DUEL';
UPDATE Maps SET DefaultPlayers=5 WHERE MapSizeType = 'MAPSIZE_TINY';
UPDATE Maps SET DefaultPlayers=8 WHERE MapSizeType = 'MAPSIZE_SMALL';
UPDATE Maps SET DefaultPlayers=10 WHERE MapSizeType = 'MAPSIZE_STANDARD';
UPDATE Maps SET DefaultPlayers=12 WHERE MapSizeType = 'MAPSIZE_LARGE';
UPDATE Maps SET DefaultPlayers=15 WHERE MapSizeType = 'MAPSIZE_HUGE';
