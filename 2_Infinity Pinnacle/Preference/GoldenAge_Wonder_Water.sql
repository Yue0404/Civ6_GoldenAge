UPDATE Features SET AddsFreshWater = 1 WHERE FollowRulesInWB = 0;

CREATE TRIGGER Trig_GA_Wonder_Water
AFTER INSERT ON Features
WHEN NEW.FollowRulesInWB = 0
BEGIN
	UPDATE Features SET AddsFreshWater = 1 WHERE FollowRulesInWB = 0;
END;