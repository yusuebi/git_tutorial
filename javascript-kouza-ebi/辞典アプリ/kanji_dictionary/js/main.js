$(function() {
	// リサイズ時の処理
	var resize = function() {
		var $target = $(".col-xs-3");
		var w = $target.width();

		$target
		.height(w)
		.css("font-size", Math.floor(w * 0.66) + "px")
			// フォントサイズを指定
		.css("line-height", w + "px");
	};

	$(window).resize(resize);
	resize();


	// 説明を表示
	var showExp = function(target) {
		var exp = $(target).find(".exp").text();
		$("#expArea").val(exp);
	};

	$(".col-xs-3").hover(
		function() {
			$(this).css("background", "#ffc");	// 背景色を変更
			showExp(this);	// 説明を表示
		},
		function() {
			$(this).css("background", "#fff");	// 背景色を変更
		}
	);
});
