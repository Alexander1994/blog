<style lang="less" scoped>
    #main {
        height: ~"calc(100vh - 48px)";
        display: flex;
        align-items: center;
        justify-content: center;
    }
</style>

<template>
    <div id="home">
        <section id="main">
            <div id="content">
                <monitor></monitor>
                <button id="aboutLink" v-scroll-to="'#about'">About Me</button>
                <router-link to="/blog/all" tag="button">Blog</router-link>
            </div>
        </section>
        <about></about>
    </div>
</template>

<script>
    const Monitor = require('./monitor.vue');
    const About = require('./about.vue');
    module.exports = {
        name: 'home',
        components: {Monitor, About}
    };
</script>