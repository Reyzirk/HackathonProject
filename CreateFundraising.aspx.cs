using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Finexus_Hackathon.Objects;
using Finexus_Hackathon.Database;

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

        protected void submitBtn_Click(object sender, EventArgs e)
        {
            Fundraiser fundraiser = new Fundraiser();
            FundraisingDB fundraisingDB = new FundraisingDB();
            Random random = new Random();
            String filename;
            var arList = new ArrayList();

            fundraiser.FundraisingID = "F" + random.Next(100000);
            fundraiser.Title = fundraisingTitle.Text;
            fundraiser.Desc = fundraisingDesc.Text;
            fundraiser.AmtRaised = Double.Parse(fundraiseAmt.Text);
            fundraiser.Category = fundraisingCategory.SelectedValue.ToString();

            if (uploadImg.HasFile)
            {
                filename = Guid.NewGuid().ToString() + "." + CoreDLL.CoreDLL.convertFileType(uploadImg.PostedFile.ContentType);
                fundraiser.CoverPhotoFilePath = filename;
                uploadImg.SaveAs(Server.MapPath("~/uploads/fundraiseImg/" + filename));
            }

            Boolean successFail = fundraisingDB.insertFundraisingRecord(fundraiser);

            if (Session["package"] != null)
            {
                arList = (ArrayList)Session["package"];

                foreach (Package package in arList)
                {
                    package.FundraisingID = fundraiser.FundraisingID;
                    fundraisingDB.insertPackageRecord(package);
                }
            }

            if (successFail == false)
            {
                Session["errorMsg"] = "Creation failed.";
            }
            else
            {
                Response.Redirect("/FundraisingListing.aspx");
            }
        }
    }
}