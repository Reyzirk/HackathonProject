using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;

namespace Finexus_Hackathon.Database
{
    public class DBController
    {
        protected SqlConnection conn;
        //Establish database connection
        protected void connectDB()
        {
            conn = new SqlConnection(ConfigurationManager.ConnectionStrings["finexus"].ConnectionString);
            conn.Open();
        }

        //Disconnect connection
        public void disconnectDB()
        {
            conn.Close();
            conn.Dispose();
        }
    }
}