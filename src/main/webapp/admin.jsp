
<%@ page import="com.example.doanltweb.dao.model.Product" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.doanltweb.dao.model.Product" %>
<%@ page import="java.util.ArrayList" %>

<%
    // Lấy danh sách sản phẩm từ request
    List<Product> products = (List<Product>) request.getAttribute("products");

    // Nếu products là null, gán nó thành một danh sách rỗng để tránh lỗi
    if (products == null) {
        products = new ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>


    <!-- FontAwesome (Chỉ tải một phiên bản) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/css/all.min.css"/>

    <!-- Bootstrap (Chỉ tải một phiên bản mới nhất) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">

    <!-- DataTables (Chỉ tải phiên bản mới nhất) -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/admin.css"/>

    <!-- jQuery (Chỉ tải một lần) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <!-- Custom JS -->
    <script src="assets/js/admin.js"></script>


    <title>admin</title>
</head>

<body>
<div class="d-flex" id="wrapper">
    <!-- Sidebar -->
    <div class="bg-white" id="sidebar-wrapper">
        <div class="sidebar-heading text-center py-4 primary-text fs-4 fw-bold text-uppercase border-bottom"><i
                class="fas fa-user-secret me-2"></i>Quản Lý
        </div>
        <div class="list-group list-group-flush my-3">
            <a href="#id1" class="list-group-item list-group-item-action bg-transparent second-text active"
               data-bs-toggle="tab" role="tab" aria-controls="home" aria-selected="true"><i
                    class="fas fa-tachometer-alt me-2"></i>Quản lý mua bán</a>
            <a href="#id2" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
               data-bs-toggle="tab" role="tab" aria-controls="home" aria-selected="true"><i
                    class="fas fa-project-diagram me-2"></i>Quản lý sản phẩm</a>
            <a href="#id3" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
               data-bs-toggle="tab" role="tab" aria-controls="home" aria-selected="true"><i
                    class="fas fa-chart-line me-2"></i>Quản lý người dùng</a>
            <a href="#id4" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
               data-bs-toggle="tab" role="tab" aria-controls="home" aria-selected="true"><i
                    class="fas fa-paperclip me-2"></i>Báo Cáo</a>
            <a href="#id5" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
               data-bs-toggle="tab" role="tab" aria-controls="home" aria-selected="true"><i
                    class="fa-solid fa-gift"></i> Bảo Hành </a>
            <a href="index.jsp" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
               aria-selected="true"><i class="fa-solid fa-power-off"></i> Thoát</a>
        </div>
    </div>
    <!-- /#sidebar-wrapper -->

    <!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="tab-content">
            <div class="tab-pane fade active show" id="id1">
                <nav class="navbar navbar-expand-lg navbar-light bg-transparent py-4 px-4">
                    <div class="d-flex align-items-center">
                        <i class="fas fa-align-left primary-text fs-4 me-3"></i>
                        <h2 class="fs-2 m-0">Quản lý mua hàng</h2>
                    </div>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                            aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle second-text fw-bold" href="#" id="navbarDropdown"
                                   role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-user me-2"></i>Nghĩa dz
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <li><a class="dropdown-item" href="#">Thông tin cá nhân</a></li>
                                    <li><a class="dropdown-item" href="#">Các cài đặt</a></li>
                                    <li><a class="dropdown-item" href="#">Đăng xuất</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </nav>

                <div class="container-fluid px-4">
                    <div class="row g-3 my-2">
                        <div class="col">
                            <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                                <div>
                                    <h3 class="fs-2">120</h3>
                                    <p class="fs-5">Số máy bơm</p>
                                </div>
                                <i class="fas fa-gift fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                            </div>
                        </div>

                        <div class="col">
                            <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                                <div>
                                    <h3 class="fs-2">500.000.000 VND</h3>
                                    <p class="fs-5">Tổng giá trị máy bơm </p>
                                </div>
                                <i class="fas fa-hand-holding-usd fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                            </div>
                        </div>
                    </div>

                    <div class="row my-5">
                        <h3 class="fs-4 mb-3">Đơn đặt hàng gần đây <span>
                            <div class="input-group w-25 my-2">
                                   <input type="text" class="form-control " placeholder="Tìm theo tên người mua...">
                            </div>
                        </span></h3>

                        <div class="col">
                            <table class="table bg-white rounded shadow-sm  table-hover">
                                <thead>
                                <tr>
                                    <th scope="col" width="50">#</th>
                                    <th scope="col">Sản Phẩm</th>
                                    <th scope="col">Khách Hàng</th>
                                    <th scope="col" class="text-center">Số lượng</th>
                                    <th scope="col">Giá</th>
                                    <th class="text-center">Hủy</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Máy bơm kangoroo</td>
                                    <td>Jonny</td>
                                    <td class="text-center">2</td>
                                    <td>1.200.000 vnd</td>
                                    <td class="text-center"><input type="checkbox"></td>
                                </tr>

                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            <%-------------------quan li san pham-------------------------%>

            <div class="tab-pane fade" id="id2">
                <div class="d-flex align-items-center m-4">
                    <i class="fas fa-box primary-text fs-4 me-3"></i>
                    <h2 class="fs-2 m-0">Quản lý sản phẩm</h2>
                </div>

                <!-- Nút thêm sản phẩm ở giữa -->
                <div class="d-flex justify-content-center align-items-center m-4">
                    <button type="button" class="btn btn-success w-100 btn-lg" data-bs-toggle="modal"
                            data-bs-target="#addProductModal">
                        Thêm sản phẩm
                    </button>
                </div>

                <!-- Tùy chỉnh vị trí "Show entries" và "Search" -->
                <div class="d-flex justify-content-between align-items-center px-4 mb-3">
                    <div id="productTable_length" class="dataTables_length"></div>
                    <div id="productTable_filter" class="dataTables_filter"></div>
                </div>

                <!-- Danh sách sản phẩm -->
                <section id="product-management" class="py-4">
                    <div class="px-4">
                        <h3 class="mb-3">Danh sách sản phẩm</h3>
                        <div class="table-responsive">
                            <table id="productTable" class="table table-striped table-bordered text-center bg-white">
                                <thead class="bg-white text-dark fw-bold">
                                <tr>
                                    <th>ID</th>
                                    <th>Tên</th>
                                    <th>Hình ảnh</th>
                                    <th>Giá</th>
                                    <th style="text-align: center">Mô tả</th>
                                    <th>Ngày sản xuất</th>
                                    <th>Công suất</th>
                                    <th>Áp suất</th>
                                    <th>Lưu lượng</th>
                                    <th>Đường kính ống</th>
                                    <th>Điện áp</th>
                                    <th>Thương hiệu</th>
                                    <th>Bảo hành (tháng)</th>
                                    <th>Tồn kho</th>
                                    <th>Danh mục</th>
                                    <th>Nhà cung cấp</th>
                                    <th>Hành động</th>
                                </tr>
                                </thead>
                                <tbody id="productBody">
                                <!-- Dữ liệu sẽ được chèn vào đây bằng Ajax -->
                                </tbody>

                            </table>
                        </div>
                    </div>


                    <!-- Modal Thêm Sản Phẩm -->
                    <div class="modal fade" id="addProductModal" tabindex="-1" aria-labelledby="addProductModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addProductModalLabel">Thêm Sản Phẩm</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="#" method="POST">
                                        <div class="mb-3 row">
                                            <label for="productName" class="col-form-label col-sm-3">Tên sản
                                                phẩm</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="productName"
                                                       name="productName"
                                                       required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productImage" class="col-form-label col-sm-3">Hình ảnh</label>
                                            <div class="col-sm-9">
                                                <input type="file" class="form-control" id="productImage"
                                                       name="productImage"
                                                       required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productPrice" class="col-form-label col-sm-3">Giá</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" id="productPrice"
                                                       name="productPrice"
                                                       required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productDescription" class="col-form-label col-sm-3">Mô
                                                tả</label>
                                            <div class="col-sm-9">
                                        <textarea class="form-control" id="productDescription" name="productDescription"
                                                  rows="3" required></textarea>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productManufactureDate" class="col-form-label col-sm-3">Ngày sản
                                                xuất</label>
                                            <div class="col-sm-9">
                                                <input type="date" class="form-control" id="productManufactureDate"
                                                       name="productManufactureDate" required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productPower" class="col-form-label col-sm-3">Công suất</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="productPower"
                                                       name="productPower"
                                                       required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productPressure" class="col-form-label col-sm-3">Áp suất</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="productPressure"
                                                       name="productPressure" required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productFlowRate" class="col-form-label col-sm-3">Lưu
                                                lượng</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="productFlowRate"
                                                       name="productFlowRate" required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productPipeDiameter" class="col-form-label col-sm-3">Đường kính
                                                ống</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="productPipeDiameter"
                                                       name="productPipeDiameter" required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productVoltage" class="col-form-label col-sm-3">Điện áp</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="productVoltage"
                                                       name="productVoltage" required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productBrand" class="col-form-label col-sm-3">Thương
                                                hiệu</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="productBrand"
                                                       name="productBrand"
                                                       required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productWarranty" class="col-form-label col-sm-3">Bảo hành
                                                (tháng)</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" id="productWarranty"
                                                       name="productWarranty" required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productStock" class="col-form-label col-sm-3">Tồn kho</label>
                                            <div class="col-sm-9">
                                                <input type="number" class="form-control" id="productStock"
                                                       name="productStock"
                                                       required>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productCategory" class="col-form-label col-sm-3">Danh
                                                mục</label>
                                            <div class="col-sm-9">
                                                <select class="form-select" id="productCategory" name="productCategory"
                                                        required>
                                                    <option value="Máy bơm">Máy bơm</option>
                                                    <!-- Add more categories as needed -->
                                                </select>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="productSupplier" class="col-form-label col-sm-3">Nhà cung
                                                cấp</label>
                                            <div class="col-sm-9">
                                                <input type="text" class="form-control" id="productSupplier"
                                                       name="productSupplier" required>
                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <button type="submit" class="btn btn-dark w-100 btn-lg">Thêm sản phẩm
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Modal Sửa Sản Phẩm -->
                    <div class="modal fade" id="editProductModal" tabindex="-1" aria-labelledby="editProductModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header text-center w-100 d-flex justify-content-center">
                                    <h5 class="modal-title" id="editProductModalLabel">Sửa Sản Phẩm</h5>
                                    <button type="button" class="btn-close position-absolute end-0 me-3"
                                            data-bs-dismiss="modal"
                                            aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <form action="#" method="POST">
                                        <input type="hidden" id="editProductId" name="productId">

                                        <div class="row mb-3">
                                            <label for="editProductName" class="col-sm-4 col-form-label">Tên sản
                                                phẩm</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="editProductName"
                                                       name="productName"
                                                       required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductImage" class="col-sm-4 col-form-label">Hình
                                                ảnh</label>
                                            <div class="col-sm-8">
                                                <input type="file" class="form-control" id="editProductImage"
                                                       name="productImage">
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductPrice" class="col-sm-4 col-form-label">Giá</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" id="editProductPrice"
                                                       name="productPrice" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductDescription" class="col-sm-4 col-form-label">Mô
                                                tả</label>
                                            <div class="col-sm-8">
                                        <textarea class="form-control" id="editProductDescription"
                                                  name="productDescription" rows="3" required></textarea>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductManufactureDate" class="col-sm-4 col-form-label">Ngày
                                                sản
                                                xuất</label>
                                            <div class="col-sm-8">
                                                <input type="date" class="form-control" id="editProductManufactureDate"
                                                       name="productManufactureDate" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductPower" class="col-sm-4 col-form-label">Công
                                                suất</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="editProductPower"
                                                       name="productPower" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductPressure" class="col-sm-4 col-form-label">Áp
                                                suất</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="editProductPressure"
                                                       name="productPressure" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductFlowRate" class="col-sm-4 col-form-label">Lưu
                                                lượng</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="editProductFlowRate"
                                                       name="productFlowRate" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductPipeDiameter" class="col-sm-4 col-form-label">Đường
                                                kính
                                                ống</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="editProductPipeDiameter"
                                                       name="productPipeDiameter" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductVoltage" class="col-sm-4 col-form-label">Điện
                                                áp</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="editProductVoltage"
                                                       name="productVoltage" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductBrand" class="col-sm-4 col-form-label">Thương
                                                hiệu</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="editProductBrand"
                                                       name="productBrand" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductWarranty" class="col-sm-4 col-form-label">Bảo hành
                                                (tháng)</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" id="editProductWarranty"
                                                       name="productWarranty" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductStock" class="col-sm-4 col-form-label">Tồn
                                                kho</label>
                                            <div class="col-sm-8">
                                                <input type="number" class="form-control" id="editProductStock"
                                                       name="productStock" required>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductCategory" class="col-sm-4 col-form-label">Danh
                                                mục</label>
                                            <div class="col-sm-8">
                                                <select class="form-select" id="editProductCategory"
                                                        name="productCategory"
                                                        required>
                                                    <option value="Máy bơm">Máy bơm</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="row mb-3">
                                            <label for="editProductSupplier" class="col-sm-4 col-form-label">Nhà cung
                                                cấp</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" id="editProductSupplier"
                                                       name="productSupplier" required>
                                            </div>
                                        </div>

                                        <div class="mb-3 text-center">
                                            <button type="submit" class="btn btn-dark w-100 btn-lg">Lưu thay đổi
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>


                <%--------------------------------------------------%>
                <%--     user--%>

                <div class="tab-pane fade" id="id3">
                    <div class="m-4">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-align-left primary-text fs-4 me-3"></i>
                            <h2 class="fs-2 m-0">Quản lý Người dùng</h2>
                        </div>
                        <div class="row g-3 my-2">
                            <div class="col">
                                <div class="p-3 bg-white shadow-sm d-flex justify-content-around align-items-center rounded">
                                    <div>
                                        <h3 class="fs-2">43</h3>
                                        <p class="fs-5">Tổng số người dùng</p>
                                    </div>
                                    <i class="fas fa-gift fs-1 primary-text border rounded-full secondary-bg p-3"></i>
                                </div>
                            </div>
                            <div class="container">
                                <table id="userTable" class="display">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Username</th>
                                        <th>Fullname</th>
                                        <th>Email</th>
                                        <th>Phone</th>
                                        <th>Address</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="user" items="${users}">
                                        <tr>
                                            <td>${user.id}</td>
                                            <td>${user.username}</td>
                                            <td>${user.fullname}</td>
                                            <td>${user.email}</td>
                                            <td>${user.phone}</td>
                                            <td>${user.address}</td>
                                            <td>
                                                <form action="${pageContext.request.contextPath}/admin" method="POST">
                                                    <input type="hidden" name="userId" value="${user.id}"/>
                                                    <button type="submit">Delete</button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>


                </div>
                <%--        ------------------------------------------------------%>

                <div class="tab-pane fade" id="id4">
                    <div class="m-4">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-align-left primary-text fs-4 me-3"></i>
                            <h2 class="fs-2 m-0">Báo cáo</h2>
                        </div>
                    </div>
                    <div class="container-fluid px-4 m-3">
                        <div class="row my-5">
                            <div class="container my-4">
                                <div class=" mt-5">
                                    <h1 class="mb-4">Danh Sách Báo Cáo Người Dùng</h1>

                                    <table class="table table-bordered bg-white">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th scope="col">Mã Báo Cáo</th>
                                            <th scope="col">Tên Người Dùng</th>
                                            <th scope="col">Ngày Báo Cáo</th>
                                            <th scope="col">Nội Dung</th>
                                            <th scope="col">Trạng Thái</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>BC001</td>
                                            <td>Nguyễn Văn A</td>
                                            <td>2024-11-30</td>
                                            <td>Vấn đề về đăng nhập</td>
                                            <td>
                                                <select class="form-control">
                                                    <option class="badge bg-warning">Đang xử lý</option>
                                                    <option class="badge bg-success" selected>Hoàn thành</option>
                                                    <option class="badge bg-danger">Cần xử lý ngay</option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>BC002</td>
                                            <td>Trần Thị B</td>
                                            <td>2024-11-29</td>
                                            <td>Không thể tải ảnh</td>
                                            <td>
                                                <select class="form-control">
                                                    <option class="badge bg-warning" selected>Đang xử lý</option>
                                                    <option class="badge bg-success">Hoàn thành</option>
                                                    <option class="badge bg-danger">Cần xử lý ngay</option>
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>BC003</td>
                                            <td>Lê Minh C</td>
                                            <td>2024-11-28</td>
                                            <td>Lỗi giao diện người dùng</td>
                                            <td>
                                                <select class="form-control">
                                                    <option class="badge bg-warning">Đang xử lý</option>
                                                    <option class="badge bg-success">Hoàn thành</option>
                                                    <option class="badge bg-danger" selected>Cần xử lý ngay</option>
                                                </select></td>
                                        </tr>
                                        <!-- Thêm các báo cáo khác ở đây -->
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="tab-pane fade" id="id5">
                    <div class="m-4">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-align-left primary-text fs-4 me-3"></i>
                            <h2 class="fs-2 m-0">Bảo hành</h2>
                        </div>
                    </div>
                    <div class="container-fluid px-4 m-3">
                        <div class="row my-5">
                            <div class="container my-4">
                                <div class=" mt-5">
                                    <h1>Danh Sách Sản Phẩm</h1>
                                    <table class="table table-bordered table-striped bg-white mt-3">
                                        <thead class="thead-dark">
                                        <tr>
                                            <th>ID Sản Phẩm</th>
                                            <th>Tên Sản Phẩm</th>
                                            <th>Ngày Bảo Hành</th>
                                            <th>Ngày Hết Hạn Bảo Hành</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <tr>
                                            <td>SP001</td>
                                            <td>Máy Bơm Nước Biển</td>
                                            <td>01/01/2024</td>
                                            <td>01/01/2025</td>
                                        </tr>
                                        <tr>
                                            <td>SP002</td>
                                            <td>Máy Lọc Nước</td>
                                            <td>15/02/2024</td>
                                            <td>15/02/2025</td>
                                        </tr>
                                        <tr>
                                            <td>SP003</td>
                                            <td>Máy Nén Khí</td>
                                            <td>10/03/2024</td>
                                            <td>10/03/2025</td>
                                        </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>

</div>
<script src="assets/js/admin.js"></script>

</body>

</html>
