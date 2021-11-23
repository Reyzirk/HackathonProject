<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="Finexus_Hackathon.UserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Finexus Hackathon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="CSS/UserProfile.css" />
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
                    <a class="d-flex" href="UserProfile.aspx">
                        <span class="align-middle pe-2">Lindsay Ellis</span>
                        <img class="d-block" src="Images/Person.svg" alt="" weight="24" />
                    </a>
                </div>
            </div>
            </nav>
        </header>

        <main>
            <div class="position-relative mb-5">
                <img class="profile-cover img-fluid shadow" src="Images/Profile_Cover.jpg" alt="" />
                <img class="profile-img d-block mx-auto position-absolute shadow-lg" src="Images/Profile_Image.jpeg" alt="" width="100" />
            </div>

            <div class="pt-6">
                <div class="text-center">
                    <p class="m-0 mb-1 fw-bold">Lindsay Ellis</p>
                    <p class="text-secondary">Joined November 2021</p>
                </div>

                <div class="text-center">
                    <p class="m-0 mb-1 fw-bold">About Me</p>
                    <p class="text-secondary">I'm Lindsay Ellis</p>
                </div>
            </div>

            <ul class="list-group list-group-flush border my-3 py-4">
                <li class="list-group-item ps-5">
                    <img src="Images/History.svg" alt="" height="24" />
                    <%-- TODO: Add recent transactions link --%>
                    <a class="ms-4" href="#">Recent Transactions</a>
                </li>
                <li class="list-group-item ps-5">
                    <img src="Images/View_List.svg" alt="" height="24" />
                    <%-- TODO: Add view memberships link --%>
                    <a class="ms-4" href="#">View Memberships</a>
                </li>
                <li class="list-group-item ps-5">
                    <img src="Images/Bubble_Chart.svg" alt="" height="24" />
                    <%-- TODO: Add modify user details link --%>
                    <a class="ms-4" href="#">Modify User Details</a>
                </li>
                <li class="list-group-item ps-5">
                    <img src="Images/Settings.svg" alt="" height="24" />
                    <%-- TODO: Add settings link --%>
                    <a class="ms-4" href="#">Settings</a>
                </li>
                <li class="list-group-item ps-5">
                    <img src="Images/Warning.svg" alt="" height="24" />
                    <%-- TODO: Add report an issue link --%>
                    <a class="ms-4" href="#">Report an Issue</a>
                </li>
            </ul>

            <div class="text-center my-3">
                <img src="Images/Monetization_On.svg" alt="" />
                <%-- Add become fundraiser link --%>
                <a class="text-primary" href="#">I want to become a fundraiser!</a>
            </div>

            <button type="button" class="btn btn-secondary mb-3 w-75 ms-5">
                <img class="pe-2" src="Images/Power_Settings_New.svg" alt="" height="20" />
                <span class="ms-1">Logout</span>
            </button>
        </main>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>
