<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="../../../../../../hoc/github/DOANLTW/assets/css/style.css" />
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
    <link rel="stylesheet" href="../../../../../../hoc/github/DOANLTW/assets/css/profile.css">
  </head>

  <body>
    <header id="header"></header>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="border p-3">
            <div id="header2"></div>
            <nav id="nav"></nav>

            <div class="row pt-3 container-fluid">
              <!-- phan thay doi -->
              <div class="col-md-12">
                <div class="container light-style flex-grow-1 container-p-y" >
                  <h4 class="font-weight-bold py-3 mb-4">Cài đặt tài khoản</h4>
                  <div class="card overflow-hidden" id="thongtin">
                    <div class="row no-gutters row-bordered row-border-light">
                      <div class="col-md-3 pt-0">
                        <div class="list-group list-group-flush account-settings-links">
                          <a
                            class="list-group-item list-group-item-action active"
                            data-toggle="list"
                            href="#account-general"
                            >Tổng quan</a
                          >
                          <a
                            class="list-group-item list-group-item-action"
                            data-toggle="list"
                            href="#account-change-password"
                            >Thay đổi mật khẩu</a
                          >
                          <a
                            class="list-group-item list-group-item-action"
                            data-toggle="list"
                            href="#account-info"
                            >Thông tin</a
                          >
                          <a
                            class="list-group-item list-group-item-action"
                            data-toggle="list"
                            href="#account-social-links"
                            >Liên kết xã hội</a
                          >
                          <a
                            class="list-group-item list-group-item-action"
                            data-toggle="list"
                            href="#account-connections"
                            >Kết nối</a
                          >
                          <a
                            class="list-group-item list-group-item-action"
                            data-toggle="list"
                            href="#account-notifications"
                            >Thông báo</a
                          >
                        </div>
                      </div>
                      <div class="col-md-9">
                        <div class="tab-content">
                          <div class="tab-pane fade active show" id="account-general">
                            <div class="card-body media align-items-center">
                              <img
                                src="../../../../../../hoc/github/DOANLTW/assets/imgs/khac/anhdaidien.png"
                                alt
                                class="d-block ui-w-80"
                              />
                              <div class="media-body ml-4">
                                <label class="btn btn-outline-primary">
                                  Tải ảnh mới lên
                                  <input type="file" class="account-settings-fileinput" />
                                </label>
                                &nbsp;
                                <button type="button" class="btn btn-default md-btn-flat">
                                  Cài lại
                                </button>
                                <div class="text-light small mt-1">
                                  Được phép JPG, GIF hoặc PNG. Kích thước tối đa 800K
                                </div>
                              </div>
                            </div>
                            <hr class="border-light m-0" />
                            <div class="card-body">
                              <div class="form-group">
                                <label class="form-label">Tên người dùng</label>
                                <input
                                  type="text"
                                  class="form-control mb-1"
                                />
                              </div>
                              <div class="form-group">
                                <label class="form-label">Tên</label>
                                <input
                                  type="text"
                                  class="form-control"
                                />
                              </div>
                              <div class="form-group">
                                <label class="form-label">E-mail</label>
                                <input
                                  type="text"
                                  class="form-control mb-1"
                                />
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="account-change-password">
                            <div class="card-body pb-2">
                              <div class="form-group">
                                <label class="form-label">Mật khẩu hiện tại</label>
                                <input type="password" class="form-control" />
                              </div>
                              <div class="form-group">
                                <label class="form-label">Mật khẩu mới</label>
                                <input type="password" class="form-control" />
                              </div>
                              <div class="form-group">
                                <label class="form-label">Lặp lại mật khẩu mới</label>
                                <input type="password" class="form-control" />
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="account-info">
                            <div class="card-body pb-2">
                              <div class="form-group">
                                <label class="form-label">Tiểu sử
                                </label>
                                <textarea class="form-control" rows="5"></textarea>
                              </div>
                              <div class="form-group">
                                <label class="form-label">Sinh nhật</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  value="May 3, 1995"
                                />
                              </div>
                              <div class="form-group">
                                <label class="form-label">Quê Quán</label>
                                <select class="custom-select">
                                  <option selected>Việt Nam</option>
                                  <option>Mỹ</option>
                                  <option>Anh</option>
                                  <option>Đức</option>
                                  <option>Pháp</option>
                                </select>
                              </div>
                            </div>
                            <hr class="border-light m-0" />
                            <div class="card-body pb-2">
                              <h6 class="mb-4">Danh bạ</h6>
                              <div class="form-group">
                                <label class="form-label">Điện thoại</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  value="01213354654"
                                />
                              </div>
                              <div class="form-group">
                                <label class="form-label">Website</label>
                                <input type="text" class="form-control" value />
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="account-social-links">
                            <div class="card-body pb-2">
                              <div class="form-group">
                                <label class="form-label">Twitter</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  value="https://twitter.com/user"
                                />
                              </div>
                              <div class="form-group">
                                <label class="form-label">Facebook</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  value="https://www.facebook.com/user"
                                />
                              </div>
                              <div class="form-group">
                                <label class="form-label">Google+</label>
                                <input type="text" class="form-control" value />
                              </div>
                              <div class="form-group">
                                <label class="form-label">Youtube</label>
                                <input type="text" class="form-control" value />
                              </div>
                              <div class="form-group">
                                <label class="form-label">Instagram</label>
                                <input
                                  type="text"
                                  class="form-control"
                                  value="https://www.instagram.com/user"
                                />
                              </div>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="account-connections">
                            <hr class="border-light m-0" />
                            <div class="card-body">
                              <button type="button" class="btn btn-Twitter">
                                Connect to <strong>Twitter</strong>
                              </button>
                            </div>
                            <hr class="border-light m-0" />
                            <div class="card-body">
                              <button type="button" class="btn btn-Youtube">
                                Connect to <strong>Youtube</strong>
                              </button>
                            </div>
                            <hr class="border-light m-0" />
                            <div class="card-body">
                              <button type="button" class="btn btn-facebook">
                                Connect to <strong>Facebook</strong>
                              </button>
                            </div>
                            <hr class="border-light m-0" />
                            <div class="card-body">
                              <button type="button" class="btn btn-instagram">
                                Connect to <strong>Instagram</strong>
                              </button>
                            </div>
                          </div>
                          <div class="tab-pane fade" id="account-notifications">
                            <div class="card-body pb-2">
                              <h6 class="mb-4">Hoạt động</h6>
                              <div class="form-group">
                                <label class="switcher">
                                  <input type="checkbox" class="switcher-input" checked />
                                  <span class="switcher-indicator">
                                    <span class="switcher-yes"></span>
                                    <span class="switcher-no"></span>
                                  </span>
                                  <span class="switcher-label"
                                    >Gửi email cho tôi khi có ai đó nhận xét về bài viết của tôi</span
                                  >
                                </label>
                              </div>
                              <div class="form-group">
                                <label class="switcher">
                                  <input type="checkbox" class="switcher-input" checked />
                                  <span class="switcher-indicator">
                                    <span class="switcher-yes"></span>
                                    <span class="switcher-no"></span>
                                  </span>
                                  <span class="switcher-label"
                                    >Gửi email cho tôi khi có ai đó trả lời trên chủ đề diễn đàn của tôi</span
                                  >
                                </label>
                              </div>
                              <div class="form-group">
                                <label class="switcher">
                                  <input type="checkbox" class="switcher-input" />
                                  <span class="switcher-indicator">
                                    <span class="switcher-yes"></span>
                                    <span class="switcher-no"></span>
                                  </span>
                                  <span class="switcher-label"
                                    >Gửi email cho tôi khi có ai đó theo dõi tôi</span
                                  >
                                </label>
                              </div>
                            </div>
                            <hr class="border-light m-0" />
                            <div class="card-body pb-2">
                              <h6 class="mb-4">Ứng dụng</h6>
                              <div class="form-group">
                                <label class="switcher">
                                  <input type="checkbox" class="switcher-input" checked />
                                  <span class="switcher-indicator">
                                    <span class="switcher-yes"></span>
                                    <span class="switcher-no"></span>
                                  </span>
                                  <span class="switcher-label">Tin tức và thông báo</span>
                                </label>
                              </div>
                              <div class="form-group">
                                <label class="switcher">
                                  <input type="checkbox" class="switcher-input" />
                                  <span class="switcher-indicator">
                                    <span class="switcher-yes"></span>
                                    <span class="switcher-no"></span>
                                  </span>
                                  <span class="switcher-label">Cập nhật sản phẩm hàng tuần</span>
                                </label>
                              </div>
                              <div class="form-group">
                                <label class="switcher">
                                  <input type="checkbox" class="switcher-input" checked />
                                  <span class="switcher-indicator">
                                    <span class="switcher-yes"></span>
                                    <span class="switcher-no"></span>
                                  </span>
                                  <span class="switcher-label">Thông báo blog hàng tuần</span>
                                </label>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="text-right mt-3">
                    <button type="button" class="btn btn-primary">Lưu thay đổi</button
                    >&nbsp;
                    <button type="button" class="btn btn-default">Hủy bỏ</button>
                  </div>
                </div>
                <script
                  data-cfasync="false"
                  src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"
                ></script>
                <script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
                <script type="text/javascript"></script>            
              </div>

              <footer id="footer2"></footer>
            </div>
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
