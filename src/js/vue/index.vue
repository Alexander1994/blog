<style lang="less">
    @import "../../less/vars";

    @border-size: 1px;
    @size: 2em;
    @across-dist: sqrt(@size * @size * 2);
    @offset: 5em;

    .n-triangle(@n) {
        .t@{n} {
            right: @across-dist * @n + @offset;
        }
    }
    .n-triangle(1);
    .n-triangle(2);
    .n-triangle(3);
    .n-triangle(4);

    // arrow
    .triangle {
        position: absolute;
        background: #FFF;
        border-left: @border-size solid @black;
        border-top: @border-size solid @black;
        width: @size;
        height: @size;
        top: 3.3em;
        &.up {
            .vendor(transform, rotate(45deg));
        }
        &.down {
            .vendor(transform, rotate(225deg));
        }
    }

    header {
        border-bottom: @border-size solid @black;
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
    p {
        font-size: 1.1em;
        line-height: 1.75em;
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

    @media (max-width: 700px) {
        .triangle {
            display: none;
        }
        p {
            font-size: 1em;
        }
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
            <div class="triangle up t1"></div>
            <div class="triangle down t2"></div>
            <div class="triangle up t3"></div>
            <div class="triangle down t4"></div>
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