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
      ,[PulleyDataLeftDistanceCCW]
      ,[PulleyDataLeftDistanceCW]
      ,[PulleyDataRightDistanceCCW]
      ,[PulleyDataRightDistanceCW]
      ,[BatteryLevel]
  FROM [final_capstone].[dbo].[MachineCheckIns]

  SELECT * FROM MachineCheckIns
  ORDER BY Serial, LastCheckInTimeUtc; 
  