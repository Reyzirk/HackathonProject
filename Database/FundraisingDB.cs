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
            String statement = "INSERT [Fundraising] VALUES (@fID, @fName, @fDesc, @fAmount, @fPhoto, @fCategory)";
            SqlCommand cmd = new SqlCommand(statement, conn);
            cmd.Parameters.AddWithValue("@fID",fundraiser.FundraisingID);
            cmd.Parameters.AddWithValue("@fName", fundraiser.Title);
            cmd.Parameters.AddWithValue("@fDesc", fundraiser.Desc);
            cmd.Parameters.AddWithValue("@fAmount", fundraiser.AmtRaised);
            cmd.Parameters.AddWithValue("@fPhoto", fundraiser.CoverPhotoFilePath);
            cmd.Parameters.AddWithValue("@fCategory", fundraiser.Category);

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
            String statement = "INSERT [Package] VALUES (@packageName, @packageDesc, @packageMinAmt, @packageFilePath, @packageFundraiserID)";
            SqlCommand cmd = new SqlCommand(statement, conn);

            cmd.Parameters.AddWithValue("@packageName", package.Title);
            cmd.Parameters.AddWithValue("@packageDesc", package.Desc);
            cmd.Parameters.AddWithValue("@packageMinAmt", package.MinAmt);
            cmd.Parameters.AddWithValue("@packageFilePath", package.Filepath);
            cmd.Parameters.AddWithValue("@packageFundraiserID", package.FundraisingID);

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