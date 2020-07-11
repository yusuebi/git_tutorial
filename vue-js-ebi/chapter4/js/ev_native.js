Vue.component('my-input', {
  template: `<input type="text" />`
});

new Vue({
  el: '#app',
  methods: {
    onfocus: function(e) {
      console.log(e);
    }
  }
});
