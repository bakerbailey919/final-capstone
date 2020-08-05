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
    [Route("api/[controller]")]
    [ApiController]
    public class MachineCheckInsController : ControllerBase
    {
        private IDeviceDAO deviceDAO;
        
        public MachineCheckInsController(IDeviceDAO _deviceDAO)
        {
            deviceDAO = _deviceDAO;
        }


        [Authorize]
        [HttpGet]
        public List<CheckIn> GetMachineCheckins()
        {
            List<Device> checkins = deviceDAO.GetMachineCheckins();

            return checkins;
        }
    }
}