<%@page contentType="text/html" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <!-- Navbar start -->
        <div class="container-fluid fixed-top">

            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="/" class="navbar-brand">
                        <h1 class="text-primary display-6">Laptopshop</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse bg-white justify-content-between mx-5" id="navbarCollapse">
                        <div class="navbar-nav ">
                            <a href="/" class="nav-item nav-link active">Trang chủ</a>
                            <a href="shop.html" class="nav-item nav-link">Sản phẩm<main></main></a>
                            <!-- <a href="shop-detail.html" class="nav-item nav-link">Shop Detail</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                            <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                <a href="cart.html" class="dropdown-item">Cart</a>
                                <a href="chackout.html" class="dropdown-item">Chackout</a>
                                <a href="testimonial.html" class="dropdown-item">Testimonial</a>
                                <a href="404.html" class="dropdown-item">404 Page</a>
                            </div>
                        </div>
                        <a href="contact.html" class="nav-item nav-link">Contact</a> -->
                        </div>
                        <div class="d-flex m-3 me-0">
                            <c:if test="${not empty pageContext.request.userPrincipal}">

                                <a href="/login" class="position-relative me-4 my-auto">
                                </a>
                                <div class="dropdown my-auto">
                                    <a href="#" class="dropdown" role="button" id="dropdownMenuLink"
                                        data-bs-toggle="dropdown" aria-expanded="false" data-bs-toggle="dropdown"
                                        aria-expanded="false">
                                        <i class="fas fa-user fa-2x"></i>
                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-end p-4" aria-labelledby="dropdownMenuLink">
                                        <li class="d-flex align-items-center flex-column" style="min-width: 300px;">
                                            <img style="width: 150px; height: 150px; border-radius: 50%; overflow: hidden;"
                                                src="/images/avatar/${sessionScope.avatar}" />
                                            <div class="text-center my-3">
                                                <c:out value="${sessionScope.fullName}" />

                                            </div>
                                        </li>

                                        <li><a class="dropdown-item" href="#">Quản lý tài khoản</a></li>

                                        <li><a class="dropdown-item" href="#">Lịch sử mua hàng</a></li>
                                        <li>
                                            <hr class="dropdown-divider">
                                        </li>
                                        <li>
                                            <form method="post" action="/logout">
                                                <button class="dropdown-item">Đăng xuất</button>
                                                <input type="hidden" name="${_csrf.parameterName}"
                                                    value="${_csrf.token}" />

                                            </form>
                                        </li>
                                    </ul>
                            </c:if>
                            <c:if test="${empty pageContext.request.userPrincipal}">
                                <a href="/login" class="position-relative me-4 my-auto">
                                    Đăng nhập
                                </a>
                            </c:if>
                        </div>
                    </div>
            </div>
            </nav>
        </div>
        </div>
        <!-- Navbar End -->