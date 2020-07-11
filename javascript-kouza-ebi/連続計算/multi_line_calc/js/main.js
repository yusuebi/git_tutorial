$(function() {
	// 計算
	var calc = function() {
		var srcTxt = $("#source").val();
		var srcArr = srcTxt.split("\n");

		var resArr = [];
		for (var i = 0; i < srcArr.length; i ++) {
			var src = srcArr[i];
			src = src.replace(/\s/g, "");
			if (src == "") continue;

			var res;
			try {
				res = eval(src);
			} catch(e) {
				res = e;
			}
			resArr.push(src + " = " + res);
		}

		var resTxt = resArr.join("\n");
		$("#result").val(resTxt);
	};

	$("#btnCalc").click(calc);
});
