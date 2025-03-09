<%@ page contentType="text/html; charset=UTF-8" language="java"%>

<!-- Bắt đầu header  -->
<div id="header" >
	<div class="container d-flex justify-content-between align-items-center py-4">
		<a href="index.jsp" class="head-title">AquaTech</a>
		<form action="Search" method="get" class="d-flex">
			<input name="search" type="search" class="form-control me-2 "
				placeholder="Search..." style="width: 300px"> <input
				type="submit" value="Search" class="btn bg-dark-blue text-light">
		</form>

		<button class="btn">
			<i class="bi-list"></i> Menu
		</button>
	</div>
	<div class=" d-flex justify-content-between align-items-center bg-dark-blue ">
		<div class="container list-display-none  text-light" >
			<ul class="list-head2 mb-0 d-flex justify-content-between px-0">
				<li class="list-item-head2 "><a href="HomeController"
					class="nav-link text-light">Trang chủ</a></li>

				<li class="list-item-head2 shop-active position-relative"><a
					class="nav-link shop text-light">Hãng sản xuất <i class="bi-caret-down-fill"></i></a>
					<ul class="wrap-shop-list">
						<li class="shop-list text-light"><a href="ShopController">Shop</a></li>
						<li class="shop-list text-light"><a href="CartController">Cart</a></li>
						<li class="shop-list text-light"><a href="CheckOutController">Checkout</a></li>
					</ul></li>

				<li class="list-item-head2"><a href="gioithieu.jsp"
					class="nav-link text-light">Giới thiệu dịch vụ</a></li>
				<li class="list-item-head2"><a href="new.jsp" class="nav-link text-light">Tin
						tức</a></li>
				<li class="list-item-head2"><a href="lienhe.jsp"
					class="nav-link text-light">Liên hệ</a></li>

				<li class="list-item-head2"><a href="giohang.jsp"
					class="nav-link icon-cart text-light"> <i class="bi-cart 	"></i>
				</a></li>

				<%-- <!-- Trường hợp nếu đã đăng nhập -->
				<c:if test="${sessionScope.user != null}">
					<c:choose>
						<c:when test="${sessionScope.user.role eq 'admin'}">
							<li class="list-item-head2"><a
								href="MyProductController?accId=${sessionScope.user.userId}"
								class="nav-link text-light" > ${sessionScope.user.username} </a></li>
						</c:when>
						<c:otherwise>
							<li class="list-item-head2"><a
								href="DetailUserController?accId=${sessionScope.user.userId}"
								class="nav-link text-light"> ${sessionScope.user.username} </a></li>
						</c:otherwise>
					</c:choose>
					<li class="list-item-head2"><a href="LogoutController"
						class="nav-link text-light">LogOut</a></li>
				</c:if> --%>

				<!-- Trường hợp nếu chưa đăng nhập -->
				<c:if test="${sessionScope.user == null}">
					<li class="list-item-head2"><a href="LoginController"
						class="nav-link text-light">Đăng nhập</a></li>
				</c:if>

			</ul>
		</div>
	</div>
</div>
<!-- Kết thức header  -->
