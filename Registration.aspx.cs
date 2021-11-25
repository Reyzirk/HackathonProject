using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Finexus_Hackathon.Objects;
using System.Web.UI.WebControls;
using CoreDLL;
using Finexus_Hackathon.Database;

namespace Finexus_Hackathon
{
    public partial class Registration : System.Web.UI.Page
    {
        private User user = new User();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void registerBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                user.UserID = Guid.NewGuid().ToString();
                user.PasswordSalt = CoreDLL.CoreDLL.generateSalt();
                user.Password = CoreDLL.CoreDLL.hashPassword(Password.Text.Trim(), CoreDLL.CoreDLL.generateSalt());
                user.IpAddress = getIpAddress();
                UserDB db = new UserDB();
                if (db.insertUser(user))
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    error.Visible = true;
                }
            }
        }
        /*
            VALIDATION 
        */
        protected void ConfirmPassword_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (!ConfirmPassword.Text.Trim().Equals(Password.Text.Trim()))
            {
                args.IsValid = false;
                confirmPasswordValidator.Text = "<b>Re-enter Password</b> not same with Password.";
            }
            else
            {
                args.IsValid = true;
                
            }
        }

        protected void Password_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Password.Text.Length > 128)
            {
                args.IsValid = false;
                PasswordValidator.Text = "<b>Password</b> cannot more than 128 characters.";
            }else if (Name.Text.Contains(Email.Text))
            {
                args.IsValid = false;
                PasswordValidator.Text = "<b>Password</b> characters cannot contains in name.";
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void Email_ServerValidate(object source, ServerValidateEventArgs args)
        {
            UserDB db = new UserDB();
            if (args.Value.Trim().Length > 320)
            {
                EmailCustomValidator.ErrorMessage = "<b>Email</b> cannot more than 320 characters.";
                args.IsValid = false;
            }
            else if (!CoreDLL.CoreDLL.checkEmail(args.Value.Trim()))
            {
                EmailCustomValidator.ErrorMessage = "<b>Email</b> invalid.";
                args.IsValid = false;
            }else if (db.checkEmailExist(args.Value.Trim()))
            {
                EmailCustomValidator.ErrorMessage = "<b>Email</b> already exist.";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
                user.Email = Email.Text.Trim();
            }
            db.disconnectDB();
        }

        protected void Name_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (args.Value.Trim().Length > 320)
            {
                NameCustomValidator.ErrorMessage = "<b>Name</b> cannot more than 320 characters.";
                args.IsValid = false;
            }
            else
            {
                args.IsValid = true;
                user.Name = Name.Text.Trim();
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