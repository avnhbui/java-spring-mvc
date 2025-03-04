<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="VanhBui - Dự án laptopshop" />
                <meta name="author" content="VanhBui" />
                <title>UpdateUser - VanhBui</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
                <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

                <script>
                    $(document).ready(() => {
                        const avatarFile = $("#avatarFile");
                        const orgImage = "${updateProduct.image}"
                        if (orgImage) {
                            const urlImage = "/images/product/" + orgImage;
                            $("#avatarPreview").attr("src", urlImage);
                            $("#avatarPreview").css({ "display": "block" });
                        }
                        avatarFile.change(function (e) {
                            const imgURL = URL.createObjectURL(e.target.files[0]);
                            $("#avatarPreview").attr("src", imgURL);
                            $("#avatarPreview").css({ "display": "block" });
                        });
                    });
                </script>
            </head>

            <body class="sb-nav-fixed">
                <jsp:include page="../layout/header.jsp" />
                <div id="layoutSidenav">
                    <jsp:include page="../layout/sidebar.jsp" />
                    <div id="layoutSidenav_content">
                        <main>
                            <div class="container-fluid px-4">
                                <h1 class="mt-4">Manage Products</h1>
                                <ol class="breadcrumb mb-4">
                                    <li class="breadcrumb-item"><a href="/admin">Dashboard</a></li>
                                    <li class="breadcrumb-item"><a href="/admin/product">Product</a></li>
                                    <li class="breadcrumb-item active">Update Product</li>

                                </ol>
                                <div class="container mt-5">
                                    <div class="row justify-content-center">
                                        <div class="col-md-6">
                                            <h1>Update product</h1>
                                            <hr>
                                            <form:form method="post" action="/admin/product/update"
                                                modelAttribute="updateProduct" class="row"
                                                enctype="multipart/form-data">
                                                <div class="mb-3" style="display: none;">
                                                    <label class="form-label">Id</label>
                                                    <form:input type="text" class="form-control" path="id" />
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <label class="form-label">Name</label>
                                                    <form:input type="text" class="form-control" path="name" />
                                                </div>
                                                <div class="mb-3 col-md-6">
                                                    <label class="form-label">Price</label>
                                                    <form:input type="number" class="form-control" path="price" />
                                                </div>
                                                <div class="mb-3 col-12">
                                                    <label class="form-label">Detail Description</label>
                                                    <form:input type="text" class="form-control" path="detailDesc" />
                                                </div>
                                                <div class="mb-3 mb-3 col-md-6">
                                                    <label class="form-label">Short Description</label>
                                                    <form:input type="text" class="form-control" path="shortDesc" />
                                                </div>
                                                <div class="mb-3 mb-3 col-md-6">
                                                    <label class="form-label"> Quantity</label>
                                                    <form:input type="number" class="form-control" path="quantity" />
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <label class="form-label">Factory:</label>
                                                    <form:select class="form-select" path="factory">
                                                        <form:option value="APPLE">Apple</form:option>
                                                        <form:option value="ASUS">Asus</form:option>
                                                        <form:option value="LENOVO">Lenovo</form:option>
                                                        <form:option value="DELL">Dell</form:option>
                                                        <form:option value="LG">LG</form:option>
                                                        <form:option value="ACER">Acer</form:option>
                                                    </form:select>
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <labelclass="form-label">Target:</label>
                                                        <form:select class="form-select" path="target">
                                                            <form:option value="GAMING">Gaming</form:option>
                                                            <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng
                                                            </form:option>
                                                            <form:option value="TKDH">Thiết kế đồ họa</form:option>
                                                            <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                                            <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                                        </form:select>
                                                </div>
                                                <div class="mb-3 col-md-6 col-12">
                                                    <label for="avatarFile" class="form-label">Input
                                                        file</label>
                                                    <input class="form-control" type="file" id="avatarFile"
                                                        accept=".jpg" name="vanhbuiFile">
                                                </div>
                                                <div>
                                                    <img style="max-height: 250px; display: none;" alt="avatar preview"
                                                        id="avatarPreview">
                                                </div>
                                                <div class="col-12 mb-5">
                                                    <button type="submit" class="btn btn-warning">Update</button>
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