<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Finexus_Hackathon.Dashboard" %>
<%@ Import Namespace="Finexus_Hackathon.Database" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Finexus Hackathon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="CSS/Dashboard.css" />
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
            <div class="border mx-3 mt-4 py-4 d-flex flex-column">
                <div class="d-flex justify-content-center">
                    <span class="text-secondary">You're not following anyone yet.</span>
                </div>
                <div class="d-flex justify-content-center">
                    <span class="text-secondary">
                        <span class="fw-bold">Support</span> fellow fundraisers for more content!
                    </span>
                </div>

                <button type="button" class="btn btn-primary w-75 mx-auto rounded-pill py-2 my-4" onclick="location.href='FundraisingListing.aspx'">
                    Find fellow fundraisers
                </button>

                <img src="Images/Donations.jpg" alt="" />
            </div>

            <div class="border-top border-bottom mt-3 px-3 py-3 bg-primary">
                <div class="d-flex w-100 pb-3 position-relative">
                    <div class="d-flex">
                        <img class="profile-img shadow" src="Images/Profile_Image.jpeg" alt="" width="100" />
                        <div class="d-flex flex-column ms-3 align-self-center">
                            <div class="d-flex justify-content-between w-100">
                                <h6 class="mb-1">Sterling Silver</h6>
                                <button class="btn btn-horiz position-absolute p-0">
                                    <img src="Images/More_Horiz.svg" alt="" />
                                </button>
                            </div>
                            <small class="text-secondary">Fundraiser of Animal Lovers</small>
                        </div>
                    </div>
                </div>

                <p>Dogs are cute creatues that deserve love. Join us today!</p>
                <img class="w-100" src="Images/Dog.jpg" alt="" />
                <div class="mt-2">
                    <small class="text-secondary">
                        110,890 people contributed to this cause.
                    </small>
                </div>

                <div class="d-flex justify-content-around mt-3 post-reactions">
                    <button class="btn w-25 rounded">
                        <img src="Images/Favorite.svg" alt="" />
                    </button>
                    <button class="btn w-25 rounded">
                        <img src="Images/Insert_Comment.svg" alt="" />
                    </button>
                    <button class="btn w-25 rounded">
                        <img src="Images/Share.svg" alt="" />
                    </button>
                </div>
            </div>

            <div class="border-top border-bottom mt-3 px-3 py-3 bg-primary">
                <div class="d-flex w-100 pb-3 position-relative">
                    <div class="d-flex">
                        <img class="profile-img shadow" src="Images/Profile_Image.jpeg" alt="" width="100" />
                        <div class="d-flex flex-column ms-3 align-self-center">
                            <div class="d-flex justify-content-between w-100">
                                <h6 class="mb-1">Sterling Silver</h6>
                                <button class="btn btn-horiz position-absolute p-0">
                                    <img src="Images/More_Horiz.svg" alt="" />
                                </button>
                            </div>
                            <small class="text-secondary">Fundraiser of Animal Shelter</small>
                        </div>
                    </div>
                </div>

                <p>It's time.</p>
                <img class="w-100" src="Images/Cat.jpg" alt="" />
                <div class="mt-2">
                    <small class="text-secondary">
                        110,890 people contributed to this cause.
                    </small>
                </div>

                <div class="d-flex justify-content-around mt-3 post-reactions">
                    <button class="btn w-25 rounded">
                        <img src="Images/Favorite.svg" alt="" />
                    </button>
                    <button class="btn w-25 rounded">
                        <img src="Images/Insert_Comment.svg" alt="" />
                    </button>
                    <button class="btn w-25 rounded">
                        <img src="Images/Share.svg" alt="" />
                    </button>
                </div>
            </div>
        </main>
    </form>
</body>
</html>
