(function($) {
	$.ajaxSetup({
			beforeSend: function(xhr) {
			xhr.setRequestHeader("AJAX", true);
		},
		error: function(xhr, status, err) {
			if (xhr.status == 401) {
				console.log("401");
			} else if (xhr.status == 403) {
				console.log("403");
				window.location = '<c:url value="/main.do" />';
			} else {
				alert("예외가 발생했습니다. 관리자에게 문의하세요.");
			}
		}
	});
})(jQuery);
