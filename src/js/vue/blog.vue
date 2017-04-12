<style lang="less" scoped>
    @black: #000;
    .black {
        color: @black;
    }
</style>

<template>
    <div>
        <h1 class="black">{{blog.title}}</h1>
        <p>{{blog.date}}</p>
        <p>{{blog.content}}</p>
        <p>You are looking for blog {{ id }}</p>
    </div>
</template>

<script>
    var blogData = require("../../media/blog.json");

    module.exports = {
        props:['blogId'],
        computed: {
            blog: function () {
                return blogData.blog[this.blogId];
            }
        }
    };
</script>