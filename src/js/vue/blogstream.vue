<style lang="less">

</style>

<template>
    <div>
        <router-link v-once v-for="blogYear in blogYears" :to="'/blog/' + blogYear">{{blogYear}}</router-link>
        <router-link to="/blog/all">All</router-link>
        <blog v-for="blogid in getBlogIdList" :blog-id="blogid"></blog>
        <div>{{blogIdList}}</div>
    </div>
</template>

<script>
    var blogData = require("../../media/blog.json");
    var Blog = require("./blog.vue");

    module.exports = {
        props:['blogYear'],
        data: function () {
          return { // returns a unique set of all years in the blog
              blogYears: [...new Set(blogData.blog.map((blog) => blog.date.substring(0,4)))]
          };
        },
        computed: {
            getBlogIdList: function () {
                return parseInt(this.blogYear) > 2015 ? this.blogIdListForYear() : [...Array(blogData.blog.length).keys()];
            },
        },
        methods: {
            blogIdListForYear: function () {
                var blogIdList =[];
                blogData.blog.forEach((blog, index) => {
                    if (this.blogYear === blog.date.substring(0,4))
                        blogIdList.push(index);
                });
                return blogIdList;
            }
        },
        components: {Blog}
    };
</script>