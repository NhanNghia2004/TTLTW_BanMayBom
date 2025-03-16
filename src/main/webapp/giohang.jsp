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
                        <h4 class="text-primary">GIỎ HÀNG</h4>
                        <%
                            Cart cart = (Cart) session.getAttribute("cart");
                            double totalPrice = cart != null ? cart.getTotalPrice() : 0;
                            int totalQuantity = cart != null ? cart.getTotalQuantity() : 0;
                        %>

                        <table>
                            <thead>
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Ảnh</th>
                                <th>Số lượng</th>
                                <th>Giá</th>
                                <th>Thao tác</th>
                            </tr>
                            </thead>
                            <tbody>
                            <%
                                if (cart != null) {
                                    for (CartItem item : cart.getItems()) {
                            %>
                            <tr>
                                <td><%= item.getProduct().getNameProduct() %></td>
                                <td><img src="assets/imgs/maybom/<%= item.getProduct().getImage() %>" alt="<%= item.getProduct().getNameProduct() %>" width="100" /></td>
                                <td>
                                    <form action="add" method="post">
                                        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>" />
                                        <input type="number" name="quantity" value="<%= item.getQuantity() %>" min="1" />
                                        <button type="submit" name="action" value="update">Cập nhật</button>
                                    </form>
                                </td>
                                <td><%= item.getProduct().getPriceProduct() * item.getQuantity() %></td>
                                <td>
                                    <form action="add" method="post">
                                        <input type="hidden" name="productId" value="<%= item.getProduct().getId() %>" />
                                        <button type="submit" name="action" value="remove">Xóa</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                            </tbody>
                        </table>

                        <!-- Tổng cộng và nút hành động -->
                        <div class=" align-items-center">
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
<script src="assets/js/nav.js"></script>
</body>
</html>
