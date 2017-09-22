<style lang="less" scoped>
    @import "../../less/vars";

    .blog-router {
        text-align: center;
        margin: 2rem 0 2rem 0;

        & > a:not(:first-child) {
            margin-right: 0.4rem;
        }
        & > a {
            color: @grey;
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
    const blogData = require("../../media/blog.json");
    const Blog = require("./blog.vue");

    module.exports = {
        props:['blogSearchParam'],
        data: function () {
          return { // returns a unique set of all years in the blog
              blogYears: [...new Set(blogData.blog.map((blog) => blog.date.substring(0,4)))]
          };
        },
        computed: {
            getBlogIdList: function () { // if the year passed in the url is not a year > 2015 it returns all years other wise it returns the specific blog from that year
                if (this.validYearSearch())
                    return this.getBlogListByYear();
                else if (this.validIdSearch())
                    return this.getBlogListById();
                else
                    return this.getAllBlogs();
            },
        },
        methods: {
            getBlogListByYear: function () { // get list of blogs for the year in the url
                const blogIdList = [];
                blogData.blog.forEach((blog, index) => {
                    if (this.blogSearchParam === blog.date.substring(0,4))
                        blogIdList.push(index);
                });
                return blogIdList;
            },
            getBlogListById: function () { // gets a list of blogs for an id
                return [parseInt(this.blogSearchParam)];
            },
            getAllBlogs: function () { // get all blogs
                return [...Array(blogData.blog.length).keys()];
            },
            validIdSearch: function () { // check if its a valid search for an Id
                return parseInt(this.blogSearchParam) >= 0 && parseInt(this.blogSearchParam) < blogData.blog.length;
            },
            validYearSearch: function () { // check if it's valid search for all blogs in a year
                return parseInt(this.blogSearchParam) > 2015;
            }

        },
        components: {Blog}
    };
</script>