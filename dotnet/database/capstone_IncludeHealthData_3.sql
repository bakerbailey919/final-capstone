USE master
GO

--drop database if it exists
IF DB_ID('final_capstone') IS NOT NULL
BEGIN
	ALTER DATABASE final_capstone SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
	DROP DATABASE final_capstone;
END

CREATE DATABASE final_capstone
GO

USE final_capstone
GO

/****** Object:  Table [dbo].[devices]    Script Date: 8/4/2020 2:52:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[MachineCheckIns]    Script Date: 8/4/2020 2:52:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MachineCheckIns](
	[AuditLogId] [varchar](50) NULL,
	[PropertyName] [varchar](50) NULL,
	[LastCheckInTimeUtc] [varchar](50) NULL,
	[Serial] [varchar](50) NULL,
	[Name] [varchar](50) NULL,
	[MachineModelId] [varchar](50) NULL,
	[Organization] [varchar](50) NOT NULL,
	[ArmAssistLeft] [varchar](50) NULL,
	[ArmAssistRight] [varchar](50) NULL,
	[ArmCartLeft] [varchar](50) NULL,
	[ArmCartRight] [varchar](50) NULL,
	[Total_PulleyDataLeftDistance] [varchar](50) NULL,
	[Total_PulleyDataRightDistance] [varchar](50) NULL,
	[BatteryLevel] [varchar](50) NULL
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[DeviceData](
	[Serial] [varchar](50) NOT NULL PRIMARY KEY,
	[LastMaintenanceDateTime] [varchar](50) NOT NULL,
	[Time_of_Maintenance_PulleyDataLeftDistance] [varchar](50) NULL,
	[Time_of_Maintenance_PulleyDataRightDistance] [varchar](50) NULL,
	)

/****** Object:  Table [dbo].[users]    Script Date: 8/4/2020 2:52:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password_hash] [varchar](200) NOT NULL,
	[salt] [varchar](200) NOT NULL,
	[user_role] [varchar](50) NOT NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952598', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-BBSZ-G4TN', N'IHM-S001-BBSZ-G4TN', N'2', 'Organization 1', N'26610',  N'23530',  N'41250',  N'42990',  N'703700',       N'693000' ,     N'55.0')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952597', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-XAQX-V9LQ', N'Helga',              N'1', 'Organization 1', N'56500',  N'54670',  N'66900',  N'72120',  N'258750',       N'268750' ,		N'52.68')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952596', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-X37G-WQMF', N'Kim',                N'1', 'Organization 2', N'20460',  N'19690',  N'31710',  N'33750',  N'106000',       N'125000' ,     N'75')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952599', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-DLTB-963H', N'Eleanor',            N'1', 'Organization 2', N'58720',  N'79870',  N'65370',  N'89520',  N'250000',       N'290000' ,     N'90.56')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952595', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-RR7V-633D', N'Ingrid',             N'1', 'Organization 3', N'33810',  N'31260',  N'49000',  N'47460',  N'95000',        N'105000',      N'50.42')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952594', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-GZ2M-47AR', N'Gertrude',           N'1', 'Organization 4', N'50360',  N'56130',  N'83130',  N'86220',  N'802000',       N'852000',      N'68')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952593', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-4G7S-LJL6', N'June',               N'1', 'Organization 5', N'30740',  N'25750',  N'7320',   N'8670',   N'242000',       N'242000',      N'100.00')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952592', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-RTDC-XYPD', N'Betty (Bricked)',    N'1', 'Organization 3', N'64540',  N'64770',  N'76050',  N'85080',  N'256000',       N'256000',      N'88.45')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952591', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-PVYU-3SNT', N'Deb',                N'1', 'Organization 2', N'115530', N'114610', N'192870', N'200850', N'100000',       N'100000',      N'91.25')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952590', N'LastCheckInTimeUtc', GETUTCDATE(),       N'IHM-S001-VRLP-W3HP', N'Fiona',              N'1', 'Organization 1', N'86220',  N'30380',  N'76950',  N'27990',  N'85000',        N'85000',       N'88.88')

INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952589', N'LastCheckInTimeUtc', N'8/27/2019 23:14', N'IHM-S001-DLTB-963H', N'Eleanor',            N'1', 'Organization 2', N'58720',  N'79870',  N'65370',  N'89520',  N'250000',       N'290000',		N'94.84')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952588', N'LastCheckInTimeUtc', N'8/27/2019 23:13', N'IHM-S001-BBSZ-G4TN', N'IHM-S001-BBSZ-G4TN', N'2', 'Organization 1', N'26610',  N'23530',  N'41250',  N'42990',  N'703700',       N'693000',		N'94.822')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952587', N'LastCheckInTimeUtc', N'8/27/2019 23:12', N'IHM-S001-XAQX-V9LQ', N'Helga',              N'1', 'Organization 1', N'56500',  N'54670',  N'66900',  N'72120',  N'258750',       N'268750',		N'94.802')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952586', N'LastCheckInTimeUtc', N'8/27/2019 23:11', N'IHM-S001-X37G-WQMF', N'Kim',                N'1', 'Organization 2', N'20460',  N'19690',  N'31710',  N'33750',  N'106000',       N'125000',      N'94.72')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952585', N'LastCheckInTimeUtc', N'8/27/2019 23:11', N'IHM-S001-RR7V-633D', N'Ingrid',             N'1', 'Organization 3', N'33810',  N'31260',  N'49000',  N'47460',  N'95000',        N'105000',		N'94.74')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952584', N'LastCheckInTimeUtc', N'8/27/2019 23:11', N'IHM-S001-GZ2M-47AR', N'Gertrude',           N'1', 'Organization 4', N'50360',  N'56130',  N'83130',  N'86220',  N'802000',       N'852000',     N'94.792')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952583', N'LastCheckInTimeUtc', N'8/27/2019 23:10', N'IHM-S001-4G7S-LJL6', N'June',               N'1', 'Organization 5', N'30740',  N'25750',  N'7320',   N'8670',   N'242000',       N'242000',      N'94.708')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952582', N'LastCheckInTimeUtc', N'8/27/2019 23:10', N'IHM-S001-RTDC-XYPD', N'Betty (Bricked)',    N'1', 'Organization 3', N'64540',  N'64770',  N'76050',  N'85080',  N'256000',       N'256000',		N'94.74')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952581', N'LastCheckInTimeUtc', N'8/27/2019 23:10', N'IHM-S001-PVYU-3SNT', N'Deb',                N'1', 'Organization 2', N'115530', N'114610', N'192870', N'200850', N'100000',       N'100000',     N'94.746')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952580', N'LastCheckInTimeUtc', N'8/27/2019 23:10', N'IHM-S001-VRLP-W3HP', N'Fiona',              N'1', 'Organization 1', N'86220',  N'30380',  N'76950',  N'27990',  N'85000',        N'85000', 		N'94.762')

INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952579', N'LastCheckInTimeUtc', N'8/27/2019 23:09', N'IHM-S001-DLTB-963H', N'Eleanor',            N'1', 'Organization 2', N'58720',  N'79870',  N'65370',  N'89520',  N'1057790',      N'1931421',		N'94.74')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952578', N'LastCheckInTimeUtc', N'8/27/2019 23:08', N'IHM-S001-BBSZ-G4TN', N'IHM-S001-BBSZ-G4TN', N'2', 'Organization 1', N'26610',  N'23530',  N'41250',  N'42990',  N'703700',       N'693447',		N'94.724')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952577', N'LastCheckInTimeUtc', N'8/27/2019 23:07', N'IHM-S001-XAQX-V9LQ', N'Helga',              N'1', 'Organization 1', N'56500',  N'54670',  N'66900',  N'72120',  N'258750',       N'268750',		N'94.702')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952576', N'LastCheckInTimeUtc', N'8/27/2019 23:06', N'IHM-S001-X37G-WQMF', N'Kim',                N'1', 'Organization 2', N'20460',  N'19690',  N'31710',  N'33750',  N'436407',		N'476027',      N'94.62')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952575', N'LastCheckInTimeUtc', N'8/27/2019 23:06', N'IHM-S001-RR7V-633D', N'Ingrid',             N'1', 'Organization 3', N'33810',  N'31260',  N'47880',  N'47460',  N'95000',        N'105000',		N'94.64')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952574', N'LastCheckInTimeUtc', N'8/27/2019 23:06', N'IHM-S001-GZ2M-47AR', N'Gertrude',           N'1', 'Organization 4', N'50360',  N'56130',  N'83130',  N'86220',  N'1091555',		N'1123067',     N'94.692')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952573', N'LastCheckInTimeUtc', N'8/27/2019 23:05', N'IHM-S001-4G7S-LJL6', N'June',               N'1', 'Organization 5', N'30740',  N'25750',  N'7320',   N'8670',   N'316749',		N'324939',      N'94.608')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952572', N'LastCheckInTimeUtc', N'8/27/2019 23:05', N'IHM-S001-RTDC-XYPD', N'Betty (Bricked)',    N'1', 'Organization 3', N'64540',  N'64770',  N'76050',  N'85080',  N'862729',		N'935950',		N'94.64')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952571', N'LastCheckInTimeUtc', N'8/27/2019 23:05', N'IHM-S001-PVYU-3SNT', N'Deb',                N'1', 'Organization 2', N'115530', N'114610', N'192870', N'200850', N'3656286',      N'3332374',     N'94.646')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [Organization], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [Total_PulleyDataLeftDistance], [Total_PulleyDataRightDistance], [BatteryLevel]) VALUES (N'952570', N'LastCheckInTimeUtc', N'8/27/2019 23:05', N'IHM-S001-VRLP-W3HP', N'Fiona',              N'1', 'Organization 1', N'86220',  N'30380',  N'76950',  N'27990',  N'1670443',      N'430672',		N'94.662')

--Insert values into DeviceData table	

INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-BBSZ-G4TN', '', N'703700',       N'693000'  )
INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-XAQX-V9LQ', '', N'258750',       N'268750'  )
INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-X37G-WQMF', '', N'106000',       N'125000'  )
INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-DLTB-963H', '', N'250000',       N'290000'  )
INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-RR7V-633D', '', N'95000',        N'105000' )
INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-GZ2M-47AR', '', N'802000',       N'852000' )
INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-4G7S-LJL6', '', N'242000',       N'242000' )
INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-RTDC-XYPD', '', N'256000',       N'256000' )
INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-PVYU-3SNT', '', N'100000',       N'100000' )
INSERT [dbo].[DeviceData] ([Serial], [LastMaintenanceDateTime], [Time_of_Maintenance_PulleyDataLeftDistance], [Time_of_Maintenance_PulleyDataRightDistance]) VALUES	(N'IHM-S001-VRLP-W3HP', '', N'85000',        N'85000' )
	
																																																																																																																						    
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role]) VALUES (1, N'user', N'Jg45HuwT7PZkfuKTz6IB90CtWY4=', N'LHxP4Xh7bN0=', N'user')
INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role]) VALUES (2, N'admin', N'YhyGVQ+Ch69n4JMBncM4lNF/i9s=', N'Ar/aB2thQTI=', N'admin')
SET IDENTITY_INSERT [dbo].[users] OFF
USE [final_capstone]
GO

ALTER TABLE [dbo].[MachineCheckIns] ADD FOREIGN KEY ([Serial]) REFERENCES [dbo].[DeviceData]([Serial]);


ALTER DATABASE [final_capstone] SET  READ_WRITE 
GO
