let currentPage = 1;
let currentSort = "default";

function loadProducts(page, sort) {
    $.ajax({
        url: 'ProductPaginationServlet',
        method: 'GET',
        data: {
            page: page,
            sort: sort
        },
        success: function(response) {
            $('#product-container').empty();
            response.products.forEach(p => {
                $('#product-container').append(`
                    <div class="col-md-3">
                        <a href="chitietsanpham?id=${p.id}" style="text-decoration: none">
                            <div class="card position-relative">
                                <div class="discount-badge">-10%</div>
                                <img src="assets/imgs/maybom/${p.image}" class="card-img-top" alt="${p.nameProduct}" />
                                <div class="card-body themaybom" style="height: 200px">
                                    <h6 class="card-title">${p.nameProduct}</h6>
                                    <p class="new-price">${p.priceProduct.toLocaleString()}đ</p>
                                    <div class="btn btn-primary btn-sm">Xem ngay</div>
                                    <div class="btn btn-danger btn-sm ms-4">Mua ngay</div>
                                </div>
                            </div>
                        </a>
                    </div>
                `);
            });

            // Pagination
            $('#pagination-container').empty();
            for (let i = 1; i <= response.totalPages; i++) {
                $('#pagination-container').append(`
                    <button onclick="goToPage(${i})" class="${i === page ? 'active' : ''}">${i}</button>
                `);
            }
        }
    });
}

function goToPage(page) {
    currentPage = page;
    loadProducts(currentPage, currentSort);
}

$(document).ready(function() {
    loadProducts(currentPage, currentSort);

    $('#sortSelect').change(function() {
        currentSort = $(this).val();
        currentPage = 1;
        loadProducts(currentPage, currentSort);
    });
});
$(document).ready(function(){
    $.ajax({
        url: "trangchu",
        method: "GET",
        success: function(data){
            $("#productList").html(data);
        },
        error: function(){
            $("#productList").html("<p>Lỗi tải sản phẩm!</p>");
        }
    });
});
