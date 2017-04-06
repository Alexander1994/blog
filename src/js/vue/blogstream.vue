<style lang="less">

</style>

<template>
    <div>
        <blog v-for="blogid in getBlogIdList" :blog-id="blogid"></blog>
    </div>
</template>

<script>
    var blogData = require("../../media/blog.json");
    var Blog = require("./blog.vue");

    module.exports = {
        props:['id'],
        computed: {
            getBlogIdList: function () {
                return this.id !== "all" ? [this.id] : [...Array(blogData.blog.length).keys()];
            }
        },
        components: {Blog}
    };
</script>