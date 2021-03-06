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
CREATE TABLE [dbo].[devices](
	[device_id] [int] IDENTITY(1,1) NOT NULL,
	[device_type] [varchar](50) NOT NULL,
	[firmware_version] [varchar](100) NOT NULL,
	[facility] [varchar](50) NOT NULL,
	[city] [varchar](10) NOT NULL,
	[state] [varchar](50) NOT NULL,
	[device_in_use] [bit] NOT NULL,
	[battery_status] [decimal](18, 0) NOT NULL
) ON [PRIMARY]
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
	[ArmAssistLeft] [varchar](50) NULL,
	[ArmAssistRight] [varchar](50) NULL,
	[ArmCartLeft] [varchar](50) NULL,
	[ArmCartRight] [varchar](50) NULL,
	[PulleyDataLeftDistanceCCW] [varchar](50) NULL,
	[PulleyDataLeftDistanceCW] [varchar](50) NULL,
	[PulleyDataRightDistanceCCW] [varchar](50) NULL,
	[PulleyDataRightDistanceCW] [varchar](50) NULL,
	[BatteryLevel] [varchar](50) NULL
) ON [PRIMARY]
GO
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
SET IDENTITY_INSERT [dbo].[devices] ON 

INSERT [dbo].[devices] ([device_id], [device_type], [firmware_version], [facility], [city], [state], [device_in_use], [battery_status]) VALUES (1, N'Strength', N'xyzzy3000', N'NationWide Childrens Hospital', N'Columbus', N'OH', 0, CAST(25 AS Decimal(18, 0)))
INSERT [dbo].[devices] ([device_id], [device_type], [firmware_version], [facility], [city], [state], [device_in_use], [battery_status]) VALUES (2, N'Connect', N'ABC123', N'St. Marys', N'Columbus', N'OH', 0, CAST(42 AS Decimal(18, 0)))
INSERT [dbo].[devices] ([device_id], [device_type], [firmware_version], [facility], [city], [state], [device_in_use], [battery_status]) VALUES (3, N'Connect', N'ABC123', N'St. Annes', N'Columbus', N'OH', 0, CAST(88 AS Decimal(18, 0)))
INSERT [dbo].[devices] ([device_id], [device_type], [firmware_version], [facility], [city], [state], [device_in_use], [battery_status]) VALUES (4, N'Strength', N'xyzzy4200', N'Riverside', N'Columbus', N'OH', 0, CAST(5 AS Decimal(18, 0)))
INSERT [dbo].[devices] ([device_id], [device_type], [firmware_version], [facility], [city], [state], [device_in_use], [battery_status]) VALUES (5, N'Strength', N'xyzzy5000', N'Mt. Caramel', N'Columbus', N'OH', 0, CAST(10 AS Decimal(18, 0)))
INSERT [dbo].[devices] ([device_id], [device_type], [firmware_version], [facility], [city], [state], [device_in_use], [battery_status]) VALUES (6, N'Connect', N'ABC12345', N'Ohio State Wexner Medical Center', N'Columbus', N'OH', 0, CAST(100 AS Decimal(18, 0)))
INSERT [dbo].[devices] ([device_id], [device_type], [firmware_version], [facility], [city], [state], [device_in_use], [battery_status]) VALUES (7, N'Strength', N'xyzzy9000', N'NationWide Childrens Hospital', N'Columbus', N'OH', 0, CAST(50 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[devices] OFF

INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952599', N'LastCheckInTimeUtc', N'8/27/2019 23:19', N'IHM-S001-DLTB-963H', N'Eleanor',            N'1', N'58720',  N'79870',  N'65370',  N'89520',  N'1057790',    N'1057790',    N'1931421.5', N'1931421.5', N'90.56')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952598', N'LastCheckInTimeUtc', N'8/27/2019 23:18', N'IHM-S001-BBSZ-G4TN', N'IHM-S001-BBSZ-G4TN', N'2', N'26610',  N'23530',  N'41250',  N'42990',  N'705000',     N'703700',     N'693447.5',  N'693447.5',  N'5.50')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952597', N'LastCheckInTimeUtc', N'8/27/2019 23:17', N'IHM-S001-XAQX-V9LQ', N'Helga',              N'1', N'56500',  N'54670',  N'66900',  N'72120',  N'949253.25',  N'949253.25',  N'979778.5',  N'979778.5',  N'52.68')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952596', N'LastCheckInTimeUtc', N'8/27/2019 23:16', N'IHM-S001-X37G-WQMF', N'Kim',                N'1', N'20460',  N'19690',  N'31710',  N'33750',  N'436407.25',  N'436407.25',  N'476027',    N'476027',    N'75')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952595', N'LastCheckInTimeUtc', N'8/27/2019 23:16', N'IHM-S001-RR7V-633D', N'Ingrid',             N'1', N'33810',  N'31260',  N'49000',  N'47460',  N'993626.5',   N'993626.5',   N'946867.75', N'946867.75', N'42.42')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952594', N'LastCheckInTimeUtc', N'8/27/2019 23:16', N'IHM-S001-GZ2M-47AR', N'Gertrude',           N'1', N'50360',  N'56130',  N'83130',  N'86220',  N'1091555.75', N'1091555.75', N'1123067',   N'1123067',   N'68')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952593', N'LastCheckInTimeUtc', N'8/27/2019 23:15', N'IHM-S001-4G7S-LJL6', N'June',               N'1', N'30740',  N'25750',  N'7320',   N'8670',   N'317500',     N'316749.75',  N'324939',    N'324939',    N'10.00')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952592', N'LastCheckInTimeUtc', N'8/27/2019 23:15', N'IHM-S001-RTDC-XYPD', N'Betty (Bricked)',    N'1', N'64540',  N'64770',  N'76050',  N'85080',  N'862729.75',  N'862729.75',  N'935950.25', N'935950.25', N'18.45')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952591', N'LastCheckInTimeUtc', N'8/27/2019 23:15', N'IHM-S001-PVYU-3SNT', N'Deb',                N'1', N'115530', N'114610', N'192870', N'200850', N'3656286',    N'3656286',    N'3332374',   N'3332374',   N'11.25')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952590', N'LastCheckInTimeUtc', N'8/27/2019 23:15', N'IHM-S001-VRLP-W3HP', N'Fiona',              N'1', N'86220',  N'30380',  N'76950',  N'27990',  N'1670443',    N'1670443',    N'430672.75', N'430672.75', N'88.88')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952589', N'LastCheckInTimeUtc', N'8/27/2019 23:14', N'IHM-S001-DLTB-963H', N'Eleanor',            N'1', N'58720',  N'79870',  N'65370',  N'89520',  N'1057790',    N'1057790',    N'1931421.5', N'1931421.5', N'94.84')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952588', N'LastCheckInTimeUtc', N'8/27/2019 23:13', N'IHM-S001-BBSZ-G4TN', N'IHM-S001-BBSZ-G4TN', N'2', N'26610',  N'23530',  N'41250',  N'42990',  N'703700',     N'703700',     N'693447.5',  N'693447.5',  N'94.822')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952587', N'LastCheckInTimeUtc', N'8/27/2019 23:12', N'IHM-S001-XAQX-V9LQ', N'Helga',              N'1', N'55100',  N'54670',  N'66900',  N'72120',  N'949253.25' , N'949253.25',  N'979778.5',  N'979778.5',  N'94.802')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952586', N'LastCheckInTimeUtc', N'8/27/2019 23:11', N'IHM-S001-X37G-WQMF', N'Kim',                N'1', N'20460',  N'19690',  N'31710',  N'33750',  N'436407.25',  N'436407.25',  N'476027',    N'476027',    N'94.72')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952585', N'LastCheckInTimeUtc', N'8/27/2019 23:11', N'IHM-S001-RR7V-633D', N'Ingrid',             N'1', N'33810',  N'31260',  N'47880',  N'47460',  N'993626.5',   N'993626.5',   N'946867.75', N'946867.75', N'94.74')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952584', N'LastCheckInTimeUtc', N'8/27/2019 23:11', N'IHM-S001-GZ2M-47AR', N'Gertrude',           N'1', N'50360',  N'56130',  N'83130',  N'86220',  N'1091555.75', N'1091555.75', N'1123067',   N'1123067',   N'94.792')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952583', N'LastCheckInTimeUtc', N'8/27/2019 23:10', N'IHM-S001-4G7S-LJL6', N'June',               N'1', N'30740',  N'25750',  N'7320',   N'8670',   N'316749.75',  N'316749.75',  N'324939',    N'324939',    N'94.708')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952582', N'LastCheckInTimeUtc', N'8/27/2019 23:10', N'IHM-S001-RTDC-XYPD', N'Betty (Bricked)',    N'1', N'64540',  N'64770',  N'76050',  N'85080',  N'862729.75',  N'862729.75',  N'935950.25', N'935950.25', N'94.74')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952581', N'LastCheckInTimeUtc', N'8/27/2019 23:10', N'IHM-S001-PVYU-3SNT', N'Deb',                N'1', N'115530', N'114610', N'192870', N'200850', N'3656286',    N'3656286',    N'3332374',   N'3332374',   N'94.746')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952580', N'LastCheckInTimeUtc', N'8/27/2019 23:10', N'IHM-S001-VRLP-W3HP', N'Fiona',              N'1', N'86220',  N'30380',  N'76950',  N'27990',  N'1670443',    N'1670443',    N'430672.75', N'430672.75', N'94.762')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952579', N'LastCheckInTimeUtc', N'8/27/2019 23:09', N'IHM-S001-DLTB-963H', N'Eleanor',            N'1', N'58720',  N'79870',  N'65370',  N'89520',  N'1057790',    N'1057790',    N'1931421.5', N'1931421.5', N'94.74')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952578', N'LastCheckInTimeUtc', N'8/27/2019 23:08', N'IHM-S001-BBSZ-G4TN', N'IHM-S001-BBSZ-G4TN', N'2', N'26610',  N'23530',  N'41250',  N'42990',  N'703700',     N'703700',     N'693447.5',  N'693447.5',  N'94.724')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952577', N'LastCheckInTimeUtc', N'8/27/2019 23:07', N'IHM-S001-XAQX-V9LQ', N'Helga',              N'1', N'55100',  N'54670',  N'66900',  N'72120',  N'949253.25',  N'949253.25',  N'979778.5',  N'979778.5',  N'94.702')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952576', N'LastCheckInTimeUtc', N'8/27/2019 23:06', N'IHM-S001-X37G-WQMF', N'Kim',                N'1', N'20460',  N'19690',  N'31710',  N'33750',  N'436407.25',  N'436407.25',  N'476027',    N'476027',    N'94.62')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952575', N'LastCheckInTimeUtc', N'8/27/2019 23:06', N'IHM-S001-RR7V-633D', N'Ingrid',             N'1', N'33810',  N'31260',  N'47880',  N'47460',  N'993626.5',   N'993626.5',   N'946867.75', N'946867.75', N'94.64')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952574', N'LastCheckInTimeUtc', N'8/27/2019 23:06', N'IHM-S001-GZ2M-47AR', N'Gertrude',           N'1', N'50360',  N'56130',  N'83130',  N'86220',  N'1091555.75', N'1091555.75', N'1123067',   N'1123067',   N'94.692')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952573', N'LastCheckInTimeUtc', N'8/27/2019 23:05', N'IHM-S001-4G7S-LJL6', N'June',               N'1', N'30740',  N'25750',  N'7320',   N'8670',   N'316749.75',  N'316749.75',  N'324939',    N'324939',    N'94.608')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952572', N'LastCheckInTimeUtc', N'8/27/2019 23:05', N'IHM-S001-RTDC-XYPD', N'Betty (Bricked)',    N'1', N'64540',  N'64770',  N'76050',  N'85080',  N'862729.75',  N'862729.75',  N'935950.25', N'935950.25', N'94.64')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952571', N'LastCheckInTimeUtc', N'8/27/2019 23:05', N'IHM-S001-PVYU-3SNT', N'Deb',                N'1', N'115530', N'114610', N'192870', N'200850', N'3656286',    N'3656286',    N'3332374',   N'3332374',   N'94.646')
INSERT [dbo].[MachineCheckIns] ([AuditLogId], [PropertyName], [LastCheckInTimeUtc], [Serial], [Name], [MachineModelId], [ArmAssistLeft], [ArmAssistRight], [ArmCartLeft], [ArmCartRight], [PulleyDataLeftDistanceCCW], [PulleyDataLeftDistanceCW], [PulleyDataRightDistanceCCW], [PulleyDataRightDistanceCW], [BatteryLevel]) VALUES (N'952570', N'LastCheckInTimeUtc', N'8/27/2019 23:05', N'IHM-S001-VRLP-W3HP', N'Fiona',              N'1', N'86220',  N'30380',  N'76950',  N'27990',  N'1670443',    N'1670443',    N'430672.75', N'430672.75', N'94.662')
																																																																																																																						    
GO
SET IDENTITY_INSERT [dbo].[users] ON 

INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role]) VALUES (1, N'user', N'Jg45HuwT7PZkfuKTz6IB90CtWY4=', N'LHxP4Xh7bN0=', N'user')
INSERT [dbo].[users] ([user_id], [username], [password_hash], [salt], [user_role]) VALUES (2, N'admin', N'YhyGVQ+Ch69n4JMBncM4lNF/i9s=', N'Ar/aB2thQTI=', N'admin')
SET IDENTITY_INSERT [dbo].[users] OFF
USE [master]
GO
ALTER DATABASE [final_capstone] SET  READ_WRITE 
GO
