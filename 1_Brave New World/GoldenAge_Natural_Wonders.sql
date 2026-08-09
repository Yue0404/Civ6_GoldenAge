--棉花堡、大堡礁、撒哈拉之眼
DELETE FROM District_Adjacencies WHERE YieldChangeId = 'GBR_Science';

DELETE FROM District_Adjacencies WHERE YieldChangeId = 'Pamukkale_Culture';
DELETE FROM District_Adjacencies WHERE YieldChangeId = 'Pamukkale_Gold';
DELETE FROM District_Adjacencies WHERE YieldChangeId = 'Pamukkale_Faith';
DELETE FROM District_Adjacencies WHERE YieldChangeId = 'Pamukkale_Science';

DELETE FROM GameModifiers WHERE ModifierId='PAMUKKALE_AMENITY';
DELETE FROM GameModifiers WHERE ModifierId='PAMUKKALE_AMENITY_ENTERTAINMENT_COMPLEX';

DELETE FROM GameModifiers WHERE ModifierId='EYESAHARA_PRODUCTION_ATOMIC';
DELETE FROM GameModifiers WHERE ModifierId='EYESAHARA_SCIENCE_ATOMIC';


--魅力
UPDATE Features SET Appeal = 2
WHERE Appeal = 4;

--自身产出
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_BARRIER_REEF';
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_CLIFFS_DOVER';
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_CRATER_LAKE';
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_DEAD_SEA';
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_PANTANAL';
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_EYE_OF_THE_SAHARA';

DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_LAKE_RETBA';
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_UBSUNUR_HOLLOW';
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_CHOCOLATEHILLS';
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_GOBUSTAN';
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_WHITEDESERT';

INSERT OR REPLACE INTO Feature_YieldChanges 
(FeatureType,				    YieldType,			YieldChange) VALUES
('FEATURE_BARRIER_REEF',        'YIELD_FOOD',       4),
('FEATURE_BARRIER_REEF',        'YIELD_SCIENCE',    4),

('FEATURE_CLIFFS_DOVER',        'YIELD_FOOD',       2),
('FEATURE_CLIFFS_DOVER',        'YIELD_GOLD',       3),
('FEATURE_CLIFFS_DOVER',        'YIELD_CULTURE',    3),

('FEATURE_CRATER_LAKE',         'YIELD_FAITH',      4),
('FEATURE_CRATER_LAKE',         'YIELD_SCIENCE',    4),

('FEATURE_DEAD_SEA',            'YIELD_FAITH',      3),
('FEATURE_DEAD_SEA',            'YIELD_CULTURE',    3),

('FEATURE_PANTANAL',            'YIELD_FOOD',       3),
('FEATURE_PANTANAL',            'YIELD_CULTURE',    3),
('FEATURE_PANTANAL',            'YIELD_FAITH',      2),

('FEATURE_EYE_OF_THE_SAHARA',   'YIELD_PRODUCTION', 4),
('FEATURE_EYE_OF_THE_SAHARA',   'YIELD_SCIENCE',    4),

('FEATURE_LAKE_RETBA',          'YIELD_GOLD',       4),
('FEATURE_LAKE_RETBA',          'YIELD_CULTURE',    4),

('FEATURE_UBSUNUR_HOLLOW',      'YIELD_FAITH',      4),
('FEATURE_UBSUNUR_HOLLOW',      'YIELD_FOOD',       4),

('FEATURE_CHOCOLATEHILLS',      'YIELD_FOOD',       3),
('FEATURE_CHOCOLATEHILLS',      'YIELD_PRODUCTION', 3),
('FEATURE_CHOCOLATEHILLS',      'YIELD_CULTURE',    2),

('FEATURE_GOBUSTAN',            'YIELD_SCIENCE',    3),
('FEATURE_GOBUSTAN',            'YIELD_CULTURE',    3),
('FEATURE_GOBUSTAN',            'YIELD_PRODUCTION', 2),

('FEATURE_WHITEDESERT',         'YIELD_GOLD',       4),
('FEATURE_WHITEDESERT',         'YIELD_CULTURE',    2),
('FEATURE_WHITEDESERT',         'YIELD_SCIENCE',    2);

UPDATE Feature_YieldChanges SET YieldChange = 4
WHERE FeatureType = 'FEATURE_DEAD_SEA' AND YieldType = 'YIELD_FAITH' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_YieldChanges SET YieldChange = 4
WHERE FeatureType = 'FEATURE_DEAD_SEA' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--DLC
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_FOUNTAIN_OF_YOUTH' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_FOUNTAIN_OF_YOUTH');
DELETE FROM Feature_YieldChanges WHERE FeatureType='FEATURE_HA_LONG_BAY' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_HA_LONG_BAY');

INSERT OR REPLACE INTO Feature_YieldChanges 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_FOUNTAIN_OF_YOUTH',	'YIELD_FOOD',	    3           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_FOUNTAIN_OF_YOUTH');
INSERT OR REPLACE INTO Feature_YieldChanges 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_FOUNTAIN_OF_YOUTH',	'YIELD_FAITH',	    3           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_FOUNTAIN_OF_YOUTH');
INSERT OR REPLACE INTO Feature_YieldChanges 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_FOUNTAIN_OF_YOUTH',	'YIELD_SCIENCE',	2           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_FOUNTAIN_OF_YOUTH') AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

INSERT OR REPLACE INTO Feature_YieldChanges 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_HA_LONG_BAY',	'YIELD_FOOD',	    3           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_HA_LONG_BAY');
INSERT OR REPLACE INTO Feature_YieldChanges 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_HA_LONG_BAY',	'YIELD_PRODUCTION',	3           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_HA_LONG_BAY');
INSERT OR REPLACE INTO Feature_YieldChanges 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_HA_LONG_BAY',	'YIELD_CULTURE',	2           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_HA_LONG_BAY') AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

--相邻产出
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_EVEREST';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_GALAPAGOS';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_PIOPIOTAHI';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_TSINGY';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_DELICATE_ARCH';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_MATTERHORN';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_RORAIMA';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_ZHANGYE_DANXIA';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_IKKIL';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_DEVILSTOWER';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_PAMUKKALE';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_VESUVIUS';
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_KILIMANJARO';

INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				 YieldType,			    YieldChange) VALUES
('FEATURE_EVEREST',          'YIELD_FAITH',         2),

('FEATURE_GALAPAGOS',        'YIELD_SCIENCE',       2),
('FEATURE_GALAPAGOS',        'YIELD_FOOD',          1),

('FEATURE_PIOPIOTAHI',       'YIELD_CULTURE',       2),
('FEATURE_PIOPIOTAHI',       'YIELD_GOLD',          1),

('FEATURE_TSINGY',           'YIELD_CULTURE',       1),
('FEATURE_TSINGY',           'YIELD_SCIENCE',       1),
('FEATURE_TSINGY',           'YIELD_GOLD',          1),

('FEATURE_DELICATE_ARCH',    'YIELD_CULTURE',       1),
('FEATURE_DELICATE_ARCH',    'YIELD_FAITH',         1),
('FEATURE_DELICATE_ARCH',    'YIELD_GOLD',          1),

('FEATURE_MATTERHORN',       'YIELD_FAITH',         1),
('FEATURE_MATTERHORN',       'YIELD_PRODUCTION',    1),

('FEATURE_RORAIMA',          'YIELD_FAITH',         1),
('FEATURE_RORAIMA',          'YIELD_SCIENCE',       2),

('FEATURE_ZHANGYE_DANXIA',   'YIELD_CULTURE',       1),
('FEATURE_ZHANGYE_DANXIA',   'YIELD_SCIENCE',       1),

('FEATURE_IKKIL',            'YIELD_PRODUCTION',    1),
('FEATURE_IKKIL',            'YIELD_FOOD',          1),

('FEATURE_DEVILSTOWER',      'YIELD_PRODUCTION',    1),
('FEATURE_DEVILSTOWER',      'YIELD_FAITH',         2),

('FEATURE_PAMUKKALE',        'YIELD_CULTURE',       3),

('FEATURE_VESUVIUS',         'YIELD_PRODUCTION',    2),

('FEATURE_KILIMANJARO',      'YIELD_FOOD',          2);

UPDATE Feature_AdjacentYields SET YieldChange = 3
WHERE FeatureType = 'FEATURE_EVEREST' AND YieldType = 'YIELD_FAITH' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');

UPDATE Feature_AdjacentYields SET YieldChange = 2
WHERE FeatureType = 'FEATURE_MATTERHORN' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_AdjacentYields SET YieldChange = 2
WHERE FeatureType = 'FEATURE_ZHANGYE_DANXIA' AND YieldType = 'YIELD_CULTURE' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
UPDATE Feature_AdjacentYields SET YieldChange = 2
WHERE FeatureType = 'FEATURE_IKKIL' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER');
--DLC
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_PAITITI' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_PAITITI');
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_GIANTS_CAUSEWAY' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_GIANTS_CAUSEWAY');
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_LYSEFJORDEN' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_LYSEFJORDEN');
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_EYJAFJALLAJOKULL' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_EYJAFJALLAJOKULL');
DELETE FROM Feature_AdjacentYields WHERE FeatureType='FEATURE_ULURU' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_ULURU');

INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_PAITITI',	            'YIELD_GOLD',	    3           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_PAITITI');

INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_GIANTS_CAUSEWAY',	            'YIELD_CULTURE',	    1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_GIANTS_CAUSEWAY');
INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_GIANTS_CAUSEWAY',	            'YIELD_PRODUCTION',	    1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_GIANTS_CAUSEWAY');
UPDATE Feature_AdjacentYields SET YieldChange = 2
WHERE FeatureType = 'FEATURE_GIANTS_CAUSEWAY' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER') AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_GIANTS_CAUSEWAY');

INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_LYSEFJORDEN',	            'YIELD_SCIENCE',	    1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_LYSEFJORDEN');
INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_LYSEFJORDEN',	            'YIELD_PRODUCTION',	    1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_LYSEFJORDEN');
UPDATE Feature_AdjacentYields SET YieldChange = 2
WHERE FeatureType = 'FEATURE_LYSEFJORDEN' AND YieldType = 'YIELD_PRODUCTION' AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_BARRINGER_CRATER') AND EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_LYSEFJORDEN');

INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_EYJAFJALLAJOKULL',	            'YIELD_CULTURE',	    1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_EYJAFJALLAJOKULL');
INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_EYJAFJALLAJOKULL',	            'YIELD_FOOD',	    1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_EYJAFJALLAJOKULL');

INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_ULURU',	            'YIELD_CULTURE',	2           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_ULURU');
INSERT OR REPLACE INTO Feature_AdjacentYields 
(FeatureType,				    YieldType,			YieldChange) SELECT	
'FEATURE_ULURU',	            'YIELD_FAITH',	    1           WHERE EXISTS (SELECT FeatureType FROM Features WHERE FeatureType = 'FEATURE_ULURU');