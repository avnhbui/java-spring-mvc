<%@page contentType="text/html" pageEncoding="UTF-8" %>

    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <link href="/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>

    <body>
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <h1>Hình như có gì đó sai xót</h1>
                    <div class="alert alert-danger" role="alert">
                        Không tìm thấy nguồn truy cập
                    </div>
                    <form:form method="post" action="/admin/user/delete" modelAttribute="newUser">
                        <div class="mb-3" style="display: none;">
                            <label for="exampleInputEmail1" class="form-label">Id</label>
                            <form:input value="${id}" type="text" class="form-control" path="id" />
                        </div>
                        <a href="/" class="btn btn-success">Trang chủ</a>
                    </form:form>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
            crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>

    </html>