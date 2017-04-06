process.env.NODE_ENV = 'production';

var Vue = require('vue');
var App = require('./vue/index.vue');
var BlogStream = require('./vue/blogstream.vue');
var Home = require('./vue/home.vue');
var VueRouter = require('vue-router');



Vue.use(VueRouter);

var routes = [
    {name: "home", path: '/', component: Home},
    {name: "blog", path: '/blog/:id', component: BlogStream, props:true}
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