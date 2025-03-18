// $(document).ready(function() {
//     $('#productTable').DataTable();
// });
// $(document).ready(function() {
//     $('#userTable').DataTable();
// });
//
//
//


//quan li sp

$(document).ready(function() {
    $.ajax({
        url: 'api/products',
        type: 'GET',
        dataType: 'json',
        success: function(data) {
            console.log(data); // Kiểm tra dữ liệu trả về
            var tableBody = $('#productBody');
            tableBody.empty(); // Xóa dữ liệu cũ trong bảng

            data.forEach(function(product) {
                var row = `<tr>
                <td>${product.id}</td>
                <td>${product.nameProduct}</td>
                <td><img src="${product.image}" alt="Product Image" style="width: 50px; height: 50px;"></td>
                <td>${product.priceProduct}</td>
                <td>${product.description}</td>
                <td>${product.manufactureDate}</td>
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
            </tr>`;
                tableBody.append(row);
            });
        },
        error: function(xhr, status, error) {
            console.error("Error fetching product data: " + error);
            console.log(xhr.responseText); // Kiểm tra response từ server
        }
    });

});
