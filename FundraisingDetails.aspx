<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FundraisingDetails.aspx.cs" Inherits="Finexus_Hackathon.FundraisingDetails" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Finexus Hackathon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="CSS/FundraisingDetails.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:SqlDataSource ID="SQLListingDetails" runat="server" ConnectionString="<%$ ConnectionStrings:finexus %>" SelectCommand="SELECT * FROM [Package]"></asp:SqlDataSource>
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
            <div class="position-relative mb-5">
                <img class="profile-cover img-fluid shadow" src="Images/Profile_Cover.jpg" alt="" />
                <img class="profile-img d-block mx-auto position-absolute shadow-lg" src="Images/Profile_Image.jpeg" alt="" width="100" />
            </div>

            <div class="text-center pt-6">
                <p class="m-0 mb-1 fw-bold">Lindsay Ellis</p>
                <p class="text-secondary">is supporting animal shelters</p>
            </div>

            <div class="bg-secondary my-4 p-4 text-center text-three">
                <p>
                    Animals do not deserve to be abandoned. Animals deserve love, just like us humans.
                </p>
                <p>
                    One human being may not make a significant change, but with all of us, we may stand a chance.
                </p>
                <p>#animalshelters #loveanimals #saveanimals</p>

                <button type="button" class="share_btn border-0" data-bs-toggle="modal" data-bs-target="#shareModal">
                    <img src="Images/Share.svg" alt="" />
                </button>

                <div class="modal fade" id="shareModal" tabindex="-1">
                    <div class="w-50 mx-auto modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-body d-flex justify-content-between">
                                <img src="Images/QR.svg" alt="" />
                                <img src="Images/Facebook.svg" alt="" />
                                <img src="Images/Twitter.svg" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <h1 class="text-center fw-bold">Select a package</h1>

            <asp:Repeater ID="packageDisplay" runat="server" DataSourceID="SQLListingDetails">
                <ItemTemplate>
                    <div class="card mx-auto my-4 shadow" style="width: 20rem">
                        <h5 class="py-3 text-center"><%# Eval("PackageTitle") %></h5>
                        <div class="d-flex flex-column mx-auto text-center">
                            <span class="fs-5 fw-bold"><%# Eval("PackageMinAmt")%></span>
                            <span class="text-secondary">per month</span>
                        </div>
                        <asp:Button ID="joinBtn" runat="server" Text="Join" CssClass="btn btn-primary w-60 my-3 mx-auto rounded-pill py-2" CommandName="Join" CommandArgument='<%# Eval("PackageTitle").ToString() %>' OnCommand="joinBtn_Command"/>
                        <p class="text-center m-3">
                            <%# Eval("PackageDesc") %>
                        </p>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

            <div class="card border-0 mx-auto" style="width: 20rem">
                <button type="button" class="btn btn-secondary my-3 w-60 mx-auto rounded-pill py-2">
                    See all 7 levels
                    <img src="Images/Down.svg" alt="" />
                </button>
            </div>

            <div class="d-flex justify-content-evenly mt-4 mb-5">
                <div class="d-flex flex-column text-center">
                    <span class="fw-bold">513</span>
                    <span class="text-secondary">members</span>
                </div>
                <div class="d-flex flex-column text-center">
                    <span class="fw-bold">RM 1,379</span>
                    <span class="text-secondary">amount raised</span>
                </div>
            </div>

            <div class="bg-secondary text-center py-4">
                <h3 class="fw-bold">Recent Posts by Lindsay Ellis</h3>
                <div class="card mx-auto mt-4 mb-4" style="width: 18rem">
                    <img class="card-img-" src="Images/Profile_Cover.jpg" alt="" height="200" />
                    <div class="bg-transparent position-absolute post-div w-100 py-3 px-5 d-flex flex-column">
                        <img src="Images/Lock.svg" alt="" height="50" />
                        <span class="my-3">Join as a member to unlock this post</span>
                        <button class="btn btn-secondary rounded-pill w-75 mx-4 py-2 fw-bold">
                            Join now
                        </button>
                    </div>

                    <div class="card-body">
                        <h6 class="text-start fw-bold mb-4">Love Never Dies Campaign!</h6>
                        <div class="text-start text-secondary">
                            <div class="row">
                                <div class="col">173 likes</div>
                                <div class="col"></div>
                            </div>
                            <div class="row">
                                <div class="col">28 comments</div>
                                <div class="col text-end">Nov 20, 2021</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="border-0 mx-auto" style="width: 20rem">
                    <button type="button" class="btn btn-primary w-60 my-3 mx-auto rounded-pill py-2">
                        View more posts
                    </button>
                </div>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    </form>
</body>
</html>
