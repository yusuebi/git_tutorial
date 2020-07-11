$(function() {
	$("#chck").change(function() {
		var isChck = $(this).prop("checked");
		if (isChck) {
			$("#pnl1").show();
		} else {
			$("#pnl1").hide();
		}
	});
});
