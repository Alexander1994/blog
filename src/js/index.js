process.env.NODE_ENV = 'production';

var Vue = require('vue');
var App = require('./vue/index.vue');
var Blog = require('./vue/blog.vue');
var Home = require('./vue/home.vue');
var VueRouter = require('vue-router');



Vue.use(VueRouter);

var routes = [
    {path: '/', component: Home},
    {path: '/:id', component: Blog, props:true}
];

var router = new VueRouter({
    routes: routes
});

new Vue({
    router: router,
    render: function (createElement) {
        return createElement(App)
    },
    components: { App: App }
}).$mount('#app');