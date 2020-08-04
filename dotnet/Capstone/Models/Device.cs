using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Device
    {
        public int DeviceID { get; set; }
        public string DeviceType { get; set; }
        public string FirmwareVersion { get; set; }
        public string Facility { get; set; }
        public string City { get; set; }
        public string State { get; set; }
        public bool DeviceInUse { get; set; }
        public decimal BatteryStatus { get; set; }
    }
}
