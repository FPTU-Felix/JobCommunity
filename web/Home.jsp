<%-- 
    Document   : Home
    Created on : Feb 13, 2025, 10:27:01 AM
    Author     : sontu
--%>

<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">

    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>HomePage - Job Community</title>
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

            <!-- Hero Section -->
            <section id="hero" class="hero section dark-background">

                <div id="hero-carousel" class="carousel slide carousel-fade" data-bs-ride="carousel" data-bs-interval="5000">

                    <div class="carousel-item active">
                        <img src="assets/img/hero-carousel/hero-carousel-1.jpg" alt="">
                        <div class="container">
                            <h2>Đáp ứng đầy đủ nhu cầu từ nhà tuyển dụng </h2>
                            <a href="Introduction.jsp" class="btn-get-started">Xem thêm</a>
                        </div>
                    </div><!-- End Carousel Item -->

                    <div class="carousel-item">
                        <img src="assets/img/hero-carousel/hero-carousel-2.jpg" alt="">
                        <div class="container">
                            <h2>Đảm bảo lợi ích tuyệt đối cho người đi làm </h2>
                            <a href="Introduction.jsp" class="btn-get-started">Xem thêm</a>
                        </div>
                    </div><!-- End Carousel Item -->

                    <div class="carousel-item">
                        <img src="assets/img/hero-carousel/hero-carousel-3.jpg" alt="">
                        <div class="container">
                            <h2>Tối ưu về mọi mặt, đảm bảo chất lượng sự kiện
                            </h2>
                            <a href="Introduction.jsp" class="btn-get-started">Xem thêm</a>
                        </div>
                    </div><!-- End Carousel Item -->

                    <a class="carousel-control-prev" href="#hero-carousel" role="button" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
                    </a>

                    <a class="carousel-control-next" href="#hero-carousel" role="button" data-bs-slide="next">
                        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
                    </a>

                    <ol class="carousel-indicators"></ol>

                </div>

            </section><!-- /Hero Section -->
            <!-- Services Section -->     
            <section id="services" class="services section light-background">
                <div class="container section-title" data-aos="fade-up">
                    <h2>Công việc</h2>
                </div>
                <div class="container">
                    <div class="row">
                        <c:forEach items="${listPostHomePage}" var="l">
                            <div class="col-lg-4 col-md-6">
                                <div class="job-card">
                                    <h3>${l.title}</h3>
                                    <p><strong>Loại công việc:</strong> ${l.workType}</p>
                                    <p><strong>Ngày làm việc:</strong> ${l.dateStarted}</p>
                                    <p><strong>Địa điểm:</strong> ${l.place}</p>
                                    <p><strong>Lương:</strong> ${l.salary}VND</p>
                                    <p><strong>Yêu cầu:</strong> ${l.requirements}</p>
                                    <a href="post_detail?id=${l.postID}" class="btn btn-primary">Chi tiết</a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </section>
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
        </main>
        <%@include file="Footer.jsp" %>
    </body>

</html>
