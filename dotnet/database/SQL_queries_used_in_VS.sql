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

  

  /*use the following script to produce two machines with connection lost*/

  UPDATE MachineCheckIns SET LastCheckInTimeUtc = 'Aug 12 2020 2:30'
  WHERE AuditLogId = 952598 
  OR AuditLogId = 952595

  /*use the following script to produce cable travel on two of the machines*/

  UPDATE MachineCheckIns SET Total_PulleyDataLeftDistance = '25000'
  WHERE AuditLogId = 952596
  OR AuditLogId = 952593

  UPDATE MachineCheckIns SET Total_PulleyDataRightDistance = '50000'
  WHERE AuditLogId = 952596
  OR AuditLogId = 952593

  /*run the following script to reduce battery levels*/

 UPDATE MachineCheckIns set BatteryLevel = '10'
  WHERE Serial = 'IHM-S001-VRLP-W3HP';
  
  