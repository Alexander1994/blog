<style lang="less">
    @black: #000;
    .black {
        color: @black;
    }
</style>

<template>
    <div>
        <h1 class="black" v-once>{{blog.title}}</h1>
        <p v-once>{{blog.date}}</p>
        <p v-once>You are looking for blog {{ id }}</p>
        <p v-once>{{blog.content}}</p>
    </div>
</template>

<script>
    var blogData = require("../../media/blog.json");

    module.exports = {
        props:['id'],
        data :function () {
            return {
                blog: blogData.blog[this.id]
            }
        }
    };
</script>