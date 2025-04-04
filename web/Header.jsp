<%-- 
    Document   : Header
    Created on : Feb 13, 2025, 11:03:48 PM
    Author     : sontu
--%>
<!DOCTYPE html>
<html>
    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>HomePage - Job Community</title>
        <meta name="description" content="">
        <meta name="keywords" content="">

        <!-- Favicons -->
        <link href="/IMG/Logo.png" rel="icon">
        <link href="/IMG/Logo.png" rel="apple-touch-icon">

        <!-- Fonts -->
        <link href="https://fonts.googleapis.com" rel="preconnect">
        <link href="https://fonts.gstatic.com" rel="preconnect" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&family=Raleway:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Nunito:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Main CSS File -->
        <link href="assets/css/main.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: Company
        * Template URL: https://bootstrapmade.com/company-free-html-bootstrap-template/
        * Updated: Aug 07 2024 with Bootstrap v5.3.3
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>
    <body>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

        <header id="header" class="header d-flex align-items-center sticky-top">
            <div class="container position-relative d-flex align-items-center">
                <a href="Home.jsp" class="logo d-flex align-items-center me-auto">
                    <img src="IMG/Logo.png" alt="">
                    <h1 class="sitename">Nhân Công Sự Kiện</h1>
                </a>

                <nav id="navmenu" class="navmenu">
                    <ul>
                        <li><a href="home" class="active">Trang chủ</a></li>
                        <li><a href="Introduction.jsp">Giới thiệu</a></li>
                        <li><a href="list_post_controller">Bài Đăng</a></li>
                        <!--                        <li><a href="list_user_message">Nhắn tin</a></li>-->
                        <li><a href="list_post_by_user?userID=${sessionScope.user.userID}">Bài đăng của tôi</a></li>
                        <!-- Kiểm tra nếu đã đăng nhập thì hiển thị dropdown -->
                        <c:if test="${not empty sessionScope.user}">
                            <li class="dropdown">
                                <a href="user_profile?userID=${sessionScope.user.userID}">
                                    <span>Xin Chào ${sessionScope.user.fullName}</span> 
                                    <i class="bi bi-chevron-down toggle-dropdown"></i>
                                </a>
                                <ul>
                                    <li><a href="user_profile?userID=${sessionScope.user.userID}">Thông tin cá nhân</a></li>
                                    <li><a href="logout">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.user.userType == 0}">
                            <li><a href="list_user">Danh sách người dùng</a></li>
                            </c:if>
                    </ul>
                    <i class="mobile-nav-toggle d-xl-none bi bi-list"></i>
                </nav>

                <div class="header-social-links">
                    <a href="https://www.facebook.com/profile.php?id=61571828608133" class="facebook"><i class="bi bi-facebook"></i></a>
                    <a href="https://www.tiktok.com/@nhancongtoiuu?_t=ZS-8u90jLgq45X&_r=1" class="twitter"><i class="bi bi-tiktok"></i></a>
                </div>

                <!-- Nếu chưa đăng nhập, hiển thị nút đăng nhập -->
                <c:if test="${empty sessionScope.user}">
                    <a href="Login.jsp" class="btn login-btn ms-3">Đăng nhập</a>
                </c:if>
            </div>
        </header>


        <style>
            .login-btn {
                background-color: rgb(30, 50, 186) !important;
                color: white !important;
                border: none;
                padding: 8px 16px;
                border-radius: 5px;
                transition: 0.3s;
                font-family: "Roboto", sans-serif;
            }

            .login-btn:hover {
                background-color: rgb(62, 112, 186) !important; /* Màu tối hơn khi hover */
            }

        </style>
    </body>
</html>
