-- GoldenAge_NoPopLose
-- Author: Flactine
-- DateCreated: 8/31/2022 11:19:03 AM
--------------------------------------------------------------
DELETE FROM RandomEvent_Damages WHERE DamageType = 'POPULATION_LOSS';

CREATE TRIGGER Trig_GA_NoPopLose
AFTER INSERT ON RandomEvent_Damages
WHEN NEW.DamageType = 'POPULATION_LOSS'
BEGIN
	DELETE FROM RandomEvent_Damages WHERE DamageType = 'POPULATION_LOSS';
END;