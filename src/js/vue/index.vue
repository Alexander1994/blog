<style lang="less">
    @black: #000;
    .black {
        color: @black;
    }
</style>

<template>
    <h1 class="black">{{msg}}</h1>
</template>

<script>
    module.exports = {
        data :() => {
            return {
                msg: 'My Blog is awesomerest!~~~~~~~~~~~~~~~~~`'
            }
        }
    };
</script>