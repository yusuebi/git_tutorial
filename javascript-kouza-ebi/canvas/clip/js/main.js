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

		var c = genCanvas(cnvsW, cnvsH);

		c.ctx.beginPath();
		c.ctx.arc(cnvsW / 2, cnvsH / 2, cnvsH * 0.6, 0, Math.PI * 2, false);

		c.ctx.save();
		c.ctx.clip();
		c.ctx.drawImage(img, 0, 0, imgW, imgH, 0, 0, cnvsW, cnvsH);
		c.ctx.restore();

		var txt = "画像切り抜きアプリ";
		c.ctx.textAlign = "left";
		c.ctx.textBaseline = "top";
		c.ctx.font = "bold 64px sans-serif";

		c.ctx.globalAlpha = 0.5;
		c.ctx.fillStyle = "#fff";
		c.ctx.fillText(txt, 12, 12);
		c.ctx.fillStyle = "#000";
		c.ctx.fillText(txt, 10, 10);

		var dtUrl = c.cnvs.toDataURL("image/png");

		// 画像を表示
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


	initDAndD();
});
