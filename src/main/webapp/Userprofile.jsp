<%@ page contentType="text/html; charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="assets/css/style.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="assets/css/Userprofilestyle.css">

<link rel="stylesheet" href="assets/css/headerAndFooter.css">
</head>

<body style="background-color: rgb(242, 244, 247)">
	<header id="header"></header>
	<nav id="nav"></nav>

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="border p-3">
					<div class="row pt-2">
						<!-- Container chính -->
						<div class="container py-5">
							<div class="row justify-content-center">
								<div class="col-lg-8">
									<!-- Card chứa thông tin người dùng -->
									<div class="card p-4">
										<!-- Avatar và tên người dùng -->
										<div class="text-center mb-4">
											<div class="avatar mx-auto mb-3">
												<img src="data:image/jpeg;base64," alt="User Avatar">
											</div>
											<h3 class="fw-bold">${auth.fullname}</h3>
											<p class="text-muted">${auth.email}</p>
										</div>

									<!-- Form chi tiết người dùng -->
										<form id="userForm" action="DetailUserController"
											method="post">
											<div class="mb-3">
												<label class="form-label fw-bold">Họ và tên</label> <input
													type="text" class="form-control" name="fullname"
													id="fullname" value="${auth.fullname}" readonly>
											</div>

											<div class="mb-3">
												<label class="form-label fw-bold">Email</label> <input
													type="email" class="form-control" name="email" id="email"
													value="${auth.email}" readonly>
											</div>

											<div class="mb-3">
												<label class="form-label fw-bold">Địa chỉ</label> <input
													type="text" class="form-control" name="address"
													id="address" value="${auth.address}" readonly>
											</div>

											<div class="mb-3">
												<label class="form-label fw-bold">Số điện thoại</label> <input
													type="text" class="form-control" name="phone" id="phone"
													value="${auth.phone}" readonly>
											</div>

											<!-- Nút hành động -->
											<div class="d-flex justify-content-between mt-4">
												<a href="LogoutController"
													class="btn btn-outline-danger px-4">Logout</a>

												<!-- Nút Edit -->
												<button type="button" id="editBtn"
													class="btn bg-dark-blue px-4 text-light">Edit
													profile</button>

												<!-- Nút Submit (Ẩn ban đầu) -->
												<button type="submit" id="submitBtn"
													class="btn btn-success px-4" style="display: none;">Submit</button>
											</div>
										</form>

										<!-- Hiển thị thông báo -->
										<div id="message" class="mt-3"></div>

									</div>
								</div>
							</div>
						</div>

						<div class="container mt-2">
							<h2 class="mb-2">Đơn hàng của bạn</h2>
							<div class="table-responsive">
								<table class="table table-bordered text-center align-middle">
									<thead class="table-light">
										<tr>
											<th class="bg-dark-blue text-light">Ngày đặt hàng</th>
											<th class="bg-dark-blue text-light">Tổng số lượng</th>
											<th class="bg-dark-blue text-light">Tổng tiền</th>
											<th class="bg-dark-blue text-light"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${orders}" var="order">
											<tr>
												<td>
													<p class="mb-0">${order.ordeDate }</p>
												</td>
												<td>${order.quantity }</td>
												<td>${order.totalPrice }</td>
												<td>
													<button class="btn btn-danger btn-sm">Hủy đơn hàng</button>
													<a href="#" class="btn  bg-dark-blue btn-sm text-light"> 
														Xem chi tiết
													</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
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
</script>
<script >
document.addEventListener("DOMContentLoaded", function () {
    const editBtn = document.getElementById("editBtn");
    const submitBtn = document.getElementById("submitBtn");
    const formInputs = document.querySelectorAll("#userForm input");
    const messageDiv = document.getElementById("message");
    const form = document.getElementById("userForm");

    // Khi nhấn "Edit"
    editBtn.addEventListener("click", function () {
        formInputs.forEach(input => input.removeAttribute("readonly"));
        editBtn.style.display = "none";   // Ẩn nút Edit
        submitBtn.style.display = "block"; // Hiện nút Submit
    });

    // Khi nhấn "Submit"
    form.addEventListener("submit", function (event) {
        event.preventDefault(); // Ngăn chặn reload trang

        // Lấy dữ liệu từ form
        const formData = new FormData(form);

        // Gửi dữ liệu qua AJAX
        fetch("http://localhost:8080/DoAnLTWeb/UserProfileServlet", {
            method: "POST",
            body: formData
        })
        .then(response => response.json()) // Đọc phản hồi JSON từ server
        .then(data => {
            if (data.success) {
                messageDiv.innerHTML = '<div class="alert alert-success">'+data.message+'</div>';
                
                // Chuyển form về trạng thái chỉ đọc
                formInputs.forEach(input => input.setAttribute("readonly", "true"));
                editBtn.style.display = "block";
                submitBtn.style.display = "none";
            } else {
                messageDiv.innerHTML = '<div class="alert alert-danger">'+data.message+'</div>';
            }
        })
        .catch(error => {
            console.error("Lỗi khi gửi AJAX:", error);
            messageDiv.innerHTML = `<div class="alert alert-danger">Có lỗi xảy ra!</div>`;
        });
    });
});
</script>
</body>
</html>
