<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateFundraising.aspx.cs" Inherits="Finexus_Hackathon.CreateFundraising" %>
<%@ Import Namespace="Finexus_Hackathon.Database" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Finexus Hackathon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="CSS/CreateFundraising.css" />
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
            <div class="d-flex justify-content-center mt-4 mx-3 pb-3 border-bottom">
                <img src="Images/Create_Fundraising.svg" alt="" height="55" />
                <h1 class="align-self-center ms-3">Create Fundraising</h1>
            </div>

            <div>
                <h5 class="fs-3 my-4 fw-bold text-center">Fundraising Details</h5>

                <!--Fundraising Title-->
                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold">
                        Title <span class="text-danger">*</span>
                    </label>
                    <asp:TextBox ID="fundraisingTitle" runat="server" CssClass="form-control mt-2" placeholder="My Fundraising Title"></asp:TextBox>
                </div>
                <!--End of Fundraising Title-->

                <!--Fundraising Description-->
                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold">
                        Description <span class="text-danger">*</span>
                    </label>
                    <asp:TextBox ID="fundraisingDesc" TextMode="MultiLine" placeholder="My Fundraising Description" CssClass="form-control mt-2" rows="3" runat="server"></asp:TextBox>
                </div>
                <!--End of Fundraising Description-->

                <!--Fundraising Category-->
                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold">
                        Category of Fundraising <span class="text-danger">*</span>
                    </label>
                    <asp:DropDownList ID="fundraisingCategory" runat="server" CssClass="form-select mt-2">
                        <asp:ListItem Disabled="True" Selected="True" Text="Select a category" Value="invalidCategory"></asp:ListItem>
                        <asp:ListItem Text="Charity" Value="charity"></asp:ListItem>
                        <asp:ListItem Text="Video" Value="video"></asp:ListItem>
                        <asp:ListItem Text="Podcast" Value="podcast"></asp:ListItem>
                        <asp:ListItem Text="Music" Value="music"></asp:ListItem>
                        <asp:ListItem Text="Business" Value="business"></asp:ListItem>
                        <asp:ListItem Text="Photography" Value="photography"></asp:ListItem>
                        <asp:ListItem Text="Software" Value="software"></asp:ListItem>
                        <asp:ListItem Text="Animation" Value="animation"></asp:ListItem>
                        <asp:ListItem Text="Writing" Value="writing"></asp:ListItem>
                        <asp:ListItem Text="Games" Value="games"></asp:ListItem>
                        <asp:ListItem Text="Personal" Value="personal"></asp:ListItem>
                        <asp:ListItem Text="Education" Value="education"></asp:ListItem>
                    </asp:DropDownList>
                </div>
                <!--End of Fundraising Category-->

                <!--Fundraising Amount-->
                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold">
                        Amount to Raise <span class="fw-normal text-muted">(optional)</span>
                    </label>
                    <div class="input-group mt-2">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">MYR</span>
                        </div>
                        <asp:TextBox ID="fundraiseAmt" CssClass="form-control" placeholder="15000.00" runat="server"></asp:TextBox>
                    </div>
                </div>
                <!--End of fundraising amount-->

                <!--Upload Fundraising Image-->
                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold" for="exampleInputText">
                        Cover Photo <span class="fw-normal text-muted">(optional)</span>
                    </label>
                    <div class="position-relative">
                        <img src="https://via.placeholder.com/280x150" class="rounded mx-auto d-block mt-2 img-fluid" alt="" />
                        <!--@Frontend Team: Please do adjust this part of File Upload-->
                        <asp:FileUpload ID="uploadImg" runat="server" Text="Click to upload image" CssClass="btn btn-secondary position-absolute image-btn w-100 h-100 bg-transparent border-0"/>
                        <!--@End of frontend team-->
                    </div>
                </div>
                <!--End of upload image-->

                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <div class="d-flex justify-content-between">
                        <label class="fw-bold">Donation Package</label>
                        <button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#packageModal">
                            <img src="Images/Add.svg" alt="" />
                        </button>
                    </div>

                    <!--Create fundraising package-->
                    <div class="modal fade" id="packageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">
                                        Create package
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <!--Create fundraising package body-->
                                <div class="modal-body">
                                    <!--Package Title-->
                                    <div class="form-group mb-3">
                                        <label class="fw-bold" for="exampleInputText">
                                            Title <span class="text-danger">*</span>
                                        </label>
                                        <asp:TextBox ID="exampleInputText" placeholder="My Package Title" CssClass="form-control mt-2" runat="server"></asp:TextBox>
                                    </div>
                                    <!--End of Package Title-->

                                    <!--Package Description-->
                                    <div class="form-group mb-3">
                                        <label class="fw-bold" for="exampleFormControlTextarea1">
                                            Description <span class="text-danger">*</span>
                                        </label>
                                        <asp:TextBox ID="exampleFormControlTextarea1" Rows="3" placeholder="My Package Description" CssClass="form-control mt-2" runat="server"></asp:TextBox>
                                    </div>
                                    <!--End of package description-->

                                    <!--Minimum fund amount-->
                                    <div class="form-group mb-3">
                                        <label class="fw-bold">
                                            Minimum Fund Amount <span class="text-danger">*</span>
                                        </label>
                                        <div class="input-group mt-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">MYR</span>
                                            </div>
                                            <asp:TextBox ID="minFundAmt" CssClass="form-control" placeholder="15.00" runat="server"></asp:TextBox>
                                        </div>
                                    </div>
                                    <!--End of minimum fund amount-->

                                    <!--Package image-->
                                    <div class="form-group mb-3">
                                        <label class="fw-bold" for="exampleInputText">
                                            Logo <span class="fw-normal text-muted">(optional)</span>
                                        </label>
                                        <div class="position-relative">
                                            <img src="https://via.placeholder.com/325x150" class="rounded mx-auto d-block mt-2 img-fluid" alt="" />
                                            <!--@Frontend Team: Please do adjust this part of File Upload-->
                                            <asp:FileUpload ID="uploadPackageImg" CssClass="btn btn-secondary position-absolute image-btn w-100 h-100 bg-transparent border-0" Text="Click to upload image" runat="server" />
                                            <!--@End of Frontend Team-->
                                        </div>
                                    </div>
                                    <!--End of package image-->
                                </div>
                                <!--End of create fundraising package body-->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                        Cancel
                                    </button>
                                    <asp:Button ID="savePackage" runat="server" Text="Save Changes" CssClass="btn btn-primary" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End of create fundraising package-->

                    <ul class="list-group mt-2">
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <div class="ms-2 me-auto">Animal Supporter</div>
                            <div>
                                <button class="btn btn-primary border-0 bg-white px-1">
                                    <img src="Images/Edit.svg" alt="" />
                                </button>
                                <button class="btn btn-primary border-0 bg-white px-1">
                                    <img src="Images/Delete.svg" alt="" />
                                </button>
                            </div>
                        </li>
                        <li class="list-group-item d-flex justify-content-between align-items-center">
                            <div class="ms-2 me-auto">Animal Lover</div>
                            <div>
                                <button class="btn btn-primary border-0 bg-white px-1">
                                    <img src="Images/Edit.svg" alt="" />
                                </button>
                                <button class="btn btn-primary border-0 bg-white px-1">
                                    <img src="Images/Delete.svg" alt="" />
                                </button>
                            </div>
                        </li>
                    </ul>
                </div>

                <div class="form-group w-75 mx-auto my-3">
                    <label class="fw-bold">Adult Content</label>

                    <div class="form-group form-check mt-2">
                        <input type="checkbox" class="form-check-input" />
                        <label class="form-check-label" for="exampleCheck1">
                            Does the page contains any sensitive content?
                        </label>
                    </div>
                </div>

                <div class="form-group form-check w-75 mt-1 mb-4 mx-auto">
                    <asp:CheckBox ID="tncChkBox" CssClass="form-check-input" runat="server" />
                    <label class="form-check-label" for="exampleCheck1">
                        I agree to the <a href="#">terms and conditions</a> and
                        <a href="#">privacy policy</a> of MinersTech
                    </label>
                </div>

                <asp:Button ID="submitBtn" CssClass="btn btn-primary w-75 ms-5 rounded-pill py-2 mt-2 mb-5" runat="server" Text="Submit" />
            </div>
        </main>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>
</html>
