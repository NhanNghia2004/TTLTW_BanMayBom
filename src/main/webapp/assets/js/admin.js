// $(document).ready(function() {
//     $('#productTable').DataTable();
// });
// $(document).ready(function() {
//     $('#userTable').DataTable();
// });
//
//

// quan li sp

$(document).ready(function () {
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
                        <td >
                        <div class="d-flex gap-2 justify-content-center">
                            <button class="btn btn-sm btn-primary edit-btn" data-id="${product.id}">Sửa</button>
                            <button class="btn btn-sm btn-danger delete-btn" data-id="${product.id}">Xóa</button>
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
});
$(document).ready(function () {
    // Sự kiện khi submit form thêm sản phẩm
    $('#addProductForm').submit(function (event) {
        event.preventDefault();  // Ngừng hành động mặc định (reload trang)

        // Thu thập dữ liệu từ form, bao gồm cả file (nếu có)
        var formData = new FormData(this);

        const productData = Object.fromEntries(formData.entries());

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

        console.log(JSON.stringify(productData))

        
        // Gửi AJAX request tới backend
        $.ajax({
            url: 'http://localhost:8080/TTW/productController',  // Địa chỉ servlet hoặc controller
            type: 'POST',
            data: JSON.stringify(productData),
            contentType: false,  // Quan trọng: không gửi content-type vì ta đang sử dụng FormData
            processData: false,  // Quan trọng: để jQuery tự xử lý dữ liệu
            success: function (response) {
                alert(response.message);  // Hiển thị thông báo thành công
                if (response.message === "Sản phẩm đã được thêm thành công!") {
                    // Cập nhật lại danh sách sản phẩm, hoặc đóng modal
                    $('#addProductModal').modal('hide');
                    loadProducts();  // Giả sử có hàm loadProducts để cập nhật bảng sản phẩm
                }
            },
            error: function (xhr, status, error) {
                alert("Có lỗi xảy ra: " + error);
            }
        });
    });
});

// Hàm để tải lại danh sách sản phẩm
function loadProducts() {
    $.ajax({
        url: 'http://localhost:8080/TTW/productController',  // Địa chỉ lấy tất cả sản phẩm
        type: 'GET',
        dataType: 'json',  // Đảm bảo dữ liệu trả về là dạng JSON
        success: function (response) {
            var productBody = $('#productBody');
            productBody.empty();  // Xóa nội dung cũ trong bảng sản phẩm
            $.each(response, function (index, product) {
                // Tạo một hàng mới cho mỗi sản phẩm
                var row = $('<tr></tr>');
                row.append('<td>' + product.id + '</td>');
                row.append('<td>' + product.nameProduct + '</td>');
                row.append('<td><img src="' + product.image + '" width="100" alt="Product Image"></td>');
                row.append('<td>' + product.priceProduct + ' VNĐ</td>');
                // Thêm các cột khác nếu cần thiết
                row.append('<td><button class="btn btn-primary btn-sm" onclick="editProduct(' + product.id + ')">Sửa</button></td>');
                row.append('<td><button class="btn btn-danger btn-sm" onclick="deleteProduct(' + product.id + ')">Xóa</button></td>');
                productBody.append(row);
            });
        },
        error: function () {
            alert("Không thể tải danh sách sản phẩm!");
        }
    });
}


