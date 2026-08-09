UPDATE Districts SET ZOC = 1, HitPoints = 100
WHERE DistrictType='DISTRICT_HARBOR';
UPDATE Districts SET ZOC = 1, HitPoints = 100
WHERE DistrictType='DISTRICT_ROYAL_NAVY_DOCKYARD';
UPDATE Districts SET ZOC = 1, HitPoints = 100
WHERE DistrictType='DISTRICT_COTHON';
UPDATE Districts SET ZOC = 1, HitPoints = 100
WHERE DistrictType='DISTRICT_NATIONAL_HARBOR';

INSERT OR REPLACE INTO Districts_XP2
(DistrictType,						AttackRange)	
VALUES
('DISTRICT_HARBOR',					1),
('DISTRICT_ROYAL_NAVY_DOCKYARD',	1),
('DISTRICT_COTHON',					1);

INSERT OR REPLACE INTO Districts_XP2
(DistrictType,			AttackRange)	
SELECT
DistrictType,			1
FROM Districts WHERE DistrictType='DISTRICT_NATIONAL_HARBOR'