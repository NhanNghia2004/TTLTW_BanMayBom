<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Document</title>
    <link rel="stylesheet" href="assets/css/style.css"/>
    <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
            rel="stylesheet"
    />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            crossorigin="anonymous"
    />
</head>
<body>
<header id="header"></header>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="border p-3">
                <div id="header2"></div>
                <nav id="nav"></nav>
                <!-- phan thay doi -->
                <div class="col-md-12">
                    <h3 class="text-primary">Đăng nhập</h3>
                    <div class="login-container">
                        <h2>Welcome back!</h2>
                        <p class="text-muted">Đơn giản hóa quy trình làm việc của bạn và tăng năng suất với ứng dụng của
                            chúng tôi. Bắt đầu miễn phí</p>
                        <form action="LoginController" method="post">
                            <div class="mb-3">
                                <input type="text" id="username" name="username" class="form-control" placeholder="Username">
                            </div>
                            <div class="mb-3 position-relative">
                                <input type="password" id="password" name="password" class="form-control" placeholder="Password">
                                <a href="#" class="position-absolute end-0 me-3 mt-2 text-decoration-none"
                                   style="top: 0; bottom: 0; margin-top: auto; margin-bottom: auto;"><i
                                        class="fa-solid fa-eye"></i></a>
                            </div>
                            <div class="mb-3 text-end">
                                <a href="laylaimatkhau.jsp" class="text-decoration-none">Forgot Password?</a>
                            </div>
                            <button type="submit" class="btn btn-dark w-100 mb-3">Login</button>
                        </form>

                        <div class="text-center">or continue with</div>

                        <div class="text-center">
                            <button type="button" class="btn btn-light btn-social"><i
                                    class="fa-brands fa-square-facebook"></i></button>
                            <button type="button" class="btn btn-light btn-social"><i class="fa-brands fa-google"></i>
                            </button>
                            <button type="button" class="btn btn-light btn-social"><i class="fa-brands fa-apple"></i>
                            </button>
                        </div>

                        <div class="mt-3">
                            <span class="text-muted">Not a member? </span><a href="dangki.jsp"
                                                                             class="text-decoration-none">Register
                            now</a>
                        </div>
                    </div>
                    <footer id="footer2"></footer>
                </div>
            </div>
        </div>
    </div>
</div>
<footer id="footer"></footer>
<script>
    const header = document.getElementById("header");
    const footer = document.getElementById("footer");
    const header2 = document.getElementById("header2");
    const footer2 = document.getElementById("footer2");
    const nav = document.getElementById("nav");
    const tintuc = document.getElementById("tintuc");
    const chonmaybom = document.getElementById("chonmaybom");
    fetch("./assets/component/header.jsp")
        .then((response) => response.text())
        .then((html) => (header.innerHTML = html));
    fetch("./assets/component/footer.jsp")
        .then((response) => response.text())
        .then((html) => (footer.innerHTML = html));
    fetch("./assets/component/footer2.jsp")
        .then((response) => response.text())
        .then((html) => (footer2.innerHTML = html));
    fetch("./assets/component/header2.jsp")
        .then((response) => response.text())
        .then((html) => (header2.innerHTML = html));
    fetch("./assets/component/nav.jsp")
        .then((response) => response.text())
        .then((html) => (nav.innerHTML = html));
    fetch("./assets/component/tintuc.jsp")
        .then((response) => response.text())
        .then((html) => (tintuc.innerHTML = html));
    fetch("./assets/component/chonmaybom.jsp")
        .then((response) => response.text())
        .then((html) => (chonmaybom.innerHTML = html));
</script>
</body>
</html>
