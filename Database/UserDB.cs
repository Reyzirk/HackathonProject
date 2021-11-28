using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Finexus_Hackathon.Database;
using Finexus_Hackathon.Objects;
using CoreDLL;

namespace Finexus_Hackathon.Database 
{
    public class UserDB : DBController
    {
        //Init and establish database connection
        public UserDB()
        {
            connectDB();
        }

        public Boolean checkPassword(string email, string password, out string userID)
        {
            userID = "";
            String statement = "SELECT UserID, Password,PasswordSalt FROM [User] WHERE Email = @email";
            SqlCommand cmd = new SqlCommand(statement,conn);
            cmd.Parameters.AddWithValue("@email", email);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                userID = reader["UserID"].ToString();
                if (CoreDLL.CoreDLL.comparePassword(reader["PasswordSalt"].ToString(), password, reader["Password"].ToString()))
                {
                    reader.Close();
                    return true;
                }
            }
            reader.Close();
            return false;
        }

        public Boolean isFundraiser(string userID, out string name)
        {
            name = "";
            String statement = "SELECT UserID,FundRaiser,Name FROM [User] WHERE UserID=@userID";
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.Parameters.AddWithValue("@userID", userID);
            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                name = reader["Name"].ToString();
                try
                {
                    if (int.Parse(reader["FundRaiser"].ToString()) == 0)
                    {
                        return false;
                    }
                    else
                    {
                        return true;
                    }
                }
                catch(Exception ex)
                {
                    return false;
                }
                
            }
            reader.Close();
            return false;
        }

        public Boolean checkEmailExist(String email)
        {
            String statement = "SELECT UserID FROM [User] WHERE Email = @email";
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.Parameters.AddWithValue("@email", email);
            var obj = cmd.ExecuteScalar();

            if (obj == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        public Boolean insertUser(User user)
        {
            String statement = "INSERT [User] VALUES(@uID, @name, @email, @pw, @passwordSalt, @ip, NULL)";
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.Parameters.AddWithValue("@uID", user.UserID);
            cmd.Parameters.AddWithValue("@pw", user.Password);
            cmd.Parameters.AddWithValue("@name", user.Name);
            cmd.Parameters.AddWithValue("@email", user.Email);
            cmd.Parameters.AddWithValue("@passwordSalt", user.PasswordSalt);
            cmd.Parameters.AddWithValue("@ip", user.IpAddress);
            int result = cmd.ExecuteNonQuery();

            if (result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}