<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Finexus_Hackathon.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Finexus Hackathon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="CSS/Registration.css" />
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
                <a class="fs-6" href="Login.aspx">Login</a>
            </div>
            </nav>
        </header>

        <main>
            <img class="w-100 mx-auto mt-4 mb-3" src="Images/Logo.svg" alt="" height="110" />
            <h1 class="text-center mb-4">Registration</h1>
            <%-- @ Backend: Start of registration form --%>
            <div class="input-group my-3 w-75 mx-auto">
                <span class="input-group-text" id="basic-addon1">
                    <img src="Person.svg" alt="" />
                </span>
                <input type="text" class="form-control py-2" placeholder="Name" aria-label="Name" />
            </div>

            <div class="input-group mb-4 w-75 mx-auto">
                <span class="input-group-text">
                    <img src="Images/Email.svg" alt="" />
                </span>
                <input type="text" class="form-control py-2" placeholder="Email" aria-label="Email" />
            </div>

            <div class="input-group mb-3 w-75 mx-auto">
                <span class="input-group-text">
                    <img src="Images/Password.svg" alt="" />
                </span>
                <input type="text" class="form-control py-2" placeholder="Password" aria-label="Password" />
            </div>

            <div class="input-group mb-3 w-75 mx-auto">
                <span class="input-group-text">
                    <img src="Images/Password.svg" alt="" />
                </span>
                <input type="text" class="form-control py-2" placeholder="Re-enter Password" aria-label="Re-enter Password" />
            </div>

            <button type="button" class="btn btn-primary w-75 ms-5 rounded-pill py-2">
                Register
            </button>
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
