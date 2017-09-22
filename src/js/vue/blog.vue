<style lang="less" scoped>
    @import "../../less/vars";

    h3 {
        margin: 0;
    }
    .content {
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
    <article :id="'id-'+blogId" class="row">
        <div class="ten columns">
            <h3 class="black"><a v-scroll-to="'#id-'+blogId" href="#" class="black">{{blog.title}}</a></h3>
            <b>{{blog.date}}</b>
            <p v-html="blog.info"></p>
            <p class="content" v-html="blog.content"></p>
            <hr>
        </div>
    </article>
</template>

<script>
    const blogData = require("../../media/blog.json");

    module.exports = {
        props:['blogId'],
        computed: {
            blog: function () {
                return blogData.blog[this.blogId];
            }
        }
    };
</script>