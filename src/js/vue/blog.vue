<style lang="less" scoped>
    @import "../../less/vars";

    article {
        margin-bottom: 2.5em;
    }
    article > .columns {
        position: relative;
    }
    h3 {
        margin: 0;
    }
    .content {
        margin: 2em 0 0 0;
    }
    section {
        margin-bottom: 4em;
    }
    // hr + decals
    hr {
        margin: 1em 0;
        border-width: 0.1rem;
    }
    .hr-decal {
        @decal-size: 5px;
        position: absolute;
        width: 0;
        height: 0;
        border-top: @decal-size solid transparent;
        border-bottom: @decal-size solid transparent;
        bottom: 11px;

        &.left {
            border-right: @decal-size solid #E1E1E1;
            right: 0;
        }
        &.right {
            border-left: @decal-size solid #E1E1E1;
        }
    }
</style>

<template>
    <article :id="'id-'+blogId" class="row">
        <div class="ten columns">
            <h3 class="black"><a v-scroll-to="'#id-'+blogId" href="#" class="black">{{blog.title}}</a></h3>
            <b>{{blog.date}}</b>
            <p v-html="blog.info"></p>
            <p class="content" v-html="blog.content"></p>
            <div class="hr-decal left"></div>
            <div class="hr-decal right"></div>
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