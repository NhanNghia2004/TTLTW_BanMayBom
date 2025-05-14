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
    <link rel="stylesheet" href="assets/css/card.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
            crossorigin="anonymous"></script>
    <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
            crossorigin="anonymous"
    />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="assets/css/index.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="assets/js/index.js"></script>

    <link rel="stylesheet" href="assets/css/headerAndFooter.css">
</head>
<body style="background-color: rgb(242 244 247)">
<header id="header"></header>
<div
        class="container d-flex justify-content-between align-items-center py-4">
    <a href="/DoAnLTWeb/index.jsp" class="head-title">AquaTech</a>
    <form action="Search" method="get" class="d-flex position-relative">
        <input id="searchInput" name="search" type="search" class="form-control me-2" placeholder="Search..." style="width: 300px">
        <input type="submit" value="Search" class="btn bg-dark-blue text-light">
        <div id="suggestions" class="position-absolute bg-white border rounded" style="top: 100%; width: 300px; z-index: 1000;"></div>
    </form>
</div>
<nav id="nav"></nav>
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="border p-3">
                <div class="row">
                    <c:forEach items="${sall}" var="s">
                        <div class="col-md-2">
                            <div class="card position-relative themenu">
                                <div class="card-body">
                                    <a href="maybomtheohang?id_supplier=${s.id}"><img src="assets/imgs/nhataitro/${s.image}"
                                                                  class=" img-fluid rounded"> </a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                <!-- phan thay doi -->
                <div class="" row pt-3>
                    <div class="col-md">
                        <!-- may bom khuyen mai  -->
                        <div class="container my-4" style="background-color:#162e5c">
                            <div class="row">
                                <div class="text-center">
                                    <img src="assets/imgs/khac/khuyenmai.png" class="img-fluid rounded">
                                </div>
                            </div>
                            <br>
                            <div class="row g-4" id="productList">
                                <!-- Sản phẩm sẽ được load ở đây -->
                            </div>

                        </div>
                        <!-- may bom khuyen mai  -->
                        <div class="container my-4">
                            <div class="row">
                                <h4>Máy bơm nước các loại</h4>
                            </div>
                            <div class="row mb-4">
                                <div class="col-md-auto">
                                    <p>Sắp xếp theo</p>
                                </div>
                                <div class="col-2">
                                    <select class="form-control form-select-sm" id="sortSelect">
                                        <option value="default" selected>Mặc định</option>
                                        <option value="priceHighToLow">Giá cao đến thấp</option>
                                        <option value="priceLowToHigh">Giá thấp đến cao</option>
                                        <option value="newest">Mới nhất</option>
                                    </select>
                                </div>
                            </div>

                            <div class="row g-4" id="product-container"></div>

                            <div id="pagination-container" class="pagination mt-4"></div>
                        </div>
                    </div>
                </div>
            </div>
            <footer id="footer2"></footer>
            <div id="bought-product"></div>
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
    const chonmaybom = document.getElementById("chonmaybom");
    const boughtProduct = document.getElementById("bought-product");
    fetch("./assets/component/boughtProduct.jsp")
    	.then((response) => response.text())
    	.then((html) => (boughtProduct.innerHTML = html));
    fetch("./assets/component/header.jsp")
        .then((response) => response.text())
        .then((html) => (header.innerHTML = html));
    fetch("./assets/component/footer.jsp")
        .then((response) => response.text())
        .then((html) => (footer.innerHTML = html));
    fetch("./assets/component/footer2.jsp")
        .then((response) => response.text())
        .then((html) => (footer2.innerHTML = html));
    fetch("./assets/component/nav.jsp")
        .then((response) => response.text())
        .then((html) => (nav.innerHTML = html));

</script>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        document.querySelectorAll(".addToCartForm").forEach(form => {
            form.addEventListener("submit", function (event) {
                event.preventDefault(); // Ngăn reload

                var formData = new FormData(form); // Lấy dữ liệu từ form

                $.ajax({
                    url: "/DoAnLTWeb/AddToCartServlet",
                    method: "POST",
                    data: formData,
                    processData: false, // Bắt buộc khi dùng FormData
                    contentType: false, // Bắt buộc khi dùng FormData
                    success: function (data) {
                        if (data.status === "success") {
                            alert(data.message);
                        } else {
                            alert(data.message);
                        }
                    },
                    error: function (xhr, status, error) {
                        alert("Có lỗi xảy ra, vui lòng thử lại!");
                        console.error("Lỗi:", error);
                    }
                });
            });
        });
    });
</script>
<style>
    .pagination {
        display: flex;           /* Dùng flexbox */
        justify-content: center; /* Căn giữa theo chiều ngang */
        align-items: center;     /* Căn giữa theo chiều dọc nếu cần */
        min-height: 100px;       /* Chiều cao tối thiểu, bạn chỉnh bao nhiêu tùy */
    }

    .pagination button {
        margin: 5px;
        padding: 8px 12px;
    }

    .pagination button.active {
        background-color: orange;
        color: white;
    }
</style>
<script src="assets/js/nav.js"></script>
<script src="assets/js/find.js"></script>
<script src="assets/js/boughtProduct.js"></script>
</body>
</html>
