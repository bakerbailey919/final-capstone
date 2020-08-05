using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Capstone.Models;
using Capstone.DAO;

namespace Capstone.Controllers
{
    [Route("[controller]")]
    [ApiController]
    
    public class DevicesController : ControllerBase
    {
        private IDeviceDAO deviceDAO;
        
        public DevicesController(IDeviceDAO _deviceDAO)
        {
            deviceDAO = _deviceDAO;
        }
        
        [Authorize]
        [HttpGet]
        public List<Device> GetDevices()
        {
            List<Device> devices = deviceDAO.GetDevices();

            return devices;
        }
        
    }
}