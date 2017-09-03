process.env.NODE_ENV = 'production';

var Vue = require('vue');
var App = require('./vue/index.vue');
var BlogStream = require('./vue/blogstream.vue');
var Home = require('./vue/home.vue');
var VueRouter = require('vue-router');
var VueScrollTo = require('vue-scrollto');

Vue.use(VueScrollTo);
Vue.use(VueRouter);

var routes = [
    {name: "home", path: '/', component: Home},
    {name: "blog", path: '/blog/:blogSearchParam', component: BlogStream, props:true}
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