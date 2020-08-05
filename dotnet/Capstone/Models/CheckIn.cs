using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Capstone.Models
{
    public class CheckIn
    {
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
    }
}
