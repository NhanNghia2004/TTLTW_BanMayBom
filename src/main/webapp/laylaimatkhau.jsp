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

            
              <!-- phan thay doi -->
              <div class="col-md-12">
                <h3 class="text-primary">Quên mật khẩu</h3>
                <div class="container-fluid d-flex justify-content-center">
                    <div class="forgot-password-container">
                      <div class="mb-4">
                        <img src="assets/imgs/khac/logo.png" alt="key icon" width="500">
                      </div>
                      <h2><i class="fa-solid fa-key" style="color: #680a8a;"></i>Quên mật khẩu?</h2>
                      <p class="text-muted">Đừng lo lắng, chúng tôi sẽ gửi cho bạn hướng dẫn đặt lại.</p>
                      <form>
                        <div class="mb-3">
                          <label for="email" class="form-label visually-hidden">Email</label>
                          <input type="email" class="form-control" id="email" placeholder="Enter your email">
                        </div>
                        <button type="submit" class="btn btn-custom btn-block border-danger" style="margin-left: 200px;">Đặt lại mật khẩu</button>
                        <div class="mt-3">
                          <a href="dangnhap.jsp" class="text-muted">← Quay lại để đăng nhập</a>
                        </div>
                      </form>
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
