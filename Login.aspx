<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Finexus_Hackathon.Login" %>
<%@ Import Namespace="Finexus_Hackathon.Database" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Finexus Hackathon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="CSS/Login.css" />
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
            <img class="w-100 mx-auto mt-5 mb-3" src="Images/Logo.svg" alt="" height="110" />
            <h1 class="text-center mb-4">Login</h1>
            <%-- @ Backend: Start of login form --%>
            <div class="input-group mb-4 w-75 mx-auto">
                <span class="input-group-text">
                    <img src="Images/Email.svg" alt="" />
                </span>
                <asp:TextBox ID="email" runat="server" CssClass="form-control py-2" aria-label="Email" placeholder="Email"></asp:TextBox>
            </div>

            <div class="input-group mb-3 w-75 mx-auto">
                <span class="input-group-text">
                    <img src="Images/Password.svg" alt="" />
                </span>
                <asp:TextBox ID="password" runat="server" CssClass="form-control py-2" aria-label="Password" placeholder="Password" TextMode="Password"></asp:TextBox>
            </div>

            <!--@Frontend Team: Please do help adjust the error messages here-->
            <%
                if (Session["errorMsg"] != null)
                {

                %>
            <p class="ms-5 mb-3 text-danger">Invalid User ID or password.</p>
            <%
                }
                %>
            <!--@Frontend Team: End of Error Message-->

            <div class="form-check col ms-5 mb-3">
                <input type="checkbox" class="form-check-input" id="flexCheckDefault"/>
                <label class="form-check-label" for="flexCheckDefault">
                    Remember Me
                </label>
            </div>

            <!-- NOTE: Frontend Team has removed the forget password feature -->
            <asp:Button ID="loginBtn" runat="server" Text="Login" CssClass="btn btn-primary w-75 ms-5 rounded-pill py-2" OnClick="loginBtn_Click" />
            <%-- @ Backend Team: End of login form --%>

            <div class="text-center my-4">
                <span>Need an account?</span>
                <a class="ms-1" href="Registration.aspx">Sign up here</a>
            </div>

            <div class="strike">
                <span>OR</span>
            </div>

            <button type="button" class="btn btn-secondary w-75 ms-5 rounded-pill py-2 mt-3 position-relative">
                <img src="Images/Google.svg" alt="" width="28" />
                Sign in with Google
            </button>

            <button type="button" class="btn btn-secondary w-75 ms-5 rounded-pill py-2 mt-4 position-relative">
                <img src="Images/Facebook.svg" alt="" />
                Sign in with Facebook
            </button>
        </main>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
