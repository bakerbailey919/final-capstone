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

        private string sqlGetDevices = "SELECT Serial, name FROM MachineCheckIns GROUP BY Serial, name;";

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
                                Serial = Convert.ToString(reader["Serial"]),
                                Name = Convert.ToString(reader["Name"])
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
