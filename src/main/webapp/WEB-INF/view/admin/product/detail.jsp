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
                <title>DetailProduct - VanhBui</title>
                <link href="/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                                    <li class="breadcrumb-item active">Product Detail</li>

                                </ol>
                                <div class="container mt-5">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <h4>Product Information</h4>
                                            <hr>
                                            <div class="card" style="width: 60%">
                                                <div class="card-header">
                                                    Featured
                                                </div>
                                                <ul class="list-group list-group-flush">
                                                    <li class="list-group-item">Image:
                                                        <img src="/images/product/${productWithId.image}"
                                                            style="max-width: 250px; max-height: 250px;" />
                                                    </li>
                                                    <li class="list-group-item">ID: ${productWithId.id}</li>
                                                    <li class="list-group-item">Name: ${productWithId.name}</li>
                                                    <li class="list-group-item">Price: ${productWithId.price}</li>
                                                    <li class="list-group-item">Detail Description:
                                                        ${productWithId.detailDesc}</li>
                                                    <li class="list-group-item">Short Description:
                                                        ${productWithId.shortDesc}</li>
                                                    <li class="list-group-item">Quantity: ${productWithId.quantity}</li>
                                                    <li class="list-group-item">Sold: ${productWithId.sold}</li>
                                                    <li class="list-group-item">Factory: ${productWithId.factory}</li>
                                                    <li class="list-group-item">Target: ${productWithId.target}</li>
                                                    </li>
                                                </ul>
                                            </div>

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