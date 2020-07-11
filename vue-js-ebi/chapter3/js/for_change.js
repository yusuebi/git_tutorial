new Vue({
  el: '#app',
  data: {
    list: ['赤パジャマ','青パジャマ','黄パジャマ']
  },
  methods: {
    onclick: function(){
      this.list.shift();
    }
  }
});
