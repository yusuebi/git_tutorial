$(function() {
	var arrId = [];		// ID
	var arrTr = [];		// DOM要素
	var arrName = [];	// 名前
	var arrArea = [];	// 面積

	// リストに値を格納
	$("#lstBdy tr").each(function(i) {
		arrId.push(i);

		arrTr.push($(this));

		arrName.push($(this).find("td").eq(0).text());

		arrArea.push($(this).find("td").eq(1).text() * 1);
	});

	// 名前でソート
	var sortName = function(a, b) {
		var aName = arrName[a];
		var bName = arrName[b];
		return aName > bName ? 1 : -1;
	};

	// 面積でソート
	var sortArea = function(a, b) {
		var aArea = arrArea[a];
		var bArea = arrArea[b];
		return aArea < bArea ? 1 : -1;
	};

	var reflect = function() {
		$("#lstBdy").empty();

		// tr を id の順に追加
		$.each(arrId, function(i, id) {
			$("#lstBdy").append(arrTr[id]);
		});
	};

	$("#btnSortName").click(function() {
		arrId.sort(sortName);
		reflect();
	});

	$("#btnSortArea").click(function() {
		arrId.sort(sortArea);
		reflect();
	});
});
