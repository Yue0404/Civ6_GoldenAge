--著作转移（10）
UPDATE GlobalParameters SET Value = 1 WHERE Name = 'GREATWORK_ART_LOCK_TIME';

-- 增加巨作的旅游业绩
UPDATE GreatWorks SET Tourism = 4 WHERE GreatWorkObjectType = 'GREATWORKOBJECT_WRITING';
UPDATE GreatWorks SET Tourism = 3 WHERE GreatWorkObjectType = 'GREATWORKOBJECT_RELIGIOUS';
UPDATE GreatWorks SET Tourism = 3 WHERE GreatWorkObjectType = 'GREATWORKOBJECT_SCULPTURE';
UPDATE GreatWorks SET Tourism = 3 WHERE GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE';
UPDATE GreatWorks SET Tourism = 3 WHERE GreatWorkObjectType = 'GREATWORKOBJECT_PORTRAIT';
UPDATE GreatWorks SET Tourism = 5 WHERE GreatWorkObjectType = 'GREATWORKOBJECT_MUSIC';