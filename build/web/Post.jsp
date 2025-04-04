<%-- 
    Document   : Post
    Created on : Feb 13, 2025, 10:50:43 PM
    Author     : sontu
--%>
<!DOCTYPE html>
<html lang="en">
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Post - Job Community</title>
        <meta name="description" content="">
        <meta name="keywords" content="">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
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

    <body class="blog-page">
        <%@include file="Header.jsp" %>
        <main class="main">

            <!-- Page Title -->
            <div class="page-title accent-background">
                <div class="container d-lg-flex justify-content-between align-items-center">
                    <h1 class="mb-2 mb-lg-0">Bài Đăng</h1>
                    <nav class="breadcrumbs">
                        <ol>
                            <li><a href="home">Trang chủ</a></li>
                            <li class="current">Bài Đăng</li>
                                <c:if test="${sessionScope.user != null}">
                                <li>
                                    <a href="prepare_create_new_post" class="btn-create-post">Tạo Bài Đăng</a>
                                </li>
                            </c:if>

                        </ol>
                    </nav>
                </div>
            </div>
            <style>
                .breadcrumbs ol {
                    display: flex;
                    align-items: center;
                    gap: 10px;
                }

                .breadcrumbs ol li {
                    list-style: none;
                }

                .breadcrumbs ol li a.btn-create-post {
                    background-color: #007bff;
                    color: white;
                    padding: 6px 15px;
                    border-radius: 6px;
                    font-weight: bold;
                    text-decoration: none;
                    transition: background 0.3s ease;
                }

                .breadcrumbs ol li a.btn-create-post:hover {
                    background-color: #0056b3;
                }
                .btn-create-post {
                    display: inline-block;
                    padding: 10px 20px;
                    background-color: #007bff; /* Màu xanh dương */
                    color: #fff;
                    font-size: 16px;
                    font-weight: bold;
                    text-decoration: none;
                    border-radius: 8px;
                    transition: background-color 0.3s ease, transform 0.2s ease;
                }

                .btn-create-post:hover {
                    background-color: #0056b3; /* Màu xanh đậm hơn khi hover */
                    transform: scale(1.05);
                }

                .btn-create-post:active {
                    background-color: #003f7f;
                    transform: scale(0.95);
                }


            </style>
            <!-- End Page Title -->

            <!-- Blog Posts Section -->
            <div class="wrapper">
                <section id="blog-filters" class="blog-filters section">
                    <div class="container">
                        <form action="list_post_controller" method="get" class="row g-3">
                            <div class="col-md-3">
                                <label for="workType" class="form-label">Loại công việc:</label>
                                <select class="form-control" id="workType" name="workType">
                                    <c:forEach var="f" items="${listWorkType}">
                                        <option value="${f.typeName}">${f.typeName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-md-3">
                                <label for="dateStarted">Ngày bắt đầu:</label>
                                <input type="date" id="dateStarted" name="dateStarted" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <label for="dateStarted">Lương:</label>
                                <input type="number" id="salary" name="salary" class="form-control">
                            </div>
                            <div class="col-md-3">
                                <label for="startTime">Từ</label>
                                <select class="form-control" id="startTime" name="startTime">
                                    <option value="">All</option>
                                    <option value="1h">1h</option>
                                    <option value="2h">2h</option>
                                    <option value="3h">3h</option>
                                    <option value="4h">4h</option>
                                    <option value="5h">5h</option>
                                    <option value="6h">6h</option>
                                    <option value="7h">7h</option>
                                    <option value="8h">8h</option>
                                    <option value="9h">9h</option>
                                    <option value="10h">10h</option>
                                    <option value="11h">11h</option>
                                    <option value="12h">12h</option>
                                    <option value="13h">13h</option>
                                    <option value="14h">14h</option>
                                    <option value="15h">15h</option>
                                    <option value="16h">16h</option>
                                    <option value="17h">17h</option>
                                    <option value="18h">18h</option>
                                    <option value="19h">19h</option>
                                    <option value="20h">20h</option>
                                    <option value="21h">21h</option>
                                    <option value="22h">22h</option>
                                    <option value="23h">23h</option>
                                    <option value="24h">24h</option>
                                </select>
                                <label for="endTime">Đến</label>
                                <select class="form-control" id="endTime" name="endTime">
                                    <option value="">All</option>
                                    <option value="1h">1h</option>
                                    <option value="2h">2h</option>
                                    <option value="3h">3h</option>
                                    <option value="4h">4h</option>
                                    <option value="5h">5h</option>
                                    <option value="6h">6h</option>
                                    <option value="7h">7h</option>
                                    <option value="8h">8h</option>
                                    <option value="9h">9h</option>
                                    <option value="10h">10h</option>
                                    <option value="11h">11h</option>
                                    <option value="12h">12h</option>
                                    <option value="13h">13h</option>
                                    <option value="14h">14h</option>
                                    <option value="15h">15h</option>
                                    <option value="16h">16h</option>
                                    <option value="17h">17h</option>
                                    <option value="18h">18h</option>
                                    <option value="19h">19h</option>
                                    <option value="20h">20h</option>
                                    <option value="21h">21h</option>
                                    <option value="22h">22h</option>
                                    <option value="23h">23h</option>
                                    <option value="24h">24h</option>
                                </select>
                            </div>
                            <div class="col-md-3 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary w-100">Lọc</button>
                            </div>
                        </form>
                    </div>
                </section>

                <div class="content">
                    <p style="color: red">Lưu ý: Xác thực tài khoản trước khi tham gia hoạt động!</p>
                    <!-- Nội dung bài đăng khác -->
                </div>
            </div>

            <style>
                .blog-filters {
                    padding: 25px;
                    background: #ffffff;
                    border-radius: 12px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                }

                .blog-filters .container {
                    max-width: 1200px;
                }

                .blog-filters .form-label {
                    font-weight: 600;
                    font-size: 14px;
                    margin-bottom: 5px;
                }

                .blog-filters .form-control {
                    border-radius: 8px;
                    border: 1px solid #ddd;
                    padding: 10px;
                    font-size: 16px;
                    transition: all 0.3s ease-in-out;
                }

                .blog-filters .form-control:focus {
                    border-color: #007bff;
                    box-shadow: 0 0 6px rgba(0, 123, 255, 0.3);
                }

                .blog-filters .row {
                    display: flex;
                    flex-wrap: wrap;
                    gap: 15px;
                }

                .blog-filters .col-md-3 {
                    flex: 1;
                    min-width: 220px;
                }

                .blog-filters select.form-control {
                    appearance: none;
                    background-image: url("data:image/svg+xml;charset=UTF-8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='%23999' class='bi bi-chevron-down' viewBox='0 0 16 16'%3E%3Cpath fill-rule='evenodd' d='M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 1 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z'/%3E%3C/svg%3E");
                    background-repeat: no-repeat;
                    background-position: right 12px center;
                    background-size: 14px;
                    padding-right: 35px;
                }

                .blog-filters .btn-primary {
                    padding: 10px;
                    font-size: 16px;
                    font-weight: 600;
                    border-radius: 8px;
                    transition: all 0.3s ease-in-out;
                }

                .blog-filters .btn-primary:hover {
                    transform: scale(1.05);
                }

                @media (max-width: 768px) {
                    .blog-filters .row {
                        flex-direction: column;
                        gap: 10px;
                    }

                    .blog-filters .col-md-3 {
                        width: 100%;
                    }

                    .blog-filters .d-flex {
                        justify-content: center;
                    }
                }

            </style>
            <c:if test="${empty listAllActivePost}">
                <div class="d-flex justify-content-center align-items-center" style="height: 200px;">
                    <p class="text-muted fs-5">Không có bài đăng nào phù hợp</p>
                </div>
            </c:if>
            <!-- Danh sách bài viết -->
            <section id="blog-posts" class="blog-posts section">
                <div class="container">
                    <div class="row gy-4">
                        <c:forEach items="${listAllActivePost}" var="lp">
                            <div class="col-lg-4">
                                <article class="position-relative h-100">
                                    <div class="post-img position-relative overflow-hidden">
                                        <img src="${lp.img}" class="img-fluid" alt="Image Job">
                                    </div>

                                    <div class="post-content d-flex flex-column">
                                        <h3 class="post-title">${lp.title}</h3>

                                        <div class="meta d-flex align-items-center">
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-arrow-bar-right"></i> <span class="ps-2">${lp.dateStarted}</span>
                                            </div>
                                            <span class="px-3 text-black-50">/</span>
                                            <div class="d-flex align-items-center">
                                                <i class="bi bi-clock"></i> <span class="ps-2">${lp.timeDuration}</span>
                                            </div>
                                        </div>
                                        <p>${lp.description}</p>
                                        <hr>
                                        <a href="post_detail?id=${lp.postID}" class="readmore stretched-link">
                                            <span>Read More</span><i class="bi bi-arrow-right"></i>
                                        </a>
                                    </div>
                                </article>
                            </div><!-- End post list item -->
                        </c:forEach>
                    </div>
                </div>
            </section>
            <!-- Blog Pagination Section -->
        </main>
        <%@include file="Footer.jsp" %>
    </body>

</html>
