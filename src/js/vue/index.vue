<style lang="less">
    @import "../../less/vars";

    header {
        border-bottom: 1px solid @black;
        margin: 0.5em 0.5em 0 0.5em;

        & h1 {
            margin: 0 0 0 1.5rem;
            font-size: 48px;
            letter-spacing: 1px;
            display: inline-block;
        }
        @media (@xSmallQuery) {
            h1 {
                margin: 0 0.5rem;
            }
        }
    }

    // cross app styles
    body {
        margin: 0;
    }
    #app {
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    h1, h2, h3, h4, h5 {
        font-family: 'Old Standard TT', serif;
    }
    a.black {
        color: @black;
        text-decoration: none;
    }
    a.black:hover {
        color: @grey;
    }
    // For Blog json HTML
    li {
        margin-left: 1.2em;
        list-style-position: outside;
    }

</style>

<template>
    <div id="app">
        <header>
            <router-link to="/" class="black">
                <h1>Alex McCallum</h1>
            </router-link>
        </header>
        <router-view></router-view>
        <footer-section></footer-section>
    </div>
</template>

<script>
    const footerSection = require('./footer.vue');
    module.exports = {
        name: 'app',
        components: {footerSection}
    };
</script>