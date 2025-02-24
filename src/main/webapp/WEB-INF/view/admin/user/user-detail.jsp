<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <!-- Latest compiled and minified CSS -->
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

            <!-- Latest compiled JavaScript -->
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        </head>

        <body>
            <div class="container mt-5">
                <div class="row">
                    <div class="col-md-12">
                        <h4>User Information</h4>
                        <hr>
                        <div class="card" style="width: 60%">
                            <div class="card-header">
                                Featured
                            </div>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">ID: ${userWithId.id}</li>
                                <li class="list-group-item">Email: ${userWithId.email}</li>
                                <li class="list-group-item">Fullname: ${userWithId.fullName}</li>
                                <li class="list-group-item">Address: ${userWithId.address}</li>

                            </ul>
                        </div>

                    </div>
                </div>
            </div>
            </div>
        </body>

        </html>