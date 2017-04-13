<style lang="less" scoped>
    h3 {
        margin: 0;
    }
    p {
        margin: 2em 0 0 0;
    }
    section {
        margin-bottom: 4em;
    }
    hr {
        border-width: 0.1rem;
    }
</style>

<template>
    <section class="row">
        <div class="twelve column">
            <h3 class="black">{{blog.title}}</h3>
            <b>{{blog.date}}</b>
            <p v-html="blog.content"></p>
            <hr>
        </div>
    </section>
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