var Vue = require('vue');
var App = require('./vue/index.vue');
process.env.NODE_ENV = 'production';

new Vue({
    el: '#app',
    render: function (createElement) {
        return createElement(App)
    }
});