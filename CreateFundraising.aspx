<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateFundraising.aspx.cs" Inherits="Finexus_Hackathon.CreateFundraising" %>

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
            <div class="d-flex justify-content-center mt-4 mx-3 pb-3 border-bottom">
                <img src="Images/Create_Fundraising.svg" alt="" height="55" />
                <h1 class="align-self-center ms-3">Create Fundraising</h1>
            </div>

            <div>
                <h5 class="fs-3 my-4 fw-bold text-center">Fundraising Details</h5>

                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold">
                        Title <span class="text-danger">*</span>
                    </label>
                    <input class="form-control mt-2" type="text" placeholder="My Fundraising Title" />
                </div>

                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold">
                        Description <span class="text-danger">*</span>
                    </label>
                    <textarea class="form-control mt-2" rows="3" placeholder="My Fundraising Description"></textarea>
                </div>

                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold">
                        Category of Fundraising <span class="text-danger">*</span>
                    </label>

                    <select class="form-select mt-2">
                        <option selected="selected" disabled="disabled">Select a category</option>
                        <option value="charity">Charity</option>
                        <option value="video">Video</option>
                        <option value="podcast">Podcast</option>
                        <option value="music">Music</option>
                        <option value="business">Business</option>
                        <option value="photography">Photography</option>
                        <option value="software">Software</option>
                        <option value="animation">Animation</option>
                        <option value="writing">Writing</option>
                        <option value="games">Games</option>
                        <option value="personal">Personal</option>
                        <option value="education">Education</option>
                    </select>
                </div>

                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold">
                        Amount to Raise <span class="fw-normal text-muted">(optional)</span>
                    </label>
                    <div class="input-group mt-2">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">MYR</span>
                        </div>
                        <input type="text" class="form-control" placeholder="15000.00" />
                    </div>
                </div>

                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <label class="fw-bold" for="exampleInputText">
                        Cover Photo <span class="fw-normal text-muted">(optional)</span>
                    </label>
                    <div class="position-relative">
                        <img src="https://via.placeholder.com/280x150" class="rounded mx-auto d-block mt-2 img-fluid" alt="" />
                        <button type="button" class="btn btn-secondary position-absolute image-btn w-100 h-100 bg-transparent border-0">
                            Click to upload image
                        </button>
                    </div>
                </div>

                <div class="form-group w-75 mx-auto mt-3 mb-4">
                    <div class="d-flex justify-content-between">
                        <label class="fw-bold">Donation Package</label>
                        <button type="button" class="add-btn" data-bs-toggle="modal" data-bs-target="#packageModal">
                            <img src="Images/Add.svg" alt="" />
                        </button>
                    </div>

                    <div class="modal fade" id="packageModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">
                                        Create package
                                    </h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="form-group mb-3">
                                        <label class="fw-bold" for="exampleInputText">
                                            Title <span class="text-danger">*</span>
                                        </label>
                                        <input type="text" class="form-control mt-2" id="exampleInputText" placeholder="My Package Title" />
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="fw-bold" for="exampleFormControlTextarea1">
                                            Description <span class="text-danger">*</span>
                                        </label>
                                        <textarea class="form-control mt-2" id="exampleFormControlTextarea1" rows="3" placeholder="My Package Description"></textarea>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="fw-bold">
                                            Price <span class="text-danger">*</span>
                                        </label>
                                        <div class="input-group mt-2">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text">MYR</span>
                                            </div>
                                            <input type="text" class="form-control" placeholder="15.00" />
                                        </div>
                                    </div>

                                    <div class="form-group mb-3">
                                        <label class="fw-bold" for="exampleInputText">
                                            Logo <span class="fw-normal text-muted">(optional)</span>
                                        </label>
                                        <div class="position-relative">
                                            <img src="https://via.placeholder.com/325x150" class="rounded mx-auto d-block mt-2 img-fluid" alt="" />
                                            <button type="button" class="btn btn-secondary position-absolute image-btn w-100 h-100 bg-transparent border-0">
                                                Click to upload image
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
                                        Cancel
                                    </button>
                                    <button type="button" class="btn btn-primary">
                                        Save changes
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

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
                    <input type="checkbox" class="form-check-input" />
                    <label class="form-check-label" for="exampleCheck1">
                        I agree to the <a href="#">terms and conditions</a> and
                        <a href="#">privacy policy</a> of the MinersTech
                    </label>
                </div>

                <button type="submit" class="btn btn-primary w-75 ms-5 rounded-pill py-2 mt-2 mb-5">
                    Submit
                </button>
            </div>
        </main>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous">
    </script>
</body>
</html>
