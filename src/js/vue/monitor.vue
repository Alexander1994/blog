<style lang="less" scoped>
    #monitor {
        margin: 0 auto 100px auto;
        position: relative;
        border-radius: 25px;
        width:200px;
        height: 130px;
        background: black;
        border: 5px grey solid;
        border-bottom: 40px grey solid;

        &:after {
            margin: 145px auto 0 auto;
            content: "";
            display: block;
            border-radius: 50%;
            width: 10px;
            height: 10px;
            background: DimGrey;
        }
        & > div {
            color:white;
            position: absolute;
            font-size: 25px;
            left: 15px;
        }
    }

</style>

<template>
    <div id="monitor">
        <div>&gt; _</div>
    </div>
</template>

<script>
    module.exports = {
        name: 'monitor'
    };
</script>