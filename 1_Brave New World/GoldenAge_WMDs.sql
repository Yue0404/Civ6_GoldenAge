INSERT OR REPLACE INTO Types	(Type,		Kind) 
VALUES				('WMD_MISSILE_BASE',	'KIND_WMD'),
					('WMD_CASTLE_BRAVO',	'KIND_WMD'),
                    ('WMD_KUZKINE_MET',     'KIND_WMD'),
                    ('WMD_R36_ORB',         'KIND_WMD');

INSERT OR REPLACE INTO Types	(Type,					Kind)
VALUES				
					('PROJECT_BUILD_BASE_MISSILE', 		'KIND_PROJECT'),
					('PROJECT_OPERATION_CASTLE',		'KIND_PROJECT'),
                    ('PROJECT_BUILD_CASTLE_BRAVO',		'KIND_PROJECT'),
                    ('PROJECT_BUILD_R36_ORB',		    'KIND_PROJECT'),					 					 					 
     				('PROJECT_BUILD_KUZKINE_MET',		'KIND_PROJECT');

INSERT OR REPLACE INTO WMDs	(WeaponType,	Name,							BlastRadius,	FalloutDuration,	ICBMStrikeRange,	AffectPopulation,	AffectImprovements, AffectBuildings,	AffectUnits,	AffectResources,	AffectRoutes,	Maintenance)
VALUES				
					('WMD_MISSILE_BASE', 	'LOC_WMD_MISSILE_BASE_NAME', 	0, 				0, 					20, 				1, 					1, 					1, 					1,				1, 					1, 				50),
					('WMD_CASTLE_BRAVO',	'LOC_WMD_CASTLE_BRAVO_NAME',	4,			  	0,					15,					1,					0,					0,					1,				0,					0,				200),
                    ('WMD_KUZKINE_MET',	    'LOC_WMD_KUZKINE_MET_NAME',		3,				20,					15,					1,					1,					1,					1,				1,					1,				250),
                    ('WMD_R36_ORB',	        'LOC_WMD_R36_ORB_NAME',		    1,				10,					200,				1,					1,					1,					1,				1,					1,				150);

UPDATE WMDs SET BlastRadius=1, FalloutDuration=10, ICBMStrikeRange=10, Maintenance=100
WHERE WeaponType = 'WMD_NUCLEAR_DEVICE';
UPDATE WMDs SET BlastRadius=2, FalloutDuration=15, ICBMStrikeRange=12, Maintenance=150
WHERE WeaponType = 'WMD_THERMONUCLEAR_DEVICE';

INSERT OR REPLACE INTO Projects	(ProjectType,			Name,									ShortName,									Description,									 MaxPlayerInstances,           PrereqTech,					PrereqResource,		Cost,		AdvisorType,		WMD)
VALUES	                
						('PROJECT_BUILD_BASE_MISSILE', 'LOC_CREATE_BASE_MISSILE_NAME', 			'LOC_CREATE_BASE_MISSILE_NAME' ,			'LOC_CREATE_BASE_MISSILE_DESCRIPTION',  		 null, 						 'TECH_ROCKETRY',				'RESOURCE_ALUMINUM',800, 		'ADVISOR_CONQUEST',	1),
                        ('PROJECT_BUILD_R36_ORB',      'LOC_PROJECT_BUILD_R36_ORB_NAME',	    'LOC_PROJECT_BUILD_R36_ORB_NAME',	        'LOC_PROJECT_BUILD_R36_ORB_DESCRIPTION',	     null,                       'TECH_SATELLITES',		        'RESOURCE_URANIUM', 2000,		'ADVISOR_CONQUEST', 1),																												
						('PROJECT_OPERATION_CASTLE',   'LOC_PROJECT_OPERATION_CASTLE_NAME',	    'LOC_PROJECT_OPERATION_CASTLE_NAME',	    'LOC_PROJECT_OPERATION_CASTLE_DESCRIPTION',	    	1,                       'TECH_NUCLEAR_FUSION',			null,               4000,		'ADVISOR_CONQUEST', 1),				
                        ('PROJECT_BUILD_CASTLE_BRAVO', 'LOC_PROJECT_BUILD_CASTLE_BRAVO_NAME',	'LOC_PROJECT_BUILD_CASTLE_BRAVO_NAME',		'LOC_PROJECT_BUILD_CASTLE_BRAVO_DESCRIPTION',	 null,                       'TECH_NUCLEAR_FUSION',			'RESOURCE_URANIUM', 3000,		'ADVISOR_CONQUEST', 1),
                        ('PROJECT_BUILD_KUZKINE_MET',  'LOC_PROJECT_BUILD_KUZKINE_MET_NAME',	'LOC_PROJECT_BUILD_KUZKINE_MET_NAME',	    'LOC_PROJECT_BUILD_KUZKINE_MET_DESCRIPTION',	 null,                       'TECH_NUCLEAR_FUSION',		    'RESOURCE_URANIUM', 3000,		'ADVISOR_CONQUEST', 1);

UPDATE Projects SET Cost = 2000
WHERE ProjectType = 'PROJECT_MANHATTAN_PROJECT';
UPDATE Projects SET Cost = 3000
WHERE ProjectType = 'PROJECT_OPERATION_IVY';
UPDATE Projects SET Cost = 1500
WHERE ProjectType = 'PROJECT_BUILD_NUCLEAR_DEVICE';
UPDATE Projects SET Cost = 2000
WHERE ProjectType = 'PROJECT_BUILD_THERMONUCLEAR_DEVICE';


INSERT OR REPLACE INTO Projectprereqs	(ProjectType,		PrereqProjectType,					MinimumPlayerInstances)
VALUES						
                    		('PROJECT_BUILD_R36_ORB',	    'PROJECT_OPERATION_IVY',		    1),
                    		('PROJECT_OPERATION_CASTLE',	'PROJECT_OPERATION_IVY',			1),							
							('PROJECT_BUILD_CASTLE_BRAVO',	'PROJECT_OPERATION_CASTLE',		    1),
                    		('PROJECT_BUILD_KUZKINE_MET',	'PROJECT_OPERATION_CASTLE',		    1);

INSERT OR REPLACE INTO ProjectCompletionModifiers	(ProjectType,		ModifierId)
VALUES									
										('PROJECT_BUILD_BASE_MISSILE', 'PROJECT_COMPLETION_MODIFIER_CREATE_BASE_MISSILE'),
										('PROJECT_BUILD_CASTLE_BRAVO', 'PROJECT_COMPLETION_MODIFIER_CREATE_CASTLE_BRAVO'),
									    ('PROJECT_BUILD_R36_ORB',      'PROJECT_COMPLETION_MODIFIER_CREATE_R36_ORB'),
									    ('PROJECT_BUILD_KUZKINE_MET',  'PROJECT_COMPLETION_MODIFIER_CREATE_KUZKINE_MET');

INSERT OR REPLACE INTO Modifiers	(ModifierID,							ModifierType,					RunOnce,	Permanent)
VALUES					
						('PROJECT_COMPLETION_MODIFIER_CREATE_BASE_MISSILE', 'MODIFIER_PLAYER_CREATE_WMD', 	1,		1),
						('PROJECT_COMPLETION_MODIFIER_CREATE_CASTLE_BRAVO', 'MODIFIER_PLAYER_CREATE_WMD',	1,		1),
				     	('PROJECT_COMPLETION_MODIFIER_CREATE_R36_ORB',      'MODIFIER_PLAYER_CREATE_WMD',	1,		1),
				     	('PROJECT_COMPLETION_MODIFIER_CREATE_KUZKINE_MET',  'MODIFIER_PLAYER_CREATE_WMD',	1,		1);

INSERT OR REPLACE INTO ModifierArguments	(ModifierId,								Name,		Value)		
VALUES							
								('PROJECT_COMPLETION_MODIFIER_CREATE_BASE_MISSILE', 	'Type', 	'WMD_MISSILE_BASE'),--导弹
								('PROJECT_COMPLETION_MODIFIER_CREATE_CASTLE_BRAVO',		'Type',		'WMD_CASTLE_BRAVO'),--中子弹
						    	('PROJECT_COMPLETION_MODIFIER_CREATE_R36_ORB',		    'Type',		'WMD_R36_ORB'),		--巡航核导弹
						    	('PROJECT_COMPLETION_MODIFIER_CREATE_KUZKINE_MET',		'Type',		'WMD_KUZKINE_MET'),	--氢弹
								('PROJECT_COMPLETION_MODIFIER_CREATE_BASE_MISSILE',		'Amount',	1),
								('PROJECT_COMPLETION_MODIFIER_CREATE_CASTLE_BRAVO',		'Amount',	1),
						    	('PROJECT_COMPLETION_MODIFIER_CREATE_R36_ORB',		    'Amount',	1),
						    	('PROJECT_COMPLETION_MODIFIER_CREATE_KUZKINE_MET',		'Amount',	1);

INSERT OR REPLACE INTO Project_ResourceCosts	(ProjectType,				ResourceType,		        StartProductionCost) 
VALUES							    
									('PROJECT_BUILD_BASE_MISSILE',		    'RESOURCE_ALUMINUM',	    30),
									('PROJECT_BUILD_CASTLE_BRAVO',		    'RESOURCE_URANIUM',	        50),
						    	    ('PROJECT_BUILD_R36_ORB',		        'RESOURCE_URANIUM',	        40),
						    	    ('PROJECT_BUILD_KUZKINE_MET',		    'RESOURCE_URANIUM',	        60);

UPDATE Project_ResourceCosts SET StartProductionCost=30
WHERE ProjectType = 'PROJECT_BUILD_NUCLEAR_DEVICE';
UPDATE Project_ResourceCosts SET StartProductionCost=40
WHERE ProjectType = 'PROJECT_BUILD_THERMONUCLEAR_DEVICE';