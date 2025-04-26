<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="f" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
        <!-- Custom CSS -->
    <link rel="stylesheet" href="assets/css/admin.css"/>
   
  </head>

  <body>
	<div class="d-flex" id="wrapper" >
		<div id="nav" class="col-2"></div>
		<div class="container mt-4 col-10" >
			<h2 class="mb-4">Danh sách đơn hàng</h2>
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped text-center align-middle border-dark shadow-sm rounded">
	<thead class="bg-dark-blue">
		<tr>
			<th class="text-light">Ngày đặt hàng</th>
			<th class="text-light">Người đặt hàng</th>
			<th class="text-light">Tổng số lượng</th>
			<th class="text-light">Tổng tiền</th>
			<th class="text-light">Trạng thái</th>
			<th class="text-light">Hành động</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="entry" items="${orderMap}">
			<c:set var="order" value="${entry.key}" />
			<c:set var="details" value="${entry.value}" />

			<tr style="cursor: pointer;" class="table-row-main">
				<td>${order.orderDate}</td>
				<td onclick="toggleDetails(${order.id})">${order.user.fullname}</td>
				<td onclick="toggleDetails(${order.id})">${order.quantity}</td>
				<td onclick="toggleDetails(${order.id})">${order.totalPrice}</td>
				<td onclick="toggleDetails(${order.id})" id="status-${order.id}" data-order-id="${order.id}">
					<span class="badge text-dark">
						${order.status}
					</span>
				</td>
				<td>
					<c:if test="${order.status == 'PENDING'}">
						<form class="cancelOrderForm d-inline" method="post">
							<input type="hidden" name="orderId" value="${order.id}" />
							<button id="btn-${order.id}" class="btn btn-danger btn-sm" type="submit">
								Hủy đơn
							</button>
						</form>
					</c:if>
				</td>
			</tr>

			<!-- Chi tiết đơn hàng -->
			<tr class="bg-light">
				<td colspan="6" class="p-0 border-0">
					<div class="collapse" id="orderDetails-${order.id}">
						<table class="table table-sm table-bordered m-0">
							<thead class="table-secondary">
								<tr>
									<th>Ảnh</th>
									<th>Tên sản phẩm</th>
									<th>Số lượng</th>
									<th>Giá</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="detail" items="${details}">
									<tr>
										<td class="text-center align-middle">
											<img src="${detail.product.image}" class="img-thumbnail" style="width: 80px;">
										</td>
										<td class="align-middle">${detail.product.nameProduct}</td>
										<td class="align-middle">${detail.quantity}</td>
										<td class="align-middle">${detail.price}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>

			</div>
		</div>
	</div>
    
    <script>
        const nav = document.getElementById("nav");
        fetch("./assets/component/adminNav.jsp")
            .then((response) => response.text())
            .then((html) => (nav.innerHTML = html));
    </script>
    <script >
		function toggleDetails(orderId) {
			let detailsRow = document.getElementById("orderDetails-" + orderId);
			if (detailsRow) {
				detailsRow.classList.toggle("show");
			} else {
				console.error("Không tìm thấy phần tử orderDetails" + orderId);
			}
		}
		document.addEventListener("DOMContentLoaded", function () {
			document.querySelectorAll(".cancelOrderForm").forEach(form => {
				form.addEventListener("submit", function (event) {
					event.preventDefault(); // Ngăn chặn reload trang

					var formData = new FormData(form); // Lấy dữ liệu từ form

					$.ajax({
						url: '/DoAnLTWeb/OrderController',
						method: 'POST',
						data: formData,
						processData: false,
						contentType: false,
						success: function (data) {
							try {
								let jsonData = (typeof data === "string") ? JSON.parse(data) : data;

								if (jsonData.status === "success") {
									alert(jsonData.message);

									console.log("Order ID:", jsonData.orderId);
									const elementId = 'status-' + jsonData.orderId;
									const statusCell = document.getElementById(elementId);
									console.log("Status Cell:", statusCell);

									if (statusCell) {
										statusCell.textContent = "CANCELLED";
									} else {
										console.warn(`Không tìm thấy phần tử với id: ${elementId}`);
									}

									const cancelButtonElement = 'btn-' + jsonData.orderId;
									const cancelButton = document.getElementById(cancelButtonElement);
									if (cancelButton) {
										cancelButton.style.display = 'none'; // Ẩn nút hủy đơn
									}
								} else {
									alert(jsonData.message);
								}
							} catch (error) {
								console.error('Lỗi khi chuyển đổi JSON:', error);
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

  </body>
</html>
