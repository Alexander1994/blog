<style lang="less" scoped>
    @import "../../less/vars";

    // general project
    #projects {
        height: 100vh;
        color: @black;
    }

    // page title
    h3 {
        margin-top: 2em;
        margin-bottom: 1.5rem;
    }
    #title-container {
        width: 100%;
        display: flex;
        justify-content: center;
    }

    // card styles
    .card {
        @cardWidth: 17.5em;
        @cardHeight: @cardWidth * 1.4;
        @cardPadding: 0.5em;

        width: @cardWidth;
        height: @cardHeight;
        margin: 0.5em 0.5em 0;
        padding: @cardPadding;


        // shadows
        box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
        transition: 0.3s;
        &:hover {
            box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
        }
        & > * {
            margin-bottom: 0;
        }
        & > p {
            font-size: 0.9em;
            line-height:1.4em;
        }
        & > h5 {
            height: 1.125em;
        }

        & > img {
            width: @cardWidth;
            height: @cardWidth;
            border-bottom: solid 1px @black;
        }
    }

    .card-holder {
        display: flex;
        justify-content: center;
        flex-flow: row wrap;
    }

    @media (@mediumQuery) {
       #projects {
           height: 100%;
       }
    }
</style>

<template>
    <section id="projects">
        <arrow down="false" black="true" scroll-to="about"></arrow>
        <div id="title-container">
            <h3>Projects</h3>
        </div>

        <div class="card-holder">
            <div class="card">
                <img src="media/mines_webassembly.png" alt="Minesweeper clone in Webassembly">
                <h5>Mines in Webassembly</h5>
                <p><a href="https://github.com/Alexander1994/minesweeper-web-assembly">Github</a> <a href="http://alexmccallum.me/minesweeper-web-assembly/">Website</a> <a href="http://alexmccallum.me/#/blog/2">Blog</a></p>
                <p>Minesweeper app written in C++ and compiled to WebAssembly for the web</p>
            </div>
            <div class="card">
                <img src="media/ts_attractor.png" alt="Modeling Attractors in Typescsript">
                <h5>Typescript Attractors</h5>
                <p><a href="https://github.com/Alexander1994/chaos-points">Github</a> <a href="http://alexmccallum.me/chaos-points/">Website</a> <a href="http://alexmccallum.me/#/blog/3">Blog</a></p>
                <p>Client side application for modeling attractors and trying out Typescript</p>
            </div>
            <div class="card">
                <img src="media/unknown.png" alt="Question mark">
                <h5>Coming Soon</h5>
                <p><a href="#">Github</a> <a href="#">Website</a> <a href="#">Blog</a></p>
                <p>Who knows what magic I could create next?</p>
            </div>
        </div>

    </section>
</template>

<script>
    const Arrow = require("./arrow.vue");
    module.exports = {
        name: 'projects',
       components: {Arrow}
    };
</script>