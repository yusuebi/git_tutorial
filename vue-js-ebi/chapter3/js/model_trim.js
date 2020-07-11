new Vue({
  el: '#app',
  data: {
    memo: ''
  },
  methods: {
    //入力値をログに出力
    onchange: function(){
      console.log('入力値は「' + this.memo + '」です。');
    }
  }
});
