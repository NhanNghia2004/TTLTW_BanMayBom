<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
  <link rel="stylesheet" href="assets/css/style.css" />
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
  <link rel="stylesheet" href="assets/css/Userprofilestyle.css">
  <link rel="stylesheet" href="assets/css/chitietmaybomStyle.css">
</head>

<body style="background-color: rgb(242 244 247)">
<header id="header"></header>
<div id="header2"></div>
<nav id="nav"></nav>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div class="border p-3">
        <div class="row pt-2">
          <!-- phan thay doi -->
          <div class="col-md">
            <div class="container my-4">
              <div class="border border-2 p-2 m-2">
              <div class="row">
                <div class="col-2">
                  <img src="assets/imgs/khac/anhdaidien.png" class="anhdaidien" >
                </div>
                <div class="col">
                  <h3>Chào mừng bạn đã trở lại, Nguoidung</h3>
                </div>
                <div class="col align-self-center">
                  <button class="form-control btn button">Đăng xuất</button>
                </div>
              </div>
              </div>
              <!--cập nhật thông tin cá nhân-->
              <div class="row">
                <div class="col">
                  <h5 class="m-2">Thông tin cá nhân</h5>
                </div>
              </div>
             <div class="row">
               <div class="col">
                 <p class="m-2">Họ và tên : Nguyễn Văn A</p>
                 <p class="m-2">Địa chỉ : số 123 đường ABC thành phố XYZ</p>
                 <p class="m-2">Email : Email@gmail.com</p>
                 <p class="m-2">Số điện thoại : 0123 456 789</p>
                 <a href="profile.jsp" class="link"><button class="btn button2 form-control">Thay đổi thông tin cá nhân</button></a>
               </div>
             </div>
              <br>
              <div class="container mt-2">
                <h2 class="mb-2">Đơn hàng của bạn</h2>
                <div class="row">
                  <div class="col-2">
                    <p class="head">Hình ảnh</p>
                  </div>
                  <div class="col-3">
                    <p class="head">Thông tin và ngày giao</p>
                  </div>
                  <div class="col-2 ">
                    <p class="head">Đơn giá</p>
                  </div>
                  <div class="col-auto">
                    <p class="head">Số lượng</p>
                  </div>
                  <div class="col-2">
                    <p class="head">Tổng</p>
                  </div>
                </div>
                <!--thẻ máy bơm-->
                <div class="card mt-2">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-md-1">
                        <img src="assets/imgs/maybom/app10.jpg" class="img-fluid anhhang">
                      </div>
                      <div class="col-md-4">
                        <h5 class="card-title">Máy bơm cao áp mini Pamtex 110</h5>
                        <p class="card-text">Ngày giao : 19/12/2024</p>
                      </div>
                      <div class="col-md-2 align-items-center">
                        <p class="card-text">650.000 đ</p>
                      </div>
                      <div class="col-md-1 text-center">
                        <p>10</p>
                      </div>
                      <div class="col-md-2">
                        <p>6.500.000</p>
                      </div>
                      <div class="col-md-2 text-end">
                        <button class="btn btn-danger btn-sm">Hủy đơn hàng</button>
                      </div>
                    </div>
                  </div>
                </div>
                <!--maybom2-->
                <div class="card mt-2">
                  <div class="card-body">
                    <div class="row align-items-center">
                      <div class="col-md-1">
                        <img src="assets/imgs/maybom/sealand3.jpg" class="img-fluid anhhang">
                      </div>
                      <div class="col-md-4">
                        <h5 class="card-title">Máy bơm Sealand Jet Xi</h5>
                        <p class="card-text">Ngày giao : 04/12/2024</p>
                      </div>
                      <div class="col-md-2 align-items-center">
                        <p class="card-text">450.000 đ</p>
                      </div>
                      <div class="col-md-1 text-center">
                        <p>10</p>
                      </div>
                      <div class="col-md-2">
                        <p>4.500.000</p>
                      </div>
                      <div class="col-md-2 text-end">
                        <button class="btn btn-danger btn-sm">Hủy đơn hàng</button>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
<div class="border p-2">
                <div class="row">
                  <h5>Sản phẩm bạn đã mua</h5>
                  <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                      <img src="assets\imgs\maybom\shizuko1.jpg" class="card-img-top" alt="Sản phẩm 1">
                      <div class="card-body text-center">
                        <h6 class="card-title">Silstar SKD 100</h6>
                        <p class="text-danger">800.000 đ</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                      <img src="assets\imgs\maybom\shizuko1.jpg" class="card-img-top" alt="Sản phẩm 2">
                      <div class="card-body text-center">
                        <h6 class="card-title">Bơm tăng áp Seahan 150</h6>
                        <p class="text-danger">950.000 đ</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                      <img src="assets\imgs\maybom\shizuko1.jpg" class="card-img-top" alt="Sản phẩm 3">
                      <div class="card-body text-center">
                        <h6 class="card-title">Bơm tăng áp mini Kangaroo KG 150A</h6>
                        <p class="text-danger">750.000 đ</p>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-3 col-sm-6 mb-4">
                    <div class="card">
                      <img src="assets\imgs\maybom\shizuko1.jpg" class="card-img-top" alt="Sản phẩm 4">
                      <div class="card-body text-center">
                        <h6 class="card-title">Silstar Luva 200A</h6>
                        <p class="text-danger">850.000 đ</p>
                      </div>
                    </div>
                  </div>

                </div>
              </div>
              <div class="row">
                <div class="col border-top">
                  <h5 class="text-bold mt-2">Nhắn tin riêng với chúng tôi</h5>
                  <div class="container border rating">
                    <p class="p-comment">Bạn muốn nói gì ? </p>
                    <textarea class="form-control comment-area" rows="5" placeholder="Vui lòng nhập tiếng Việt có dấu. Nhập tối đa 255 kí tự"></textarea>
                    <button class="form-control btn-right com-btn justify-content-center"> Gửi đánh giá</button>
                  </div>
                </div>
                <div class="col-3 mt-2">
                  <div id="tintuc"></div>
                </div>
                 </div>
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
  const tintuc = document.getElementById("tintuc");
  const chonmaybom = document.getElementById("chonmaybom");
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
  fetch("./assets/component/tintuc.jsp")
          .then((response) => response.text())
          .then((html) => (tintuc.innerHTML = html));
  fetch("./assets/component/chonmaybom.jsp")
          .then((response) => response.text())
          .then((html) => (chonmaybom.innerHTML = html));
</script>
</body>
</html>
