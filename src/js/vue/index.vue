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
        <a href="/">
            <h1>Home</h1>
        </a>
        <a v-once v-for="(blog, index) in blogs" :href="'/#/' + index">{{blog.title}}</a>
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