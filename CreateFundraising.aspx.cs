using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Finexus_Hackathon.Objects;

namespace Finexus_Hackathon
{

    public partial class CreateFundraising : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["login"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (Session["package"] != null)
            {
                displaySections.DataSource = Session["package"];
                displaySections.DataBind();
            }
        }

        protected void savePackage_Click(object sender, EventArgs e)
        {
            Package package = new Package();
            var arList = new ArrayList();
            String filename;


            if (Session["package"] != null)
            {
                arList = (ArrayList)Session["package"];
            }

            package.Title = exampleInputText.Text;
            package.Desc = exampleFormControlTextarea1.Text;
            package.MinAmt = double.Parse(minFundAmt.Text);

            if (uploadPackageImg.HasFile)
            {
                filename = Guid.NewGuid().ToString() + "." + CoreDLL.CoreDLL.convertFileType(uploadPackageImg.PostedFile.ContentType);
                package.Filepath = filename;
                uploadPackageImg.SaveAs(Server.MapPath("~/uploads/packageImg/" + filename));
            }
            arList.Add(package);
            Session["package"] = arList;
            displaySections.DataSource = Session["package"];
            displaySections.DataBind();
        }

        protected void delBtn_Command(object sender, CommandEventArgs e)
        {
            var arList = new ArrayList();
            if (e.CommandName.Equals("delete"))
            {
                arList = (ArrayList)Session["package"];
                //arList.Remove(e.CommandArgument);
                foreach(Package package in arList)
                {
                    if (package.Title.Equals(e.CommandArgument))
                    {
                        arList.Remove(package);
                        break;
                    }
                }

                Session["package"] = arList;
                //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('"+ e.CommandArgument + "')", true);
            }
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Tester')", true);
            displaySections.DataSource = Session["package"];
            displaySections.DataBind();
        }
    }
}