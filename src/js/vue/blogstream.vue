<style lang="less" scoped>
    .blog-router {
        text-align: center;
        margin: 2rem 0 2rem 0;

        & > a:not(:first-child) {
            margin-right: 0.4rem;
        }
    }
</style>

<template>
    <div>
        <div class="blog-router">
            <router-link to="/blog/all">All</router-link>
            <router-link v-once v-for="blogYear in blogYears" :to="'/blog/' + blogYear">{{blogYear}}</router-link>
        </div>
        <div class="blog-stream container">
            <blog v-for="blogid in getBlogIdList" :blog-id="blogid"></blog>
        </div>
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
            getBlogIdList: function () { // if the year passed in the url is not a year > 2015 it returns all years other wise it returns the specific blogs from that year
                return parseInt(this.blogYear) > 2015 ? this.blogIdListForYear() : [...Array(blogData.blog.length).keys()];
            },
        },
        methods: {
            blogIdListForYear: function () {
                var blogIdList = [];
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