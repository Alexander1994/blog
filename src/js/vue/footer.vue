<style lang="less" scoped>
    @import "../../less/vars";
    h5 {
        color: @black;
        margin: 2rem 0 0 0;
    }
    footer {
        height: 4em;
        margin: 0.5em 0.5em 0 0.5em;
    }
    hr {
        margin: 0;
        border-color: @black;
    }
    @media (@xSmallQuery) {
        footer {
            height: 2em;
        }
        h5 {
            margin-top: 1rem;
        }
    }
</style>

<template>
    <footer>
        <div>
            <hr>
            <h5 class="u-pull-right">Alex McCallum 2017</h5>
        </div>
    </footer>
</template>

<script>
    module.exports = {
        name: 'footerSection'
    };
</script>