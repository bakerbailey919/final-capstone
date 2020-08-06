﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Capstone.Models;


namespace Capstone.DAO
{
    public class AlertSqlDAO : IAlertDAO
    {
        private readonly string connectionString;

        public AlertSqlDAO(string dbConnectionString)
        {
            connectionString = dbConnectionString;
        }
    }
}
