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

        private string sqlGetDevices = "SELECT Serial, name FROM MachineCheckIns GROUP BY Serial, name;";

        private string sqlGetOrderedMachineCheckIns = "SELECT * FROM MachineCheckIns ORDER BY Serial, LastCheckInTimeUtc";

        public DeviceSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;

        }

        public List<Device> GetDevices()
        {
            List<Device> allDevices = new List<Device>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sqlGetDevices, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Device dev = new Device()
                            {
                                Serial = Convert.ToString(reader["Serial"]),
                                Name = Convert.ToString(reader["Name"])
                            };

                                allDevices.Add(dev);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return allDevices;
        }

        public List<CheckIn> GetMachineData()
        {
            List<CheckIn> checkIns = new List<CheckIn>();
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

                            checkIns.Add(checkIn);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            //breaksdown our total list to contain the recent updates from each machine
            for (int i = 2; i < checkIns.Count; i++)
            {
                if (checkIns[i].Name != checkIns[i - 1].Name)
                {
                    recentCheckIns.Add(checkIns[i - 1]);
                    secondMostRecentCheckIns.Add(checkIns[i - 2]);
                }
            }
            //write loops that check our last two updates for issues
            for (int i = 0; i < recentCheckIns.Count; i++)
            {
                if (recentCheckIns[i].BatteryLevel < 94.9M)
                {
                    recentCheckIns[i].BatteryIssues = true;
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

        public List<Device> GetAllDevicesAndRelavantAlerts()
        {
            List<Device> allDevices = GetDevices();

            List<CheckIn> checkInAlerts = GetMachineData();
            

            for (int i = 0; i < allDevices.Count; i++)
            {
                for (int j = 0; j < checkInAlerts.Count; j++)
                {
                    if (allDevices[i].Serial == checkInAlerts[j].Serial)
                    {
                        allDevices[i].BatteryLow = checkInAlerts[j].BatteryIssues;
                        allDevices[i].InUse = checkInAlerts[j].InUse;

                    }
                }
            }

            return allDevices;
            
        }
    }

}
