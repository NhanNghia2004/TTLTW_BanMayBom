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
			<h2 class="mb-2">Đơn hàng chờ xác nhận</h2>
			<div class="table-responsive">
				<table class="table table-bordered text-center align-middle" >
					<thead class="table-light">
						<tr>
							<th class="bg-dark-blue text-light">Ngày đặt hàng</th>
							<th class="bg-dark-blue text-light">Người đặt hàng</th>
							<th class="bg-dark-blue text-light">Tổng số lượng</th>
							<th class="bg-dark-blue text-light">Tổng tiền</th>
							<th class="bg-dark-blue text-light">Trạng thái</th>
							<th class="bg-dark-blue text-light"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="entry" items="${orderMap}">
							<c:set var="order" value="${entry.key}" />
							<c:set var="details" value="${entry.value}" />
							<!-- Hàng chính (Order) -->
							<tr style="cursor: pointer;" >
								<td>${order.orderDate}</td>
								<td onclick="toggleDetails(${order.id})">${order.user.fullname}</td>
								<td onclick="toggleDetails(${order.id})">${order.quantity}</td>
								<td onclick="toggleDetails(${order.id})">${order.totalPrice}</td>
								<td onclick="toggleDetails(${order.id})" id ="status-${order.id}"data-order-id="${order.id}">${order.status}</td>
								<td>
									<c:if test="${order.status == 'PENDING'}">
									<form class="cancelOrderForm" action="post">
									<input   type="hidden" name="orderId" value ="${order.id}"/>
										<button id ="btn-${order.id}" class="btn btn-danger btn-sm" type="submit" >
										Hủy đơn
									</button>
									</form>
									</c:if>
								</td>
							</tr>


							<tr>
								<td colspan="5" class="p-0">
									<div class="collapse" id="orderDetails-${order.id}">
										<table class="table table-sm mb-0">
											<thead>
												<tr style="background-color: #f1f1f1;">
													<th>Ảnh</th>
													<th>Tên sản phẩm</th>
													<th>Số lượng</th>
													<th>Giá</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="detail" items="${details}">
													<tr>
														<td class="text-center align-middle"><img src="${detail.product.image }"
															class="img-fluid anhhang"
															style="width: 80px; height: auto;"></td>
														<td class="text-center align-middle">${detail.product.nameProduct}</td>
														<td class="text-center align-middle" >${detail.quantity}</td>
														<td class="text-center align-middle">${detail.price}</td>
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

                fetch('/DoAnLTWeb/OrderController', {
                    method: 'POST',
                    body: new FormData(form)  // Gửi dữ liệu form
                })
                .then(response => response.text())  // Chuyển thành text để xem nội dung
                .then(data => {
                    try {
                        let jsonData = JSON.parse(data);  // Chuyển text thành JSON

                        if (jsonData.status === "success") {
                            alert(jsonData.message);

                            console.log("Order ID:", jsonData.orderId);
                            const elementId = 'status-'+jsonData.orderId;
                            const statusCell = document.getElementById(elementId);
                            console.log("Status Cell:", statusCell);

                            if (statusCell) {
                                statusCell.textContent = "CANCELLED";
                            } else {
                                console.warn(`Không tìm thấy phần tử với id: ${elementId}`);
                            }
                            const cancelButtonElement = 'btn-'+jsonData.orderId;
                            const cancelButton = document.getElementById(cancelButtonElement);
                            if (cancelButton) {
                                cancelButton.style.display = 'none';  // Ẩn nút hủy đơn
                            }
                        } else {
                            alert(jsonData.message);
                        }
                    } catch (error) {
                        console.error('Error parsing JSON:', error);  // Log nếu không thể parse
                    }
                })
                .catch(error => {
                    alert("Có lỗi xảy ra, vui lòng thử lại!");
                    console.error("Lỗi:", error);
                });

            });
        });
    });

    </script>
  </body>
</html>
