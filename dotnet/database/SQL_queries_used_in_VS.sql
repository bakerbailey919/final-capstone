/****** Script for SelectTopNRows command from SSMS  ******/

SELECT TOP (1000) [AuditLogId]
      ,[PropertyName]
      ,[LastCheckInTimeUtc]
      ,[Serial]
      ,[Name]
      ,[MachineModelId]
      ,[ArmAssistLeft]
      ,[ArmAssistRight]
      ,[ArmCartLeft]
      ,[ArmCartRight]
      ,[Total_PulleyDataLeftDistance]
      ,[Total_PulleyDataRightDistance]
      ,[BatteryLevel]
  FROM [final_capstone].[dbo].[MachineCheckIns]

  SELECT TOP (1000) [Serial]
      ,[LastMaintenanceDateTime]
      ,[Time_of_Maintenance_PulleyDataLeftDistance]
      ,[Time_of_Maintenance_PulleyDataRightDistance]
  FROM [final_capstone].[dbo].[DeviceData]

  Select * FROM MachineCheckIns
  ORDER BY Serial, LastCheckInTimeUtc;

  SELECT * FROM MachineCheckIns ORDER BY Serial, LastCheckInTimeUtc

  /*use the following script to produce two machines with connection lost*/

  UPDATE MachineCheckIns SET LastCheckInTimeUtc = 'Aug 12 2020 2:30'
  WHERE AuditLogId = '952599'
  

  /*CHANGE JUNE TO BE PAST MAINTENANCE*/

  UPDATE MachineCheckIns SET Total_PulleyDataLeftDistance = N'272000'      
  WHERE AuditLogId = '952593'
  UPDATE MachineCheckIns SET Total_PulleyDataRightDistance = N'250000'
  WHERE AuditLogId = '952593'

  /*CHANGE INGRID TO HAVE SOME USE BUT NOT ENOUGH TO TRIP THE PAST MAINTENANCE ERROR*/
  UPDATE MachineCheckIns SET Total_PulleyDataLeftDistance = N'105000'      
  WHERE AuditLogId = '952595'
  UPDATE MachineCheckIns SET Total_PulleyDataRightDistance = N'120000'
  WHERE AuditLogId = '952595'

  /*run the following script to reduce battery levels*/

 UPDATE MachineCheckIns set BatteryLevel = '10'
  WHERE Serial = 'IHM-S001-VRLP-W3HP';
