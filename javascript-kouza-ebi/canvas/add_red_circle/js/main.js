$(function() {
	// ドラッグ＆ドロップの準備
	var initDAndD = function() {
		var $holder = $("#dropArea");

		$holder.on("dragover", function () {
			$(this).addClass("drop");
			return false;
		});

		$holder.on("dragleave", function () {
			$(this).removeClass("drop");
			return false;
		});

		$holder.on("drop", function (e) {
			// 遅延実行
			setTimeout(function() {
				$holder.removeClass("drop");
			}, 300);

			// 処理の開始
			actDrp(e.originalEvent);
			return false;
		});
	}

	// ドラッグ＆ドロップの実行
	var actDrp = function(e) {
		var reader = new FileReader();
		reader.readAsDataURL(e.dataTransfer.files[0]);
		reader.onload = function(){
			var dtURL = reader.result;

			var img = new Image();
			img.src = dtURL;
			img.onload = actImgProc;
		};
	};

	// 画像処理
	var actImgProc = function() {
		var img = this;
		var imgW = img.width;
		var imgH = img.height;
		var cnvsW = 640;
		var cnvsH = 480;

		var drwW = cnvsW;
		var drwH = Math.floor(drwW / imgW * imgH);
		var drwX = 0;
		var drwY = Math.floor((cnvsH - drwH) / 2);

		var cProc = genCanvas(cnvsW, cnvsH);
		cProc.ctx.drawImage(img, 0, 0, imgW, imgH, drwX, drwY, drwW, drwH);
		eachPixel(cProc, fltrRed);

		var c = genCanvas(cnvsW, cnvsH);
		c.ctx.drawImage(img, 0, 0, imgW, imgH, drwX, drwY, drwW, drwH);

		// クリップ付きで描画
		c.ctx.save();
		c.ctx.beginPath();
		c.ctx.arc(cnvsW / 2, cnvsH / 2, cnvsH * 0.6, 0, Math.PI * 2, false);
		c.ctx.clip();
		c.ctx.drawImage(cProc.cnvs, 0, 0);
		c.ctx.restore();

		// クリップ付きで描画2
		c.ctx.save();
		c.ctx.beginPath();
		c.ctx.arc(cnvsW / 2, cnvsH / 2, cnvsH * 0.4, 0, Math.PI * 2, false);
		c.ctx.clip();
		c.ctx.drawImage(img, 0, 0, imgW, imgH, drwX, drwY, drwW, drwH);
		c.ctx.restore();

		var dtUrl = c.cnvs.toDataURL("image/png");

		var img = new Image();
		img.src = dtUrl;
		$(img).addClass("img-responsive");
		$("#outArea").empty().append(img);
	}


	// Cnavas の生成
	var genCanvas = function(w, h) {
		var c = {cnvs: null, ctx: null};

		c.cnvs = $("<canvas>").attr("width", w).attr("height", h).get(0);

		if (! c.cnvs || ! c.cnvs.getContext) return null;

		c.ctx = c.cnvs.getContext("2d");

		return c;
	};


	// 画素操作
	var eachPixel = function(c, fnc) {
		var w = c.cnvs.width;
		var h = c.cnvs.height;
		var imgDt = c.ctx.getImageData(0, 0, w, h);
		var data = imgDt.data;

		for (var y = 0; y < h; y ++) {
			for (var x = 0; x < w; x ++) {
				// 画素の位置を計算
				var pos = (x + y * w) * 4;
				fnc(data, pos);
			}
		}

		c.ctx.putImageData(imgDt, 0, 0);
	};

	var fltrRed = function(data, pos) {
		var r = data[pos + 0];
		var g = data[pos + 1];
		var b = data[pos + 2];
		var a = data[pos + 3];

		var y = 0.298912 * r + 0.586611 * g + 0.114478 * b;
		y = Math.floor(y);

		data[pos + 0] = y;
		data[pos + 1] = y >> 3;
		data[pos + 2] = y >> 3;
	};


	initDAndD();
});
