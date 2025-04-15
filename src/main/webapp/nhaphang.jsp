<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Quản lý nhập hàng</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="assets/css/admin.css" />
</head>
<body>
    <div class="d-flex" id="wrapper">
        <div id="nav" class="col-2"></div>
        <div class="container mt-4 col-10">
            <div class="card shadow-sm p-4">
                <h4 class="mb-4">
                     Quản Lý Nhập Hàng
                </h4>

                <!-- Nút chuyển đến trang nhập hàng mới -->
                <div class="mb-3 text-end">
                    <a href="nhap-hang.jsp" class="btn btn-success">
                        <i class="bi bi-plus-circle me-1"></i> Nhập hàng mới
                    </a>
                </div>

                <!-- Bảng hiển thị danh sách nhập hàng -->
                <div class="table-responsive">
                    <table class="table table-striped table-bordered align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>#</th>
                                <th>Tên sản phẩm</th>
                                <th>Danh mục</th>
                                <th>Số lượng</th>
                                <th>Giá nhập</th>
                                <th>Nhà cung cấp</th>
                                <th>Ngày nhập</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${nhapHangList}" varStatus="loop">
                                <tr>
                                    <td>${loop.index + 1}</td>
                                    <td>${item.productName}</td>
                                    <td>${item.category}</td>
                                    <td>${item.quantity}</td>
                                    <td><f:formatNumber value="${item.price}" type="currency" currencySymbol="₫"/></td>
                                    <td>${item.supplier}</td>
                                    <td><f:formatDate value="${item.date}" pattern="dd/MM/yyyy"/></td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty nhapHangList}">
                                <tr>
                                    <td colspan="7" class="text-center text-muted">Chưa có dữ liệu nhập hàng.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <script>
        const nav = document.getElementById("nav");
        fetch("./assets/component/adminNav.jsp")
            .then((response) => response.text())
            .then((html) => (nav.innerHTML = html));
    </script>
</body>
</html>
