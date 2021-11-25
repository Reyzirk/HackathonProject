using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Finexus_Hackathon.Database;

namespace Finexus_Hackathon.Database 
{
    public class UserDB : DBController
    {
        //Init and establish database connection
        public UserDB()
        {
            connectDB();
        }
    }
}