--总督部署时间（5→3）
UPDATE GlobalParameters SET Value = 3 WHERE Name = 'GOVERNOR_BASE_TURNS_TO_ESTABLISH';
--最多任职总督数（7→9）
UPDATE GlobalParameters SET Value = 9 WHERE Name = 'MAX_GOVERNOR_APPOINTMENTS';