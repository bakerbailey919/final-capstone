using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capstone.Models;

namespace Capstone.DAO
{
    public class MachineSqlDAO : IMachineDAO
    {
        private readonly string connectionString;

        public MachineSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        private string sqlGetMachineCheckIns = "SELECT * FROM MachineCheckIns";

        public List<CheckIn> GetMachineCheckIns()
        {
            List<CheckIn> checkIns = new List<CheckIn>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sqlGetMachineCheckIns, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            CheckIn dev = new CheckIn()
                            {
                               AuditLogID = Convert.To(reader[""]),
                               PropertyName = Convert.ToString(reader["PropertyName"]),
                               LastCheckInTimeUtc = Convert.ToString(reader["device_type"]),
                               Serial = Convert.ToString(reader["firmware_version"]),
                               Name = Convert.ToString(reader["facility"]),
                               MachineModelId = Convert.ToString(reader["city"]),
                               ArmAssistLeft = Convert.ToString(reader["state"]),
                               ArmAssistRight = Convert.ToBoolean(reader["device_in_use"]),
                               ArmCartLeft = Convert.ToDecimal(reader["battery_status"]),
                               ArmCartRight = Convert.ToInt32(reader["device_id"]),
                               PulleyDataLeftDistanceCCW = Convert.ToString(reader["device_type"]),
                               PulleyDataLeftDistanceCW = Convert.ToString(reader["firmware_version"]),
                               PulleyDataRightDistanceCCW = Convert.ToString(reader["facility"]),
                               PulleyDataRightDistanceCW = Convert.ToString(reader["city"]),
                               BatteryLevel = Convert.ToString(reader["state"]),
                                

                            };
                            public int AuditLogID { get; set; }
        public string PropertyName { get; set; }
        public DateTime LastCheckInTime { get; set; }
        public string Serial { get; set; }
        public string Name { get; set; }
        public int MachineModelID { get; set; }
        public int ArmAssistLeft { get; set; }
        public int ArmAssistRight { get; set; }
        public int ArmCartLeft { get; set; }
        public int ArmCartRight { get; set; }
        public decimal PulleyDataLeftDistanceCCW { get; set; }
        public decimal PulleyDataLeftDistanceCW { get; set; }
        public decimal PulleyDataRightDistanceCCW { get; set; }
        public decimal PulleyDataRightDistanceCW { get; set; }
        public decimal BatteryLevel { get; set; }

        devices.Add(dev);
                        }
                    }
                }
            }
            catch (SqlException)
            {
                throw;
            }

            return devices;
        }
    }
}
