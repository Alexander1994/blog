<style lang="less" scoped>
    @import "../../less/colors";

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
    a:hover {
        color: @grey;
    }
    a {
        color: @black;
        text-decoration: none;
    }
</style>

<template>
    <section v-bind:id="'id-'+blogId" class="row">
        <div class="twelve column">
            <h3 class="black"><a v-scroll-to="'#id-'+blogId" href="#">{{blog.title}}</a></h3>
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