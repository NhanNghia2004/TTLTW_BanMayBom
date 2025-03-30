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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
     <link rel="stylesheet" href="assets/css/headerAndFooter.css">
  </head>

  <body>
    <header id="header"></header>
    <nav id="nav"></nav>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="border p-3">
            

            <div class="row pt-3">
              
              <!-- phan thay doi -->
              <div class="col-md-12">
                <div class="text-primary">
                   <h2 style="color: #162e5c !important;">Thông Tin Đơn Hàng và Vận Chuyển</h2>
                   <form id="orderForm" action="CheckoutServlet" method="post" style="color: #162e5c !important;">
                    <div class="mb-3">
                       <label class="form-label">Họ và Tên</label>
                       <input type="text" class="form-control" id="fullName" value="${auth.fullname}" required>
                     </div>
                     <div class="mb-3">
                       <label class="form-label">Số Điện Thoại</label>
                       <input type="text" class="form-control" id="phone" value="${auth.phone}" required>
                     </div>
                     <div class="mb-3">
                       <label class="form-label">Email</label>
                       <input type="email" class="form-control" id="email"  value="${auth.email}" required>
                     </div>
                     <div class="mb-3">
                       <label class="form-label">Địa Chỉ Giao Hàng</label>
                       <textarea class="form-control" id="address" rows="3" required>${auth.address}</textarea>
                     </div>
                     <div class="mb-3">
                       <label class="form-label">Phương Thức Thanh Toán</label>
                      <select class="form-select" name="paymentMethod" id="paymentMethod">                        <option value="1">Thanh toán khi nhận hàng</option>
                         <option value="2">Chuyển khoản ngân hàng</option>
                       </select>
                     </div>
                     <div class="d-flex justify-content-between">
  						<button type="submit" class="btn btn-success">Xác nhận đơn hàng</button>
 						<a href="CartServlet" class="btn btn-secondary">Trở về giỏ hàng</a>
					</div>
                   </form>
                   <div id="orderMessage" class="mt-3"></div>
            </div>

            <footer id="footer2"></footer>
          </div>
        </div>
      </div>
    </div>
    </div>
    </div>
    <footer id="footer"></footer>
    <script>
      const header = document.getElementById("header");
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
      fetch("./assets/component/nav.jsp")
              .then((response) => response.text())
              .then((html) => (nav.innerHTML = html));
      
     
    </script>
    <script>
    document.getElementById("orderForm").addEventListener("submit", async function(event) {
        event.preventDefault();

        let formData = new FormData(this);
        try {
            let response = await fetch("CheckoutServlet", {
                method: "POST",
                body: formData
            });

            if (!response.ok) throw new Error(`HTTP error! Status: ${response.status}`);

            let data = await response.json();
            console.log("Data received:", data);
            console.log("Success value:", data.success, typeof data.success); // Kiểm tra kiểu dữ liệu

            let messageBox = document.getElementById("orderMessage");
            messageBox.innerHTML = '<div class="alert ' + (data.success ? 'alert-success' : 'alert-danger') + '">' + data.message + '</div>';



        } catch (error) {
            console.error("Error:", error);
            document.getElementById("orderMessage").innerHTML = `<div class="alert alert-danger">Lỗi khi đặt hàng!</div>`;
        }
    });


</script>
  </body>
</html>
