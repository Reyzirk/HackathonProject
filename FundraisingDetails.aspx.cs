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
    public partial class FundraisingDetails : System.Web.UI.Page
    {
        public Fundraiser raiser = new Fundraiser();
        public String name = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            if (id == null)
            {
                Response.Redirect("FundraisingListing.aspx");
            }
            else
            {
                FundraisingDB db = new FundraisingDB();
                SqlDataReader reader = db.getFundraisingDetails(id);
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        raiser.AmtRaised = double.Parse(reader["FundraisingAmount"].ToString());
                        raiser.Title = reader["FundraisingName"].ToString();
                        raiser.Desc = reader["FundraisingDesc"].ToString();
                        raiser.CoverPhotoFilePath = reader["FundraisingPhoto"].ToString();
                        raiser.Category = reader["FundraisingCategory"].ToString();
                        raiser.UserID = reader["UserID"].ToString();
                        UserDB db2 = new UserDB();
                        name = "";
                        db2.isFundraiser(raiser.UserID,out name);
                        db2.disconnectDB();
                    }
                }
                else
                {
                    Response.Redirect("FundraisingListing.aspx");
                }
                db.disconnectDB();
            }
        }
    }
}