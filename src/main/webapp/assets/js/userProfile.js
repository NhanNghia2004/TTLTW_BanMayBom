/**
 * 
 */
document.addEventListener("DOMContentLoaded", function() {
	const editBtn = document.getElementById("editBtn");
	const submitBtn = document.getElementById("submitBtn");
	const formInputs = document.querySelectorAll("#userForm input");
	const messageDiv = document.getElementById("message");
	const form = document.getElementById("userForm");

	// Khi nhấn "Edit"
	editBtn.addEventListener("click", function() {
		formInputs.forEach(input => input.removeAttribute("readonly"));
		editBtn.style.display = "none";   // Ẩn nút Edit
		submitBtn.style.display = "block"; // Hiện nút Submit
	});

	// Khi nhấn "Submit"
	form.addEventListener("submit", function(event) {
		event.preventDefault(); // Ngăn chặn reload trang

		// Lấy dữ liệu từ form
		const formData = new FormData(form);

		// Gửi dữ liệu qua AJAX
		fetch("http://localhost:8080/DoAnLTWeb/UserProfileServlet", {
			method: "POST",
			body: formData
		})
			.then(response => response.json()) // Đọc phản hồi JSON từ server
			.then(data => {
				if (data.success) {
					messageDiv.innerHTML = '<div class="alert alert-success">' + data.message + '</div>';

					// Chuyển form về trạng thái chỉ đọc
					formInputs.forEach(input => input.setAttribute("readonly", "true"));
					editBtn.style.display = "block";
					submitBtn.style.display = "none";
				} else {
					messageDiv.innerHTML = '<div class="alert alert-danger">' + data.message + '</div>';
				}
			})
			.catch(error => {
				console.error("Lỗi khi gửi AJAX:", error);
				messageDiv.innerHTML = `<div class="alert alert-danger">Có lỗi xảy ra!</div>`;
			});
	});
});


function cancelOrder(orderId) {
	$.ajax({
		url: '/DoAnLTWeb/CancelOrderServlet',
		type: 'POST',
		contentType: "application/x-www-form-urlencoded",
		data: {
			orderId: orderId
		},
		success: function(response) {
	
				// Cập nhật trạng thái đơn hàng
				const elementId = 'status-' + orderId;
				const statusCell = document.getElementById(elementId);

				if (statusCell) {
					statusCell.textContent = "CANCELLED";
				} else {
					console.warn(`Không tìm thấy phần tử với id: ${elementId}`);
				}

				// Ẩn nút hủy
				const cancelButtonId = 'btn-' + orderId;
				const cancelButton = document.getElementById(cancelButtonId);

				if (cancelButton) {
					cancelButton.style.display = 'none';
				}

				alert(response.status);
		},
		error: function(response) {
		           alert(response.status);
		       }
	});
}
