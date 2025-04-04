<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>


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
    <div id="sidebar-wrapper">
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
                    class="fas fa-gift me-2"></i>Quản lý khuyến mãi</a>
            <a href="#id5" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
               data-bs-toggle="tab" role="tab" aria-controls="home" aria-selected="true"><i
                    class="fas fa-paperclip me-2"></i>Báo Cáo</a>
            <a href="#id6" class="list-group-item list-group-item-action bg-transparent second-text fw-bold"
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


                    <%--                    <!-- Modal Thêm Sản Phẩm -->--%>
                    <%--                    <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog"--%>
                    <%--                         aria-labelledby="addProductModalLabel" aria-hidden="true">--%>
                    <%--                        <div class="modal-dialog" role="document">--%>
                    <%--                            <div class="modal-content">--%>
                    <%--                                <div class="modal-header">--%>
                    <%--                                    <h5 class="modal-title w-100 text-center" id="addProductModalLabel">Thêm Sản--%>
                    <%--                                        Phẩm</h5>--%>
                    <%--                                </div>--%>
                    <%--                                <div class="modal-body">--%>
                    <%--                                    <form id="addProductForm">--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productName" class="col-4 col-form-label">Tên Sản Phẩm</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="text" class="form-control" id="productName"--%>
                    <%--                                                       name="nameProduct" required>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productImage" class="col-4 col-form-label">Hình Ảnh--%>
                    <%--                                                (URL)</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="text" class="form-control" id="productImage" name="image"--%>
                    <%--                                                       required>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productPrice" class="col-4 col-form-label">Giá</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="number" class="form-control" id="productPrice"--%>
                    <%--                                                       name="priceProduct" required min="0">--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productDescription" class="col-4 col-form-label">Mô Tả</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <textarea class="form-control" id="productDescription"--%>
                    <%--                                                          name="description" rows="2"></textarea>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productManufactureDate" class="col-4 col-form-label">Ngày Sản--%>
                    <%--                                                Xuất</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="date" class="form-control" id="productManufactureDate"--%>
                    <%--                                                       name="manufactureDate" required>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productPower" class="col-4 col-form-label">Công Suất</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="text" class="form-control" id="productPower" name="power"--%>
                    <%--                                                       required>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productPressure" class="col-4 col-form-label">Áp Suất</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="number" class="form-control" id="productPressure"--%>
                    <%--                                                       name="pressure" required min="0">--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productFlowRate" class="col-4 col-form-label">Lưu Lượng</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="number" class="form-control" id="productFlowRate"--%>
                    <%--                                                       name="flowRate" required min="0">--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productPipeDiameter" class="col-4 col-form-label">Đường Kính--%>
                    <%--                                                Ống</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="number" class="form-control" id="productPipeDiameter"--%>
                    <%--                                                       name="pipeDiameter" required min="0">--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productVoltage" class="col-4 col-form-label">Điện Áp</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="number" class="form-control" id="productVoltage"--%>
                    <%--                                                       name="voltage" required min="0">--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productBrand" class="col-4 col-form-label">Thương Hiệu</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="text" class="form-control" id="productBrand" name="brand"--%>
                    <%--                                                       required>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productWarrantyMonths" class="col-4 col-form-label">Bảo Hành--%>
                    <%--                                                (Tháng)</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="number" class="form-control" id="productWarrantyMonths"--%>
                    <%--                                                       name="warrantyMonths" required min="0">--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productStock" class="col-4 col-form-label">Tồn Kho</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                <input type="number" class="form-control" id="productStock" name="stock"--%>
                    <%--                                                       required min="0">--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productCategory" class="col-4 col-form-label">Danh Mục</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                &lt;%&ndash;                                                <input type="number" class="form-control" id="productCategory" name="idCategory" required>&ndash;%&gt;--%>
                    <%--                                                <select class="form-control" id="productCategory" name="idCategory"--%>
                    <%--                                                        required>--%>
                    <%--                                                    <option value="1">Máy bơm nước</option>--%>
                    <%--                                                    <option value="2">Máy bơm chân không</option>--%>
                    <%--                                                    <option value="3">Máy bơm ly tâm</option>--%>
                    <%--                                                    <option value="4">Máy bơm định lượng</option>--%>
                    <%--                                                    <option value="5">Máy bơm hóa chất</option>--%>
                    <%--                                                    <option value="6">Máy bơm chìm</option>--%>
                    <%--                                                    <option value="7">Máy bơm nước sạch</option>--%>
                    <%--                                                    <option value="8">Máy bơm công nghiệp</option>--%>
                    <%--                                                </select>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="form-group row">--%>
                    <%--                                            <label for="productSupplier" class="col-4 col-form-label">Nhà Cung--%>
                    <%--                                                Cấp</label>--%>
                    <%--                                            <div class="col-8">--%>
                    <%--                                                &lt;%&ndash;                                                <input type="number" class="form-control" id="productSupplier"&ndash;%&gt;--%>
                    <%--                                                &lt;%&ndash;                                                       name="idSupplier" required>&ndash;%&gt;--%>
                    <%--                                                <select class="form-control" id="productSupplier" name="idSupplier"--%>
                    <%--                                                        required>--%>
                    <%--                                                    <option value="">-- Chọn nhà cung cấp --</option>--%>
                    <%--                                                    <option value="1">Công ty A</option>--%>
                    <%--                                                    <option value="2">Công ty B</option>--%>
                    <%--                                                    <option value="3">Công ty C</option>--%>
                    <%--                                                    <option value="4">Công ty D</option>--%>
                    <%--                                                    <option value="5">Công ty E</option>--%>
                    <%--                                                    <option value="6">Công ty F</option>--%>
                    <%--                                                    <option value="7">Công ty G</option>--%>
                    <%--                                                    <option value="8">Công ty H</option>--%>
                    <%--                                                    <option value="9">Công ty I</option>--%>
                    <%--                                                    <option value="10">Công ty J</option>--%>
                    <%--                                                </select>--%>
                    <%--                                            </div>--%>
                    <%--                                        </div>--%>
                    <%--                                        <div class="text-center mt-3">--%>
                    <%--                                            <button type="submit" class="btn btn-primary" onclick="addProduct(event)">--%>
                    <%--                                                Thêm Sản Phẩm--%>
                    <%--                                            </button>--%>
                    <%--                                        </div>--%>
                    <%--                                    </form>--%>
                    <%--                                </div>--%>
                    <%--                            </div>--%>
                    <%--                        </div>--%>
                    <%--                    </div>--%>

                    <div class="modal fade" id="addProductModal" tabindex="-1" role="dialog"
                         aria-labelledby="addProductModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                            <div class="modal-content">
                                <div class="modal-header bg-success text-white">
                                    <h5 class="modal-title w-100 text-center" id="addProductModalLabel">Thêm Sản
                                        Phẩm</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                            aria-label="Đóng"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="addProductForm">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label for="productName" class="form-label">Tên Sản Phẩm</label>
                                                <input type="text" class="form-control" id="productName"
                                                       name="nameProduct" required>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productImage" class="form-label">Hình Ảnh (URL)</label>
                                                <input type="text" class="form-control" id="productImage" name="image"
                                                       required>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productPrice" class="form-label">Giá</label>
                                                <input type="number" class="form-control" id="productPrice"
                                                       name="priceProduct" required min="0">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productManufactureDate" class="form-label">Ngày Sản
                                                    Xuất</label>
                                                <input type="date" class="form-control" id="productManufactureDate"
                                                       name="manufactureDate" required>
                                            </div>
                                            <div class="col-md-12">
                                                <label for="productDescription" class="form-label">Mô Tả</label>
                                                <textarea class="form-control" id="productDescription"
                                                          name="description" rows="2"></textarea>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="productPower" class="form-label">Công Suất</label>
                                                <input type="text" class="form-control" id="productPower" name="power"
                                                       required>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productPressure" class="form-label">Áp Suất</label>
                                                <input type="number" class="form-control" id="productPressure"
                                                       name="pressure" required min="0">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productFlowRate" class="form-label">Lưu Lượng</label>
                                                <input type="number" class="form-control" id="productFlowRate"
                                                       name="flowRate" required min="0">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productPipeDiameter" class="form-label">Đường Kính
                                                    Ống</label>
                                                <input type="number" class="form-control" id="productPipeDiameter"
                                                       name="pipeDiameter" required min="0">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productVoltage" class="form-label">Điện Áp</label>
                                                <input type="number" class="form-control" id="productVoltage"
                                                       name="voltage" required min="0">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productBrand" class="form-label">Thương Hiệu</label>
                                                <input type="text" class="form-control" id="productBrand" name="brand"
                                                       required>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productWarrantyMonths" class="form-label">Bảo Hành
                                                    (Tháng)</label>
                                                <input type="number" class="form-control" id="productWarrantyMonths"
                                                       name="warrantyMonths" required min="0">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productStock" class="form-label">Tồn Kho</label>
                                                <input type="number" class="form-control" id="productStock" name="stock"
                                                       required min="0">
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productCategory" class="form-label">Danh Mục</label>
                                                <select class="form-select" id="productCategory" name="idCategory"
                                                        required>
                                                    <option value="1">Máy bơm nước</option>
                                                    <option value="2">Máy bơm chân không</option>
                                                    <option value="3">Máy bơm ly tâm</option>
                                                    <option value="4">Máy bơm định lượng</option>
                                                    <option value="5">Máy bơm hóa chất</option>
                                                    <option value="6">Máy bơm chìm</option>
                                                    <option value="7">Máy bơm nước sạch</option>
                                                    <option value="8">Máy bơm công nghiệp</option>
                                                </select>
                                            </div>
                                            <div class="col-md-6">
                                                <label for="productSupplier" class="form-label">Nhà Cung Cấp</label>
                                                <select class="form-select" id="productSupplier" name="idSupplier"
                                                        required>
                                                    <option value="">-- Chọn nhà cung cấp --</option>
                                                    <option value="1">Công ty A</option>
                                                    <option value="2">Công ty B</option>
                                                    <option value="3">Công ty C</option>
                                                    <option value="4">Công ty D</option>
                                                    <option value="5">Công ty E</option>
                                                    <option value="6">Công ty F</option>
                                                    <option value="7">Công ty G</option>
                                                    <option value="8">Công ty H</option>
                                                    <option value="9">Công ty I</option>
                                                    <option value="10">Công ty J</option>
                                                </select>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" form="addProductForm" class="btn btn-success w-100"
                                            onclick="addProduct(event)">Thêm Sản Phẩm
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <%-- Modal Sửa Sản Phẩm --%>
                    <div class="modal fade" id="editProductModal" tabindex="-1" role="dialog"
                         aria-labelledby="editProductModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title w-100 text-center" id="editProductModalLabel">Sửa Sản
                                        Phẩm</h5>
                                </div>
                                <div class="modal-body">
                                    <form id="editProductForm">
                                        <input type="hidden" id="editProductId" name="idProduct">

                                        <div class="form-group row">
                                            <label for="editProductName" class="col-4 col-form-label">Tên Sản
                                                Phẩm</label>
                                            <div class="col-8">
                                                <input type="text" class="form-control" id="editProductName"
                                                       name="nameProduct" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductImage" class="col-4 col-form-label">Hình Ảnh
                                                (URL)</label>
                                            <div class="col-8">
                                                <input type="text" class="form-control" id="editProductImage"
                                                       name="image" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductPrice" class="col-4 col-form-label">Giá</label>
                                            <div class="col-8">
                                                <input type="number" class="form-control" id="editProductPrice"
                                                       name="priceProduct" required min="0">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductDescription" class="col-4 col-form-label">Mô
                                                Tả</label>
                                            <div class="col-8">
                                                <textarea class="form-control" id="editProductDescription"
                                                          name="description" rows="2"></textarea>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductManufactureDate" class="col-4 col-form-label">Ngày
                                                Sản Xuất</label>
                                            <div class="col-8">
                                                <input type="date" class="form-control" id="editProductManufactureDate"
                                                       name="manufactureDate" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductPower" class="col-4 col-form-label">Công Suất</label>
                                            <div class="col-8">
                                                <input type="text" class="form-control" id="editProductPower"
                                                       name="power" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductPressure" class="col-4 col-form-label">Áp
                                                Suất</label>
                                            <div class="col-8">
                                                <input type="number" class="form-control" id="editProductPressure"
                                                       name="pressure" required min="0">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductFlowRate" class="col-4 col-form-label">Lưu
                                                Lượng</label>
                                            <div class="col-8">
                                                <input type="number" class="form-control" id="editProductFlowRate"
                                                       name="flowRate" required min="0">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductPipeDiameter" class="col-4 col-form-label">Đường Kính
                                                Ống</label>
                                            <div class="col-8">
                                                <input type="number" class="form-control" id="editProductPipeDiameter"
                                                       name="pipeDiameter" required min="0">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductVoltage" class="col-4 col-form-label">Điện Áp</label>
                                            <div class="col-8">
                                                <input type="number" class="form-control" id="editProductVoltage"
                                                       name="voltage" required min="0">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductBrand" class="col-4 col-form-label">Thương
                                                Hiệu</label>
                                            <div class="col-8">
                                                <input type="text" class="form-control" id="editProductBrand"
                                                       name="brand" required>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductWarrantyMonths" class="col-4 col-form-label">Bảo Hành
                                                (Tháng)</label>
                                            <div class="col-8">
                                                <input type="number" class="form-control" id="editProductWarrantyMonths"
                                                       name="warrantyMonths" required min="0">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductStock" class="col-4 col-form-label">Tồn Kho</label>
                                            <div class="col-8">
                                                <input type="number" class="form-control" id="editProductStock"
                                                       name="stock" required min="0">
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductCategory" class="col-4 col-form-label">Danh
                                                Mục</label>
                                            <div class="col-8">
                                                <%--                                                <input type="number" class="form-control" id="editProductCategory"--%>
                                                <%--                                                       name="idCategory" required>--%>
                                                <select class="form-control" id="editProductCategory" name="idCategory"
                                                        required>
                                                    <option value="1">Máy bơm nước</option>
                                                    <option value="2">Máy bơm chân không</option>
                                                    <option value="3">Máy bơm ly tâm</option>
                                                    <option value="4">Máy bơm định lượng</option>
                                                    <option value="5">Máy bơm hóa chất</option>
                                                    <option value="6">Máy bơm chìm</option>
                                                    <option value="7">Máy bơm nước sạch</option>
                                                    <option value="8">Máy bơm công nghiệp</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group row">
                                            <label for="editProductSupplier" class="col-4 col-form-label">Nhà Cung
                                                Cấp</label>
                                            <div class="col-8">
                                                <%--                                                <input type="number" class="form-control" id="editProductSupplier"--%>
                                                <%--                                                       name="idSupplier" required>--%>
                                                <select class="form-control" id="editProductSupplier" name="idSupplier"
                                                        required>
                                                    <option value="">-- Chọn nhà cung cấp --</option>
                                                    <option value="1">Công ty A</option>
                                                    <option value="2">Công ty B</option>
                                                    <option value="3">Công ty C</option>
                                                    <option value="4">Công ty D</option>
                                                    <option value="5">Công ty E</option>
                                                    <option value="6">Công ty F</option>
                                                    <option value="7">Công ty G</option>
                                                    <option value="8">Công ty H</option>
                                                    <option value="9">Công ty I</option>
                                                    <option value="10">Công ty J</option>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="text-center mt-3">
                                            <button type="submit" class="btn btn-primary" onclick="editProduct(event)">
                                                Lưu thay đổi
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>

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
            <%--        --------------------Khuyến mãi----------------------------------%>

            <div class="tab-pane fade" id="id4">
                <div class="d-flex align-items-center m-4">
                    <i class="fas fa-gift primary-text fs-4 me-3"></i>
                    <h2 class="fs-2 m-0">Quản lý Khuyến mãi</h2>
                </div>

                <!-- Nút thêm khuyến mãi ở giữa -->
                <div class="d-flex justify-content-center align-items-center m-4">
                    <button type="button" class="btn btn-success w-100 btn-lg" data-bs-toggle="modal"
                            data-bs-target="#addPromotionModal">
                        Thêm khuyến mãi
                    </button>
                </div>

                <!-- Danh sách khuyến mãi -->
                <section id="promotion-management" class="py-4">
                    <div class="px-4">
                        <h3 class="mb-3">Danh sách khuyến mãi</h3>
                        <div class="table-responsive">
                            <table id="promotionTable" class="table table-striped table-bordered text-center bg-white">
                                <thead class="bg-white text-dark fw-bold">
                                <tr>
                                    <th style="text-align: center">ID</th>
                                    <th style="text-align: center">Giảm giá (%)</th>
                                    <th style="text-align: center">Mô tả</th>
                                    <th style="text-align: center">Trạng thái</th>
                                    <th style="text-align: center">Ngày bắt đầu</th>
                                    <th style="text-align: center">Ngày kết thúc</th>
                                    <th style="text-align: center">ID Sản phẩm</th>  <!-- Thêm cột ID Sản phẩm -->
                                    <th style="text-align: center">Hành động</th>
                                </tr>
                                </thead>
                                <tbody id="promotionBody">
                                <!-- Dữ liệu sẽ được chèn vào đây bằng JavaScript hoặc AJAX -->
                                </tbody>
                            </table>
                        </div>
                    </div>


                    <!-- Modal thêm khuyến mãi -->
                    <div class="modal fade" id="addPromotionModal" tabindex="-1"
                         aria-labelledby="addPromotionModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg"> <!-- modal lớn hơn để dễ nhập -->
                            <div class="modal-content">
                                <div class="modal-header bg-success text-white">
                                    <h5 class="modal-title w-100 text-center" id="addPromotionModalLabel">Thêm Khuyến
                                        Mãi</h5>
                                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                            aria-label="Đóng"></button>
                                </div>
                                <div class="modal-body">
                                    <form id="addPromotionForm">
                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label for="promotionValue" class="form-label">Giảm giá (%)</label>
                                                <input type="number" class="form-control" id="promotionValue"
                                                       name="promotion" min="0" max="100" required>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="status" class="form-label">Trạng thái</label>
                                                <select class="form-select" id="status" name="status" required>
                                                    <option value="1">Đang áp dụng</option>
                                                    <option value="0">Không áp dụng</option>
                                                </select>
                                            </div>

                                            <div class="col-md-12">
                                                <label for="description" class="form-label">Mô tả</label>
                                                <textarea class="form-control" id="description" name="description"
                                                          rows="2" required></textarea>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="startDate" class="form-label">Ngày bắt đầu</label>
                                                <input type="datetime-local" class="form-control" id="startDate"
                                                       name="startDate" required>
                                            </div>

                                            <div class="col-md-6">
                                                <label for="endDate" class="form-label">Ngày kết thúc</label>
                                                <input type="datetime-local" class="form-control" id="endDate"
                                                       name="endDate" required>
                                            </div>

                                            <div class="col-md-12">
                                                <label for="idProduct" class="form-label">ID Sản phẩm</label>
                                                <input type="number" class="form-control" id="idProduct"
                                                       name="idProduct" required>
                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <div class="modal-footer">

                                    <button type="submit" form="addPromotionForm"
                                            class="btn btn-success w-100 text-center">Thêm mới
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>


                </section>
            </div>


            <%--            -----------------------------------------%>
            <div class="tab-pane fade" id="id5">
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

            <%--            -----------------------------%>
            <div class="tab-pane fade" id="id6">
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
