using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using System.Data.SqlClient;
using Capstone.Controllers;

namespace Capstone.DAO
{
    public class DeviceSqlDAO : IDeviceDAO
    {
        private readonly string connectionString;

        //private string sqlGetDevices = "SELECT Serial, name FROM MachineCheckIns GROUP BY Serial, name;";

        private string sqlGetOrderedMachineCheckIns = "SELECT * FROM MachineCheckIns ORDER BY Serial, LastCheckInTimeUtc";

        public DeviceSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;

        }

        public List<CheckIn> GetDevices()
        {
            List<CheckIn> orderedCheckIns = new List<CheckIn>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sqlGetOrderedMachineCheckIns, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            CheckIn checkIn = new CheckIn()
                            {
                                AuditLogId = Convert.ToInt32(reader["AuditLogId"]),
                                PropertyName = Convert.ToString(reader["PropertyName"]),
                                LastCheckInTimeUtc = Convert.ToDateTime(reader["LastCheckInTimeUtc"]),
                                Serial = Convert.ToString(reader["Serial"]),
                                Name = Convert.ToString(reader["Name"]),
                                MachineModelId = Convert.ToInt32(reader["MachineModelId"]),
                                ArmAssistLeft = Convert.ToInt32(reader["ArmAssistLeft"]),
                                ArmAssistRight = Convert.ToInt32(reader["ArmAssistRight"]),
                                ArmCartLeft = Convert.ToInt32(reader["ArmCartLeft"]),
                                ArmCartRight = Convert.ToInt32(reader["ArmCartRight"]),
                                PulleyDataLeftDistanceCCW = Convert.ToDecimal(reader["PulleyDataLeftDistanceCCW"]),
                                PulleyDataLeftDistanceCW = Convert.ToDecimal(reader["PulleyDataLeftDistanceCW"]),
                                PulleyDataRightDistanceCCW = Convert.ToDecimal(reader["PulleyDataRightDistanceCCW"]),
                                PulleyDataRightDistanceCW = Convert.ToDecimal(reader["PulleyDataRightDistanceCW"]),
                                BatteryLevel = Convert.ToDecimal(reader["BatteryLevel"])
                            };

                                orderedCheckIns.Add(checkIn);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            List<CheckIn> recentCheckIns = new List<CheckIn>();

            //breaksdown our total list to contain the recent updates from each machine
            for (int i = 2; i < orderedCheckIns.Count; i++)
            {
                if (orderedCheckIns[i].Serial != orderedCheckIns[i - 1].Serial)
                {
                    recentCheckIns.Add(orderedCheckIns[i - 1]);
                }
                if(i == orderedCheckIns.Count - 1)
                {
                    recentCheckIns.Add(orderedCheckIns[orderedCheckIns.Count - 1]);
                }
            }

            return recentCheckIns;
        }

        public List<CheckIn> GetMachineData()
        {
            List<CheckIn> orderedCheckIns = new List<CheckIn>();
            List<CheckIn> recentCheckIns = new List<CheckIn>();
            List<CheckIn> secondMostRecentCheckIns = new List<CheckIn>();
            List<CheckIn> machinesAlerting = new List<CheckIn>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sqlGetOrderedMachineCheckIns, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            CheckIn checkIn = new CheckIn()
                            {
                                AuditLogId = Convert.ToInt32(reader["AuditLogId"]),
                                PropertyName = Convert.ToString(reader["PropertyName"]),
                                LastCheckInTimeUtc = Convert.ToDateTime(reader["LastCheckInTimeUtc"]),
                                Serial = Convert.ToString(reader["Serial"]),
                                Name = Convert.ToString(reader["Name"]),
                                MachineModelId = Convert.ToInt32(reader["MachineModelId"]),
                                ArmAssistLeft = Convert.ToInt32(reader["ArmAssistLeft"]),
                                ArmAssistRight = Convert.ToInt32(reader["ArmAssistRight"]),
                                ArmCartLeft = Convert.ToInt32(reader["ArmCartLeft"]),
                                ArmCartRight = Convert.ToInt32(reader["ArmCartRight"]),
                                PulleyDataLeftDistanceCCW = Convert.ToDecimal(reader["PulleyDataLeftDistanceCCW"]),
                                PulleyDataLeftDistanceCW = Convert.ToDecimal(reader["PulleyDataLeftDistanceCW"]),
                                PulleyDataRightDistanceCCW = Convert.ToDecimal(reader["PulleyDataRightDistanceCCW"]),
                                PulleyDataRightDistanceCW = Convert.ToDecimal(reader["PulleyDataRightDistanceCW"]),
                                BatteryLevel = Convert.ToDecimal(reader["BatteryLevel"])

                            };

                            orderedCheckIns.Add(checkIn);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            //breaksdown our total list to contain the recent updates from each machine
            for (int i = 2; i < orderedCheckIns.Count; i++)
            {
                if (orderedCheckIns[i].Serial != orderedCheckIns[i - 1].Serial)
                {
                    recentCheckIns.Add(orderedCheckIns[i - 1]);
                    secondMostRecentCheckIns.Add(orderedCheckIns[i - 2]);
                }
                if (i == orderedCheckIns.Count - 1)
                {
                    recentCheckIns.Add(orderedCheckIns[orderedCheckIns.Count - 1]);
                    secondMostRecentCheckIns.Add(orderedCheckIns[i - 2]);
                }
            }
            //write loops that check our last two updates for issues
            for (int i = 0; i < recentCheckIns.Count; i++)
            {
                if (recentCheckIns[i].BatteryLevel < 25.00M)
                {
                    recentCheckIns[i].BatteryLow = true;
                    machinesAlerting.Add(recentCheckIns[i]);
                }
                if (recentCheckIns[i].ArmAssistLeft != secondMostRecentCheckIns[i].ArmAssistLeft ||
                    recentCheckIns[i].ArmAssistRight != secondMostRecentCheckIns[i].ArmAssistRight ||
                    recentCheckIns[i].ArmCartLeft != secondMostRecentCheckIns[i].ArmCartLeft ||
                    recentCheckIns[i].ArmCartRight != secondMostRecentCheckIns[i].ArmCartRight ||
                    recentCheckIns[i].PulleyDataLeftDistanceCCW != secondMostRecentCheckIns[i].PulleyDataLeftDistanceCCW ||
                    recentCheckIns[i].PulleyDataLeftDistanceCW != secondMostRecentCheckIns[i].PulleyDataLeftDistanceCW ||
                    recentCheckIns[i].PulleyDataRightDistanceCCW != secondMostRecentCheckIns[i].PulleyDataRightDistanceCCW ||
                    recentCheckIns[i].PulleyDataRightDistanceCW != secondMostRecentCheckIns[i].PulleyDataRightDistanceCW)
                {
                    recentCheckIns[i].InUse = true;
                    machinesAlerting.Add(recentCheckIns[i]);
                }
            }

            return machinesAlerting;
        }

        public List<CheckIn> GetAllDevicesAndRelavantAlerts()
        {
            List<CheckIn> allDevices = GetDevices();

            List<CheckIn> checkInAlerts = GetMachineData();


            for (int i = 0; i < allDevices.Count; i++)
            {
                for (int j = 0; j < checkInAlerts.Count; j++)
                {
                    if (allDevices[i].Serial == checkInAlerts[j].Serial)
                    {
                        allDevices[i].BatteryLow = checkInAlerts[j].BatteryLow;
                        allDevices[i].InUse = checkInAlerts[j].InUse;
                        
                    }
                }
            }

            return allDevices;

        }
    }

}
