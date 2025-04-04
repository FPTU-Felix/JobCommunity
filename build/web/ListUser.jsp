<%-- 
    Document   : ListUser
    Created on : Feb 24, 2025, 2:23:52 AM
    Author     : sontu
--%>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Trang quản lý - Nhân Công Sự Kiện</title>
        <meta name="description" content="">
        <meta name="keywords" content="">
        <!-- Favicons -->
        <link href="/IMG/Logo.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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

    <body class="index-page">

        <%@include file="Header.jsp" %>
        <main class="main">
            <!-- Services Section -->     
            <section id="services" class="services section light-background">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Người dùng</h2>
                </div>
                <div class="container">
                    <div class="row">
                        <c:forEach items="${listAllUser}" var="l">
                            <div class="col-lg-4 col-md-6">
                                <div class="job-card">
                                    <p><strong>Mã hệ thống: </strong> ${l.userID}</p>
                                    <p><strong>Tài khoản:</strong> ${l.userName}</p>
                                    <p><strong>Mật Khẩu:</strong> ${l.password}</p>
                                    <p><strong>Email:</strong> ${l.email}</p>
                                    <p><strong>Họ và Tên</strong> ${l.fullName}</p>
                                    <p><strong>Số điện thoại:</strong> ${l.phone}</p>
                                    <c:choose>
                                        <c:when test="${l.userType == 0}">
                                            <p><strong>Loại tài khoản:</strong> Là Admin</p>
                                        </c:when>
                                        <c:when test="${l.userType == 1}">
                                            <p><strong>Loại tài khoản:</strong> Đã xác thực</p>
                                        </c:when>
                                        <c:when test="${l.userType == 2}">
                                            <p><strong>Loại tài khoản:</strong> Chưa xác thực</p>
                                        </c:when>
                                    </c:choose>
                                    <a href="user_detail_for_admin?userID=${l.userID}" class="btn btn-primary">Chi tiết</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
        </main>
        <style>
            .job-card {
                background: #fff;
                border: 1px solid #ddd;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: transform 0.2s ease-in-out;
            }

            .job-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            }

            .job-card h3 {
                font-size: 18px;
                color: #333;
                margin-bottom: 10px;
            }

            .job-card p {
                font-size: 14px;
                color: #666;
                margin: 5px 0;
            }

            .job-card .btn {
                display: inline-block;
                margin-top: 10px;
                padding: 8px 12px;
                background: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 5px;
                text-align: center;
            }

            .job-card .btn:hover {
                background: #0056b3;
            }

        </style>
        <%@include file="Footer.jsp" %>
    </body>

</html>
