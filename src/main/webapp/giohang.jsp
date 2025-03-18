<%@ page import="com.example.doanltweb.dao.model.CartItem" %>
<%@ page import="com.example.doanltweb.dao.model.Cart" %>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/css/giohang.css">
    <link rel="stylesheet" href="assets/css/headerAndFooter.css">
</head>

<body>
<header id="header"></header>
<nav id="nav"></nav>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div class="border p-3">
                
                <div class="row pt-3">
                    <!-- phan thay doi -->
                    <div class="col">                 
                        <%
                            Cart cart = (Cart) session.getAttribute("cart");
                            double totalPrice = cart != null ? cart.getTotalPrice() : 0;
                            int totalQuantity = cart != null ? cart.getTotalQuantity() : 0;
                        %>

                        	<div class="container mt-2">
							<h2 class="mb-2">Giỏ hàng của bạn</h2>
							<div class="table-responsive">
								<table class="table table-bordered text-center align-middle">
									<thead class="table-light">
										<tr>
											<th class="bg-dark-blue text-light">Hình ảnh</th>
											<th class="bg-dark-blue text-light">Thông tin và ngày
												giao</th>
											<th class="bg-dark-blue text-light">Đơn giá</th>
											<th class="bg-dark-blue text-light">Số lượng</th>
											<th class="bg-dark-blue text-light">Tổng</th>
											<th class="bg-dark-blue text-light"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orders}" var="order">
											<tr>
												<td><img src="assets/imgs/maybom/app10.jpg"
													class="img-fluid anhhang"
													style="width: 80px; height: auto;"></td>
												<td>
													<h5 class="mb-1">Máy bơm cao áp mini Pamtex 110</h5>
													<p class="mb-0">Ngày giao: 19/12/2024</p>
												</td>
												<td>650.000 đ</td>
												<td>10</td>
												<td>6.500.000 đ</td>
												<td>
													<button class="btn btn-danger btn-sm">Hủy đơn hàng</button>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

                        <!-- Tổng cộng và nút hành động -->
                        <div class=" align-items-center px-3">
                            <div class="text-end">
                                <p class="mb-1"><strong>Tổng số lượng:</strong> <%= totalQuantity %></p>
                                <p class="mb-1"><strong>Tổng tiền:</strong> <%= totalPrice %> đ</p>
                                <button class="btn btn-success mt-2">
                                    Tiến hành thanh toán
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <footer id="footer2"></footer>
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
    fetch("./assets/component/nav.jsp")
        .then((response) => response.text())
        .then((html) => (nav.innerHTML = html));
</script>
<script src="assets/js/nav.js"></script>
</body>
</html>
