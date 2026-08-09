--区域相邻加成
-- DELETE FROM District_Adjacencies WHERE YieldChangeId = 'ADJ_TM_NW_FAITH' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
-- DELETE FROM District_Adjacencies WHERE YieldChangeId = 'ADJ_TM_NW_SCIENCE' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
-- DELETE FROM District_Adjacencies WHERE YieldChangeId = 'ADJ_TM_NW_CULTURE' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
-- DELETE FROM District_Adjacencies WHERE YieldChangeId = 'ADJ_TM_NW_PRODUCTION' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
-- DELETE FROM District_Adjacencies WHERE YieldChangeId = 'ADJ_TM_NW_GOLD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
-- DELETE FROM District_Adjacencies WHERE YieldChangeId = 'ADJ_TM_NW_FOOD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
INSERT OR REPLACE INTO District_Adjacencies 
(DistrictType,				        YieldChangeId) SELECT	
'DISTRICT_HOLY_SITE',	            'NaturalWonder_Faith'  WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Adjacency_YieldChanges SET YieldChange = 1
WHERE ID = 'NaturalWonder_Faith' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_BARRINGER_CRATER
--<!--BARRINGER_CRATER巴林杰陨石坑3科技，2金币（+1科技+2金币）-->
UPDATE Feature_YieldChanges SET YieldChange = 4
WHERE FeatureType = 'FEATURE_BARRINGER_CRATER' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 4
WHERE FeatureType = 'FEATURE_BARRINGER_CRATER' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_BIOLUMINESCENT_BAY
--<!--BIOLUMINESCENT_BAY生物荧光海湾3科技，1金币，1食物（+1金币+2食物）-->
UPDATE Feature_YieldChanges SET YieldChange = 2
WHERE FeatureType = 'FEATURE_BIOLUMINESCENT_BAY' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 3
WHERE FeatureType = 'FEATURE_BIOLUMINESCENT_BAY' AND YieldType = 'YIELD_FOOD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_DALLOL
--<!--DALLOL达罗尔2科技，1金币，2生产力（+1科技+1金币+1生产力）-->
UPDATE Feature_YieldChanges SET YieldChange = 2
WHERE FeatureType = 'FEATURE_DALLOL' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 3
WHERE FeatureType = 'FEATURE_DALLOL' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 3
WHERE FeatureType = 'FEATURE_DALLOL' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_LAKE_VICTORIA
--<!--LAKE_VICTORIA维多利亚湖3食物，1金币，1文化（+2金币+1文化）-->
UPDATE Feature_YieldChanges SET YieldChange = 3
WHERE FeatureType = 'FEATURE_LAKE_VICTORIA' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 2
WHERE FeatureType = 'FEATURE_LAKE_VICTORIA' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_LENCOIS_MARANHENSES
--<!--LENCOIS_MARANHENSES千湖沙漠2食物，3文化（+3科技）-->
INSERT OR REPLACE INTO Feature_YieldChanges (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_LENCOIS_MARANHENSES',	    'YIELD_SCIENCE',	3           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 2
WHERE FeatureType = 'FEATURE_LENCOIS_MARANHENSES' AND YieldType = 'YIELD_FOOD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_OLD_FAITHFUL
--<!--OLD_FAITHFUL老忠实泉3科技，1金币，1信仰（+2信仰、+1金币）-->
UPDATE Feature_YieldChanges SET YieldChange = 2
WHERE FeatureType = 'FEATURE_OLD_FAITHFUL' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 3
WHERE FeatureType = 'FEATURE_OLD_FAITHFUL' AND YieldType = 'YIELD_FAITH' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_NAMIB
--<!--NAMIB纳米布沙漠3文化，2金币（+3信仰）-->
INSERT OR REPLACE INTO Feature_YieldChanges 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_NAMIB',	    'YIELD_FAITH',	3           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_OUNIANGA
--<!--OUNIANGA乌尼昂加湖泊群2文化，1金币,2食物（+1食物、+2金币）-->
UPDATE Feature_YieldChanges SET YieldChange = 3
WHERE FeatureType = 'FEATURE_OUNIANGA' AND YieldType = 'YIELD_FOOD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 3
WHERE FeatureType = 'FEATURE_OUNIANGA' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_SALAR_DE_UYUNI
--<!--OUNIANGA乌尤尼盐沼2科技，1生产力,2金币（+1科技+2生产力）-->
UPDATE Feature_YieldChanges SET YieldChange = 3
WHERE FeatureType = 'FEATURE_SALAR_DE_UYUNI' AND YieldType = 'YIELD_SCIENCE' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 3
WHERE FeatureType = 'FEATURE_SALAR_DE_UYUNI' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_VREDEFORT_DOME
--<!--VREDEFORT_DOME弗里德堡陨石坑2科技，1文化,2食物（+3科技+3金币-1文化-2食物）-->
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_VREDEFORT_DOME' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_VREDEFORT_DOME');
INSERT OR REPLACE INTO Feature_YieldChanges 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_VREDEFORT_DOME',	    'YIELD_GOLD',	3           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
INSERT OR REPLACE INTO Feature_YieldChanges 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_VREDEFORT_DOME',	    'YIELD_SCIENCE',	5           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');


-------------------------------------------------
--FEATURE_CERRO_DE_POTOSI
--<!--CERRO_DE_POTOSI富饶山1生产力，1金币（1金币）-->
UPDATE Feature_AdjacentYields SET YieldChange = 2
WHERE FeatureType = 'FEATURE_CERRO_DE_POTOSI' AND YieldType = 'YIELD_GOLD' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_GIBRALTAR
--<!--DALLOL直布罗陀巨岩1食物，1金币（1文化）-->
INSERT OR REPLACE INTO Feature_AdjacentYields 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_GIBRALTAR',	    'YIELD_CULTURE',	1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_GRAND_MESA
--<!--GRAND_MESA大平顶山1食物，1文化（1科技）-->
INSERT OR REPLACE INTO Feature_AdjacentYields 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_GRAND_MESA',	    'YIELD_SCIENCE',	1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_KAILASH
--<!--KAILASH冈底斯山1信仰，1文化（1生产力）-->
INSERT OR REPLACE INTO Feature_AdjacentYields 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_KAILASH',	    'YIELD_PRODUCTION',	1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_KRAKATOA
--<!--KRAKATOA喀拉喀托火山1科技，（1文化）-->
INSERT OR REPLACE INTO Feature_AdjacentYields 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_KRAKATOA',	    'YIELD_CULTURE',	1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_MOSI_OA_TUNYA
--<!--MOSI_OA_TUNYA维多利亚瀑布2食物（1金币）-->
INSERT OR REPLACE INTO Feature_AdjacentYields 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_MOSI_OA_TUNYA',	    'YIELD_GOLD',	1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_MOTLATSE_CANYON
--<!--MOTLATSE_CANYON布莱德河峡谷瀑布1科技1文化（1信仰）-->
INSERT OR REPLACE INTO Feature_AdjacentYields 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_MOTLATSE_CANYON',	    'YIELD_FAITH',	1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_SINAI
--<!--SINAI西奈山2信仰（1信仰）-->
UPDATE Feature_AdjacentYields SET YieldChange = 3
WHERE FeatureType = 'FEATURE_SINAI' AND YieldType = 'YIELD_FAITH' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--FEATURE_SRI_PADA
--<!--SRI_PADA圣足山1食物，1信仰（1信仰）-->
UPDATE Feature_AdjacentYields SET YieldChange = 2
WHERE FeatureType = 'FEATURE_SRI_PADA' AND YieldType = 'YIELD_FAITH' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');


--FEATURE_WULINGYUAN--DLC
--<!--WULINGYUAN武陵源2文化（1科技）-->
INSERT OR REPLACE INTO Feature_AdjacentYields 
        (FeatureType,				    YieldType,			YieldChange)
SELECT	'FEATURE_WULINGYUAN',	    'YIELD_SCIENCE',	1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER') AND EXISTS (SELECT UnitType FROM Units WHERE UnitType = 'UNIT_INDONESIAN_JONG');
