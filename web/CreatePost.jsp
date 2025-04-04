<%-- 
    Document   : CreatePost
    Created on : Feb 16, 2025, 8:04:29 PM
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

    <body class="contact-page">
        <%@include file="Header.jsp" %>
        <main class="main">

            <!-- Page Title -->
            <div class="page-title accent-background">
                <div class="container d-lg-flex justify-content-between align-items-center">
                    <h1 class="mb-2 mb-lg-0">Tạo bài đăng mới</h1>
                    <nav class="breadcrumbs">
                        <ol>
                            <li><a href="home">Trang chủ</a></li>
                            <li class="current">Tạo bài đăng</li>
                        </ol>
                    </nav>
                </div>
            </div><!-- End Page Title -->

            <!-- Contact Section -->
            <section id="contact" class="contact section">
                <div class="container" data-aos="fade">
                    <div class="row gy-5 gx-lg-5">
                        <div class="col-lg-12">
                            <form action="create_new_post" method="post" enctype="multipart/form-data" class="form-group">
                                <input type="hidden" name="userID" value="${sessionScope.user.userID}">

                                <label for="title">Tiêu đề</label>
                                <input type="text" id="title" name="Title" class="form-control" required>

                                <label for="description">Mô tả</label>
                                <textarea id="description" name="Description" class="form-control" rows="4" required></textarea>

                                <label for="img" class="form-label">Chọn ảnh đại diện</label>
                                <input type="file" class="form-control mt-2" id="img" name="img" 
                                       accept="image/*" onchange="previewImage(event, 'img-preview')" required>

                                <!-- Xem trước ảnh -->
                                <div class="preview-container mt-3">
                                    <img id="img-preview" src="" alt="Ảnh xem trước" style="max-width: 100%; display: none;">
                                </div>


                                <label for="dateStarted">Ngày bắt đầu</label>
                                <input type="date" id="dateStarted" name="dateStarted" class="form-control" required>

                                <label for="timeDuration">Thời gian làm việc</label>
                                <input type="text" id="timeDuration" name="timeDuration" class="form-control" required>

                                <label for="place">Địa điểm</label>
                                <input type="text" id="place" name="place" class="form-control" required>

                                <label for="salary">Mức lương</label>
                                <input type="number" id="salary" name="salary" class="form-control" required>

                                <label for="paymentTime">Thời gian thanh toán</label>
                                <input type="text" id="paymentTime" name="paymentTime" class="form-control" required>
                                <label for="workType" class="form-label">Loại công việc</label>
                                <select class="form-control" id="workType" name="workType">
                                    <c:forEach var="f" items="${listWorkType}">
                                        <option value="${f.typeName}">${f.typeName}</option>
                                    </c:forEach>
                                </select>
                                <label for="requirement">Yêu cầu</label>
                                <textarea id="requirement" name="requirement" class="form-control" rows="3" required></textarea>
                                <button type="submit" class="btn btn-primary mt-3">Đăng bài</button>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
            <script>
                function previewImage(input) {
                    const preview = document.getElementById('img-preview-id');

                    // Kiểm tra xem có file được chọn hay không
                    if (input.files && input.files[0]) {
                        // Hiển thị preview của hình ảnh
                        preview.src = window.URL.createObjectURL(input.files[0]);
                        preview.style.display = "block"; // Hiển thị ảnh
                    } else {
                        preview.style.display = "none"; // Ẩn ảnh nếu không có file nào
                    }
                }
                document.querySelectorAll('.size-btn').forEach(function (button) {
                    button.addEventListener('click', function () {
                        // Xóa class 'active' khỏi tất cả các nút
                        document.querySelectorAll('.size-btn').forEach(function (btn) {
                            btn.classList.remove('active');
                        });
                        // Thêm class 'active' vào nút được chọn
                        button.classList.add('active');
                        // Cập nhật giá trị của size vào input ẩn
                        document.getElementById('size-input').value = button.getAttribute('data-size');
                    });
                });
            </script>
            <script>
                function previewImage(event, previewId) {
                    const input = event.target;
                    const preview = document.getElementById(previewId);

                    if (input.files && input.files[0]) {
                        const reader = new FileReader();
                        reader.onload = function (e) {
                            preview.src = e.target.result;
                            preview.style.display = "block"; // Hiển thị ảnh
                        };
                        reader.readAsDataURL(input.files[0]); // Đọc file ảnh
                    } else {
                        preview.src = "";
                        preview.style.display = "none"; // Ẩn ảnh nếu không chọn file
                    }
                }

            </script>
        </main>

        <%@include file="Footer.jsp" %>
    </body>
</html>
