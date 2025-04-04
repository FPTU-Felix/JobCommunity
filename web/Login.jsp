<%-- 
    Document   : Login
    Created on : Feb 13, 2025, 3:44:11 PM
    Author     : sontu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">
        <link href="assets/css/login.css" rel="stylesheet">
        <link href="assets/img/favicon.png" rel="icon">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">
    </head>
    <body>
        <section class="vh-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6 text-black">

                        <div class="px-5 ms-xl-4">
                            <i class="fas fa-crow fa-2x me-3 pt-5 mt-xl-4" style="color: #709085;"></i>
                            <span class="h1 fw-bold mb-0">Logo</span>
                        </div>

                        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

                            <form style="width: 23rem;" action="login">

                                <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Đăng nhập</h3>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <input type="text" id="form2Example18" class="form-control form-control-lg" name="username" placeholder="Tài Khoản" required/>
                                    <label class="form-label" for="form2Example18">Tài Khoản</label>
                                </div>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <input type="password" id="form2Example28" class="form-control form-control-lg" name="password" placeholder="Mật Khẩu" required/>
                                    <label class="form-label" for="form2Example28">Mật Khẩu</label>
                                </div>
                                <div class="pt-1 mb-4">
                                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-lg btn-block" type="submit">Đăng nhập</button>
                                </div>
                                <p class="small mb-5 pb-lg-2">${mess}</p>
                                <p>Chưa có tài khoản? <a href="Register.jsp" class="link-info">Đăng ký</a></p>
                                <div class="pt-1 mb-4">
                                    <a class="btn btn-info btn-lg btn-block" href="home">Về Trang Chủ</a>
                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="col-sm-6 px-0 d-none d-sm-block h-100">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img3.webp"
                             alt="Login image" class="w-100 min-vh-100" style="object-fit: cover; object-position: left;">
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>
