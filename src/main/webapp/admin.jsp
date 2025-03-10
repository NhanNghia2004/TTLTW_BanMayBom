<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link rel="stylesheet" href="assets/css/admin.css"/>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js"
            integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.1/js/all.min.js"
            integrity="sha512-1JkMy1LR9bTo3psH+H4SV5bO2dFylgOy+UJhMus1zF4VEFuZVu5lsi4I6iIndE4N9p01z1554ZDcvMSjMaqCBQ=="
            crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <%--    datatable--%>
    <!-- Thêm jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

    <!-- Thêm DataTable CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">

    <!-- Thêm DataTable JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <%--ajax--%>
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


            <%--            <div class="tab-pane fade" id="id2">--%>
            <%--                <div class="d-flex align-items-center m-4">--%>
            <%--                    <i class="fas fa-align-left primary-text fs-4 me-3"></i>--%>
            <%--                    <h2 class="fs-2 m-0">Quản lý sản phẩm</h2>--%>
            <%--                </div>--%>
            <%--                <div class="input-group w-25 m-4">--%>
            <%--                    <input type="text" class="form-control " placeholder="Tìm kiếm sản phẩm...">--%>
            <%--                </div>--%>
            <%--                <div class="px-4">--%>
            <%--                        <h3>Hiển thị sản phẩm</h3>--%>


            <%--                    <table id="productTable" class="display">--%>
            <%--                        <thead>--%>
            <%--                        <tr>--%>
            <%--                            <th>ID</th>--%>
            <%--                            <th>Name</th>--%>
            <%--                            <th>Description</th>--%>
            <%--                            <th>Price</th>--%>
            <%--                            <th>Stock</th>--%>
            <%--                            <th>Actions</th>--%>
            <%--                        </tr>--%>
            <%--                        </thead>--%>
            <%--                        <tbody>--%>
            <%--                        <c:forEach var="product" items="${products}">--%>
            <%--                            <tr>--%>
            <%--                                <td>${product.id}</td>--%>
            <%--                                <td>${product.nameProduct}</td>--%>
            <%--                                <td>${product.description}</td>--%>
            <%--                                <td>${product.priceProduct}</td>--%>
            <%--                                <td>${product.stock}</td>--%>
            <%--                                <td>--%>
            <%--                                    <form action="" method="POST" style="display:inline-block;">--%>
            <%--                                        <input type="hidden" name="productId" value="${product.id}" />--%>
            <%--                                        <button type="submit" name="action" value="delete">Delete</button>--%>
            <%--                                    </form>--%>
            <%--                                    <a href="">Edit</a>--%>
            <%--                                </td>--%>
            <%--                            </tr>--%>
            <%--                        </c:forEach>--%>
            <%--                        </tbody>--%>
            <%--                    </table>--%>
            <%--&lt;%&ndash;&ndash;%&gt;--%>

            <%--                </div>--%>
            <%--            </div>--%>
            <div class="tab-pane fade" id="id2">
                <div class="d-flex align-items-center m-4">
                    <i class="fas fa-box primary-text fs-4 me-3"></i>
                    <h2 class="fs-2 m-0">Quản lý sản phẩm</h2>
                </div>

                <!-- Thanh tìm kiếm và nút thêm sản phẩm -->
                <div class="d-flex justify-content-between align-items-center m-4">
                    <div class="input-group w-50">
                        <input type="text" class="form-control" placeholder="Tìm kiếm sản phẩm...">
                        <button class="btn btn-primary">
                            <i class="fas fa-search"></i> Tìm
                        </button>
                    </div>
                    <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#addProductModal">
                        <i class="fas fa-plus"></i> Thêm sản phẩm
                    </button>
                </div>


                <!-- Danh sách sản phẩm -->
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
                                <th>Mô tả</th>
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
                            <tbody>
                            <!-- Dữ liệu sản phẩm sẽ được hiển thị ở đây -->
                            <tr>
                                <td>1</td>
                                <td>Sản phẩm A</td>
                                <td><img src="img.jpg" alt="Hình ảnh" width="50"></td>
                                <td>1.000.000₫</td>
                                <td>Mô tả ngắn...</td>
                                <td>01/01/2024</td>
                                <td>100W</td>
                                <td>10 bar</td>
                                <td>5 L/min</td>
                                <td>50mm</td>
                                <td>220V</td>
                                <td>Thương hiệu X</td>
                                <td>12</td>
                                <td>20</td>
                                <td>Máy bơm</td>
                                <td>Nhà cung cấp A</td>
                                <td>
                                    <button class="btn btn-warning btn-sm" data-bs-toggle="modal" data-bs-target="#editProductModal">
                                        <i class="fas fa-edit"></i> Sửa
                                    </button>
                                    <form action="" method="POST" class="d-inline">
                                        <input type="hidden" name="productId" value="1">
                                        <button type="submit" name="action" value="delete" class="btn btn-danger btn-sm">
                                            <i class="fas fa-trash-alt"></i> Xóa
                                        </button>
                                    </form>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>


                <!-- Phân trang -->
                    <nav class="mt-3">
                        <ul class="pagination justify-content-center">
                            <li class="page-item"><a class="page-link" href="#">Trước</a></li>
                            <li class="page-item"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Sau</a></li>
                        </ul>
                    </nav>
                </div>
            </div>



        <%--------------------------------------------------%>
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
<!-- /#page-content-wrapper -->
</div>
</body>

</html>
