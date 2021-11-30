<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Finexus_Hackathon.Registration" %>
<%@ Import Namespace="Finexus_Hackathon.Database" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Finexus Hackathon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="~/CSS/Registration.css" />
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
        <header class="shadow-sm">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <!-- TODO: Link to homepage -->
                <a class="navbar-brand" href="dashboard.aspx">
                    <img src="Images/Logo.svg" alt="" height="24" />
                </a>
                <%
                        if (Session["login"] == null)
                        {
                    %>
                    <a class="fs-6" href="Login.aspx">Login</a>
                    <%
                        }
                        else
                        {
                            UserDB db = new UserDB();
                            String name = "";
                            Boolean isFundraiser = db.isFundraiser(Session["login"].ToString(), out name);
                    %>
                    <a class="d-flex" href="<%= isFundraiser==true?"FundraiserProfile.aspx":"UserProfile.aspx" %>">
                        <span class="align-middle pe-2"><%= name %></span>
                        <img class="d-block" src="Images/Person.svg" alt="" weight="24" />
                    </a>
                    <%

                        }%>
            </div>
            </nav>
        </header>

        <main>
            <img class="w-100 mx-auto mt-4 mb-3" src="Images/Logo.svg" alt="" height="110" />
            <h1 class="text-center mb-4">Registration</h1>
            <asp:Label ID="error" runat="server" Text="Failed to register the account, Reason: Database Error" Visible="false" CssClass="invalid-message"></asp:Label>
            <%-- @ Backend: Start of registration form --%>
            <div class="input-group my-3 w-75 mx-auto">
                <span class="input-group-text" id="basic-addon1">
                    <img src="Images/Person.svg" alt="" />
                </span>
                 <asp:TextBox ID="Name" class="form-control py-2" placeholder="Name" aria-label="Name" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="NameRequiredValidator" runat="server" ErrorMessage="Name cannot be empty!" controlToValidate="Name" CssClass="invalid-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="NameCustomValidator" runat="server" CssClass="invalid-message" ControlToValidate="Name" OnServerValidate="Name_ServerValidate" Display="Dynamic"></asp:CustomValidator>
            </div>

            <div class="input-group mb-4 w-75 mx-auto">
                <span class="input-group-text">
                    <img src="Images/Email.svg" alt="" />
                </span>
                <asp:TextBox ID="Email" class="form-control py-2" placeholder="Email" aria-label="Email" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequiredValidator" runat="server" ErrorMessage="Email cannot be empty!" controlToValidate="Email" CssClass="invalid-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="EmailCustomValidator" runat="server" CssClass="invalid-message" ControlToValidate="Email" OnServerValidate="Email_ServerValidate" Display="Dynamic"></asp:CustomValidator>
            </div>

            <div class="input-group mb-3 w-75 mx-auto">
                <span class="input-group-text">
                    <img src="Images/Password.svg" alt="" />
                </span>
                <asp:TextBox ID="Password" class="form-control py-2" placeholder="Password" aria-label="Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequiredValidator" runat="server" ErrorMessage="Password cannot be empty!" controlToValidate="Password" CssClass="invalid-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="PasswordValidator" runat="server" CssClass="invalid-message" ControlToValidate="Password" OnServerValidate="Password_ServerValidate" Display="Dynamic"></asp:CustomValidator>
            </div>

            <div class="input-group mb-3 w-75 mx-auto">
                <span class="input-group-text">
                    <img src="Images/Password.svg" alt="" />
                </span>
                <asp:TextBox ID="ConfirmPassword" class="form-control py-2" placeholder="Re-enter Password" aria-label="Re-enter Password" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="confirmPasswordRequiredValidator" runat="server" ErrorMessage="Re-enter Password cannot be empty!" controlToValidate="ConfirmPassword" CssClass="invalid-message" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="confirmPasswordValidator" runat="server" CssClass="invalid-message" ControlToValidate="ConfirmPassword" OnServerValidate="ConfirmPassword_ServerValidate" Display="Dynamic"></asp:CustomValidator>
            </div>
            <asp:Button type="button" class="btn btn-primary w-75 ms-5 rounded-pill py-2" ID="registerBtn" runat="server" Text="Register" OnClick="registerBtn_Click"/>
            <%-- @ Backend Team: End of registration form --%>

            <div class="text-center my-3">
                <span>Already have an account?</span>
                <a class="ms-1" href="Login.aspx">Login here</a>
            </div>

            <div class="strike">
                <span>OR</span>
            </div>

            <button type="button" class="btn btn-secondary w-75 ms-5 rounded-pill py-2 mt-3 position-relative">
                <img src="Images/Google.svg" alt="" width="28" />
                Sign up with Google
            </button>

            <button type="button" class="btn btn-secondary w-75 ms-5 rounded-pill py-2 mt-4 position-relative">
                <img src="Images/Facebook.svg" alt="" />
                Sign up with Facebook
            </button>
        </main>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
