<style lang="less" scoped>
    @import "../../less/vars";

    .main {
        height: ~"calc(100vh - 48px)";
        display: flex;
        justify-content: center;
    }
    .content {
        margin-top: 14vh;
    }
    .content > h3 {
        text-align: center;
    }
    @media (@xSmallQuery) {
        .content {
            margin-top: 10vh;
        }
    }
    .button-container {
        display: flex;
        justify-content: center;
        flex-flow: row wrap;

        & > .about-link {
            margin-right: 1rem;
        }
    }
</style>

<template>
    <div class="home">
        <section class="main">
            <div class="content">
                <monitor></monitor>
                <h3>A Minimalist Showcase of my Software Experience</h3>
                <div class="button-container">
                    <button class="about-link" v-scroll-to="'#about'">About Me</button>
                    <button class="about-link" v-scroll-to="'#projects'">Projects</button>
                    <router-link to="/blog/all" tag="button">Blog</router-link>
                </div>
            </div>
        </section>
        <about></about>
        <projects></projects>
    </div>
</template>

<script>
    const Monitor = require('./monitor.vue');
    const About = require('./about.vue');
    const Projects = require('./projects.vue');
    module.exports = {
        name: 'home',
        components: {Monitor, About, Projects}
    };
</script>