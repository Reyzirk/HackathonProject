using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Finexus_Hackathon.Database;
using Finexus_Hackathon.Objects;
using System.Data.SqlClient;

namespace Finexus_Hackathon
{
    public partial class FundraiserProfile : System.Web.UI.Page
    {
        public Fundraiser raiser = new Fundraiser();
        public String name = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                FundraisingDB db = new FundraisingDB();
                SqlDataReader reader = db.getFundraisingUserDetails(Session["login"].ToString());
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        raiser.AmtRaised = double.Parse(reader["FundraisingAmount"].ToString());
                        raiser.Title = reader["FundraisingName"].ToString();
                        raiser.Desc = reader["FundraisingDesc"].ToString();
                        raiser.CoverPhotoFilePath = reader["FundraisingPhoto"].ToString();
                        raiser.Category = reader["FundraisingCategory"].ToString();
                        raiser.FundraisingID = reader["FundraisingID"].ToString();
                        raiser.CurrentRaised = double.Parse(reader["FundraisingCurrent"].ToString());
                        name = reader["Name"].ToString();
                    }
                    
                }
                else
                {
                    db.disconnectDB();
                    Response.Redirect("FundraisingListing.aspx");
                }
                db.disconnectDB();
            }
        }
    }
}