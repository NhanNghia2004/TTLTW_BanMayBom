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

				<div class="mb-3 text-end">
					<button class="btn btn-success" data-bs-toggle="modal"
						data-bs-target="#StockInModal">
						<i class="bi bi-plus-circle me-1"></i> Nhập hàng mới
					</button>
				</div>

				<div class="modal fade" id="StockInModal" tabindex="-1"
					aria-labelledby="nhapHangModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<form id="StockInForm" action="StockInController" method="post">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="nhapHangModalLabel">Nhập hàng
										mới</h5>
									<button type="button" class="btn-close" data-bs-dismiss="modal"
										aria-label="Đóng"></button>
								</div>
								<div class="modal-body">
									<div class="mb-3">
										<label for="productId" class="form-label">ID sản phẩm</label>
										<input type="number" class="form-control" name="productId" required>
									</div>
									<div class="mb-3">
										<label for="quantity" class="form-label">Số lượng</label>
										<input type="number" class="form-control" name="quantity" required>
									</div>									
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Đóng</button>
									<button type="submit" class="btn btn-primary">Lưu</button>
								</div>
							</div>
						</form>
						<div id="message" class="mt-3"></div>
					</div>
				</div>

				<!-- Bảng hiển thị danh sách nhập hàng -->
                <div class="table-responsive">
                    <table class="table table-striped table-bordered align-middle">
                        <thead class="table-dark">
                            <tr>
                                <th>Tên sản phẩm</th>
                                <th>Số lượng</th>
                                <th>Ngày nhập</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${records}" varStatus="loop">
                                <tr>                                    
                                    <td>${item.getProduct().getNameProduct()}</td>
                                    <td>${item.quantity}</td>                                   
                                    <td>${item.getStockDate() }</td>
                                </tr>
                            </c:forEach>
                            <c:if test="${empty records}">
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
    document.addEventListener("DOMContentLoaded", function () {
    	const form = document.getElementById("StockInForm");
    	const messageDiv = document.getElementById("message");
    	form.addEventListener("submit", function (event) {
    		 event.preventDefault(); 
    		// Lấy dữ liệu từ form
    	        const formData = new FormData(form);
				console.log("Sending:", Object.fromEntries(formData.entries()));

				fetch("${pageContext.request.contextPath}/StockInController", {
					method: "POST",
					body: formData
				})

    	        .then(res => {
    	            if (!res.ok) {
    	                return res.text().then(text => { // lấy nội dung lỗi từ server
    	                    throw new Error(text);
    	                });
    	            }
    	            return res.text();
    	        })
    	        .then(msg => {
    	            messageDiv.innerHTML = `<div class="alert alert-success">${msg}</div>`;
    	            form.reset();
    	        })
    	        .catch(err => {
    	            messageDiv.innerHTML = `<div class="alert alert-danger">${err.message}</div>`;
    	        });

    	  })
    })
  		

    </script>
    <script>
        const nav = document.getElementById("nav");
        fetch("./assets/component/adminNav.jsp")
            .then((response) => response.text())
            .then((html) => (nav.innerHTML = html));
    </script>
    
</body>
</html>
