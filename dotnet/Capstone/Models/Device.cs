using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class Device
    {
        public string Serial { get; set; }
        public string Name { get; set; }
        public bool BatteryLow { get; set; }
        public bool InUse { get; set; }
    }
}
