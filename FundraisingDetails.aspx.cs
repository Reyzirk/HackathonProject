using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Finexus_Hackathon
{
    public partial class FundraisingDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string id = Request.QueryString["id"];
            SQLListingDetails.SelectCommand = "SELECT * FROM Package WHERE PackageFundraisingID = '" + id + "'";
            SQLListingDetails.SelectParameters.Clear();
            packageDisplay.DataBind();
        }

        protected void joinBtn_Command(object sender, CommandEventArgs e)
        {
            string packageName = e.CommandArgument.ToString();
            Response.Redirect("/Payment.aspx?packageName=" + packageName);

        }
    }
}