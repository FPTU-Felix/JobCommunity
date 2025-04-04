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
                        <form action="change_avatar" method="post" enctype="multipart/form-data">
                            <div class="col-lg-12" data-aos="fade-up">
                                <div class="portfolio-description">
                                    <h2>Thông tin người dùng</h2>
                                    <div class="testimonial-item">
                                        <div class="text-center">
                                            <!-- Truyền userID từ session -->
                                            <input type="hidden" name="userID" value="${sessionScope.user.userID}">
                                            <label for="fullName" class="form-label">Họ và Tên</label>
                                            <input type="text" id="fullName" name="fullName" required><br>
                                            <!-- Chọn ảnh -->
                                            <label for="thumbnail" class="form-label">Chọn ảnh đại diện</label>
                                            <input type="file" class="form-control mt-2" id="thumbnail" name="img" 
                                                   accept="image/*" onchange="previewImage(event, 'previewThumbnail')" required>

                                            <!-- Xem trước ảnh -->
                                            <div class="preview-container mt-3">
                                                <img id="previewThumbnail" src="" alt="Ảnh xem trước" 
                                                     style="display:none; width:150px; height:150px; border-radius:50%; object-fit:cover; border:4px solid #007bff;">
                                            </div>                                     
                                            <!-- Nút tải lên -->
                                            <button class="btn btn-primary btn-sm mt-3" type="submit">Tải lên</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </section>

            <style>
                .preview-container {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    justify-content: center;
                    margin-top: 15px;
                }

                #previewThumbnail {
                    display: none;
                    width: 150px;
                    height: 150px;
                    border-radius: 50%;
                    object-fit: cover;
                    border: 4px solid #007bff;
                    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
                    transition: transform 0.3s ease-in-out;
                }

                #previewThumbnail:hover {
                    transform: scale(1.1);
                }


                /* Căn chỉnh tổng thể */
                #portfolio-details {
                    background: #f8f9fa;
                    padding: 40px 0;
                }

                .portfolio-details .container {
                    max-width: 1100px;
                    background: white;
                    padding: 30px;
                    border-radius: 10px;
                    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
                }

                /* Phần thông tin người dùng */
                .portfolio-description {
                    text-align: center;
                }

                .portfolio-description h2 {
                    font-size: 24px;
                    font-weight: bold;
                    margin-bottom: 20px;
                    color: #007bff;
                }

                /* Avatar + Tên */
                .testimonial-item {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    background: #ffffff;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                    margin-top: 10px;
                }

                .testimonial-item img {
                    width: 120px;
                    height: 120px;
                    border-radius: 50%;
                    object-fit: cover;
                    margin-bottom: 10px;
                    border: 4px solid #007bff;
                }

                .testimonial-item h3 {
                    font-size: 20px;
                    font-weight: 600;
                    color: #333;
                }

                .testimonial-item h4 {
                    font-size: 16px;
                    color: #666;
                }

                /* Phần thông tin cá nhân */
                .portfolio-info {
                    background: #f1f1f1;
                    padding: 20px;
                    border-radius: 10px;
                    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
                }

                .portfolio-info h3 {
                    font-size: 20px;
                    font-weight: bold;
                    color: #007bff;
                    margin-bottom: 15px;
                }

                .portfolio-info ul {
                    list-style: none;
                    padding: 0;
                }

                .portfolio-info ul li {
                    font-size: 16px;
                    padding: 8px 0;
                    border-bottom: 1px solid #ddd;
                }

                .portfolio-info ul li:last-child {
                    border-bottom: none;
                }

                /* Đường link */
                .portfolio-info a {
                    color: #007bff;
                    font-weight: bold;
                    text-decoration: none;
                }

                .portfolio-info a:hover {
                    text-decoration: underline;
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

