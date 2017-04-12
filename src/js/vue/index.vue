<style lang="less">
    #app {
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }
    h1 {
        margin: 0;
        font-size: 48px;
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