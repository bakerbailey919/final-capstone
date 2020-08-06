using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Capstone.Models;
using Capstone.DAO;
using Capstone.Controllers;

namespace Capstone.DAO
{
    public interface IDeviceDAO
    {
        List<Device> GetDevices();

        List<CheckIn> GetMachineData();

        List<Device> GetAllDevicesAndRelavantAlerts();
    }
}
