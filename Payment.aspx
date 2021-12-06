<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Finexus_Hackathon.Payment" %>
<%@ Import Namespace="Finexus_Hackathon.Database" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Finexus Hackathon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="CSS/Payment.css" />
</head>
<body>
    <form id="form1" runat="server">
        <header class="shadow-sm">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <!-- TODO: Link to homepage -->
                <a class="navbar-brand" href="#">
                    <img src="Images/Logo.svg" alt="" height="24" />
                </a>
                <div>
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
            </div>
            </nav>
        </header>

        <main>
            <div class="py-4">
                <h1 class="text-center m-0 fw-bold">
                    <img src="Images/Card.svg" alt="" />
                    Payment
                </h1>
            </div>
            <div class="payment-header d-flex justify-content-center py-4">
                <img class="profile-img" src="Images/Profile_Image.jpeg" alt="" />
                <span class="fw-bold fs-4 align-self-center ms-4"><%= name %></span>
            </div>

            <div class="mx-4 my-4">
                <h3 class="text-center mb-4 fw-bold">Order Summary</h3>
                <div class="d-flex justify-content-between">
                    <span class="text-muted"><%= package.Title %></span>
                    <span class="fw-bold">RM <%= String.Format("{0:#0.00}",package.MinAmt) %></span>
                </div>
                <hr />
                <div class="d-flex flex-column align-items-end">
                    <div>
                        <span class="text-muted">Service Tax (2%)</span>
                        <span class="fw-bold ms-4">RM <%= String.Format("{0:#0.00}",package.MinAmt*0.02) %></span>
                    </div>
                    <div class="py-2">
                        <span class="text-muted fw-bold">Total</span>
                        <span class="fw-bold ms-4">RM <%= String.Format("{0:#0.00}",package.MinAmt+(package.MinAmt*0.02)) %></span>
                    </div>
                </div>
            </div>

            <h1 class="my-5 fw-bold fs-4 text-center">Select a payment method</h1>
            <div class="px-4 my-3 d-flex justify-content-between">
                <img src="Images/TNG.png" alt="" />
                <img src="Images/Visa.png" alt="" />
                <img src="Images/Paypal.png" alt="" />
            </div>

            <div class="d-flex py-5">
                <asp:Button ID="Button1" runat="server" Text="Pay Now" CssClass="btn btn-primary w-50 mx-auto rounded-pill py-2" OnClick="Button1_Click" />
            </div>
        </main>
    </form>
</body>
</html>
