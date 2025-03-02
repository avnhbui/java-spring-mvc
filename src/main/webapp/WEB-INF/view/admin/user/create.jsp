<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="Hỏi Dân IT - Dự án laptopshop" />
                <meta name="author" content="Hỏi Dân IT" />
                <title>Dashboard - Hỏi Dân IT</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>

                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Users</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/user">User</a></li>
                                    <li class="breadcrumb-item active">Create User</li>

                                </ol>
                                <div class="container mt-5">
                                    <div class="row justify-content-center">
                                        <div class="col-md-6">
                                            <h1>Create a user</h1>
                                            <hr>
                                            <form:form method="post" action="/admin/user/create"
                                                modelAttribute="newUser" class="row" enctype="multipart/form-data">
                                                <div class="mb-3 col-md-6 col-12">
                                                    <label for="exampleInputEmail1" class="form-label">Email
                                                        address</label>
                                                    <form:input type="email" class="form-control" path="email" />
                                                </div>

                                                <div class="mb-3 col-md-6 col-12">
                                                    <label for="exampleInputPassword1"
                                                        class="form-label">Password</label>
                                                    <form:input type="password" class="form-control" path="password" />
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <label for="exampleInputfullName1" class="form-label">Your Full
                                                        Name</label>
                                                    <form:input type="text" class="form-control" path="fullName" />
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <label for="exampleInputAddress1" class="form-label">Your
                                                        Address</label>
                                                    <form:input type="text" class="form-control" path="address" />
                                                </div>
                                                <div class="mb-3">
                                                    <label for="exampleInputPhone1" class="form-label">Your
                                                        Phone</label>
                                                    <form:input type="tel" class="form-control" path="phone" />
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <label for="exampleInputPhone1" class="form-label">Your
                                                        Role:</label>
                                                    <form:select class="form-select" path="role.name">
                                                        <form:option value="ADMIN">Admin</form:option>
                                                        <form:option value="USER">User</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <label for="avatarFile" class="form-label">Input
                                                        file</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".jpg, .png, .jpeg" name="vanhbuiFile">
                                                </div>
                                                <div>
                                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                        id="avatarPreview">
                                                </div>
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-primary">Submit</button>
                                                </div>
                                            </form:form>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </main>
                        <jsp:include page="../layout/footer.jsp" />
                    </div>
                </div>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="js/scripts.js"></script>

            </body>

            </html>