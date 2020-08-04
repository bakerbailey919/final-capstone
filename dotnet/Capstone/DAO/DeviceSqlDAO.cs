using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using System.Data.SqlClient;

namespace Capstone.DAO
{
    public class DeviceSqlDAO : IDeviceDAO
    {
        private readonly string connectionString;

        private string sqlGetDevices = "SELECT * FROM devices";

        public DeviceSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }

        public List<Device> GetDevices()
        {
            List<Device> devices = new List<Device>();

            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    SqlCommand cmd = new SqlCommand(sqlGetDevices, conn);
                    SqlDataReader reader = cmd.ExecuteReader();

                    if(reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            Device dev = new Device()
                            {
                                DeviceID = Convert.ToInt32(reader["device_id"]),
                                DeviceType = Convert.ToString(reader["device_type"]),
                                FirmwareVersion = Convert.ToString(reader["firmware_version"]),
                                Facility = Convert.ToString(reader["facility"]),
                                City = Convert.ToString(reader["city"]),
                                State = Convert.ToString(reader["state"]),
                                DeviceInUse = Convert.ToBoolean(reader["device_in_use"]),
                                BatteryStatus = Convert.ToDecimal(reader["battery_status"])

                            };

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
