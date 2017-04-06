<style lang="less">
    #app {
        font-family: Helvetica, Arial, sans-serif;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
        text-align: center;
        color: #2c3e50;
        margin-top: 20px;
    }
</style>

<template>
    <div id="app">
        <router-link to="/">
            <h1>Home</h1>
        </router-link>
        <router-link v-once v-for="(blog, index) in blogs" :to="'/blog/' + index">{{blog.title}}</router-link>
        <router-link to="/blog/all">All</router-link>
        <router-view></router-view>
    </div>
</template>

<script>
    var blogData = require("../../media/blog.json");
    module.exports = {
        name: 'app',
        data: function () {
            return {
                blogs: blogData.blog
            };
        }
    };
</script>