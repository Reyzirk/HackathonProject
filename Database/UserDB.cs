using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Finexus_Hackathon.Database;
using Finexus_Hackathon.Objects;
using CoreDLL;
using nkkCoreDLL;

namespace Finexus_Hackathon.Database 
{
    public class UserDB : DBController
    {
        //Init and establish database connection
        public UserDB()
        {
            connectDB();
        }

        public Boolean checkPassword(string email, string password)
        {
            String statement = "SELECT Password,PasswordSalt FROM User WHERE Email = ?";
            SqlCommand cmd = new SqlCommand(statement,conn);
            cmd.Parameters.AddWithValue("@email", email);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                if (nkkCoreDLL.core.comparePassword(reader["PasswordSalt"].ToString(), password, reader["Password"].ToString()))
                {
                    reader.Close();
                    return true;
                }
            }
            reader.Close();
            return false;
        }
    }
}