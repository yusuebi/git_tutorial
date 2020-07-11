new Vue({
  el: '#app',
  data: {
    unit: {}
  },
  methods: {
    //選択されたオプションの値をログに出力
    onchange: function(){
      console.log(this.unit.name + '：' +this.unit.size);
    }
  }
});
