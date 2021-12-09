using System;
using Finexus_Hackathon.Database;
using Finexus_Hackathon.Objects;
using System.Data.SqlClient;

namespace Finexus_Hackathon
{
    public partial class Payment : System.Web.UI.Page
    {
        public Fundraiser raiser = new Fundraiser();
        public String name = "";
        public Package package = new Package();
        public String fundid = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("login.aspx");
            }
            string id = Request.QueryString["packageID"];
            if (id == null)
            {
                Response.Redirect("FundraisingListing.aspx");
            }
            else
            {
                FundraisingDB db = new FundraisingDB();
                FundraisingDB db3 = new FundraisingDB();
                SqlDataReader reader2 = db3.getPackageDetails(id);
                if (reader2.HasRows)
                {
                    while (reader2.Read())
                    {
                        package.Title = reader2["PackageTitle"].ToString();
                        package.MinAmt = double.Parse(reader2["PackageMinAmt"].ToString());
                        fundid = reader2["PackageFundraisingID"].ToString();
                        SqlDataReader reader = db.getFundraisingDetails(fundid);
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                raiser.AmtRaised = double.Parse(reader["FundraisingAmount"].ToString());
                                raiser.Title = reader["FundraisingName"].ToString();
                                raiser.Desc = reader["FundraisingDesc"].ToString();
                                raiser.CoverPhotoFilePath = reader["FundraisingPhoto"].ToString();
                                raiser.Category = reader["FundraisingCategory"].ToString();
                                raiser.CurrentRaised = double.Parse(reader["FundraisingCurrent"].ToString());
                                raiser.UserID = reader["UserID"].ToString();
                                UserDB db2 = new UserDB();
                                name = "";
                                db2.isFundraiser(raiser.UserID, out name);
                                db2.disconnectDB();
                            }
                        }
                        else
                        {
                            Response.Redirect("FundraisingListing.aspx");
                        }
                    }
                }
                else
                {
                    Response.Redirect("FundraisingListing.aspx");
                }

                db.disconnectDB();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            FundraisingDB db = new FundraisingDB();
            db.updateCurrentAmount(fundid, raiser.CurrentRaised + package.MinAmt);
            db.disconnectDB();
            Response.Redirect("FundraisingDetails.aspx?id=" + fundid);
        }
    }
}