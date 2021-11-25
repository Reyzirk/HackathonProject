<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FundraisingListing.aspx.cs" Inherits="Finexus_Hackathon.FundraisingListing" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Finexus Hackathon</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <link rel="stylesheet" href="CSS/FundraisingListing.css" />
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
                    <a class="d-flex" href="FundraiserProfile.aspx">
                        <span class="align-middle pe-2">Lindsay Ellis</span>
                        <img class="d-block" src="Images/Person.svg" alt="" weight="24" />
                    </a>
                </div>
            </div>
            </nav>
        </header>

        <main>
            <div class="w-75 mx-auto my-4">
                <input type="text" class="form-control mt-2" id="exampleInputText" placeholder="Search for creators here..." />
            </div>

            <div class="w-75 mx-auto d-flex flex-column">
                <div class="d-flex justify-content-center">
                    <p class="text-center fs-5 mb-1 fw-bold">
                        Find creators you already love.
                    </p>
                </div>
                <div class="d-flex my-2 justify-content-center">
                    <p class="text-center text-secondary">
                        Follow thousands of fundraisers and fuel their passion today!
                    </p>
                </div>
                <img class="mx-auto d-block my-3" src="Images/People_Connection.jpg" alt="" width="140" />
            </div>

            <div class="list-group my-4 mx-4 border">
                <div class="d-flex w-100 justify-content-between px-3 py-3 border border-top-0 border-start-0 border-end-0">
                    <p class="fw-bold w-100 m-0">Creators we found</p>
                </div>

                <a href="#" class="list-group-item list-group-item-action border-0" aria-current="true">
                    <div class="d-flex w-100 justify-content-between py-3">
                        <div class="d-flex">
                            <img class="profile-img shadow" src="Images/Profile_Image.jpeg" alt="" width="" />
                            <div class="d-flex flex-column ms-4 align-self-center">
                                <h5>Lindsay Ellis</h5>
                                <small class="text-secondary">Fundraiser of Chez Lindsay</small>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action border-0" aria-current="true">
                    <div class="d-flex w-100 justify-content-between py-3">
                        <div class="d-flex">
                            <img class="profile-img shadow" src="Images/Profile_Image.jpeg" alt="" width="100" />
                            <div class="d-flex flex-column ms-4 align-self-center">
                                <h5>Sterling Silver</h5>
                                <small class="text-secondary">Fundraiser of Animal Torture</small>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action border-0" aria-current="true">
                    <div class="d-flex w-100 justify-content-between py-3">
                        <div class="d-flex">
                            <img class="profile-img shadow" src="Images/Profile_Image.jpeg" alt="" width="" />
                            <div class="d-flex flex-column ms-4 align-self-center">
                                <h5>Aurum Arsenicum</h5>
                                <small class="text-secondary">Fundraiser of Argentite</small>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action border-0" aria-current="true">
                    <div class="d-flex w-100 justify-content-between py-3">
                        <div class="d-flex">
                            <img class="profile-img shadow" src="Images/Profile_Image.jpeg" alt="" width="" />
                            <div class="d-flex flex-column ms-4 align-self-center">
                                <h5>Aragorn Elessar</h5>
                                <small class="text-secondary">Fundraiser of The Gondorians</small>
                            </div>
                        </div>
                    </div>
                </a>
                <a href="#" class="list-group-item list-group-item-action border-0" aria-current="true">
                    <div class="d-flex w-100 justify-content-between py-3">
                        <div class="d-flex">
                            <img class="profile-img shadow" src="Images/Profile_Image.jpeg" alt="" width="" />
                            <div class="d-flex flex-column ms-4 align-self-center">
                                <h5>Hermione Granger</h5>
                                <small class="text-secondary">Fundraiser of S.P.E.W</small>
                            </div>
                        </div>
                    </div>
                </a>
            </div>
        </main>
    </form>
</body>
</html>
