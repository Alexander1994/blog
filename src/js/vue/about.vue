<style lang="less" scoped>
    #about {
        height: ~"calc(100vh - 48px)";

        & > p {
            font-style: italic;
        }
    }

</style>

<template>
    <section id="about">
        <p>This is something about me</p>
    </section>
</template>

<script>
    module.exports = {
        name: 'about'
    };
</script>