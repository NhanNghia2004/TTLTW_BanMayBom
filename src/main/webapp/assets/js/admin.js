
// quan li sp

function loadProductData() {
    $.ajax({
        url: 'http://localhost:8080/TTW/productController', // API của bạn
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data); // Kiểm tra dữ liệu trả về
            var tableBody = $('#productBody');
            tableBody.empty(); // Xóa dữ liệu cũ

            data.forEach(function (product) {
                var row = `<tr>
                        <td>${product.id}</td>
                        <td style="min-width: 70px;">${product.nameProduct}</td>
                        <td><img src="${product.image}" alt="Product Image" style="width: 60px; height: 60px;"></td>
                        <td>${product.priceProduct}</td>
                        <td style="min-width: 150px;">${product.description}</td>
                        <td style="min-width: 90px;">${product.manufactureDate}</td>
                        <td>${product.power}</td>
                        <td>${product.pressure}</td>
                        <td>${product.flowRate}</td>
                        <td>${product.pipeDiameter}</td>
                        <td>${product.voltage}</td>
                        <td>${product.brand}</td>
                        <td>${product.warrantyMonths}</td>
                        <td>${product.stock}</td>
                        <td>${product.idCategory}</td>
                        <td>${product.idSupplier}</td>
                        <td>
                            <div class="d-flex gap-2 justify-content-center">
                                <button class="btn btn-sm btn-primary edit-btn" data-id="${product.id}">Sửa</button>
                                <button class="btn btn-sm btn-danger delete-btn" data-id="${product.id}">Xóa</button>
                            </div>
                        </td>
                    </tr>`;
                tableBody.append(row);
            });

            // Destroy bảng cũ nếu có
            if ($.fn.DataTable.isDataTable('#productTable')) {
                $('#productTable').DataTable().destroy();
            }

            // Khởi tạo DataTable với tiếng Việt
            $('#productTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "lengthChange": true,
                "language": {
                    "lengthMenu": "Hiển thị _MENU_ sản phẩm mỗi trang",
                    "zeroRecords": "Không tìm thấy sản phẩm nào",
                    "info": "Hiển thị _START_ đến _END_ của _TOTAL_ sản phẩm",
                    "infoEmpty": "Không có sản phẩm nào",
                    "infoFiltered": "(lọc từ _MAX_ sản phẩm)",
                    "search": "Tìm kiếm:",
                    "paginate": {
                        "first": "Đầu",
                        "last": "Cuối",
                        "next": "Sau",
                        "previous": "Trước"
                    },
                }
            });
        },
        error: function (xhr, status, error) {
            console.error("Lỗi lấy dữ liệu sản phẩm: " + error);
            console.log(xhr.responseText);
        }
    });
}
document.addEventListener('DOMContentLoaded',loadProductData)
//thêm
// Hàm xử lý thêm sản phẩm
function addProduct(event) {
    event.preventDefault();  // Ngăn reload trang

    // Lấy form theo ID
    var form = document.getElementById('addProductForm');
    var formData = new FormData(form);
    const productData = Object.fromEntries(formData.entries());

    // Ép kiểu dữ liệu
    productData.nameProduct = String(productData.nameProduct);
    productData.image = String(productData.image);
    productData.priceProduct = parseFloat(productData.priceProduct);
    productData.description = String(productData.description);
    productData.manufactureDate = String(productData.manufactureDate);
    productData.power = String(productData.power);
    productData.pressure = parseFloat(productData.pressure);
    productData.flowRate = parseFloat(productData.flowRate);
    productData.pipeDiameter = parseFloat(productData.pipeDiameter);
    productData.voltage = parseInt(productData.voltage);
    productData.brand = String(productData.brand);
    productData.warrantyMonths = parseInt(productData.warrantyMonths);
    productData.stock = parseInt(productData.stock);
    productData.idCategory = parseInt(productData.idCategory);
    productData.idSupplier = parseInt(productData.idSupplier);

    console.log(productData); // Debug data

    // Gửi AJAX
    $.ajax({
        url: 'http://localhost:8080/TTW/productController',
        type: 'POST',
        data: JSON.stringify(productData),
        contentType: 'application/json',
        success: function (response) {
            alert(response.message);
            if (response.message === "Sản phẩm đã được thêm thành công!") {
                $('#addProductModal').modal('hide');
                // Giả sử có hàm loadProducts()
                loadProductData();
            }
        },
        error: function (xhr, status, error) {
            alert("Có lỗi xảy ra: " + error);
        }
    });
}


