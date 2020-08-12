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

  SELECT * FROM MachineCheckIns
  ORDER BY Serial, LastCheckInTimeUtc; 

  SELECT * FROM DeviceData
  Order BY Serial;

  UPDATE dbo.DeviceData 
  SET LastMaintenanceDateTime = CURRENT_TIMESTAMP, 
  Time_of_Maintenance_PulleyDataLeftDistance = '5000', 
  Time_of_Maintenance_PulleyDataRightDistance = '4500'
  WHERE Serial = 'IHM-S001-BBSZ-G4TN';

  UPDATE MachineCheckIns set LastCheckInTimeUtc = GETUTCDATE()
  WHERE Serial IN  ('IHM-S001-DLTB-963H', 'IHM-S001-BBSZ-G4TN','IHM-S001-RR7V-633D','IHM-S001-VRLP-W3HP','IHM-S001-X37G-WQMF');

  UPDATE MachineCheckIns set BatteryLevel = '10'
  WHERE Serial = 'IHM-S001-VRLP-W3HP';