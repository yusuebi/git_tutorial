$(function() {
	var cnvs = $("#cnvs").get(0);

	if (! cnvs || ! cnvs.getContext) return;

	var ctx = cnvs.getContext("2d");
	var w = cnvs.width;
	var h = cnvs.height;

	// 背景を塗りつぶし
	ctx.fillStyle = "#ffc";
	ctx.fillRect(0, 0, w, h);

	// 画像の読み込み
	var img = new Image();
	img.onload = function() {
		var iW = this.width;
		var iH = this.height;
		ctx.drawImage(this, 0, 240);
		ctx.drawImage(this, 0, 0, 320, 240);
		ctx.drawImage(this,
				iW * 0.2, iH * 0.2, iW * 0.6, iH * 0.6,
				320, 0, 640, 480);
	};
	img.src = "../img_sample.jpg";
});
