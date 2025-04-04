// quan li sp

function loadProductData() {
    if ($.fn.dataTable.isDataTable('#productTable')) {
        $('#productTable').DataTable().clear().destroy();
    }
    // Static mapping for category and supplier names (replace with dynamic data if necessary)
    var categories = {
        1: 'Máy bơm nước',
        2: 'Máy bơm chân không',
        3: 'Máy bơm ly tâm',
        4: 'Máy bơm định lượng',
        5: 'Máy bơm hóa chất',
        6: 'Máy bơm chìm',
        7: 'Máy bơm nước sạch',
        8: 'Máy bơm công nghiệp'
    };

    var suppliers = {
        1: 'Công ty A',
        2: 'Công ty B',
        3: 'Công ty C',
        4: 'Công ty D',
        5: 'Công ty E',
        6: 'Công ty F',
        7: 'Công ty G',
        8: 'Công ty H',
        9: 'Công ty I',
        10: 'Công ty J'
    };
    $.ajax({
        url: 'http://localhost:8080/TTW/productController', // API của bạn
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data); // Kiểm tra dữ liệu trả về
            var tableBody = $('#productBody');
            tableBody.empty(); // Xóa dữ liệu cũ

            data.forEach(function (product) {

                // Get category and supplier names based on their IDs
                var categoryName = categories[product.idCategory] || 'N/A';
                var supplierName = suppliers[product.idSupplier] || 'N/A';

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
                    
                        <td style="min-width: 100px;" data-category-id="${product.idCategory}">${categoryName}</td> <!-- Display category name -->
                        <td style="min-width: 70px;" data-supplier-id="${product.idSupplier}">${supplierName}</td> <!-- Display supplier name -->
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
// sua san pham
// Hàm xử lý khi nhấn nút "Sửa" để hiển thị dữ liệu sản phẩm vào modal
$(document).on('click', '.edit-btn', function() {
    var id = $(this).data('id');  // Lấy id sản phẩm từ thuộc tính data-id
    showEditProductModal(id);  // Hiển thị modal sửa sản phẩm
});

// Hàm hiển thị dữ liệu sản phẩm trong modal sửa
function showEditProductModal(id) {
    // Lấy dữ liệu của sản phẩm từ dòng chứa nút sửa

    var row = $('button[data-id="'+id+'"]').closest('tr');  // Lấy dòng chứa nút sửa
    // Lấy giá trị từ các cột trong dòng đó và điền vào form modal
    $('#editProductId').val(id);
    $('#editProductName').val(row.find('td').eq(1).text());  // Lấy tên sản phẩm từ cột thứ 2
    $('#editProductImage').val(row.find('td').eq(2).find('img').attr('src'));  // Lấy hình ảnh từ cột thứ 3
    $('#editProductPrice').val(row.find('td').eq(3).text());  // Lấy giá từ cột thứ 4
    $('#editProductDescription').val(row.find('td').eq(4).text());  // Lấy mô tả từ cột thứ 5
    $('#editProductManufactureDate').val(row.find('td').eq(5).text());  // Lấy ngày sản xuất từ cột thứ 6
    $('#editProductPower').val(row.find('td').eq(6).text());  // Lấy công suất từ cột thứ 7
    $('#editProductPressure').val(row.find('td').eq(7).text());  // Lấy áp suất từ cột thứ 8
    $('#editProductFlowRate').val(row.find('td').eq(8).text());  // Lấy lưu lượng từ cột thứ 9
    $('#editProductPipeDiameter').val(row.find('td').eq(9).text());  // Lấy đường kính ống từ cột thứ 10
    $('#editProductVoltage').val(row.find('td').eq(10).text());  // Lấy điện áp từ cột thứ 11
    $('#editProductBrand').val(row.find('td').eq(11).text());  // Lấy thương hiệu từ cột thứ 12
    $('#editProductWarrantyMonths').val(row.find('td').eq(12).text());  // Lấy bảo hành từ cột thứ 13
    $('#editProductStock').val(row.find('td').eq(13).text());  // Lấy tồn kho từ cột thứ 14
    $('#editProductCategory').val(row.find('td').eq(14).data('category-id'));  // Lấy danh mục từ cột thứ 15
    $('#editProductSupplier').val(row.find('td').eq(15).data('supplier-id')); // Lấy nhà cung cấp từ cột thứ 16

    // Hiển thị modal
    $('#editProductModal').modal('show');
}

// Hàm xử lý sửa sản phẩm
function editProduct(event) {
    event.preventDefault();  // Ngăn reload trang

    // Lấy form theo ID
    var form = document.getElementById('editProductForm');
    var formData = new FormData(form);
    const productData = Object.fromEntries(formData.entries());
    var pid =parseInt(document.getElementById('editProductId').value);
    // Ép kiểu dữ liệu
    productData.id = parseInt(productData.id);  // ID sản phẩm cần sửa
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

    // Gửi yêu cầu PUT để cập nhật sản phẩm

    $.ajax({
        url: 'http://localhost:8080/TTW/productController?id=' + pid,  // API xử lý PUT sửa sản phẩm
        type: 'PUT',
        data: JSON.stringify(productData),
        contentType: 'application/json',
        success: function(response) {
            alert(response.message);
            if (response.message === "Sản phẩm đã được cập nhật thành công!") {
                $('#editProductModal').modal('hide');  // Đóng modal sau khi sửa thành công
                loadProductData();  // Tải lại dữ liệu sản phẩm
            }
        },
        error: function(xhr, status, error) {
            console.error('Lỗi cập nhật :', error);
            alert("Có lỗi xảy ra: " + error);
        }
    });
}
// Hàm xử lý xóa sản phẩm

$(document).off('click', '.delete-btn').on('click', '.delete-btn', function () {
    var productId = $(this).data('id');

    if (confirm('Bạn có chắc chắn muốn xóa sản phẩm này?')) {
        $.ajax({
            url: 'http://localhost:8080/TTW/productController?id=' + productId,
            type: 'DELETE',
            success: function (response) {
                alert(response.message);
                loadProductData();
            },
            error: function (xhr, status, error) {
                console.log(xhr);
                let errorMessage;
                try {
                    errorMessage = JSON.parse(xhr.responseText).message || 'Có lỗi xảy ra khi xóa sản phẩm';
                } catch (e) {
                    errorMessage = 'Có lỗi xảy ra khi xóa sản phẩm';
                }
                alert(errorMessage);
            }
        });
    }
});

// --------------khuyen mãi--------------------
function loadSaleData() {
    if ($.fn.dataTable.isDataTable('#promotionTable')) {
        $('#promotionTable').DataTable().clear().destroy();
    }

    // Static mapping for status names (you can modify or make this dynamic if necessary)
    var statuses = {
        1: 'Hoạt động',
        0: 'Không hoạt động'
    };

    $.ajax({
        url: 'http://localhost:8080/TTW/SaleController', // API của bạn
        type: 'GET',
        dataType: 'json',
        success: function (data) {
            console.log(data); // Kiểm tra dữ liệu trả về
            var tableBody = $('#promotionBody');
            tableBody.empty(); // Xóa dữ liệu cũ

            data.forEach(function (sale) {

                // Get status name based on status ID
                var statusName = statuses[sale.status] || 'N/A';

                var row = `<tr>
                        <td>${sale.id}</td>
                        <td style="min-width: 50px;">${sale.promotion}</td>
                        <td style="min-width: 130px;">${sale.description}</td>
                        <td>${statusName}</td>
                        <td style="min-width: 100px;">${sale.startDate}</td>
                        <td style="min-width: 100px;">${sale.endDate}</td>
                        <td>${sale.idProduct}</td>
                        <td>
                            <div class="d-flex gap-2 justify-content-center">
                                <button class="btn btn-sm btn-primary edit-btn" data-id="${sale.id}">Sửa</button>
                                <button class="btn btn-sm btn-danger delete-btn" data-id="${sale.id}">Xóa</button>
                            </div>
                        </td>
                    </tr>`;
                tableBody.append(row);
            });

            // Destroy bảng cũ nếu có
            if ($.fn.DataTable.isDataTable('#promotionTable')) {
                $('#promotionTable').DataTable().destroy();
            }

            // Khởi tạo DataTable với tiếng Việt
            $('#promotionTable').DataTable({
                "paging": true,
                "searching": true,
                "ordering": true,
                "lengthChange": true,
                "language": {
                    "lengthMenu": "Hiển thị _MENU_ khuyến mãi mỗi trang",
                    "zeroRecords": "Không tìm thấy khuyến mãi nào",
                    "info": "Hiển thị _START_ đến _END_ của _TOTAL_ khuyến mãi",
                    "infoEmpty": "Không có khuyến mãi nào",
                    "infoFiltered": "(lọc từ _MAX_ khuyến mãi)",
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
            console.error("Lỗi lấy dữ liệu khuyến mãi: " + error);
            console.log(xhr.responseText);
        }
    });
}

document.addEventListener('DOMContentLoaded', loadSaleData);

