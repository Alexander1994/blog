<style lang="less">
    header {
        & h1 {
            margin: 0;
            font-size: 48px;
            letter-spacing: 1px;
            display: inline-block;
            border-bottom: 1px solid grey;
        }
        & h1:hover {
            color: #888;
        }
        & > a {
            text-decoration: none;
            color: #000;
        }
    }

    // cross app styles

    #app {
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }

    h1, h2, h3 {
        font-family: 'Old Standard TT', serif;
    }

</style>

<template>
    <div id="app">
        <header>
            <router-link to="/">
                <h1>Alex McCallum</h1>
            </router-link>
        </header>
        <router-view></router-view>
    </div>
</template>

<script>
    module.exports = {
        name: 'app'
    };
</script>