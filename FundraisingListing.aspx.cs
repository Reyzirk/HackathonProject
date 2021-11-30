using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Finexus_Hackathon
{
    public partial class FundraisingListing : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SQLListing.SelectCommand = "SELECT * FROM Fundraising WHERE FundraisingName LIKE '%" + searchText.Text + "%'";
            SQLListing.SelectParameters.Clear();
            repeat.DataBind();
        }

        protected void searchText_TextChanged(object sender, EventArgs e)
        {
            SQLListing.SelectCommand = "SELECT * FROM Fundraising WHERE FundraisingName LIKE '%"+searchText.Text+"%'";
            SQLListing.SelectParameters.Clear();
            repeat.DataBind();
        }
    }
}