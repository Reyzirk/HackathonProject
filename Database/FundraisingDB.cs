using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Finexus_Hackathon.Objects;

namespace Finexus_Hackathon.Database
{
    public class FundraisingDB : DBController
    {
        public FundraisingDB()
        {
            connectDB();
        }

        public Boolean insertFundraisingRecord(Fundraiser fundraiser)
        {
            String statement = "INSERT [Fundraising] VALUES (@fID, @fName, @fDesc, @fAmount, @fPhoto, @fCategory,0,@userID)";
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.Parameters.AddWithValue("@fID",fundraiser.FundraisingID);
            cmd.Parameters.AddWithValue("@fName", fundraiser.Title);
            cmd.Parameters.AddWithValue("@fDesc", fundraiser.Desc);
            cmd.Parameters.AddWithValue("@fAmount", fundraiser.AmtRaised);
            cmd.Parameters.AddWithValue("@fPhoto", fundraiser.CoverPhotoFilePath);
            cmd.Parameters.AddWithValue("@fCategory", fundraiser.Category);
            cmd.Parameters.AddWithValue("@userID", fundraiser.UserID);

            int result = cmd.ExecuteNonQuery();

            if(result > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Boolean insertPackageRecord(Package package)
        {
            String statement = "INSERT [Package] VALUES (@packageName, @packageDesc, @packageMinAmt, @packageFilePath, @packageFundraiserID,@packageID)";
            SqlCommand cmd = new SqlCommand(statement, conn);

            cmd.Parameters.AddWithValue("@packageName", package.Title);
            cmd.Parameters.AddWithValue("@packageDesc", package.Desc);
            cmd.Parameters.AddWithValue("@packageMinAmt", package.MinAmt);
            cmd.Parameters.AddWithValue("@packageFilePath", package.Filepath);
            cmd.Parameters.AddWithValue("@packageFundraiserID", package.FundraisingID);
            cmd.Parameters.AddWithValue("@packageID", package.PackageID);

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

        public SqlDataReader getFundraisingDetails(String id)
        {
            String statement = "SELECT * FROM [Fundraising] WHERE FundraisingID = @id";
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader;
        }
        public SqlDataReader getFundraisingUserDetails(String id)
        {
            String statement = "SELECT FundraisingID,FundraisingName,FundraisingAmount,FundraisingDesc,FundraisingPhoto,FundraisingCategory,FundraisingCurrent,Name FROM [Fundraising],[User] WHERE [Fundraising].UserID = [User].[UserID] AND [User].UserID = @id";
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.Parameters.AddWithValue("@id", id);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader;
        }

        public SqlDataReader getPackageDetails(string packageID)
        {
            String statement = "SELECT * FROM [Package] WHERE PackageID = @id";
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.Parameters.AddWithValue("@id", packageID);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader;
        }

        public Boolean updateCurrentAmount(String fundraisingID,double current)
        {
            String statement = "UPDATE [Fundraising] SET FundraisingCurrent=@current WHERE FundraisingID = @id";
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.Parameters.AddWithValue("@current", current);
            cmd.Parameters.AddWithValue("@id", fundraisingID);

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