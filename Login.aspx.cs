using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Finexus_Hackathon.Objects;
using Finexus_Hackathon.Database;
using CoreDLL;


namespace Finexus_Hackathon
{
    public partial class Login : System.Web.UI.Page
    {
        private User user = new User();
        private UserDB userdb = new UserDB();

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void loginBtn_Click(object sender, EventArgs e)
        {
            String userID = "";
            if (Page.IsValid)
            {
                user.Email = email.Text;
                user.Password = password.Text;

                if (userdb.checkPassword(user.Email, user.Password, out userID))
                {
                    Session["login"] = userID;
                    if (userdb.isFundraiser(userID, out string name))
                    {
                        Response.Redirect("/FundraiserProfile.aspx");
                    }
                    else
                    {
                        Response.Redirect("/UserProfile.aspx");
                    }
                }
                else
                {
                    Session["errorMsg"] = "Invalid Login!";
                    Response.Redirect("/Login.aspx");
                }
            }
        }

        private String getIpAddress()
        {
            String ipAddr = Request.ServerVariables["HTTP_X_FORWARDED_FOR"];

            if (string.IsNullOrEmpty(ipAddr))
            {
                ipAddr = Request.ServerVariables["REMOTE_ADDR"];
            }

            return ipAddr;
        }
    }
}