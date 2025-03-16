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
<link rel="stylesheet" href="assets/css/chitietmaybomStyle.css">
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
										<form action=DetailUserController method="post">

											<div class="mb-3">
												<label class="form-label fw-bold">Họ và tên</label> <input
													type="text" class="form-control" name="firstName"
													value="${auth.fullname}" readonly>
											</div>

											<div class="mb-3">
												<label class="form-label fw-bold">Email</label> <input
													type="email" class="form-control" name="email"
													value="${auth.email}" readonly>
											</div>

											<div class="mb-3">
												<label class="form-label fw-bold">Địa chỉ</label> <input
													type="text" class="form-control" name="address"
													value="${auth.address}" readonly>
											</div>

											<div class="mb-3">
												<label class="form-label fw-bold">Số điện thoại</label> <input
													type="text" class="form-control" name="phone"
													value="${auth.phone}" readonly>
											</div>

											<!-- Nút hành động -->
											<div class="d-flex justify-content-between mt-4">
												<a href="EditUserController"
													class="btn btn-outline-danger px-4"> Logout </a> <a
													href="EditUserController"
													class="btn  bg-dark-blue px-4 text-light"> Edit profile
												</a>
											</div>
										</form>
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

						<div class="container mt-2">
							<div class="row">
								<h4>Sản phẩm bạn đã mua</h4>
								<c:forEach items="${items}" var="item">
								<div class="col-md-3 col-sm-6 mb-4">
									<div class="card">
										<img src="assets\imgs\maybom\shizuko1.jpg"
											class="card-img-top" alt="Sản phẩm 1">
										<div class="card-body text-center">
											<h6 class="card-title">Silstar SKD 100</h6>
											<p class="text-danger">800.000 đ</p>
										</div>
									</div>
								</div>
								</c:forEach>

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
</body>
</html>
