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
  </head>

  <body>
    <header id="header"></header>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="border p-3">
            <div id="header2"></div>
            <nav id="nav"></nav>

            <div class="row pt-3">
              <div class="col-md-3">
                <div id="chonmaybom"></div>
                <div id="tintuc"></div>
              </div>
              <!-- phan thay doi -->
              <div class="col-md-9">
                <div class="text-primary">
                    <h4>Mua hàng & thanh toán</h4>
                  </div>
                
                  <!-- Phần I: Mua hàng -->
                  <div class="content">
                    <h5 class="text-primary">I. Mua hàng</h5>
                    <p>Sản phẩm được bán trực tiếp tại cửa hàng. Khách hàng có thể gọi điện hoặc đặt mua qua website, chúng tôi sẽ xử lý trong thời gian sớm nhất dựa trên thông tin khách hàng cung cấp.</p>
                
                    <!-- Bước 1 -->
                    <h5>Bước 1: Chọn sản phẩm</h5>
                    <ul>
                      <li>Bạn vào Website và tìm các sản phẩm cần mua, để nhanh chóng bạn chọn các Danh mục tương ứng ở góc trái Website.</li>
                      <li>Nếu bạn muốn tìm kiếm sản phẩm nào đó mà đã biết tên hoặc khoảng giá có thể dùng công cụ tìm kiếm.</li>
                      <li>Sau khi chọn được sản phẩm, bạn click vào nút <strong>Mua hàng</strong> tương ứng với sản phẩm cần mua.</li>
                    </ul>
                
                    <!-- Bước 2 -->
                    <h5>Bước 2: Đặt hàng</h5>
                    <ul>
                      <li>Gọi điện thoại đặt hàng tới số Hotline trên website</li>
                      <li>Chat với nick Hỗ trợ trực tuyến và Yêu cầu đặt hàng</li>
                      <li>Đặt mua trên Website</li>
                      <li>Bạn nên điền đầy đủ và chính xác thông tin để chúng tôi có thể liên hệ được với bạn sớm nhất.</li>
                    </ul>
                
                    <!-- Bước 3 -->
                    <h5>Bước 3: Hoàn tất</h5>
                    <ul>
                      <li>Sau khi nhận được đơn hàng, nhân viên Công ty sẽ xác thực thông tin, kiểm tra lại hàng và liên hệ lại với bạn.</li>
                      <li>Khách hàng tiến hành thanh toán trực tiếp, chuyển tiền vào tài khoản của Công ty, hoặc chuyển tiền qua nhà xe.</li>
                      <li>Sau khi nhận được thông tin khách hàng và nhận được tiền, chúng tôi sẽ tiến hành chuyển hàng sớm nhất cho Quý khách.</li>
                    </ul>
                
                    <!-- Bước 4 -->
                    <h5>Bước 4: Nhận hàng</h5>
                    <ul>
                      <li>Quý khách sẽ nhận được hàng tận nơi nếu Quý khách ở nội thành Hà nội.</li>
                      <li>Quý khách ở xa có thể gửi hàng: Xe khách hoặc chuyển phát bưu điện theo yêu cầu quý khách.</li>
                    </ul>
                  </div>
                
                  <!-- Phần II: Thanh toán -->
                  <div class="content mt-4">
                    <h5 class="text-primary">II. Thanh toán</h5>
                    <ul>
                      <li>Với hàng giao tận nhà trong khu vực nội thành Hà Nội: thanh toán tiền mặt hoặc chuyển khoản ngay khi nhận được hàng.</li>
                      <li>Với hàng gửi đến khách ở xa : khách thanh toán qua chuyển khoản hoặc nhờ nhà xe. Chúng tôi sẽ kiểm tra và giao hàng theo yêu cầu của quý khách. Cước gửi hàng quý khách sẽ phải thanh toán.</li>
                    </ul>
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
