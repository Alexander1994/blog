<style lang="less" scoped>
    .main {
        height: ~"calc(100vh - 48px)";
        display: flex;
        justify-content: center;
        margin-top: 14vh;
    }
    .content > h2 {
        text-align: center;
    }
    .button-container {
        display: flex;
        justify-content: center;

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
                <h3>Brief explainer about Website</h3>
                <div class="button-container">
                    <button class="about-link" v-scroll-to="'#about'">About Me</button>
                    <router-link to="/blog/all" tag="button">Blog</router-link>
                </div>
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