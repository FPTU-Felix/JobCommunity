<%-- 
    Document   : IdentifyAccount
    Created on : Feb 17, 2025, 4:30:39 PM
    Author     : sontu
--%>

<%-- 
    Document   : ChangeImageProfile
    Created on : Feb 16, 2025, 7:06:23 PM
    Author     : sontu
--%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <title>Thông tin cá nhân</title>
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

    <body class="portfolio-details-page">

        <%@include file="Header.jsp" %>

        <main class="main">

            <!-- Page Title -->
            <div class="page-title accent-background">
                <div class="container d-lg-flex justify-content-between align-items-center">
                    <h1 class="mb-2 mb-lg-0">Thông tin cá nhân</h1>
                    <nav class="breadcrumbs">
                        <ol>
                            <li><a href="home">Home</a></li>
                            <li class="current">Thông tin cá nhân</li>
                        </ol>
                    </nav>
                </div>
            </div><!-- End Page Title -->

            <!-- Portfolio Details Section -->
            <section id="portfolio-details" class="portfolio-details section">
                <div class="container" data-aos="fade-up">
                    <div class="row justify-content-between gy-4 mt-4">
                        <!-- Form phải có method="post" để gửi file -->
                        <form action="identify_account" method="post" enctype="multipart/form-data">
                            <div class="col-lg-12" data-aos="fade-up">
                                <div class="portfolio-description">
                                    <h2>Thông tin người dùng</h2>
                                    <div class="testimonial-item">
                                        <div class="text-center">
                                            <!-- Truyền userID từ session -->
                                            <input type="hidden" name="userID" value="${sessionScope.user.userID}">
                                            <p class="form-label">Chọn ảnh 2 mặt CCCD để xác thực</p>
                                            <!-- Chọn ảnh -->
                                            <input type="file" class="form-control mt-2" id="CCCD1" name="img1" 
                                                   accept="image/*" onchange="previewImage(event, 'previewCCD1')" required>

                                            <!-- Xem trước ảnh -->
                                            <div class="preview-container mt-3">
                                                <img id="previewCCD1" src="" alt="Ảnh xem trước" >
                                            </div>

                                            <input type="file" class="form-control mt-2" id="CCCD2" name="img2" 
                                                   accept="image/*" onchange="previewImage(event, 'previewCCD2')" required>

                                            <!-- Xem trước ảnh -->
                                            <div class="preview-container mt-3">
                                                <img id="previewCCD2" src="" alt="Ảnh xem trước" >
                                            </div>


                                            <!-- Nút tải lên -->
                                            <button class="btn btn-primary btn-sm mt-3" type="submit">Tải lên</button><br>
                                            <ul>Đăng ký tài khoản vip:</ul> 
                                            <li>Đăng bài không giới hạn</li>
                                            <li>Ưu tiên trong mọi công việc </li>
                                            <ul> Đăng ký ngay chỉ với 39k/1tháng. Các gói đăng ký:</ul>
                                            <li> 1 tháng 39k </li>
                                            <li> 2 tháng 109k </li>
                                            <li> 3 tháng 219k </li>
                                            <p>Ngân hàng MB Bank </p>
                                            <p> Chủ tài khoản: Nguyễn Trọng Sơn</p>
                                            <p>  Mã QR:
                                            </p>
                                            <img src="IMG/maQR.jpg" alt="alt"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>

            <style>
                /* Căn giữa nội dung */
                .text-center {
                    text-align: center;
                }

                /* Ô chọn ảnh */
                .form-control {
                    width: 100%;
                    max-width: 400px;
                    margin: 0 auto;
                    display: block;
                }

                /* Container xem trước ảnh */
                .preview-container {
                    display: flex;
                    justify-content: center;  /* Căn giữa theo chiều ngang */
                    align-items: center;      /* Căn giữa theo chiều dọc */
                    margin: 10px auto;        /* Căn giữa theo chiều ngang */
                    border: 2px dashed #007bff;
                    border-radius: 8px;
                    width: 200px;
                    height: 250px;
                    overflow: hidden;
                    background-color: #f8f9fa;
                }

                /* Ảnh xem trước */
                .preview-container img {
                    max-width: 100%;
                    max-height: 100%;
                    object-fit: cover;
                }

                /* Nút tải lên */
                .btn-primary {
                    background-color: #007bff;
                    border: none;
                    padding: 8px 15px;
                    border-radius: 5px;
                    font-size: 14px;
                    cursor: pointer;
                }

                .btn-primary:hover {
                    background-color: #0056b3;
                }
            </style>
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


