-- GoldenAge_NoAIWonders
-- Author: Flactine
-- DateCreated: 4/8/2024 11:24:53 PM
--------------------------------------------------------------
UPDATE CivilizationLevels SET CanBuildWonders = 0 WHERE CivilizationLevelType = 'CIVILIZATION_LEVEL_FULL_CIV';

--DELETE FROM BehaviorTrees WHERE TreeName='Seek Target Wonder';
--DELETE FROM BehaviorTreeNodes WHERE TreeName='Seek Target Wonder';
--DELETE FROM TreeData WHERE TreeName='Seek Target Wonder';

--DELETE FROM BehaviorTrees WHERE TreeName='Manage Great Person';
--DELETE FROM BehaviorTreeNodes WHERE TreeName='Manage Great Person';
--DELETE FROM TreeData WHERE TreeName='Manage Great Person';

