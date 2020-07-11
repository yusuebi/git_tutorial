new Vue({
	el: '#app',
	data: {
		author: {
			name: '山田'
		}
	},
	created: function(){
		let that =this;
		this.timer = setTimeout(function() {
			//that.author.name = 'Y.YAMADA';
			//that.author.company = 'WINGSプロジェクト';
			Vue.set(that.author, 'company', 'WINGプロジェクト');
		}, 3000);
	},
	beforeDestroy: function() {
		clearInterval(this.timer);
	}
});