$(function() {
	var d = null;
	var id = null;
	var wait = 10;

	// 経過時間文字列の取得
	var getElapsedTime = function() {
		var dNow = new Date();
		var dElapsed = dNow - d;
		var h = Math.floor(dElapsed / 1000 / 60 / 60);	// 時
		var m = Math.floor(dElapsed / 1000 / 60) % 60;	// 分
		var s = Math.floor(dElapsed / 1000) % 60;	// 秒
		var ms = dElapsed % 1000;	// ミリ秒

// 1  2   01  02
// 12 34  012 034

		var mTxt  = ("0" + m).substr(-2);
		var sTxt  = ("0" + s).substr(-2);
		var msTxt = ("00" + ms).substr(-3);

		return h + ":" + mTxt + ":" + sTxt + ":" + msTxt;
	};

	$("#btn").click(function() {
		if (id == null) {
			d = new Date();

			id = setInterval(function() {
				$("#output").text(getElapsedTime());
			}, wait);

			$("#btn").text("停止");
		} else {
			clearInterval(id);
			id = null;
			$("#output").text(getElapsedTime());

			$("#btn").text("開始");
		}
	});
});
